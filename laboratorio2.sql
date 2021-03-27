/*
 * Laboratorio 2 - Punto 2.1
 * Grupo: * * *, * * *, Ramírez Santiago
 * Fecha: 22 de Marzo de 2021
 * Agregar if DataBase then delete
*/

create domain name_r as varchar(50) not null;
create domain phone_r as varchar(30) default '0';
create domain email_r as varchar(40) not null;

-- facultad (codigo_facultad, nombre, telefono, direccion, email, pagina_web, profesor_id)

create table facultad (
    codigo_facultad varchar(20),
    nombre name_r,
    telefono phone_r,
    direccion varchar(30),
    email email_r unique,
    pagina_web varchar(50),
    profesor_id varchar(20) unique
);

-- profesor (profesor_id, nombre, direccion, telefono, email, titulo_obtenido, facultad_id)

create table profesor (
    profesor_id varchar(20),
    nombre name_r,
    direccion varchar(50),
    telefono phone_r,
    email email_r unique,
    titulo_obtenido varchar(30),
    facultad_id varchar(20)
);

-- proyecto (proyecto_id, nombre, descripcion, presupuesto, duracion, fecha_inicio, fecha_fin, estado, facultad_id)

create table proyecto (
    proyecto_id varchar(20),
    nombre varchar(30) not null unique,
    descripcion text not null,
    presupuesto int default 0,
    duracion varchar(20) default 'Por definir',
    fecha_inicio date not null,
    fecha_fin date not null,
    estado varchar(20) default 'En espera',
    facultad_id varchar(20)
);

-- profesores_proyecto (profesor-id, proyecto-id)

create table profesores_proyecto (
    profesor_id varchar(20),
    proyecto_id varchar(20),
    primary key (profesor_id, proyecto_id)
);

-- evaluador (evaluador_id, nombre, direccion, telefono, email, titulo_academico, anos_experiencia)

create table evaluador (
    evaluador_id varchar(20),
    nombre name_r,
    direccion varchar(30),
    telefono phone_r,
    email email_r unique,
    titulo_academico varchar(30),
    anos_experiencia int default(0) check ( anos_experiencia <= 80 )
);

-- evaluadores_proyecto (proyecto-id, evaluador-id)

create table evaluadores_proyecto (
    proyecto_id varchar(20),
    evaluador_id varchar(20),
    primary key (proyecto_id, evaluador_id)
);

-- Primary key of facultad
alter table facultad
    add constraint facultad_pk primary key (codigo_facultad);
-- Primary key of Profesor
alter table profesor
    add constraint profesor_pk primary key (profesor_id);
-- Primary key of proyecto
alter table proyecto
    add constraint proyecto_pk primary key (proyecto_id);
-- Primary key of evaluador
alter table evaluador
    add constraint evaluador_pk primary key (evaluador_id);

-- Foreign key of facultad
alter table facultad
    add constraint facultad_fk foreign key (profesor_id) references profesor(profesor_id);

-- Foreign key of profesor
alter table profesor
    add constraint profesor_fk foreign key (facultad_id) references facultad(codigo_facultad);

-- Foreign key of proyecto
alter table proyecto
    add constraint proyecto_fk foreign key (facultad_id) references facultad(codigo_facultad);

-- Foreign keys of profesores_proyecto
alter table profesores_proyecto
    add foreign key (profesor_id) references profesor(profesor_id),
    add foreign key (proyecto_id) references proyecto(proyecto_id);

-- Foreign keys of evaluadores_proyecto
alter table evaluadores_proyecto
    add foreign key (proyecto_id) references proyecto(proyecto_id),
    add foreign key (evaluador_id) references evaluador(evaluador_id);

-- Insert data
insert into facultad
values ('A1003E', 'Facultad de Ciencias Exactas', '3149407303', 'Edificio A4', 'ciencias.exactas@gmail.com', 'www.sciencexplore.es'),
       ('A100BI', 'Facultad de Medicina', '3001049577', 'Bloque 2F', 'mdhealth@gmail.es', 'www.mdhealth.com.co'),
       ('E3017G', 'Facultad de Ingenieria', '3058620041', 'Bloque M', 'iee@gmail.com', 'www.ing.com'),
       ('E5N991', 'Facultad de Agronomia', '339-201-2298', 'Edicio 9Q', 'agronomia@gmail.com', 'www.agro.edu.co'),
       ('A66M02', 'Facultad de arquitectura', '339-206-0881', 'Edificio K1', 'faArquitec@gmail.es', 'www.aquit.com'),
       ('AB0243', 'Facultad de Ciencias Economicas', '339-222-8896', 'Edificio 3', 'econo@gmail.es', 'www.ecmia.es'),
       ('M33I1A', 'Facultad de Ciencias Físicas y Matemáticas', '339-224-7132', 'Bloque P1', 'fiandmat@gmail.com', 'www.fismat.com.co'),
       ('NL10R0', 'Facultad de Ciencias Sociales', '339-499-5655', 'Bloque 6', 'socialsci@gmail.es', 'www.cisocia.com'),
       ('EU4501', 'Facultad de Filosofia', '339-402-7384', 'Edificio 4K', 'filoso@gmail.com', 'www.filoso.com.co'),
       ('H99NIR', 'Facultad de Humanidades', '339-307-1275', 'Bloque S2', 'human@gmail.com', 'www.human.com'),
       ('Y44YDX', 'Facultad de Psicologia', '339-593-0931', 'Bloque 7', 'psic@gmail.com', 'www.psic.com'),
       ('ZE62MS', 'Facultad de Derecho', '339-581-0500', 'Bloque W2', 'law@gmail.com', 'www.law.com.co');

insert into profesor
values ('2all04', 'Juan Esteban Mena', '280 Sumner St Stoughton', '3013590421', 'juanEsteban@gmail.com', 'Biologo', 'A1003E'),
       ('Uq980', 'Jason Brownlee', '200 Merrimack St #4TH', '3125940231', 'brownlee@gmail.com', 'Medico', 'A100BI'),
       ('sMM02E', 'Zhen Yu', '20 St Jude Close, Colchester', '509-874-0631', 'zhenY10@gmail.com', 'Ingenieria Electrica', 'E3017G'),
       ('E21So7', 'Teale Christa Peak', '363 Great Rd Beadford', '717-957-2445', 'christapeak2@gmail.com', 'Agroecologia', 'E5N991'),
       ('377H1l', 'Selina Pearce Devine', '4303 King Kennedy St Carlisle', '864-427-5543', 'seDevine@gmail.es', 'Arquitectura y Urbanismo', 'A66M02'),
       ('701Jj', 'Rylan Faith Waterman', '214 Lexington Ave Crum Lynne', '610-872-1424', 'waterman1980@gmail.com', 'Contador Publico', 'AB0243'),
       ('094RX', 'Ariana Ely Buckley', '13670 Dixie Hwy Birch Run', '989-624-4631', 'arianly@gmail.com', 'Fisica Nuclear', 'M33I1A'),
       ('44Fn6l', 'Ewen Cormag Lyne', '3883 E 2609th Rd Sheridan', '815-496-2299', 'ewenly23@gmail.es', 'Lenguas y Cultura', 'NL10R0'),
       ('Wwa91', 'Jacqueline Damien Barbier', '344 La Porte Ave Melrose Park', '708-562-2820', 'damienBar@gmail.es', 'Filosofia y Letras', 'EU4501'),
       ()
