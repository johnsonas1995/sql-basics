-- Select all rows from the classes table.
SELECT * FROM classes;
-- Select the name and credits from the classes table where the number of credits is greater than 3.
SELECT name, credits FROM classes WHERE credits > 3;
SELECT name, credits FROM classes WHERE credits::int > 3; --needed to cast as int? had to update create_schema.sql
--All rows from the classes table where credits is an even number.
SELECT * FROM classes WHERE credits %2 = 0;
SELECT * FROM classes WHERE credits::int %2 = 0;-- no longer needed but good to know
--All of Tianna's enrollments that she hasn't yet received a grade for.
SELECT * FROM enrollments WHERE student_id = 1 AND grade IS NULL;
--All of Tianna's enrollments that she hasn't yet received a grade for, 
--selected by her first name, not her student.id
SELECT * FROM students INNER JOIN enrollments 
        ON students.id = enrollments.student_id WHERE first_name = 'Tianna' AND grade IS NULL;
--All of Tianna's enrollments that she hasn't yet received a grade for, selected by her 
--first name, not her student.id, with the class name included in the result set.
SELECT 
    * 
FROM 
    students 
    INNER JOIN enrollments ON students.id = enrollments.student_id 
    INNER JOIN classes ON enrollments.class_id = classes.id 
    WHERE first_name = 'Tianna' AND grade IS NULL;
--All students born before 1986 who have a 't' in their first or last name.
SELECT first_name, birthdate FROM students WHERE "birthdate" < '1986-01-01'; --working on it
--The average age of all the students.
SELECT avg(age("birthdate")) FROM students;--birthdate needs to be date type
--Addresses that have a space in their city name.
SELECT * FROM addresses WHERE city LIKE '% %';
--Students & their addresses that live in a city with more than one word in the city name.
SELECT * FROM students INNER JOIN addresses 
        ON students.address_id = addresses.id WHERE addresses.city LIKE '% %';
--The average number of credits for classes offered at the school.
SELECT AVG(credits) FROM classes;
--The first and last name of all students who have received an 'A'.
SELECT first_name, last_name, enrollments.grade FROM students 
        INNER JOIN enrollments ON students.id = enrollments.student_id 
        WHERE enrollments.grade = 'A';
--Each student's first name and the total credits they've enrolled in



-- starts with "T"
SELECT * FROM students WHERE first_name LIKE 'T%';
SELECT * FROM students WHERE LOWER(first_name) LIKE 'T%'; --LOWER will lower every char in str