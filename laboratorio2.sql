/*
 * Laboratorio 2 - Punto 2.1
 * Grupo: Aura Pasmin, Matheo Chupa pijas, Ramírez Santiago
 * Fecha: 22 de Marzo de 2021
 * Agregar if DataBase then delete
*/

create domain name_r as varchar(50) not null;
create domain phone_r as varchar(30) default '0';
create domain email_r as varchar(40) not null;

-- facultad (codigo_facultad, nombre, telefono, direccion, email, pagina_web, profesor_id)

drop table if exists facultad;
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

drop table if exists profesor;
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

drop table if exists proyecto;
create table proyecto (
    proyecto_id varchar(20),
    nombre text not null unique,
    descripcion text not null,
    presupuesto int default 0,
    duracion varchar(20) default 'Por definir',
    fecha_inicio date not null,
    fecha_fin date not null,
    estado varchar(20) default 'En espera',
    facultad_id varchar(20)
);

-- profesores_proyecto (profesor-id, proyecto-id)

drop table if exists profesores_proyecto;
create table profesores_proyecto (
    profesor_id varchar(20),
    proyecto_id varchar(20),
    primary key (profesor_id, proyecto_id)
);

-- evaluador (evaluador_id, nombre, direccion, telefono, email, titulo_academico, anos_experiencia)

drop table if exists evaluador
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

drop table if exists evaluadores_proyecto;
create table evaluadores_proyecto (
    proyecto_id varchar(20),
    evaluador_id varchar(20),
    primary key (proyecto_id, evaluador_id)
);

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
       ('nUN852', 'Dilip Nagendra Ahmad', '276 Mechanic St Southbridge', '774-402-8189', 'nagemad10@gmail.es', 'Geografia', 'H99NIR'),
       ('L0lq4', 'Alexey Raisa Shwetz', '278 Tremont St Carver', '508-866-4427', 'alexeytz@gmail.com', 'Neuropsicoloía Clínica', 'Y44YDX'),
       ('55opF', 'Anika Berthold Gotti', '277 Wallingford Ave Athol', '978-249-3056', 'Berthold@gmail.com.co', 'Derecho Procesal Penal', 'ZE62MS');

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

-- Inserto algunos profesores más

insert into profesor values ('m4nT1', 'Nadiye Anar Afolabi', '811 S Carney Dr Saint Clair', '810-326-1797', 'nadiyeA@gmail.com', 'Patologa', 'A100BI'),
                            ('D43M8', 'Titus Gyeong-Suk Nicolas', '2439 Concord Ln SW Bogue Chitto', '601-734-6238', 'suk1990@gmail.com.co', 'Biologia Evolutiva', 'A1003E'),
                            ('7Uye22', 'Alfhard Adsila Southers', '457 Gardner St El Cajon', '619-749-5974', 'alfhard@gmail.com', 'PhD. Software', 'E3017G');

-- Insertar 3 registros en la tabla profesor, cada profesor debe pertenecer a una facultad diferente

insert into profesor values ('8Mus11', 'Hanne Elise Reiter', '32 Mitchell Rd Stow', '912-778-5509', 'hanneE203@gmail.com', 'Quimica de materiales', 'A1003E'),
                            ('330Ga', 'Matt Trace Hopper', '220 Mill Rd Chelmsford', '918-693-6828', 'mattSoci@gmail.es', 'Sociologia', 'NL10R0'),
                            ('46oIIn', 'Pernel Keith Holland', '145 Pleasant St Ashland', '717-485-0416', 'perkeilland@gmail.com', 'Psicologia Forence', 'Y44YDX');


-- Inserte 3 registros en la tabla proyecto

insert into proyecto values ('EE1o8',
                             'ActivationNet: Representation learning to predict contact quality of interacting 3-D surfaces in engineering designs',
                             'we introduce a machine learning algorithm to extract features from point-based',
                             13000000, '2 años y 2 meses', '2019-01-18', '2020-03-06', 'Concluida', 'E3017G'),
                            ('jBc300', 'Iron chelates hitch a ride on PAT1',
                             'Iron is an essential nutrient for humans and other mammalswith numerous critical biochemical function',
                             5710000, '1 año, 6 meses', '2021-01-23', '2022-07-12', 'Activa', 'A100BI'),
                            ('2Ma5', 'The PDB and the Ribosome',
                             'The PDB is a publicly accessible repository of information about the positions of atoms in biological macromolecules',
                             7900000, '3 años', '2015-11-03', '2018-05-11', 'Concluida', 'A1003E');

-- Insertar 5 registros en la tabla evaluador

insert into evaluador values ('4Ev011', 'Gracie Camellia Grenville', '131 Beth Ct Waveland', '228-467-1110', 'Grcamegr@gmail.com', 'PhD. Biologia', 20),
                             ('tTo092', 'Jin Ling Kuang', '419 S 4th St Murfreesboro', '252-396-8476', 'JLkuang@gmail.es', 'Inmunología', 11),
                             ('00Nc6', 'Patti Amberly Rogers', '3904 Montrose Dr Chevy Chase', '301-215-9889', 'pattiAmr@gmail.com', 'Medicina Experimental', 7),
                             ('r93Kz2', 'Hachirou Takahiro', '1380 Hoppers Blf Rutledge', '865-767-3815', 'takahiro@gmail.com', 'PhD. Ingenieria de Software', 15),
                             ('Xo5p55', 'Milla Tércia Hinrichs', '333 Mccorrie Ln Portsmouth', '401-942-1428', 'hinrichs@gmail.com', 'Modelos Matematicos y TI', 13);


-- Insertar 5 registros en la tabla profesores_proyecto

insert into profesores_proyecto values ('m4nT1', 'jBc300'),
                                       ('Uq980', 'jBc300'),
                                       ('sMM02E', 'EE1o8'),
                                       ('7Uye22', 'EE1o8'),
                                       ('D43M8', '2Ma5');

-- Insertar 5 registros en la tabla evalusdores_proyecto

insert into evaluadores_proyecto values ('2Ma5', '4Ev011'),
                                        ('jBc300', 'tTo092'),
                                        ('jBc300', '00Nc6'),
                                        ('EE1o8', 'r93Kz2'),
                                        ('EE1o8', 'Xo5p55');

