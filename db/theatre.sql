DROP TABLE performances;
DROP TABLE shows;

CREATE TABLE shows (
id SERIAL4 PRIMARY KEY,
name VARCHAR(255),
type VARCHAR(255)
);

CREATE TABLE performances (
id SERIAL4 PRIMARY KEY,
show_id INT4 REFERENCES shows(id) ON DELETE CASCADE,
start_time VARCHAR(255),
seating_capacity INT2
);
