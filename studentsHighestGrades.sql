USE bottega_university_project_schema;
-- returns students highest grade
SELECT grades.grades_value, grades.grades_value_2, grades.grades_student_id, students.students_name
FROM grades
RIGHT JOIN students ON grades.grades_student_id = students.students_id
ORDER BY grades.grades_student_id;




