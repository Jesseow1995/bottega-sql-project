USE bottega_university_project_schema;

-- hardest to easiest course
SELECT ((grades_value + grades_value_2)/2) AS average_grade, grades.grades_course_id, grades.grades_professor_id
FROM grades
RIGHT JOIN courses ON grades.grades_course_id = courses.course_id
GROUP BY grades.grades_professor_id
ORDER BY average_grade ASC;