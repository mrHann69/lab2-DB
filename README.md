# LABORATORIO PRACTICO 2
* Description
*this is a practical laboratory from the  Databases course*\
*Participantes:*
- Aura Marina Pasmin - 1825680-2711
- Santiago Ramirez - 1841391-2711
- Franco L. Matheo - 1830665-2711

### PUNTO 1

## PUNTO 1


* Dadas las relaciones X, Y y Z, completar la tabla 1. Partiendo de la operación del algebra relacional que se muestra la primera columna, escriba una instrucciónSQL adecuada para cada operación. En la última columna escriba el resultado que se obtiene al aplicar dicha consulta. Escriba este resultado lo más claramente posible, use tablas si es necesario.\
![punto1-tablas](imgs/tablasp1.jpeg)
![punto1-operaciones](imgs/operaciones.jpeg)
**Solucion**
* consulta 1\
![consula1](imgs/sol1.png)
* consulta 2\
![consula1](imgs/sol2.png)
* consulta 3\
![consula1](imgs/sol3.png)
* consulta 4\
![consula1](imgs/sol4.png)
* consulta 5\
![consula1](imgs/sol5.png)
* consulta 6\
![consula1](imgs/sol6.png)
* consulta 7\
![consula1](imgs/sol7.png)




### PUNTO 2

![punto2](imgs/punto2.png)


### 2.1 CREACION DE LA BASE DE DATOS
```
laboratorio2.sql

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
alter table evaluad## PUNTO 2or
    add constraint evaluador_pk primary key (evaluador_id);

-- Foreign key of facultad
alter table facultad
    add constraint facultad_fk foreign key (profesor_id) references profesor(profesor_id);

-- Foreign key of profesor
alter table profesor
    add constraint ## PUNTO 2profesor_fk foreign key (facultad_id) references facultad(codigo_facultad);

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

 ```

### 2.2 Escriba las instrucciones SQL necesarias para insertar la siguiente información.

  * 2.2.1 Insertar 3 registros en la tabla profesor, cada profesor debe pertenecer a una facultad diferente.
```
  insert into profesor values ('8Mus11', 'Hanne Elise Reiter', '32 Mitchell Rd Stow', '912-778-5509', 'hanneE203@gmail.com', 'Quimica de materiales', 'A1003E'),
                              ('330Ga', 'Matt Trace Hopper', '220 Mill Rd Chelmsford', '918-693-6828', 'mattSoci@gmail.es', 'Sociologia', 'NL10R0'),
                              ('46oIIn', 'Pernel Keith Holland', '145 Pleasant St Ashland', '717-485-0416', 'perkeilland@gmail.com', 'Psicologia Forence', 'Y44YDX');
```

  * 2.2.2 Inserte 3 registros en la tabla proyecto.
```
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
```
   * 2.2.3 Insertar 5 registros en la tabla evaluador.
```
  insert into evaluador values ('4Ev011', 'Gracie Camellia Grenville', '131 Beth Ct Waveland', '228-467-1110', 'Grcamegr@gmail.com', 'PhD. Biologia',20),
                               ('tTo092','Jin Ling Kuang', '419 S 4th St Murfreesboro', '252-396-8476', 'JLkuang@gmail.es', 'Inmunología', 11),
                               ('00Nc6', 'Patti Amberly Rogers', '3904 Montrose Dr Chevy Chase', '301-215-9889', 'pattiAmr@gmail.com', 'Medicina Experimental', 7),
                               ('r93Kz2', 'Hachirou Takahiro', '1380 Hoppers Blf Rutledge', '865-767-3815', 'takahiro@gmail.com', 'PhD. Ingenieria de Software', 15),
                               ('Xo5p55', 'Milla Tércia Hinrichs', '333 Mccorrie Ln Portsmouth', '401-942-1428', 'hinrichs@gmail.com', 'Modelos Matematicos y TI',13);
```

  * 2.2.4 Insertar 5 registros en la tabla profesores_proyecto y evaluadores_proyecto.

```
  insert into profesores_proyecto values
  ('m4nT1', 'jBc300'),
  ('Uq980', 'jBc300'),
  ('sMM02E', 'EE1o8'),
  ('7Uye22', 'EE1o8'),
  ('D43M8', '2Ma5');

  insert into evaluadores_proyecto values
  ('2Ma5', '4Ev011'),
  ('jBc300', 'tTo092'),
  ('jBc300', '00Nc6'),
  ('EE1o8', 'r93Kz2'),
  ('EE1o8', 'Xo5p55');
```
### 2.3 Escriba en SQL las siguientes consultas, las cuales deben adicionarse alarchivo SQL.

a. Obtener el nombre de todas las facultades con su respectivo director o decano, su email y teléfono de contacto. Recuerde que el decano es un profesor de la facultad.
```
select f.nombre, p.nombre, p.email, p.telefono from facultad f, profesor p
where f.profesor_id=p.profesor_id;
```

b. Obtener el nombre, fecha de inicio y fecha de finalización de los proyectos en que ha participadoel profesor cuya identificación es ‘93123775’.
```
select nombre, fecha_inicio, fecha_fin from profesores_proyecto pp, proyecto p
where profesor_id='93123775' and pp.proyecto_id = p.proyecto_id;
```
c. Obtener el nombre de los proyectos cuyo presupuesto es mayor a $50.000.000 y que pertenecena la facultad cuyo código es ‘Ing-001’ Se debe mostrar también el nombre de la facultad.
```
select p.nombre, f.nombre from proyecto p, facultad f
where p.presupuesto > 50000000 and p.facultad_id = 'Ing-001' and p.facultad_id=f.codigo_facultad;
```
d. Obtener el nombre, presupuesto y nombre de la facultad a la que pertenecen los proyectos que ha revisado el evaluador cuya identificación es ‘98212123’;
```
select p.nombre, p.presupuesto, f.nombre from evaluadores_proyecto ep, proyecto p, facultad f
where ep.evaluador_id = '98212123' and
      p.facultad_id = f.codigo_facultad and
      ep.proyecto_id = p.proyecto_id;
```
e. Obtener el nombre de los profesores que pertenecen a la facultad ‘cie-001’ y que han presentado proyectos que hayan iniciado entre el año 2007 y el 2010.
```
select pr.nombre from profesores_proyecto pp, profesor pr, proyecto p
where pr.facultad_id = 'cie-001' and
      p.fecha_inicio between '2007-01-01' and '2010-12-31' and
      pp.profesor_id = pr.profesor_id and
      pp.proyecto_id = p.proyecto_id;
```
