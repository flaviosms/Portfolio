DROP TABLE IF EXISTS performance;

CREATE TABLE performance (
	t_unit_id serial ,
    created_at  TIMESTAMP  DEFAULT now() ,
	fuel_percentage INTEGER NOT NULL,
	speed_km_h INTEGER NOT NULL,
	engine_temperature INTEGER,
    constraint pk_test primary key (t_unit_id, created_at)
);

INSERT INTO performance (t_unit_id, fuel_percentage,speed_km_h,engine_temperature)
VALUES(1,80,80,140)
,(2,75,85,135)
,(3, 31, 13, 38)
,(4, 18, 72, 68)
,(5, 79, 77, 69);