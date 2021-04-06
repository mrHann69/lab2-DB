--  Obtener el nombre de todas las facultades con su respectivo director o decano, su email y
-- teléfono de contacto. Recuerde que el decano es un profesor de la facultad.
select f.nombre,p.nombre, p.email, p.telefono from facultad f join profesor p on f.profesor_id = p.profesor_id;

-- Obtener el nombre, fecha de inicio y fecha de finalización de los proyectos en que ha participado
--el profesor cuya identificación es ‘93123775’.
select p.nombre, p.fecha_inicio, p.fecha_fin, p2.profesor_id from profesores_proyecto pp join proyecto p on p.proyecto_id = pp.proyecto_id join profesor p2 on p2.profesor_id = pp.profesor_id where p2.profesor_id = '93123775';  

--Obtener el nombre de los proyectos cuyo presupuesto es mayor a $50.000.000 y que pertenecen
--a la facultad cuyo código es ‘Ing-001’ Se debe mostrar también el nombre de la facultad.
select p.nombre, p.presupuesto, p.facultad_id, f.nombre from proyecto p join facultad f on p.facultad_id = f.codigo_facultad where p.presupuesto >= 50000000 AND p.facultad_id = 'Ing-001';

--Obtener el nombre, presupuesto y nombre de la facultad a la que pertenecen los proyectos
--que ha revisado el evaluador cuya identificación es ‘98212123’;
select p.nombre, p.presupuesto, p.facultad_id from evaluadores_proyecto ep2, proyecto p, facultad f2  where f2.profesor_id = '00Nc6' and p.facultad_id = f2.codigo_facultad and  p.proyecto_id = ep2.proyecto_id;
select  * from evaluadores_proyecto;
--Obtener el nombre de los profesores que pertenecen a la facultad ‘cie-001’ y que han presentado
--proyectos que hayan iniciado entre el año 2007 y el 2010
select * from evaluadores_proyecto ep 