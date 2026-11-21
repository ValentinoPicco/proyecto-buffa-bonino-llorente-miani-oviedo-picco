# Aplicaciones auxiliares de escritorio

Implementacion de la seccion 4.2 del proyecto de **Gestion y Tecnologias de Procesos de Negocio**.

| Aplicacion | Seccion | Comunicacion con Flowable |
| :--- | :--- | :--- |
| `desktop-java` | 4.2.1 - Preparacion de materiales | API Java + JDBC contra la base del motor |
| `simulador-rest` | 4.2.2 - Simulacion de comunicaciones | API REST de Flowable UI |

## Requisitos

- JDK 17 (`javac -version` debe responder 17).
- Maven 3.9 o superior.
- El entorno Docker del repositorio levantado:

```bash
cd ../docker
sudo docker compose up -d
```

## Compilacion

Desde este directorio:

```bash
./build.sh
```

o manualmente:

```bash
JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64 mvn clean package
```

## Ejecucion

```bash
./desktop-java/run.sh
./simulador-rest/run.sh
```

## Configuracion

Cada aplicacion trae un `config.properties` por defecto dentro de `src/main/resources`.
Para cambiarlo sin recompilar, se puede:

1. Crear un archivo `config.properties` en el directorio de la app (tiene prioridad sobre el del classpath).
2. Pasar `-Dconfig.file=/ruta/al/config.properties`.
3. Usar variables de entorno con prefijo `BPMN_` (por ejemplo `BPMN_DB_URL` o `BPMN_REST_BASEURL`).

## Nombres reales de los mensajes BPMN

Flowable usa como nombre de suscripcion el atributo `name` del elemento `<message>` cuando el evento tiene `messageRef`. El atributo `flowable:messageExpression` se ignora en ese caso.

| Accion | Evento BPMN | Nombre real en el motor |
| :--- | :--- | :--- |
| Iniciar solicitud | `Inicio` | `Solicitud de curso` |
| Aceptar propuesta | `Aceptar` | `Aceptación` |
| Rechazar propuesta | `Rechazar` | `Rechazo` |
| Solicitar modificaciones | `Modificar` | `Solicitud de modificaciones` |
| Cancelar preparacion | `Event_1g4xmqo` | `cancelacionMsg` |
| Enviar nomina | `Nomina` (receiveTask) | Se completa con `signal`, no con mensaje |

> El documento `CONTRATO_VARIABLES.md` de la raiz del repositorio menciona los valores de `messageExpression`. Para los eventos con `messageRef` esos valores no son los que expone el motor; los nombres de esta tabla son los verificados contra la instancia en ejecucion.

## Comportamiento del simulador (4.2.2)

`simulador-rest` lista las instancias activas y consulta, para cada una, sus
actividades y suscripciones de mensaje. A partir de eso habilita solo las
acciones posibles: aceptar, rechazar o pedir modificaciones cuando la instancia
espera esa respuesta; enviar la nomina cuando la receive task `Nomina` esta
activa; y cancelar cuando existe la suscripcion `cancelacionMsg`. No usa la base
de datos ni depende de la version del proceso.

## Variables que utilizan estas apps

| Variable | Tipo | App | Uso |
| :--- | :--- | :--- | :--- |
| `materialesPreparados` | boolean | `desktop-java` | Se pone en `true` al completar `Material`. |
| `fechaCurso` | string ISO-8601 | `simulador-rest` | Fecha acordada al aceptar la propuesta. |
| `observacionesEmpresa` | string | `simulador-rest` | Observaciones al solicitar modificaciones. |
| `nominaParticipantes` | string | `simulador-rest` | Nomina enviada por la empresa. |
| `empresaNombre`, `cursoNombre`, `solicitudId` | string / long | Ambas apps | Datos de contexto para mostrar en las tablas. |
