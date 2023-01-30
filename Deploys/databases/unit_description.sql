DROP TABLE IF EXISTS unit_description;

CREATE TABLE unit_description (
	t_unit_id serial ,
    created_at  TIMESTAMP DEFAULT now() ,
	manufacturer_name VARCHAR(255),
	company_id integer NOT NULL,
	company_name VARCHAR(255) ,
	vehicle_type VARCHAR(255) NOT NULL,
	lenght integer NOT NULL,
    constraint pk_description primary key (t_unit_id, created_at)
);

INSERT INTO unit_description (t_unit_id, manufacturer_name,company_id,company_name,vehicle_type,lenght)
VALUES(1,'WeManufactureShips' , 1, 'Fictional-Maritime','ship', 400)
,(2,'WeManufactureShips',1,'Fictional-Maritime','ship', 400)
,(3,'Metalworks lt',2,'Fake-transporting','ship',420)
,(4,'Fictional Heavy Industries',3,'Best Transport','ship',380)
,(5,'Fictional Heavy Industries',3,'Best Transport','ship',380);
