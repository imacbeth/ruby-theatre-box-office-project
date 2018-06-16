DROP TABLE performance;
DROP TABLE show;

CREATE TABLE show (
id SERIAL4,
name VARCHAR(255),
type VARCHAR(255)
);

CREATE TABLE performance (
id SERIAL4,
show_id INT4 REFERENCES show(id),
start_time VARCHAR(255),
available_seats INT2
);
