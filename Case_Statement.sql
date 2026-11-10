create DATABASE college_db;
use college_db;

create table if NOT EXISTS students (
    s_id int auto_increment primary key,
    first_name varchar(30) not null,
    last_name varchar(30) not null,
    score float(5,2)
);

insert into students (first_name, last_name, score) values
('Leyla', 'Garcia', 42),
("David", "Freitas", 99),
("Eli", "Jarvis", 75);

select * from students;

-- alter table students add grade char(1);
-- insert into students value(null,'Martin', 'Fernandez', 81, null);


CREATE PROCEDURE IF NOT EXISTS update_student_grade(IN p_id INT)
BEGIN
    UPDATE students
    SET grade = CASE
        WHEN score >= 90 THEN 'A'
        WHEN score >= 80 THEN 'B'
        WHEN score >= 70 THEN 'C'
        WHEN score >= 60 THEN 'D'
        ELSE 'F'
    END
    WHERE s_id = p_id;
END;

call update_student_grade(2);
select * from students;