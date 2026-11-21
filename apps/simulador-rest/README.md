# Simulador de comunicaciones (API REST)

Aplicación de escritorio de la sección **4.2.2**.

## Qué hace

- Se conecta a la API REST de Flowable UI con Basic Auth.
- Lista las instancias **activas** del proceso `Process_Curso` (todas las versiones deployadas).
- Detecta el estado real de cada solicitud consultando el runtime.
- Habilita únicamente las comunicaciones que ese estado permite:
  - Aceptar la propuesta, indicando la fecha acordada (`fechaCurso`).
  - Rechazar la propuesta.
  - Solicitar modificaciones (`observacionesEmpresa`).
  - Enviar la nómina de participantes (`nominaParticipantes`).
  - Cancelar durante la preparación.

No lee la base de datos de Flowable: toda la interacción es por REST.

## Configuración

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

El usuario `admin` se usa como credencial técnica de la simulación y tiene el
privilegio `access-rest-api`. Se puede cambiar por cualquier usuario que tenga
ese privilegio.

## Compilar y ejecutar

```bash
../build.sh
./run.sh
```

## Cómo se detecta el estado

La aplicación consulta el runtime de Flowable:

1. `GET /runtime/process-instances?processDefinitionKey=Process_Curso&includeProcessVariables=true`
   para obtener las instancias activas y sus variables de contexto.
2. `GET /runtime/executions?processInstanceId=...` para conocer las actividades
   activas y la ejecución concreta de la receive task de nómina.
3. `GET /runtime/event-subscriptions?processInstanceId=...` para saber qué
   mensajes está esperando la instancia.
4. `GET /repository/process-definitions/{id}` y el `contentUrl` del recurso BPMN
   para traducir los `activityId` a nombres legibles. El catálogo se cachea por
   definición.

Con esa información se decide:

| Comunicación | Condición en el runtime |
| :--- | :--- |
| Aceptar propuesta | Suscripción de mensaje `Aceptación` |
| Rechazar propuesta | Suscripción de mensaje `Rechazo` |
| Solicitar modificaciones | Suscripción de mensaje `Solicitud de modificaciones` |
| Enviar nómina | Actividad `Nomina` activa |
| Cancelar preparación | Suscripción de mensaje `cancelacionMsg` |

Los nombres de los mensajes se pueden ajustar en `config.properties`. Si el
modelo cambia, la aplicación no necesita recompilarse: detecta las
suscripciones que realmente expone el motor.

## Cómo se envían las acciones

- Mensajes (aceptar, rechazar, modificar, cancelar):
  `PUT /runtime/executions/{executionId}` con
  `action=messageEventReceived`, `messageName` y las variables.
- Nómina:
  `PUT /runtime/executions/{executionId}` con `action=signal` y
  `nominaParticipantes`.

La fecha de aceptación se valida como ISO-8601, por ejemplo
`2026-11-18T15:30:00Z`, porque el timer del BPMN la usa directamente.

## Nombres reales de los mensajes BPMN

Flowable usa como nombre de suscripción el atributo `name` del elemento
`<message>` cuando el evento tiene `messageRef`. El atributo
`flowable:messageExpression` se usa solo cuando no hay `messageRef`.

| Acción | Evento BPMN | Nombre real en el motor |
| :--- | :--- | :--- |
| Aceptar propuesta | `Aceptar` | `Aceptación` |
| Rechazar propuesta | `Rechazar` | `Rechazo` |
| Solicitar modificaciones | `Modificar` | `Solicitud de modificaciones` |
| Cancelar preparación | `Event_1g4xmqo` | `cancelacionMsg` |
| Enviar nómina | `Nomina` (receiveTask) | Se completa con `signal` |

## Estados que muestra la tabla

- Esperando decisión de la empresa.
- Preparación: nómina pendiente.
- Preparación del curso.
- Cancelación en curso.
- Elaboración o revisión de la propuesta (área interna).
- Curso en dictado.
- Informe de resultados pendiente.
- Cierre administrativo.
- En ejecución (con las actividades activas).

## Prueba rápida

1. Levantar el entorno:

   ```bash
   cd ../../docker
   docker compose up -d
   ```

2. Deployar el BPMN o restaurar un backup que ya lo contenga.

3. Iniciar una solicitud desde el portal de empresa o por REST y completar la
   tarea interna `Propuesta` para llegar a la compuerta de negociación.

4. Abrir el simulador, seleccionar la solicitud y usar solo los botones que se
   habilitan. Después de cada acción el listado se refresca y el estado cambia.

## Notas

- La aplicación lista todas las versiones del proceso; no depende de que la
  última versión sea la correcta.
- Si una instancia está en una etapa interna (por ejemplo `Revisar` o
  `Archivar`), se muestra con estado y sin botones de comunicación.
- `cancelacionMsg` solo existe mientras la instancia está en preparación, porque
  lo publica el event subprocess de cancelación.
