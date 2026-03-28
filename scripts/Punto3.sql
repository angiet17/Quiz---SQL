CREATE TABLE tic_sedes_resumen (
    resumen_id INTEGER PRIMARY KEY,
    sede_codigo INTEGER NOT NULL,
    anio INTEGER NOT NULL,
    total_actividades INTEGER,
    tiene_internet BOOLEAN,
    fecha_carga DATETIME,
    
    UNIQUE (sede_codigo, anio)
);
