# Contrato de Variables, Usuarios y Tareas (Flowable BPMN + BD Institucional)

Este documento define el contrato de integración entre los módulos del proyecto grupal (**Picco, Bonino, Buffa, Llorente, Miani y Oviedo**), alineado con el modelo ejecutable [Organizar_curso_de_capacitación.bpmn20.xml](bpmn/Organizar_curso_de_capacitación.bpmn20.xml) y la tabla de decisión [Evaluar Vialidad Cursos.dmn](bpmn/Evaluar%20Vialidad%20Cursos.dmn).

---

## 1. Identificadores del Proceso y Mensajes BPMN

- **Process Definition Key:** `Process_Curso` (*Institución de capacitación*)
- **Decision Table Key (DMN):** `decisionVialidad`
- **Mensajes (`flowable:messageExpression` en BPMN):**
  | ID Mensaje | Nombre en BPMN | `messageExpression` | Origen | Momento de uso |
  | :--- | :--- | :--- | :--- | :--- |
  | `Msg_sol` | Solicitud de curso | `solicitudMsg` | `web/empresa/` (Buffa) | Inicia la instancia del proceso al registrar solicitud |
  | `Msg_acepta` | Aceptación | `aceptacionMsg` | `apps/` Simulador REST (Miani) | En el Event-Based Gateway `Esperar` |
  | `Msg_rechaza` | Rechazo | `rechazoMsg` | `apps/` Simulador REST (Miani) | En el Event-Based Gateway `Esperar` |
  | `Msg_mod` | Solicitud de modificaciones | `modificacionesMsg` | `apps/` Simulador REST (Miani) | En el Event-Based Gateway `Esperar` |
  | `Msg_nom` | Nómina de participantes | ReceiveTask `Nomina` | `apps/` Simulador REST (Miani) | Desbloquea `Recibir nómina` en subproceso `Preparar` |
  | `Msg_cancel` | Cancelación | `cancelacionMsg` | `apps/` Simulador REST (Miani) | Dispara el Event Subprocess `Activity_048d5em` durante `Preparar` |

---

## 2. Usuarios y Grupos en Flowable IDM (`act_id_user` / `act_id_group`)

> [!IMPORTANT]
> En Flowable IDM los identificadores técnicos (`id_`) de los grupos son **`adm`** y **`teach`**. Todos los usuarios listados a continuación deben tener asignado el privilegio `access-rest-api` en Flowable IDM para operar mediante Basic Auth en la API REST.

| Usuario (`id_`) | Contraseña | Grupo (`group_id_`) | Nombre de Grupo | Rol en el Enunciado |
| :--- | :--- | :--- | :--- | :--- |
| `admin_boss` | `admin_boss` | `adm` | Administración | **Jefe Administrativo** |
| `admin2` | `admin2` | `adm` | Administración | Administrativo |
| `teaching_leader` | `teachingleader` | `teach` | Docente | **Jefe del Equipo Docente** |
| `teaching` | `teaching` | `teach` | Docente | Integrante Equipo Docente 1 |
| `teaching2` | `teaching2` | `teach` | Docente | Integrante Equipo Docente 2 |

---

## 3. Catálogo de Tareas de Usuario (`userTask`)

| `taskDefinitionKey` (ID BPMN) | Nombre de Tarea | Asignación en BPMN | Responsable de Interfaz | Acción Principal |
| :--- | :--- | :--- | :--- | :--- |
| `Propuesta` | Registrar y Elaborar propuesta | `assignee="admin_boss"` | `web/interno/` (Llorente) | Carga programa, presupuesto y fechas; genera **PDF Propuesta v1**; inicializa `recordatorios = 0`. |
| `Revisar` | Revisar propuesta | `assignee="admin_boss"` | `web/interno/` (Llorente) | Ajusta propuesta según `observacionesEmpresa`; genera **PDF Propuesta vN**; reinicia `recordatorios = 0`. |
| `Archivar` | Archivar solicitud | `assignee="admin_boss"` | `web/interno/` (Llorente) | Registra motivo de archivo (rechazo o falta de respuesta tras 2 recordatorios). |
| `Lista` | Confeccionar lista definitiva | `candidateGroups="adm"` *(+ TaskListener Bonino)* | `web/interno/` (Llorente) | Revisa la nómina enviada por la empresa y confirma la lista definitiva de participantes. |
| `Material` | Preparar materiales | `candidateGroups="adm"` | `apps/` API Java (Miani) | Reclama y completa la preparación de materiales didácticos por JDBC/API Java. |
| `Activity_12i2hpf` | Evaluar Recursos | `candidateGroups="adm"` | `web/interno/` (Llorente) | Define `requiereAula`, `requierePlataforma` y `requiereEquipamiento` (al menos uno `true`). |
| `Virtual` | Solicitar Aula Virtual | `candidateGroups="adm"` | Flowable Task UI | Se gestiona desde la UI de Flowable (según sección 4.1.3). |
| `Equipo` | Contratar equipamiento | `candidateGroups="adm"` | Flowable Task UI | Se gestiona desde la UI de Flowable (según sección 4.1.3). |
| `Activity_1m08pcl` | Liberar Equipamiento | `candidateGroups="adm"` | Flowable Task UI | Tarea de compensación en caso de cancelación o cierre. |
| `Activity_1018bdz` | Definir Docente que desarrolla el curso | `assignee="teaching_leader"` | `web/interno/` (Llorente) | Selecciona entre `teaching_leader`, `teaching` o `teaching2` y guarda `docenteSeleccionado`. |
| `Dictar` | Desarrollar curso | `assignee="${docenteSeleccionado}"` | `web/interno/` (Llorente) | Habilitada tras cumplirse el timer `${fechaCurso}`. Registra la finalización del dictado. |
| `Informe` | Elaborar informe de resultados | `candidateUsers="teaching_leader"` | `web/interno/` (Llorente) / Flowable UI | Elabora el informe final y genera el **PDF de Informe de Resultados**. |
| `EnviarInforme` | Enviar informe a empresa y Archivar expediente. | `assignee="admin_boss"` | `web/interno/` (Llorente) | Consulta el informe de resultados, lo envía a la empresa y archiva el expediente. |

---

## 4. Contrato de Variables de Proceso en Flowable

### 4.1 Etapa 1: Solicitud y Evaluación de Viabilidad
| Nombre Variable | Tipo Flowable | Creada / Modificada por | Consumida por | Descripción / Ejemplo |
| :--- | :--- | :--- | :--- | :--- |
| `solicitudId` | `integer` / `long` | `web/empresa/` (Buffa) | Todos (`institucion_db`) | ID de la fila del curso/solicitud en PostgreSQL (`institucion_db`). |
| `empresaNombre` | `string` | `web/empresa/` (Buffa) | `web/interno/`, `apps/` | Razón social de la empresa solicitante (ej. `"TechCorp S.A."`). |
| `empresaContacto` | `string` | `web/empresa/` (Buffa) | `web/interno/` | Nombre y correo de contacto (ej. `"Laura Gómez (lgomez@techcorp.com)"`). |
| `cursoNombre` | `string` | `web/empresa/` (Buffa) | Todos | Título o temática de la capacitación solicitada. |
| `cursoDescripcion` | `string` | `web/empresa/` (Buffa) | `web/interno/` | Descripción detallada de necesidades de capacitación. |
| `cantidadParticipantes` | `integer` | `web/empresa/` (Buffa) | `web/interno/` | Cantidad estimada de asistentes (ej. `25`). |
| `fechasPreferidas` | `string` | `web/empresa/` (Buffa) | `web/interno/` | Rango o preferencias de fechas indicadas por la empresa. |
| `otrasInstancias` | `integer` | Script/Listener previo a DMN (Picco) | DMN `decisionVialidad` | Cantidad de instancias activas de `Process_Curso` excluyendo la actual. |
| `viable` | `boolean` | DMN `decisionVialidad` (Picco) | Gateway `Gateway_10gftrn` | Resultado de la tabla DMN (`true` si `otrasInstancias < 5`, `false` si `>= 5`). |

### 4.2 Etapa 2: Acuerdo y Negociación de Propuesta
| Nombre Variable | Tipo Flowable | Creada / Modificada por | Consumida por | Descripción / Ejemplo |
| :--- | :--- | :--- | :--- | :--- |
| `programaPropuesto` | `string` | `web/interno/` (`Propuesta`, `Revisar`) | `web/empresa/`, `pdf_generator` | Temario y módulos propuestos por el jefe administrativo. |
| `presupuesto` | `double` / `string` | `web/interno/` (`Propuesta`, `Revisar`) | `web/empresa/`, `pdf_generator` | Monto presupuestado para el curso (ej. `450000.0`). |
| `fechasPosibles` | `string` | `web/interno/` (`Propuesta`, `Revisar`) | `apps/` (Miani), `pdf_generator` | Fechas propuestas por la institución (ej. `"2026-11-25, 2026-12-02"`). |
| `versionPropuesta` | `integer` | `web/interno/` (`Propuesta`=1, `Revisar`=+1) | `web/interno/`, `pdf_generator` | Número de versión de la propuesta enviada (`1`, `2`, ...). |
| `propuestaPdfNombre` | `string` | `web/interno/` (`Propuesta`, `Revisar`) | `web/interno/`, `web/empresa/` | Nombre del archivo PDF generado (ej. `"propuesta_101_v1.pdf"`). |
| `recordatorios` | `integer` | `web/interno/` (pone `0`) y Script `Recordatorio` (`+1`) | Gateway `Limite` | **Requerido en BPMN:** `${recordatorios < 2}` y `${recordatorios >= 2}`. |
| `observacionesEmpresa` | `string` | `apps/` Simulador REST (Miani) en `Msg_mod` | `web/interno/` (`Revisar`) | Modificaciones solicitadas por la empresa para revisar la propuesta. |
| `fechaCurso` | `string` (ISO-8601) | `apps/` Simulador REST (Miani) en `Msg_acepta` | Timer `Fecha` (`${fechaCurso}`) | **Requerido en BPMN:** Fecha/hora acordada en formato ISO-8601 (ej. `"2026-11-18T15:30:00Z"`). |
| `motivoArchivo` | `string` | `web/interno/` (`Archivar`) | Listener de cierre (Bonino) | Observación administrativa al archivar solicitud rechazada o vencida. |

### 4.3 Etapa 3: Preparación Paralela del Curso
| Nombre Variable | Tipo Flowable | Creada / Modificada por | Consumida por | Descripción / Ejemplo |
| :--- | :--- | :--- | :--- | :--- |
| `nominaParticipantes` | `string` (JSON/CSV) | `apps/` Simulador REST (Miani) en `Nomina` | `web/interno/` (`Lista`) | Nómina enviada por la empresa (lista de nombres/DNI/emails). |
| `listaDefinitiva` | `string` | `web/interno/` (`Lista`) | `web/interno/`, BD | Lista definitiva confeccionada y validada por Administración. |
| `observacionesLista` | `string` | `web/interno/` (`Lista`) | `web/interno/` | Notas adicionales sobre la inscripción de participantes. |
| `materialesPreparados` | `boolean` | `apps/` API Java (Miani) en `Material` | Subproceso `Preparar` | Indica que los materiales didácticos fueron preparados. |
| `requiereAula` | `boolean` | `web/interno/` (`Activity_12i2hpf`) | Inclusive Gateway `OrInicio` | **Requerido en BPMN:** Activa la rama `Presencial` (`Reservar aula`). |
| `requierePlataforma` | `boolean` | `web/interno/` (`Activity_12i2hpf`) | Inclusive Gateway `OrInicio` | **Requerido en BPMN:** Activa la rama `Virtual` (`Solicitar Aula Virtual`). |
| `requiereEquipamiento` | `boolean` | `web/interno/` (`Activity_12i2hpf`) | Inclusive Gateway `OrInicio` | **Requerido en BPMN:** Activa la rama `Equipamiento especial` (`Contratar equipamiento`). |
| `aulaAsignada` | `string` | ServiceTask `Aula` (Picco/Miani) | `web/interno/`, compensación | Identificador del aula física reservada (ej. `"Aula Magna 2"`). |

### 4.4 Etapa 4: Desarrollo, Informe y Cierre
| Nombre Variable | Tipo Flowable | Creada / Modificada por | Consumida por | Descripción / Ejemplo |
| :--- | :--- | :--- | :--- | :--- |
| `docenteSeleccionado` | `string` | `web/interno/` (`Activity_1018bdz`) | Tarea `Dictar` (`assignee`) | **Requerido en BPMN:** ID de usuario Flowable (`"teaching_leader"`, `"teaching"` o `"teaching2"`). |
| `fechaFinDictado` | `string` | `web/interno/` (`Dictar`) | `web/interno/` (`Informe`) | Fecha/hora real en que el docente registró la finalización del dictado. |
| `observacionesDictado` | `string` | `web/interno/` (`Dictar`) | `web/interno/` (`Informe`) | Comentarios del docente sobre la asistencia y desarrollo del curso. |
| `informeResultados` | `string` | `web/interno/` (`Informe`) | `web/interno/` (`EnviarInforme`), BD | Resumen ejecutivo, métricas de aprobación y evaluación del curso. |
| `porcentajeAsistencia` | `integer` | `web/interno/` (`Informe`) | `web/interno/` (`EnviarInforme`), BD | Porcentaje promedio de asistencia (0 a 100). |
| `informePdfNombre` | `string` | `web/interno/` (`Informe`) | `web/interno/` (`EnviarInforme`) | Nombre del PDF generado (ej. `"informe_101.pdf"`). |
| `expedienteArchivado` | `boolean` | `web/interno/` (`EnviarInforme`) | Proceso / Auditoría | Confirmación de envío de informe a la empresa y cierre de expediente. |
| `resultadoProceso` | `string` | Caminos de fin BPMN (Picco) | ExecutionListener fin (Bonino) | Valores esperados según sección 3.4: `"finalizado"`, `"cancelado"`, `"rechazado"`, `"cerrado_sin_respuesta"`, `"no_viable"`. |
