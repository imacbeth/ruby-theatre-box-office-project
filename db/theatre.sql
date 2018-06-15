DROP TABLE performance;
DROP TABLE show;

CREATE TABLE show (
id SERIAL4,
name VARCHAR(255),
type VARCHAR(255)
);

CREATE TABLE performance (
id SERIAL4,
show_id VARCHAR(255),
start_time VARCHAR(255),
available_seats INT2
);
