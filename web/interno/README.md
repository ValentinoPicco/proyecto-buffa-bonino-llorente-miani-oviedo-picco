# Portal Web Interno — Administración y Equipo Docente (`web/interno/`)

Módulo responsable de la sección interna del sitio web de la institución (Secciones **4.1.3 Funciones para Administración** y **4.1.4 Funciones para el Equipo Docente** del enunciado).

## Características implementadas
1. **Login contra Flowable IDM (`/login`):**
   - Valida credenciales del personal de la institución contra `http://localhost:8080/flowable-ui/idm-api` y obtiene sus grupos (`adm` o `teach`).
2. **Bandeja de Tareas (`/bandeja`):**
   - Separa **Mis Tareas Asignadas** (`assignee=<user>`) de **Tareas Disponibles para Reclamar en mi Grupo** (`candidateGroup=adm|teach` o `candidateUser=<user>`).
   - Permite reclamar tareas candidatas (`POST /tasks/<id>/claim`) antes de completarlas.
3. **Formularios por `taskDefinitionKey` (`/tasks/<id>`):**
   - `Propuesta` (*Registrar y Elaborar propuesta*): Genera PDF de propuesta inicial v1 y fija `recordatorios = 0`.
   - `Revisar` (*Revisar propuesta*): Muestra las observaciones de la empresa, genera nueva versión del PDF (v2, v3...) y reinicia `recordatorios = 0`.
   - `Archivar` (*Archivar solicitud*): Cierra solicitudes rechazadas o con plazo vencido.
   - `Lista` (*Confeccionar lista definitiva*): Muestra la nómina enviada por la empresa y guarda `listaDefinitiva`.
   - `Activity_12i2hpf` (*Evaluar Recursos*): Valida que se seleccione **al menos una** opción (`requiereAula`, `requierePlataforma`, `requiereEquipamiento`).
   - `Activity_1018bdz` (*Definir Docente que desarrolla el curso*): Permite a `teaching_leader` elegir entre los 3 docentes (`teaching_leader`, `teaching`, `teaching2`) y envía `docenteSeleccionado`.
   - `Dictar` (*Desarrollar curso*): Permite al docente asignado registrar la finalización del dictado.
   - `Informe` (*Elaborar informe de resultados*): Genera el PDF del informe final de resultados.
   - `EnviarInforme` (*Enviar informe a empresa y Archivar expediente*): Permite a `admin_boss` consultar el informe, su PDF y archivar el expediente.

## Ejecución

```bash
cd web/interno
python3 -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt
python3 app.py
```

Luego abre `http://localhost:5000` en el navegador (el Portal de Empresas corre en paralelo en `http://localhost:5001`).
