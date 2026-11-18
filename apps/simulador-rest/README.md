# Simulador de comunicaciones (API REST)

Aplicacion de escritorio de la seccion **4.2.2**.

## Que hace

- Se conecta a la API REST de Flowable UI con Basic Auth.
- Lista las solicitudes activas del proceso `Process_Curso`.
- Detecta el estado actual de cada solicitud.
- Permite simular solo las comunicaciones habilitadas:
  - Aceptar la propuesta, indicando la fecha acordada (`fechaCurso`).
  - Rechazar la propuesta.
  - Solicitar modificaciones (`observacionesEmpresa`).
  - Enviar la nomina de participantes (`nominaParticipantes`).
  - Cancelar durante la preparacion.

## Configuracion

`src/main/resources/config.properties`:

```properties
rest.baseUrl=http://localhost:8080/flowable-ui/process-api
rest.username=admin
rest.password=test
process.definitionKey=Process_Curso

message.accept=Aceptación
message.reject=Rechazo
message.modify=Solicitud de modificaciones
message.cancel=cancelacionMsg
activity.nomina=Nomina
```

El usuario `admin` se usa como credencial tecnica de la simulacion y tiene el privilegio `access-rest-api`. Se puede cambiar por cualquier usuario que tenga ese privilegio.

## Compilar y ejecutar

```bash
../build.sh
./run.sh
```

## Como se detecta el estado

La aplicacion consulta el runtime de Flowable:

- Mensajes de negociacion:
  `GET /runtime/executions?processInstanceId=...&messageEventSubscriptionName=Aceptación`
- Cancelacion:
  `GET /runtime/executions?processInstanceId=...&messageEventSubscriptionName=cancelacionMsg`
- Nomina:
  `GET /runtime/executions?processInstanceId=...&activityId=Nomina`
- Actividades activas:
  `GET /runtime/executions/{processInstanceId}/activities`

## Como se envian las acciones

- Mensajes:
  `PUT /runtime/executions/{executionId}` con `action=messageEventReceived`, `messageName` y variables.
- Nomina:
  `PUT /runtime/executions/{executionId}` con `action=signal` y `nominaParticipantes`.
