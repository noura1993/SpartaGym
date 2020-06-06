DROP TABLE IF EXISTS bookings;
DROP TABLE IF EXISTS sparta_classes;
DROP TABLE IF EXISTS members;

CREATE TABLE members (
    id SERIAL PRIMARY KEY,
    title VARCHAR(5) NOT NULL,
    first_name VARCHAR(255) NOT NULL,
    surname VARCHAR(255) NOT NULL,
    mobile VARCHAR(20) NOT NULL,
    email VARCHAR(255) NOT NULL,
    status VARCHAR(255) NOT NULL,
    membership VARCHAR(255) NOT NULL
);

CREATE TABLE sparta_classes (
    id SERIAL PRIMARY KEY,
    class_name VARCHAR(255) NOT NULL,
    capacity INT NOT NULL, 
    trainer_name VARCHAR(255) NOT NULL,
    room VARCHAR(20) NOT NULL,
    date_time TIMESTAMP NOT NULL,
    status VARCHAR(15) NOT NULL
);

CREATE TABLE bookings (
    id SERIAL PRIMARY KEY,
    member_id INT REFERENCES members(id) ON DELETE CASCADE NOT NULL,
    sparta_class_id INT REFERENCES sparta_classes(id) ON DELETE CASCADE NOT NULL
);
