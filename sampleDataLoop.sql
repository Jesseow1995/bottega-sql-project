USE bottega_university_project_schema;

-- adding students to table
DELIMITER $$
DROP PROCEDURE IF EXISTS add_student_data;
CREATE PROCEDURE add_student_data()
BEGIN
	DECLARE count INT DEFAULT 0;
    student_loop : LOOP
		IF (count = 100) THEN
			LEAVE student_loop;
		END IF;
        SET count = count + 1;
        INSERT INTO students (students_name, students_email) VALUES (CONCAT('Student', count), CONCAT('sample', count, '@email.com'));
	END LOOP;
END;
$$

CALL add_student_data();
		
SELECT * 
FROM students