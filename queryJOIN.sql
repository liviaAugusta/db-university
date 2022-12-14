-- 1. Selezionare tutti gli studenti iscritti al Corso di Laurea in Economia
SELECT students.*, degrees.name FROM students INNER JOIN degrees ON students.degree_id = degrees.id WHERE degrees.name = 'Corso di Laurea in Economia';

-- 2. Selezionare tutti i Corsi di Laurea del Dipartimento di Neuroscienze
SELECT degrees.*, departments.name FROM degrees INNER JOIN departments ON degrees.department_id = departments.id WHERE departments.name = 'Dipartimento di Neuroscienze';

-- 3. Selezionare tutti i corsi in cui insegna Fulvio Amato (id=44)
SELECT courses.*, course_teacher.teacher_id FROM courses INNER JOIN course_teacher ON courses.id = course_teacher.course_id WHERE course_teacher.teacher_id = 44;

-- 4. Selezionare tutti gli studenti con i dati relativi al corso di laurea a cui sono iscritti e il relativo dipartimento, in ordine alfabetico per cognome e nome
SELECT students.*, departments.name AS 'dipartimento' FROM students INNER JOIN degrees ON students.degree_id = degrees.id INNER JOIN departments ON degrees.department_id = departments.id;

-- 5. Selezionare tutti i corsi di laurea con i relativi corsi e insegnanti
SELECT degrees.name as 'nome_laurea', courses.name as 'nome_corso', teachers.name as 'nome_teacher', teachers.surname as 'cognome_teacher' FROM degrees INNER JOIN courses ON degrees.id = courses.degree_id INNER JOIN course_teacher ON courses.id = course_teacher.course_id INNER JOIN teachers ON course_teacher.teacher_id = teachers.id;

-- 6. Selezionare tutti i docenti che insegnano nel Dipartimento di Matematica (54)
SELECT teachers.*, departments.name FROM teachers INNER JOIN course_teacher ON course_teacher.teacher_id = teachers.id INNER JOIN courses ON courses.id = course_teacher.course_id INNER JOIN degrees ON degrees.id = courses.degree_id INNER JOIN departments ON departments.id = degrees.department_id WHERE departments.name = 'Dipartimento di Matematica' GROUP BY id;


-- 7. BONUS: Selezionare per ogni studente quanti tentativi d’esame ha sostenuto per superare ciascuno dei suoi esami