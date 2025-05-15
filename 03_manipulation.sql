SELECT p.first_name, p.last_name 
FROM patients p
JOIN appointments a ON p.id = a.patient_id
JOIN doctors d ON d.id = a.doctor_id
WHERE d.first_name ='John' AND d.last_name = 'Smith';
--this will output Alice JohnSon and Charlie Brown 
--because they are the one who had appointment with doctor John Smith.

SELECT  p.first_name, p.last_name, m.diagnosis, m.treatment, m.doctor_id, m.created_at
FROM medical_records m
JOIN patients p ON p.id = m.patient_id
WHERE p.first_name='Bob' AND p.last_name='Williams';
