USE bottega_university_project_schema;

-- adding professors to table
DELIMITER $$
DROP PROCEDURE IF EXISTS add_professors_data;
CREATE PROCEDURE add_professors_data()
BEGIN
	DECLARE count INT DEFAULT 0;
    professors_loop : LOOP
		IF (count = 100) THEN
			LEAVE professors_loop;
		END IF;
        SET count = count + 1;
        INSERT INTO professors (professors_name, professors_email) VALUES (CONCAT('Professor', count), CONCAT('sample', count, '@email.com'));
	END LOOP;
END;
$$

CALL add_professors_data();
		
SELECT * 
FROM professors