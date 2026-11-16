# Entorno Docker Flowable & PostgreSQL - Proyecto Grupal

Este entorno provee la infraestructura completa para la práctica básica y el proyecto de la cátedra de **Gestión y Tecnologías de Procesos de Negocio**.

## Servicios incluidos

| Servicio | Contenedor | Puerto Local | Acceso / Propósito |
| :--- | :--- | :--- | :--- |
| **Flowable UI 6.8.0** | `flowable-persistente` | `8080` | `http://localhost:8080/flowable-ui` (Modeler, IDM, Task, Admin y API REST) |
| **PostgreSQL 15** | `flowable-postgres` | `5432` | `localhost:5432` (BD `flowable` y BD `institucion_db`) |
| **pgAdmin 4** | `flowable-pgadmin` | `5050` | `http://localhost:5050` (Gestión visual de bases de datos) |

---

## Credenciales predeterminadas

- **Flowable UI:**
  - Usuario: `admin`
  - Contraseña: `test`
- **PostgreSQL:**
  - Host (desde apps externas en host): `localhost` o `127.0.0.1`
  - Host (desde red interna Docker / pgAdmin): `postgres`
  - Puerto: `5432`
  - Usuario: `flowable`
  - Contraseña: `flow10`
  - Bases de datos: `flowable` (motor BPMN) y `institucion_db` (cursos, empresas y seguimiento)
- **pgAdmin 4:**
  - Usuario: `admin@localhost.com`
  - Contraseña: `admin123`

---

## Comandos de Operación

### 1. Iniciar los contenedores
```bash
docker compose up -d
```

### 2. Verificar estado de los contenedores
```bash
docker compose ps
```

### 3. Ver logs en tiempo real
```bash
# Todos los servicios
docker compose logs -f

# Solo Flowable
docker compose logs -f flowable
```

### 4. Detener los contenedores (preservando datos)
```bash
docker compose down
```

> [!WARNING]
> **NUNCA** utilices `docker compose down -v` salvo que desees borrar intencionalmente todas las bases de datos y modelos guardados.

---

## Copias de Seguridad y Restauración

Para compartir el estado de la base de datos entre los integrantes del grupo:

### Generar Backup
```bash
./scripts/backup.sh
```
Los archivos se guardarán en la carpeta `backups/`.

### Restaurar Backup
```bash
./scripts/restore.sh ../backups/full_backup_YYYYMMDD_HHMMSS.sql
```

---

## Conexión de Aplicaciones del Proyecto

### 1. Aplicación de Escritorio con API Java (Sección 4.2.1)
Conexión JDBC directa:
- URL: `jdbc:postgresql://localhost:5432/flowable`
- Usuario: `flowable`
- Clave: `flow10`

### 2. Sitio Web y Aplicación de Simulación (Sección 4.1 y 4.2.2)
Acceso vía API REST de Flowable:
- Base URL: `http://localhost:8080/flowable-ui/process-api`
- Autenticación: Basic Auth con las credenciales de los usuarios creados en Flowable IDM (o `admin`:`test`).
