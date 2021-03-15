
TRIGGER

CREATE OR REPLACE FUNCTION Emplead() RETURNS TRIGGER 
	AS
	$Emplead$
BEGIN   
    IF NEW.id_empleado is null then raise 
	exception 'NO SE INSERTO EL id_empleado';
	END IF;
    IF NEW.nombres is null then raise 
	exception ' % DEBE INSERTAR LOS NOMBRES DEL EMPLEADO',NEW.nombres;
	 END if; 
	 NEW.fechaingreso := current_date;
	 RETURN NEW;
END;
	$Emplead$
	LANGUAGE plpgsql;

CREATE TRIGGER Emplead BEFORE INSERT OR UPDATE ON empleado
FOR EACH ROW
EXECUTE PROCEDURE Emplead();
select * from empleado;
INSERT INTO empleado (
id_empleado,
nombres,
direccion,
telefono,
fechaingreso	
)values
(
5,
'Mauro Zambrano',
'los Bajos',
'0998564723',
'2021-02-12'
)
select * from empleado;

Update empleado set 
id_empleado= null,
nombres='Mauro Zambrano'
where id_empleado=4
