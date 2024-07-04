-- public.detales_habitacion definition

-- Drop table

DROP TABLE public.detales_habitacion;

CREATE TABLE public.detales_habitacion (
	id_detallesh int4 NOT NULL,
	vista_al_mar bool NULL,
	cant_camas int4 NULL,
	CONSTRAINT detales_habitacion_pk PRIMARY KEY (id_detallesh)
);


-- public.habitaciones definition

-- Drop table

DROP TABLE public.habitaciones;

CREATE TABLE public.habitaciones (
	id int4 GENERATED ALWAYS AS IDENTITY( INCREMENT BY 1 MINVALUE 1 MAXVALUE 2147483647 START 110 CACHE 100 NO CYCLE) NOT NULL,
	cantdepersonas int4 NULL,
	precio int4 NULL,
	reservada bool NULL,
	id_detalles int4 NULL,
	image text DEFAULT 'assets/images.jpg'::text NULL,
	CONSTRAINT habitaciones_pk PRIMARY KEY (id),
	CONSTRAINT habitaciones_unique UNIQUE (id_detalles)
);


-- public.users definition

-- Drop table

DROP TABLE public.users;

CREATE TABLE public.users (
	username varchar NULL,
	id smallserial NOT NULL,
	conectado bool DEFAULT false NULL,
	rol varchar NULL,
	"password" varchar NULL,
	mail varchar NULL,
	sexo varchar NULL,
	edad int4 NULL,
	calle varchar NULL,
	"#casa" int4 NULL,
	CONSTRAINT users_pk PRIMARY KEY (id)
);


-- public.administradores definition

-- Drop table

DROP TABLE public.administradores;

CREATE TABLE public.administradores (
	id_admin int4 NOT NULL,
	id_user int4 NOT NULL,
	CONSTRAINT administradores_pk PRIMARY KEY (id_admin),
	CONSTRAINT administradores_unique UNIQUE (id_user),
	CONSTRAINT administradores_users_fk FOREIGN KEY (id_user) REFERENCES public.users(id)
);


-- public.clientes definition

-- Drop table

DROP TABLE public.clientes;

CREATE TABLE public.clientes (
	id_cliente int4 GENERATED ALWAYS AS IDENTITY( INCREMENT BY 1 MINVALUE 115 MAXVALUE 1000000 START 115 CACHE 1 NO CYCLE) NOT NULL,
	id_user int4 NOT NULL,
	CONSTRAINT clientes_pk PRIMARY KEY (id_cliente),
	CONSTRAINT clientes_unique UNIQUE (id_user),
	CONSTRAINT clientes_users_fk FOREIGN KEY (id_user) REFERENCES public.users(id)
);


-- public.deatil_room definition

-- Drop table

DROP TABLE public.deatil_room;

CREATE TABLE public.deatil_room (
	id int4 NOT NULL,
	id_detalles int4 NULL,
	id_habitacion int4 NULL,
	CONSTRAINT detalles_habitacion_pk PRIMARY KEY (id),
	CONSTRAINT deatil_room_detales_habitacion_fk FOREIGN KEY (id_detalles) REFERENCES public.detales_habitacion(id_detallesh),
	CONSTRAINT detalles_habitacion_habitaciones_fk FOREIGN KEY (id_habitacion) REFERENCES public.habitaciones(id)
);


-- public.gerente definition

-- Drop table

DROP TABLE public.gerente;

CREATE TABLE public.gerente (
	id_gerente int4 NOT NULL,
	id_user int4 NOT NULL,
	CONSTRAINT gerente_pk PRIMARY KEY (id_gerente),
	CONSTRAINT gerente_unique UNIQUE (id_user),
	CONSTRAINT gerente_users_fk FOREIGN KEY (id_user) REFERENCES public.users(id)
);


-- public.reservas definition

-- Drop table
DROP TABLE public.reservas;

CREATE TABLE public.reservas (
	id int4 GENERATED BY DEFAULT AS IDENTITY( INCREMENT BY 1 MINVALUE 1 MAXVALUE 2147483647 START 11333 CACHE 1 NO CYCLE) NOT NULL,
	fecha_entrada date NULL,
	fecha_salida date NULL,
	numero_huspedes int4 NULL,
	id_cliente int4 NOT NULL,
	preciototal int4 NULL,
	cantdiasestadia int4 NULL,
	id_habitacion int4 NOT NULL,
	CONSTRAINT reservas_pk PRIMARY KEY (id),
	CONSTRAINT uniquehabit UNIQUE (id_habitacion) INCLUDE (id_habitacion),
	CONSTRAINT habitacon_fg FOREIGN KEY (id_habitacion) REFERENCES public.habitaciones(id),
	CONSTRAINT reservas_users_fk FOREIGN KEY (id_cliente) REFERENCES public.users(id)
);


-- public.telefonos_users definition

-- Drop table

DROP TABLE public.telefonos_users;

CREATE TABLE public.telefonos_users (
	id_telefono int4 NOT NULL,
	id_user int4 NULL,
	numero_telefono int4 NULL,
	CONSTRAINT telefonos_users_pk PRIMARY KEY (id_telefono),
	CONSTRAINT telefonos_users_users_fk FOREIGN KEY (id_user) REFERENCES public.users(id)
);


-- public.reportes definition

-- Drop table

DROP TABLE public.reportes;

CREATE TABLE public.reportes (
	idr int4 NOT NULL,
	reporte varchar NULL,
	id_habitacion int4 NULL,
	CONSTRAINT reportes_pk PRIMARY KEY (idr),
	CONSTRAINT reportes_reservas_fk FOREIGN KEY (id_habitacion) REFERENCES public.reservas(id)
);