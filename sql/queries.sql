-- Example SELECT query
SELECT s.name AS student_name, r.room_number, h.name AS hostel_name
FROM student s
JOIN allotments a ON s.student_id = a.student_id
JOIN rooms r ON a.room_id = r.room_id
JOIN hostels h ON r.hostel_id = h.hostel_id;

-- Example UPDATE query
UPDATE payment
SET status = 'Paid'
WHERE student_id = 3;

-- Example DELETE query
DELETE FROM complaints
WHERE complaint_id = 5;

-- Example JOIN with ASC (Ascending Order)
SELECT s.name, r.room_number
FROM student s
JOIN allotments a ON s.student_id = a.student_id
JOIN rooms r ON a.room_id = r.room_id
ORDER BY r.room_number ASC;

-- Example JOIN with DESC (Descending Order)
SELECT s.name, r.room_number
FROM student s
JOIN allotments a ON s.student_id = a.student_id
JOIN rooms r ON a.room_id = r.room_id
ORDER BY r.room_number DESC;

-- Example GROUP BY query
SELECT h.name AS hostel_name, COUNT(s.student_id) AS total_students
FROM hostels h
JOIN rooms r ON h.hostel_id = r.hostel_id
JOIN allotments a ON r.room_id = a.room_id
JOIN student s ON a.student_id = s.student_id
GROUP BY h.name;

-- Example SELECT BETWEEN query
SELECT name, dob
FROM student
WHERE dob BETWEEN '1998-01-01' AND '2000-01-01';

-- Example UNION query
SELECT name FROM student WHERE course = 'BCA'
UNION
SELECT name FROM student WHERE course = 'BBA';

-- Example LIKE query
SELECT name
FROM student
WHERE name LIKE 'A%';

-- Example LIMIT query
SELECT s.name, p.amount, p.status
FROM student s
JOIN payment p ON s.student_id = p.student_id
WHERE p.status = 'Pending'
LIMIT 5;
