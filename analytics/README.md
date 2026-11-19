# Análisis Histórico y Minería de Procesos (`analytics/`)

Módulo correspondiente a las secciones **4.3 (Análisis de las ejecuciones del proceso)** y **4.4 (Introducción a la minería de procesos con PM4Py)** sobre el proceso `Process_Curso`.

---

## Requisitos previos

1. **Entorno Docker activo** (Flowable UI y PostgreSQL levantados según [docker/README.md](../docker/README.md)).
2. **Python 3.10+**, `python3-venv` y **Graphviz** (en Ubuntu/WSL):
   ```bash
   sudo apt update
   sudo apt install -y python3-venv graphviz
   ```

---

## Preparación del entorno virtual (`.venv`)

Para no ensuciar el repositorio con archivos del entorno virtual, crear `.venv` en la carpeta padre del repositorio:

```bash
# Desde la carpeta padre del repositorio
python3 -m venv .venv
source .venv/bin/activate

# Instalar dependencias
pip install --upgrade pip
pip install -r proyecto-buffa-bonino-llorente-miani-oviedo-picco/analytics/requirements.txt
```

Para desactivar el entorno al terminar:
```bash
deactivate
```

---

## Ejecución

Con el entorno virtual activado, ubicarse en `analytics/`:

Cuando los scripts soliciten credenciales de Flowable, ingresar las credenciales de acceso a la API REST definidas en [docker/README.md](../docker/README.md) (por defecto **`admin`** / **`test`**). (o cualquier usuario con permiso `access-rest-api` de [CONTRATO_VARIABLES.md](../CONTRATO_VARIABLES.md)).

### 1. Análisis histórico de ejecuciones (Sección 4.3)

```bash
python analisis_historico.py
```

Muestra por consola:
- **Resultados de las solicitudes (4.3.1):** cantidad y porcentaje de instancias terminadas por resultado (*Curso finalizado*, *Cancelación*, *Rechazo de la propuesta*, *Solicitud no viable* y *Cierre por falta de respuesta*).
- **Análisis de la preparación paralela (4.3.2):** duración promedio de las ramas de *Inscripciones*, *Materiales* y *Recursos* (solo cursos que completaron normalmente la preparación, excluyendo cancelaciones).
- **Distribución de tareas (4.3.3):** cantidad de tareas de usuario completadas normalmente por cada administrativo y docente.

### 2. Minería de procesos con PM4Py (Sección 4.4)

Primero exportar el log de eventos de la etapa de negociación (previa al subproceso `Preparar curso`):

```bash
python exportar_history.py
```

Esto genera el archivo `eventos.csv`. Luego ejecutar el análisis con PM4Py:

```bash
python analizar.py
```

Muestra por consola la cantidad de instancias analizadas y los **3 recorridos más frecuentes**, y genera:
- `recorridos.png` — grafo de sucesión directa (DFG).
- `modelo_descubierto.png` — diagrama visual del modelo BPMN descubierto.
- `modelo_descubierto.bpmn` — modelo BPMN descubierto en formato XML.
