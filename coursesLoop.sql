USE bottega_university_project_schema;

-- adding courses to table
DELIMITER $$
DROP PROCEDURE IF EXISTS add_courses;
CREATE PROCEDURE add_courses()
BEGIN
	DECLARE count INT DEFAULT 0;
    courses_loop : LOOP
		IF (count = 15) THEN
			LEAVE courses_loop;
		END IF;
        SET count = count + 1;
        INSERT INTO courses (course_name, course_professor_id) VALUES (CONCAT('Course', count), count);
	END LOOP;
END;
$$

CALL add_courses();
		
SELECT * 
FROM courses