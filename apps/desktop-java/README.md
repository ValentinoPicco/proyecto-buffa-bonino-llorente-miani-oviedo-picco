# Preparacion de materiales (API Java)

Aplicacion de escritorio de la seccion **4.2.1**.

## Que hace

- Se conecta directamente por JDBC a la base del motor Flowable.
- Valida el usuario y la contrasena contra Flowable IDM.
- Muestra las tareas `Preparar materiales` asignadas al usuario o disponibles para reclamar por su grupo.
- Permite reclamar y completar la tarea.
- Al completar, guarda la variable `materialesPreparados = true`.

## Por que usa dos motores

- `ProcessEngine`: ejecuta las operaciones sobre tareas y proceso.
- `IdmEngine`: valida credenciales y obtiene los grupos del usuario.

Ambos apuntan a la misma base PostgreSQL que Flowable UI. La aplicacion usa `databaseSchemaUpdate=false` y no activa el ejecutor asincronico, para no modificar el esquema ni competir con el motor que ya corre en Docker.

## Configuracion

`src/main/resources/config.properties`:

```properties
db.url=jdbc:postgresql://localhost:5432/flowable
db.username=flowable
db.password=flow10
db.driver=org.postgresql.Driver

task.definitionKey=Material
task.name=Preparar materiales
group.administracion=adm
```

Para usar otro archivo:

```bash
./run.sh -Dconfig.file=/ruta/al/config.properties
```

## Compilar y ejecutar

```bash
../build.sh
./run.sh
```

Usuarios de prueba (Flowable IDM):

| Usuario | Contrasena | Grupo |
| :--- | :--- | :--- |
| `admin2` | `admin2` | `adm` |
| `admin_boss` | `admin_boss` | `adm` |
