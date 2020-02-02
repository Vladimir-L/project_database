# query #1
SELECT * FROM employe
    ORDER BY employe_last_name;

# query #2
SELECT e.employe_first_name, e.employe_last_name,
    AVG(sl.monthly_salary) AS average_monthly_salary
FROM employe AS e
    INNER JOIN salary_log AS sl ON e.employe_id=sl.employe_id
GROUP BY sl.employe_id;

# query #3
SELECT p.position_name,
    AVG(sl.monthly_salary) AS average_monthly_salary,
    SUM(sl.monthly_salary) AS total_monthly_salary
FROM position AS p
    INNER JOIN employe AS e ON e.position_id=p.position_id
    LEFT JOIN salary_log AS sl ON e.employe_id=sl.employe_id
GROUP BY p.position_id;

# query #4
SELECT e.employe_first_name, e.employe_last_name,
    COUNT(dtl.employe_id) AS total_working_day,
    SUM(dtl.income) AS total_income
FROM daily_transport_log AS dtl
    INNER JOIN employe AS e ON e.employe_id=dtl.employe_id
GROUP BY dtl.employe_id;

# query #5
SELECT t.transport_name,
       COUNT(dtl.employe_id) AS total_working_day,
       AVG(dtl.income) AS avg_income,
       SUM(dtl.income) AS total_income
FROM daily_transport_log AS dtl
         INNER JOIN transport AS t ON t.transport_id=dtl.transport_id
GROUP BY dtl.transport_id
ORDER BY total_income DESC;

# query #6
SELECT employe_first_name, employe_last_name, dob
FROM employe
WHERE MONTH(dob) = 5;

# query #7
SELECT employe_first_name, employe_last_name,
    TIMESTAMPDIFF(YEAR, employment_date, CURDATE()) AS work_experience
FROM employe;

ALTER TABLE position ADD UNIQUE INDEX `EMPLOYEE_POSITION` (position_name);

ALTER TABLE position DROP INDEX `EMPLOYEE_POSITION`;

ALTER TABLE transport ADD UNIQUE INDEX `TRANSPORT_NUMBER` (car_number);

ALTER TABLE transport DROP INDEX `TRANSPORT_NUMBER`;

ALTER TABLE transport ADD INDEX `TRANSPORT_ROUTE` (transport_name);