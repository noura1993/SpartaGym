DROP TABLE IF EXISTS bookings;
DROP TABLE IF EXISTS sparta_classes;
DROP TABLE IF EXISTS members;

CREATE TABLE members (
    id SERIAL PRIMARY KEY,
    title VARCHAR(5),
    first_name VARCHAR(255),
    surname VARCHAR(255),
    mobile VARCHAR(20),
    email VARCHAR(255),
    status VARCHAR(255),
    membership VARCHAR(255)
);

CREATE TABLE sparta_classes (
    id SERIAL PRIMARY KEY,
    class_name VARCHAR(255),
    capacity INT, 
    trainer_name VARCHAR(255),
    room VARCHAR(20),
    date DATE,
    time TIME,
    status VARCHAR(15)
);

CREATE TABLE bookings (
    id SERIAL PRIMARY KEY,
    member_id INT REFERENCES members(id) ON DELETE CASCADE,
    sparta_class_id INT REFERENCES sparta_classes(id) ON DELETE CASCADE
);
