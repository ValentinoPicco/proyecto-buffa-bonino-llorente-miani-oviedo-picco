CREATE TABLE IF NOT EXISTS empresas (
    id BIGSERIAL PRIMARY KEY,
    nombre VARCHAR(150) NOT NULL,
    contacto_nombre VARCHAR(120),
    contacto_email VARCHAR(180),
    created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS solicitudes_curso (
    id BIGSERIAL PRIMARY KEY,
    empresa_id BIGINT NOT NULL REFERENCES empresas(id),
    process_instance_id VARCHAR(64) UNIQUE,
    nombre VARCHAR(200) NOT NULL,
    descripcion TEXT,
    cantidad_participantes INTEGER NOT NULL CHECK (cantidad_participantes > 0),
    fechas_preferidas TEXT,
    estado VARCHAR(30) NOT NULL DEFAULT 'solicitado'
        CHECK (estado IN (
            'solicitado',
            'no_viable',
            'en_propuesta',
            'rechazado',
            'en_preparacion',
            'en_curso',
            'finalizado',
            'cancelado',
            'cerrado_sin_respuesta'
        )),
    created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS propuestas (
    id BIGSERIAL PRIMARY KEY,
    solicitud_id BIGINT NOT NULL REFERENCES solicitudes_curso(id) ON DELETE CASCADE,
    version INTEGER NOT NULL CHECK (version > 0),
    programa TEXT,
    presupuesto NUMERIC(12, 2) CHECK (presupuesto IS NULL OR presupuesto >= 0),
    fechas_posibles TEXT,
    pdf_nombre VARCHAR(255),
    observaciones_empresa TEXT,
    created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    UNIQUE (solicitud_id, version)
);

CREATE TABLE IF NOT EXISTS participantes (
    id BIGSERIAL PRIMARY KEY,
    solicitud_id BIGINT NOT NULL REFERENCES solicitudes_curso(id) ON DELETE CASCADE,
    nombre VARCHAR(150) NOT NULL,
    documento VARCHAR(40),
    email VARCHAR(180),
    asistencia NUMERIC(5, 2) CHECK (asistencia IS NULL OR (asistencia >= 0 AND asistencia <= 100))
);

CREATE TABLE IF NOT EXISTS informes_resultados (
    id BIGSERIAL PRIMARY KEY,
    solicitud_id BIGINT NOT NULL REFERENCES solicitudes_curso(id) ON DELETE CASCADE,
    resultados TEXT NOT NULL,
    porcentaje_asistencia NUMERIC(5, 2)
        CHECK (porcentaje_asistencia IS NULL OR (porcentaje_asistencia >= 0 AND porcentaje_asistencia <= 100)),
    pdf_nombre VARCHAR(255),
    created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX IF NOT EXISTS idx_solicitudes_empresa
    ON solicitudes_curso (empresa_id);

CREATE INDEX IF NOT EXISTS idx_solicitudes_estado
    ON solicitudes_curso (estado);

CREATE INDEX IF NOT EXISTS idx_participantes_solicitud
    ON participantes (solicitud_id);

CREATE INDEX IF NOT EXISTS idx_informes_solicitud
    ON informes_resultados (solicitud_id);
