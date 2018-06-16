DROP TABLE performances;
DROP TABLE shows;

CREATE TABLE shows (
id SERIAL4,
name VARCHAR(255),
type VARCHAR(255)
);

CREATE TABLE performances (
id SERIAL4,
show_id INT4 REFERENCES shows(id),
start_time VARCHAR(255),
available_seats INT2
);
