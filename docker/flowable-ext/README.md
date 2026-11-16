# Directorio de Extensiones de Flowable (`flowable-ext`)

Este directorio está montado como volumen en el contenedor de Flowable UI en `/app/ext-libs`.

### Uso para Listeners y Delegates Java:
Si implementan clases Java compiladas para el proyecto (por ejemplo, el `TaskListener` para la asignación balanceada o el `ExecutionListener` para actualizar la base de datos de la institución):
1. Empaquetar las clases compiladas en un archivo JAR (ej. `gestion-listeners.jar`).
2. Colocar el archivo JAR en este directorio.
3. Reiniciar el contenedor de Flowable con:
   ```bash
   docker compose restart flowable
   ```
4. El cargador de clases (`LOADER_PATH=/app/ext-libs`) incorporará automáticamente las clases para que puedan ser referenciadas desde los modelos BPMN (como Java Class Delegate o Delegate Expression).
