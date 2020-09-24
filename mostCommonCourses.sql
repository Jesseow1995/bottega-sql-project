USE bottega_university_project_schema;

-- professor and student with most common course
SELECT courses.course_id, courses.course_professor_id, grades.grades_course_id, COUNT(grades.grades_course_id = courses.course_professor_id) AS common_courses
FROM courses
RIGHT JOIN grades ON courses.course_id = grades.grades_course_id
GROUP BY courses.course_id
ORDER BY common_courses DESC;