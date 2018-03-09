-- CREATE TABLE students (
--     id INT AUTO_INCREMENT PRIMARY KEY,
--     first_name VARCHAR(50)
-- );

-- CREATE TABLE papers (
--     title VARCHAR(50),
--     grade INT,
--     student_id INT, 
--      FOREIGN KEY (student_id) REFERENCES students(id) 
-- );

-- SELECT 
--     first_name, 
--     title, 
--     grade
-- FROM students
-- JOIN papers
--     ON papers.student_id = students.id
-- ORDER BY grade DESC;


-- SELECT 
--     first_name, 
--     title, 
--     grade
-- FROM students
--     LEFT JOIN papers
--     ON student_id = students.id;
    
-- SELECT 
--     first_name, 
--     IFNULL(AVG(grade), 0) as grade
-- FROM students
--     LEFT JOIN papers
--     ON student_id = students.id
-- GROUP BY first_name
-- ORDER BY grade DESC;


SELECT 
    first_name, 
    IFNULL(AVG(grade), 0) as grade,
    CASE WHEN grade >= 75 THEN 'Passing'
        ELSE 'Failing' 
    END as passing_status
FROM students
    LEFT JOIN papers
    ON student_id = students.id
GROUP BY first_name
ORDER BY grade DESC;
    
