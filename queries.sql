# quuery #1
SELECT * FROM employe
    ORDER BY employe_last_name;

# quuery #2
SELECT e.employe_first_name, e.employe_last_name,
    AVG(sl.monthly_salary) AS average_monthly_salary
FROM employe AS e
    INNER JOIN salary_log AS sl ON e.employe_id=sl.employe_id
GROUP BY sl.employe_id;

# quuery #3
SELECT p.position_name,
    AVG(sl.monthly_salary) AS average_monthly_salary,
    SUM(sl.monthly_salary) AS total_monthly_salary
FROM position AS p
    RIGHT JOIN employe AS e ON e.position_id=p.position_id
    LEFT JOIN salary_log AS sl ON e.employe_id=sl.employe_id
GROUP BY p.position_id;

# quuery #4
SELECT e.employe_first_name, e.employe_last_name,
    COUNT(dtl.employe_id) AS total_working_day,
    SUM(dtl.income) AS total_income
FROM daily_transport_log AS dtl
    INNER JOIN employe AS e ON e.employe_id=dtl.employe_id
GROUP BY dtl.employe_id;

# quuery #5
SELECT t.transport_name,
    COUNT(dtl.employe_id) AS total_working_day,
    AVG(dtl.income) AS avg_income,
    SUM(dtl.income) AS total_income
FROM daily_transport_log AS dtl
    INNER JOIN transport AS t ON t.transport_id=dtl.transport_id
GROUP BY dtl.transport_id;

# quuery #6
SELECT employe_first_name, employe_last_name, dob
FROM employe
WHERE MONTH(dob) = 5;

# quuery #7
SELECT employe_first_name, employe_last_name,
    TIMESTAMPDIFF(YEAR, employment_date, CURDATE()) AS work_experience
FROM employe;