USE bottega_university_project_schema;
-- groups students by courses
SELECT grades_course_id, grades.grades_student_id, students.students_name
FROM grades
RIGHT JOIN students ON grades.grades_student_id = students.students_id
ORDER BY grades.grades_course_id;