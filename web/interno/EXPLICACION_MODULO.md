# Documentación Técnica y Explicación del Módulo: Portal Web Interno (`web/interno/`)

**Responsable:** Llorente  
**Alcance:** Secciones **4.1.3 (Funciones para Administración)** y **4.1.4 (Funciones para el Equipo Docente)** del enunciado del proyecto.

---

## 1. Contrato de Integración con el Equipo (`CONTRATO_VARIABLES.md`)

A partir del análisis del modelo BPMN ejecutable (`bpmn/Organizar_curso_de_capacitación.bpmn20.xml`), la tabla de decisión DMN (`bpmn/Evaluar Vialidad Cursos.dmn`) y el backup de PostgreSQL/Flowable (`docker/backups/`), se extrajeron los identificadores con los que opera el motor:

* **Identificadores técnicos de Grupos en Flowable IDM (`act_id_group`):**
  * **`adm`** (*Administración*)
  * **`teach`** (*Docente*)
* **Usuarios en Flowable IDM (`act_id_user`):**
  * Grupo `adm`: `admin_boss` (Jefe Administrativo) y `admin2` (Administrativo).
  * Grupo `teach`: `teaching_leader` (Jefe del Equipo Docente), `teaching` (Docente 1) y `teaching2` (Docente 2).
* **Identificadores de Tareas de Usuario (`taskDefinitionKey`) en el BPMN:**
  * `Propuesta` (*Registrar y Elaborar propuesta*)
  * `Revisar` (*Revisar propuesta*)
  * `Archivar` (*Archivar solicitud*)
  * `Lista` (*Confeccionar lista definitiva*)
  * `Activity_12i2hpf` (*Evaluar Recursos*)
  * `Activity_1018bdz` (*Definir Docente que desarrolla el curso*)
  * `Dictar` (*Desarrollar curso*)
  * `Informe` (*Elaborar informe de resultados*)
  * `EnviarInforme` (*Enviar informe a empresa y Archivar expediente.*)
* **Variables clave evaluadas por expresiones del motor BPMN:**
  * Compuerta inclusiva `OrInicio` (Recursos): `${requiereAula}`, `${requierePlataforma}` y `${requiereEquipamiento}`.
  * Compuerta exclusiva `Limite` (Recordatorios): `${recordatorios < 2}` y `${recordatorios >= 2}`.
  * Evento temporizador `Fecha` (Inicio de dictado): `${fechaCurso}` (formato ISO-8601).
  * Asignación dinámica de la tarea `Dictar`: `flowable:assignee="${docenteSeleccionado}"`.

---

## 2. Arquitectura del Backend (`web/interno/`)

El módulo está construido en **Python + Flask** y estructurado en capas para separar la configuración, la comunicación con Flowable REST, la base de datos institucional y la generación de documentos PDF:

```text
web/interno/
├── app.py                     # Controlador principal Flask (rutas, sesión y lógica de formularios)
├── config.py                  # Configuración de URLs de Flowable REST, PostgreSQL y directorio de PDFs
├── requirements.txt           # Dependencias: flask, requests, psycopg2-binary, fpdf2
├── README.md                  # Guía rápida de instalación y ejecución
├── EXPLICACION_MODULO.md      # Este documento técnico detallado
├── generated_pdfs/            # Carpeta donde se almacenan los PDFs generados
├── services/
│   ├── flowable_client.py     # Cliente HTTP REST para Flowable (IDM API y Process API)
│   ├── pdf_generator.py       # Generador de PDFs (Propuesta v1, Propuesta vN e Informe Final)
│   └── db_client.py           # Sincronización con PostgreSQL (institucion_db)
├── static/
│   ├── styles.css             # Estilos responsivos (Container Queries, validación visual)
│   └── validation.js          # Validación accesible sincronizada con :user-invalid y grupos de checkboxes
└── templates/
    ├── base.html              # Layout principal con barra de sesión, rol/grupo y alertas
    ├── login.html             # Formulario de autenticación contra Flowable IDM
    ├── bandeja.html           # Bandeja dividida en tareas asignadas y tareas candidatas del grupo
    └── tasks/                 # Plantillas específicas por cada taskDefinitionKey
        ├── propuesta.html
        ├── revisar.html
        ├── archivar.html
        ├── lista.html
        ├── recursos.html
        ├── definir_docente.html
        ├── dictar.html
        ├── informe.html
        └── enviar_informe.html
```

---

### A. Configuración (`config.py`)
Centraliza todas las constantes y permite sobreescribirlas mediante variables de entorno:
* Apunta a la API REST del contenedor `flowable-persistente` en:
  * `http://localhost:8080/flowable-ui/process-api`
  * `http://localhost:8080/flowable-ui/idm-api`
* Define la carpeta `web/interno/generated_pdfs/` para almacenar los PDFs generados.
* Configura los parámetros de conexión a PostgreSQL (`localhost:5432`, base `institucion_db`, usuario `flowable`, clave `flow10`).

---

### B. Cliente HTTP de Flowable (`services/flowable_client.py`)
Encapsula las 5 llamadas HTTP REST contra Flowable utilizando `HTTPBasicAuth(username, password)`:

1. **`authenticate_user(username, password)`:**
   * Realiza `GET /idm-api/idm/users/{username}` autenticándose con las credenciales ingresadas por el usuario. Si Flowable responde `200 OK`, las credenciales son válidas.
   * Luego realiza `GET /idm-api/idm/groups?member={username}` para recuperar la lista de grupos a los que pertenece el usuario (`adm` o `teach`).
2. **`get_tasks_for_user(username, password, groups)`:**
   * Implementa la separación exigida por el enunciado entre **tareas asignadas directamente** y **tareas candidatas del grupo**:
     * **Tareas asignadas:** Consulta `GET /process-api/runtime/tasks?assignee={username}&includeProcessVariables=true` para obtener las tareas cuyo responsable directo es el usuario actual (ya sea por rol fijo como `admin_boss` / `teaching_leader`, por el *Task Listener* de asignación balanceada, o porque el usuario ya la reclamó previamente).
     * **Tareas candidatas (disponibles para reclamar):** Consulta `GET /process-api/runtime/tasks?candidateGroup={grp}&includeProcessVariables=true` para cada grupo del usuario (`adm` o `teach`) y `GET /process-api/runtime/tasks?candidateUser={username}&includeProcessVariables=true` (para contemplar tareas como `Informe`, donde `teaching_leader` figura como `candidateUsers` en el BPMN).
   * Transforma el array de variables de Flowable (`[{"name": "...", "value": "..."}]`) en un diccionario clave-valor de Python mediante `_variables_list_to_dict()` para facilitar su lectura en las vistas Jinja2.
3. **`get_task_by_id(username, password, task_id)`:**
   * Consulta `GET /process-api/runtime/tasks/{task_id}` y `GET /process-api/runtime/process-instances/{processInstanceId}/variables` para cargar el formulario de la tarea con todas las variables actuales de la instancia del proceso.
4. **`claim_task(username, password, task_id)`:**
   * Envía `POST /process-api/runtime/tasks/{task_id}` con el payload `{"action": "claim", "assignee": username}`. Esto asigna la tarea candidata al usuario que la reclama.
5. **`complete_task(username, password, task_id, variables)`:**
   * Envía `POST /process-api/runtime/tasks/{task_id}` con `{"action": "complete", "variables": [...]}` para guardar las variables del formulario en la instancia del proceso y avanzar a la siguiente actividad del BPMN.

---

### C. Generador de Documentos PDF (`services/pdf_generator.py`)
Utiliza `fpdf2` (con un generador PDF 1.4 de respaldo sin dependencias externas) y provee dos funciones:

1. **`generate_propuesta_pdf(...)`:**
   * Se invoca al completar **`Propuesta`** (Versión 1) y **`Revisar`** (Versión $N + 1$).
   * Crea el archivo `propuesta_<processInstanceId>_v<version>.pdf` dentro de `generated_pdfs/` con los datos de la solicitud, empresa, contacto, programa propuesto, presupuesto, fechas posibles y observaciones revisadas.
2. **`generate_informe_pdf(...)`:**
   * Se invoca al completar **`Informe`** (*Elaborar informe de resultados*).
   * Crea el archivo `informe_<processInstanceId>.pdf` con la información general del curso, el docente que estuvo a cargo, el porcentaje de asistencia, las observaciones registradas al finalizar el dictado y la evaluación final de resultados.

---

### D. Sincronización con la Base de Datos Institucional (`services/db_client.py`)
* Se integra con las tablas reales definidas en `db/institucion_schema.sql` (`solicitudes_curso`, `propuestas`, `participantes` e `informes_resultados`) y con el Portal de Empresas (`web/empresa/`):
  * **`sync_propuesta_to_db(...)`:** Inserta o actualiza la versión de la propuesta en `propuestas` (incluyendo `pdf_nombre`) y pasa `solicitudes_curso.estado` a `'en_propuesta'`.
  * **`sync_participantes_to_db(...)`:** Al confeccionar la lista definitiva (`Lista`), registra a los inscriptos en la tabla `participantes` y actualiza el estado a `'en_preparacion'`.
  * **`sync_informe_to_db(...)`:** Registra el informe final y su PDF en `informes_resultados`.
  * **`sync_estado_solicitud(...)`:** Mantiene sincronizada la columna `estado` en `solicitudes_curso` (`'en_preparacion'`, `'en_curso'`, `'finalizado'`, `'rechazado'`, `'cerrado_sin_respuesta'`) a medida que avanzan las tareas en Flowable, para que la vista de seguimiento de empresas refleje cada transición en tiempo real.
* Utiliza bloques `try/except` tolerantes a fallos para no interrumpir la ejecución del motor Flowable si la base de datos no está disponible.

---

## 3. Controlador Principal y Reglas de Negocio por Tarea (`app.py`)

El archivo `app.py` conecta las rutas HTTP con los requisitos funcionales del enunciado:

* **Mapeo automático por `taskDefinitionKey` (`TASK_TEMPLATES`):** Cada tarea devuelta por Flowable se asocia con su plantilla HTML específica en `templates/tasks/`.
* **Verificación de reclamo previo:** En `GET/POST /tasks/<task_id>`, el controlador verifica que `task.get("assignee") == user["id"]`. Si un usuario intenta abrir o completar una tarea grupal sin haberla reclamado antes, el sistema lo redirige a la bandeja indicando que debe reclamarla primero (cumpliendo la Sección 2 del enunciado).
* **Comportamiento específico de cada formulario (`POST /tasks/<task_id>`):**
  1. **`Propuesta` (*Registrar y Elaborar propuesta*) y `Revisar` (*Revisar propuesta*):**
     * Valida que se hayan completado `programaPropuesto`, `presupuesto` (numérico mayor a 0) y `fechasPosibles`.
     * Calcula automáticamente la versión (`1` en la propuesta inicial; `versionPropuesta + 1` en cada revisión).
     * Genera el PDF mediante `generate_propuesta_pdf(...)`.
     * Envía a Flowable las variables actualizadas junto con **`recordatorios = 0`**, cumpliendo la regla de la Sección 1.1 (*"El contador de recordatorios se reinicia con cada nueva versión enviada de la propuesta"*).
  2. **`Archivar` (*Archivar solicitud*):**
     * Permite a `admin_boss` registrar las observaciones de cierre (`motivoArchivo`) y archivar una solicitud rechazada o cuyo plazo expiró tras dos recordatorios.
  3. **`Lista` (*Confeccionar lista definitiva*):**
     * Muestra en pantalla la `nominaParticipantes` enviada por la empresa y permite al administrativo guardar la `listaDefinitiva` y `observacionesLista`.
  4. **`Activity_12i2hpf` (*Evaluar Recursos*):**
     * Presenta las 3 opciones de recursos (`requiereAula`, `requierePlataforma`, `requiereEquipamiento`).
     * Valida tanto en el cliente (`validation.js`) como en el servidor (`app.py`) que **se seleccione al menos una opción** (requisito de las Secciones 1.2 y 4.1.3).
     * Envía los 3 booleanos a Flowable para que la compuerta inclusiva `OrInicio` active las ramas seleccionadas.
  5. **`Activity_1018bdz` (*Definir Docente que desarrolla el curso*):**
     * Presenta al Jefe Docente (`teaching_leader`) los 3 integrantes del grupo `teach` (`teaching_leader`, `teaching`, `teaching2`), permitiéndole elegirse a sí mismo.
     * Almacena el ID elegido en la variable **`docenteSeleccionado`**, que Flowable utiliza en `flowable:assignee="${docenteSeleccionado}"` para asignar la tarea *Desarrollar curso*.
  6. **`Dictar` (*Desarrollar curso*):**
     * Una vez superado el temporizador `${fechaCurso}`, permite al docente asignado registrar la fecha de finalización real (`fechaFinDictado`) y las observaciones del dictado (`observacionesDictado`).
  7. **`Informe` (*Elaborar informe de resultados*):**
     * Muestra al Jefe Docente los datos del curso y las observaciones cargadas por el docente que dictó la capacitación.
     * Recibe el porcentaje de asistencia (`porcentajeAsistencia`) y el texto del informe (`informeResultados`), genera el PDF oficial del informe y guarda su nombre en `informePdfNombre`.
  8. **`EnviarInforme` (*Enviar informe a empresa y Archivar expediente.*):**
     * Permite al Jefe Administrativo (`admin_boss`) consultar el informe elaborado, abrir/descargar el PDF generado y completar el envío y archivo del expediente (`expedienteArchivado = True`, `resultadoProceso = "finalizado"`), lo que dispara el evento de fin con compensación para liberar los recursos del curso.

---

## 4. Interfaz de Usuario, Accesibilidad y Validaciones (`templates/` y `static/`)

* **Bandeja de Tareas (`templates/bandeja.html`):**
  * Presenta dos tablas claramente diferenciadas: **"1. Mis Tareas Asignadas"** (con acceso directo al formulario) y **"2. Tareas Disponibles para Reclamar en mi Grupo"** (con botón para ejecutar el *claim*).
  * Incluye al pie una sección con enlaces directos para visualizar o descargar todos los documentos PDF generados en `generated_pdfs/`.
* **Tablas Responsivas (`static/styles.css`):**
  * Implementadas con encabezados fijos (`position: sticky`) y `@container (width < 600px)` para adaptarse automáticamente en pantallas angostas transformando las filas en tarjetas con etiquetas inyectadas por CSS.
* **Validación Diferida y Accesible (`static/validation.js`):**
  * Utiliza el selector moderno `:user-invalid` (con fallback en JavaScript) para mostrar errores visuales y mensajes de ayuda recién después de que el usuario interactúa con un campo, evitando alertas prematuras al cargar la página.
  * Incluye un botón accesible (`aria-pressed`) para mostrar u ocultar la contraseña en el login y deshabilita el botón de envío tras un *submit* válido para evitar envíos duplicados a Flowable.
