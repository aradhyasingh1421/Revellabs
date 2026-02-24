CREATE TABLE students (
   emp_id serial primary key,
   fname varchar(100) not null,
   lname varchar(100) not null,
   email varchar(100) not null unique,
   dept varchar(100),
   salary decimal(10,2) default 20000.00,
   hire_date date not null default current_date
);
INSERT INTO students(emp_id, fname, lname, email, dept, salary, hire_date)
VALUES
(1, 'Rahul', 'Sharma', 'rahul@gmail.com', 'IT', 50000, '2023-01-10'),
(2, 'Amit', 'Kumar', 'amit@gmail.com', 'HR', 45000, '2022-05-15'),
(3, 'Neha', 'Singh', 'neha@gmail.com', 'Finance', 55000, '2021-08-20'),
(4, 'Riya', 'Verma', 'riya@gmail.com', 'IT', 60000, '2023-03-12'),
(5, 'Karan', 'Malhotra', 'karan@gmail.com', 'Sales', 40000, '2022-11-05'),
(6, 'Priya', 'Mehta', 'priya@gmail.com', 'HR', 48000, '2021-07-18'),
(7, 'Ankit', 'Gupta', 'ankit@gmail.com', 'IT', 65000, '2023-06-01'),
(8, 'Simran', 'Kaur', 'simran@gmail.com', 'Marketing', 42000, '2022-09-22'),
(9, 'Rohit', 'Yadav', 'rohit@gmail.com', 'Finance', 53000, '2021-12-10'),
(10, 'Pooja', 'Chopra', 'pooja@gmail.com', 'Sales', 47000, '2023-02-14');

SELECT * FROM students;

SELECT * FROM students
WHERE dept='IT';

SELECT * FROM students
WHERE salary > 50000;

SELECT fname,lname FROM students
WHERE dept='HR';
	 
SELECT * FROM students
WHERE dept = 'sales' AND salary > 30000;
	  
SELECT * FROM students
WHERE dept = 'sales' OR salary > 30000;

SELECT * FROM students
ORDER BY salary DESC;

SELECT * FROM students
LIMIT 3;

UPDATE students
SET salary = 95000
WHERE fname = 'Rahul';

DELETE FROM students;

DROP TABLE students;

[second_table]

CREATE TABLE departments (
dept_id SERIAL PRIMARY KEY,
dept_name VARCHAR(100) UNIQUE NOT NULL

);

INSERT INTO departments(dept_id, dept_name)
VALUES
(1,'IT'),
(2,'HR'),
(3,'Finance'),
(4,'Sales'),
(5,'Marketing');

[third_table]

CREATE TABLE projects (
project_id SERIAL PRIMARY KEY,
project_name VARCHAR(100),
emp_id INT,
FOREIGN KEY (emp_id)
REFERENCES students(emp_id)

);

INSERT INTO projects(project_id, project_name, emp_id)
VALUES

(1,'Website',1),
(2,'Mobile App',4),
(3,'Database System',7),
(4,'HR Portal',2),
(5,'Finance Report',3);

[inner_join]

SELECT s.fname, s.dept, p.project_name
FROM students s
INNER JOIN projects p
ON s.emp_id = p.emp_id;

[left_join]

SELECT s.fname, p.project_name
FROM students s
LEFT JOIN projects p
ON s.emp_id = p.emp_id;

[Employees_Without_Project]

SELECT s.fname

FROM students s

LEFT JOIN projects p

ON s.emp_id = p.emp_id

WHERE p.emp_id IS NULL;

[counts]

SELECT COUNT(*) 
FROM students;

[sums]

SELECT SUM(salary)
FROM students;

[avg_function]

SELECT AVG(salary)
FROM students;

[group_by]

SELECT dept, COUNT(*) 
FROM students
GROUP BY dept;

[minimum_salary]

SELECT dept, MIN(salary)
FROM students
GROUP BY dept;

[PostgreSQL]

CREATE OR REPLACE PROCEDURE show_students()
LANGUAGE plpgsql
AS $$
BEGIN

SELECT * FROM students;

END;
$$;

[]

CREATE OR REPLACE PROCEDURE get_department(department_name VARCHAR)
LANGUAGE plpgsql
AS $$
BEGIN

SELECT * FROM students
WHERE dept = department_name;

END;
$$;