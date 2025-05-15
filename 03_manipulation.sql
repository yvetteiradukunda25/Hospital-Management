
--1. Retrieve all patients who have appointments with a specific doctor
SELECT p.first_name, p.last_name 
FROM patients p
JOIN appointments a ON p.id = a.patient_id
JOIN doctors d ON d.id = a.doctor_id
WHERE d.first_name ='John' AND d.last_name = 'Smith';
--this will output Alice JohnSon and Charlie Brown 
--because they are the one who had appointment with doctor John Smith.

--2. List all medical records for a specific patient.

SELECT  p.first_name, p.last_name, m.diagnosis, m.treatment, m.doctor_id, m.created_at
FROM medical_records m
JOIN patients p ON p.id = m.patient_id
WHERE p.first_name='Bob' AND p.last_name='Williams';

--3. Find the total number of appointments for each doctor
SELECT
    d.first_name,
    d.last_name,
    COUNT(a.id) AS total_appointments
FROM
    doctors d
LEFT JOIN
    appointments a ON d.id = a.doctor_id
GROUP BY
    d.first_name, d.last_name
ORDER BY
    total_appointments DESC; 


--4. Display the list of doctors and the number of patients they are attending to.

SELECT
    d.first_name,
    d.last_name,
    COUNT(a.patient_id) AS number_of_patients
FROM
    doctors d
LEFT JOIN
    appointments a ON d.id = a.doctor_id
GROUP BY
    d.first_name,
    d.last_name
ORDER BY
    number_of_patients DESC;


--task 7:
--2. Create indexes to optimize search on appointments based on appointment_date

CREATE INDEX 
idx_appointments_appointment_date 
ON appointments (appointment_date);
