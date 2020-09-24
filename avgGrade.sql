
-- average grade for each professor
USE bottega_university_project_schema;

SELECT ((grades_value + grades_value_2)/2) AS average_grade, grades.grades_course_id, grades.grades_professor_id
FROM grades
RIGHT JOIN courses ON grades.grades_course_id = courses.course_id
GROUP BY grades.grades_professor_id
ORDER BY grades.grades_course_id;

-- testing a loop that has similar results
DELIMITER $$
DROP PROCEDURE IF EXISTS avg_grades;
CREATE PROCEDURE avg_grades()
BEGIN
	DECLARE count INT DEFAULT 0;
    avg_loop : LOOP
		IF (count = 15) THEN
			LEAVE avg_loop;
		END IF;
        SET count = count + 1;
		SELECT grades_course_id, AVG(grades_value+grades_value_2), (SELECT professors_name FROM professors WHERE professors_id = count)
		FROM grades
		WHERE grades_course_id = count;
	END LOOP;
END;
$$
CALL avg_grades();
		
        

