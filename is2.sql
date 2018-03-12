
CREATE TABLE prioridades (
                id_prioridad VARCHAR NOT NULL,
                descripcion VARCHAR NOT NULL,
                CONSTRAINT prioridades_pk PRIMARY KEY (id_prioridad)
);


CREATE TABLE estados (
                id_estado VARCHAR NOT NULL,
                descripcion VARCHAR NOT NULL,
                CONSTRAINT estados_pk PRIMARY KEY (id_estado)
);


CREATE TABLE funciones (
                id_funcion INTEGER NOT NULL,
                descripcion VARCHAR NOT NULL,
                CONSTRAINT funciones_pk PRIMARY KEY (id_funcion)
);


CREATE TABLE permisos (
                id_permiso INTEGER NOT NULL,
                descripcion VARCHAR NOT NULL,
                CONSTRAINT permisos_pk PRIMARY KEY (id_permiso)
);


CREATE TABLE roles (
                id_rol INTEGER NOT NULL,
                descripcion VARCHAR NOT NULL,
                CONSTRAINT roles_pk PRIMARY KEY (id_rol)
);


CREATE TABLE rol_permiso (
                id_rol INTEGER NOT NULL,
                id_permiso INTEGER NOT NULL,
                CONSTRAINT rol_permiso_pk PRIMARY KEY (id_rol, id_permiso)
);


CREATE TABLE Cargos (
                id_cargo INTEGER NOT NULL,
                descripcion VARCHAR NOT NULL,
                CONSTRAINT cargos_pk PRIMARY KEY (id_cargo)
);


CREATE TABLE Personas (
                cedula VARCHAR NOT NULL,
                id_cargo INTEGER NOT NULL,
                nombre VARCHAR NOT NULL,
                apellido VARCHAR NOT NULL,
                fecha_nacimiento DATE NOT NULL,
                CONSTRAINT personas_pk PRIMARY KEY (cedula)
);


CREATE TABLE proyectos (
                id_proyecto VARCHAR NOT NULL,
                descripcion VARCHAR NOT NULL,
                fecha_inicio DATE NOT NULL,
                fecha_entrega DATE NOT NULL,
                monto_cotizado DOUBLE PRECISION NOT NULL,
                CONSTRAINT proyectos_pk PRIMARY KEY (id_proyecto)
);


CREATE TABLE requerimientos (
                id_requerimiento VARCHAR NOT NULL,
                nombre VARCHAR NOT NULL,
                id_funcion INTEGER NOT NULL,
                id_proyecto VARCHAR NOT NULL,
                id_prioridad VARCHAR NOT NULL,
                id_estado VARCHAR NOT NULL,
                dimension VARCHAR NOT NULL,
                comentarios VARCHAR NOT NULL,
                CONSTRAINT requerimientos_pk PRIMARY KEY (id_requerimiento)
);


CREATE TABLE equipo_desarrollo (
                id_empleado VARCHAR NOT NULL,
                cedula VARCHAR NOT NULL,
                id_proyecto VARCHAR NOT NULL,
                descripcion VARCHAR NOT NULL,
                CONSTRAINT equipo_desarrollo_pk PRIMARY KEY (id_empleado)
);


CREATE TABLE roles_empleado (
                id_rol INTEGER NOT NULL,
                id_empleado VARCHAR NOT NULL,
                CONSTRAINT roles_empleado_pk PRIMARY KEY (id_rol, id_empleado)
);


CREATE TABLE Sprints (
                id_proyecto VARCHAR NOT NULL,
                id_sprint VARCHAR NOT NULL,
                descripcion VARCHAR NOT NULL,
                fecha_inicio DATE NOT NULL,
                fecha_fin DATE NOT NULL,
                CONSTRAINT sprints_pk PRIMARY KEY (id_proyecto, id_sprint)
);


CREATE TABLE actividades (
                id_actividad VARCHAR NOT NULL,
                id_requerimiento VARCHAR NOT NULL,
                id_proyecto VARCHAR NOT NULL,
                id_sprint VARCHAR NOT NULL,
                CONSTRAINT actividades_pk PRIMARY KEY (id_actividad)
);


CREATE TABLE kanban (
                id_actividad VARCHAR NOT NULL,
                id_estado VARCHAR NOT NULL,
                fecha_creacion DATE NOT NULL,
                fecha_fin DATE NOT NULL,
                CONSTRAINT kanban_pk PRIMARY KEY (id_actividad)
);


ALTER TABLE requerimientos ADD CONSTRAINT prioridades_requerimientos_fk
FOREIGN KEY (id_prioridad)
REFERENCES prioridades (id_prioridad)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE kanban ADD CONSTRAINT estados_kanban_fk
FOREIGN KEY (id_estado)
REFERENCES estados (id_estado)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE requerimientos ADD CONSTRAINT estados_requerimientos_fk
FOREIGN KEY (id_estado)
REFERENCES estados (id_estado)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE requerimientos ADD CONSTRAINT funciones_requerimientos_fk
FOREIGN KEY (id_funcion)
REFERENCES funciones (id_funcion)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE rol_permiso ADD CONSTRAINT permisos_rol_permiso_fk
FOREIGN KEY (id_permiso)
REFERENCES permisos (id_permiso)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE rol_permiso ADD CONSTRAINT roles_rol_permiso_fk
FOREIGN KEY (id_rol)
REFERENCES roles (id_rol)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE roles_empleado ADD CONSTRAINT roles_roles_desarrollador_fk
FOREIGN KEY (id_rol)
REFERENCES roles (id_rol)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE Personas ADD CONSTRAINT cargos_personas_fk
FOREIGN KEY (id_cargo)
REFERENCES Cargos (id_cargo)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE equipo_desarrollo ADD CONSTRAINT personas_equipo_desarrollo_fk
FOREIGN KEY (cedula)
REFERENCES Personas (cedula)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE Sprints ADD CONSTRAINT proyectos_sprints_fk
FOREIGN KEY (id_proyecto)
REFERENCES proyectos (id_proyecto)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE equipo_desarrollo ADD CONSTRAINT proyectos_equipo_desarrollo_fk
FOREIGN KEY (id_proyecto)
REFERENCES proyectos (id_proyecto)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE requerimientos ADD CONSTRAINT proyectos_requerimientos_fk
FOREIGN KEY (id_proyecto)
REFERENCES proyectos (id_proyecto)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE actividades ADD CONSTRAINT requerimientos_actividades_fk
FOREIGN KEY (id_requerimiento)
REFERENCES requerimientos (id_requerimiento)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE roles_empleado ADD CONSTRAINT equipo_desarrollo_roles_desarrollador_fk
FOREIGN KEY (id_empleado)
REFERENCES equipo_desarrollo (id_empleado)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE actividades ADD CONSTRAINT sprints_actividades_fk
FOREIGN KEY (id_proyecto, id_sprint)
REFERENCES Sprints (id_proyecto, id_sprint)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE kanban ADD CONSTRAINT actividades_kanban_fk
FOREIGN KEY (id_actividad)
REFERENCES actividades (id_actividad)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;