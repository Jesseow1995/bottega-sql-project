USE bottega_university_project_schema;

-- adding grades to table
DELIMITER $$
DROP PROCEDURE IF EXISTS add_grades;
CREATE PROCEDURE add_grades()
BEGIN
	DECLARE count INT DEFAULT 0;
    grades_loop : LOOP
		IF (count = 100) THEN
			LEAVE grades_loop;
		END IF;
        SET count = count + 1;
        -- INSERT INTO grades(grades_value_2, grades_second_course_id) 
        -- VALUES ((SELECT FLOOR(RAND()*(100-0+1)+0)), (SELECT FLOOR(RAND()*(15-1+1)+1)))
        
        UPDATE grades
			SET grades_second_course_id = (SELECT FLOOR(RAND()*(15-1+1)+1)),
				grades_value_2 = (SELECT FLOOR(RAND()*(100-0+1)+0))
			WHERE grades_student_id = count + 7;
        
	END LOOP;
END;
$$

CALL add_grades();
		
SELECT * 
FROM grades
