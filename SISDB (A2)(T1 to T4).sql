--ASSIGNMENT 2 STUDENT INFORMATION SYSTEM

CREATE TABLE Students (
    student_id INT PRIMARY KEY identity(1,1),
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    date_of_birth DATE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone_number VARCHAR(15) UNIQUE NOT NULL
);

CREATE TABLE Teachers (
    teacher_id INT PRIMARY KEY identity(1,1),
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE Courses (
    course_id INT PRIMARY KEY identity(1,1),
    course_name VARCHAR(100) NOT NULL,
    credits INT NOT NULL,
    teacher_id INT,
    FOREIGN KEY (teacher_id) REFERENCES Teachers(teacher_id)
);

CREATE TABLE Enrollments (
    enrollment_id INT PRIMARY KEY identity(1,1),
    student_id INT,
    course_id INT,
    enrollment_date DATE NOT NULL,
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);

CREATE TABLE Payments (
    payment_id INT PRIMARY KEY identity(1,1),
    student_id INT,
    amount DECIMAL(10,2) NOT NULL,
    payment_date DATE NOT NULL,
    FOREIGN KEY (student_id) REFERENCES Students(student_id)
);


INSERT INTO Students (first_name, last_name, date_of_birth, email, phone_number)
VALUES
('sudha', 'sana ', '01-03-2004', 'sudha.sana@gmail.com', 9876543210),
('dharshana', 'shana','02-03-2004','dharshana.shana@gmail.com', 9876543211 ),
('sudharshana', 'maha','03-03-2004','sudharshana.maha@gmail.com', 9876543212 ),
('kamal', 'hasan', '04-03-2004','kamal.hasan@gmail.com', 9876543213),
('vijay ', 'joshep', '05-05-2004','vijay.joshep@gmail.com', 9876543214),
('ajith ', 'kumar', '06-03-2004','ajith.kumar@gmail.com', 9876543215),
('taylor', 'swift', '07-03-2004','taylor.swift@gmail.com', 9876543216),
('selena ', 'gomas', '08-03-2004','selena.gomas@gmail.com', 9876543217),
('harris', 'jairaj', '09-03-2004','harris.jairaj@gmail.com', 9876543218),
('uvan', 'shanker', '10-03-2003','uvan.shanker@gmail.com', 9876543219 );


INSERT INTO Teachers VALUES
('Mari', 'Muthu', 'mari.muthu@example.com'),
('Harris', 'Kalyan', 'harris.kalyan@example.com'),
('Leo', 'Das', 'leo.das@example.com'),
('Petter', 'Parker', 'petter.parker@example.com'),
('Chin', 'Chan', 'chin.chan@example.com'),
('Harry', 'Potter', 'harry.potter@example.com'),
('Donald', 'Trump', 'donald.trump@example.com'),
('Modi', 'Ji', 'modi.ji@example.com'),
('Arjun', 'Das', 'arjun.das@example.com'),
('Seeba', 'Sri', 'seeba.sri@example.com');

INSERT INTO Courses VALUES
('Mathematics', 3, 1),
('Physics', 4, 2),
('Chemistry', 3, 2),
('Biology', 4, 3),
('Computer Science', 3, 1),
('English Literature', 2, 3),
('History', 3, 2),
('Economics', 3, 1),
('Political Science', 2, 2),
('Psychology', 3, 3);

INSERT INTO Enrollments VALUES
(1, 1, '2024-01-10'),
(2, 2, '2024-01-12'),
(3, 3, '2024-01-15'),
(4, 4, '2024-01-18'),
(5, 5, '2024-01-20'),
(6, 6, '2024-01-22'),
(7, 7, '2024-01-25'),
(8, 8, '2024-01-28'),
(9, 9, '2024-02-01'),
(10, 10, '2024-02-05');


INSERT INTO Payments VALUES
(1, 500.00, '2024-02-10'),
(2, 600.00, '2024-02-12'),
(3, 550.00, '2024-02-15'),
(4, 580.00, '2024-02-18'),
(5, 620.00, '2024-02-20'),
(6, 510.00, '2024-02-22'),
(7, 590.00, '2024-02-25'),
(8, 570.00, '2024-02-28'),
(9, 530.00, '2024-03-01'),
(10, 540.00, '2024-03-05');


--TASK 2
--1. Write an SQL query to insert a new student into the "Students" table with the following details:
a. First Name: John
© Hexaware Technologies Limited. All rights www.hexaware.com
b. Last Name: Doe
c. Date of Birth: 1995-08-15
d. Email: john.doe@example.com
e. Phone Number: 1234567890

INSERT INTO Students (first_name, last_name, date_of_birth, email, phone_number)
VALUES
('John', 'Doe ', '1995-08-15', 'john.doe@example.com', 1234567890)

select *from Students

--2. Write an SQL query to enroll a student in a course. Choose an existing student and course and
insert a record into the "Enrollments" table with the enrollment date.

INSERT INTO Enrollments VALUES
(1, 1, '2024-01-10'),


--3. Update the email address of a specific teacher in the "Teacher" table. Choose any teacher and
modify their email address.

update Teachers
set Email =  'maha.sudha@gmail.com'
where teacher_id ='2'

select *from Teachers



---4. Write an SQL query to delete a specific enrollment record from the "Enrollments" table. Select
an enrollment record based on the student and course.

delete from Enrollments
where  student_id = '2' AND course_id = '2'

select * from Enrollments


--5. Update the "Courses" table to assign a specific teacher to a course. Choose any course and
teacher from the respective tables.


update  Courses
set teacher_id= '1'
where course_id ='4'


--6. Delete a specific student from the "Students" table and remove all their enrollment records
from the "Enrollments" table. Be sure to maintain referential integrity.

ALTER TABLE Enrollments 
ADD CONSTRAINT FK_Enrollments_Students
FOREIGN KEY (student_id) REFERENCES Students(student_id) 
;


--7. Update the payment amount for a specific payment record in the "Payments" table. Choose any
payment record and modify the payment amount

update Payments
set amount ='123.45'
where payment_id='4'



----Task 3.


--1. Write an SQL query to calculate the total payments made by a specific student. You will need to
join the "Payments" table with the "Students" table based on the students id .


select s.student_id ,SUM(p.amount) as total_payments
from Payments p
inner join Students s on s.student_id = p.student_id
where s.student_id= 6
group by s.student_id;


--2. Write an SQL query to retrieve a list of courses along with the count of students enrolled in each
course. Use a JOIN operation between the "Courses" table and the "Enrollments" table.


select c.course_id, c.course_name ,count(e.student_id) as countofstudents
from Courses c
left join Enrollments e on c.course_id =e.course_id
group by c.course_id,c.course_name;



--3. Write an SQL query to find the names of students who have not enrolled in any course. Use a
LEFT JOIN between the "Students" table and the "Enrollments" table to identify students
without enrollments.

select s.first_name,s.last_name
from Students s
left join Enrollments e on s.student_id = e.student_id

where e.student_id is null;



--4. Write an SQL query to retrieve the first name, last name of students, and the names of the
courses they are enrolled in. Use JOIN operations between the "Students" table and the
"Enrollments" and "Courses" tables.

select s.first_name, s.last_name, c.course_name
from students s
join enrollments e on s.student_id = e.student_id
join courses c on e.course_id = c.course_id;



--5. Create a query to list the names of teachers and the courses they are assigned to. Join the
"Teacher" table with the "Courses" table.


select t.first_name, t.last_name, c.course_name
from Teachers t
join courses c on t.teacher_id = c.teacher_id;



--6. Retrieve a list of students and their enrollment dates for a specific course. You'll need to join the
"Students" table with the "Enrollments" and "Courses" tables.

select s.first_name, s.last_name, e.enrollment_date
from students s
join enrollments e on s.student_id = e.student_id
join courses c on e.course_id = c.course_id
where c.course_name = 'Biology';  






--7. Find the names of students who have not made any payments. Use a LEFT JOIN between the
"Students" table and the "Payments" table and filter for students with NULL payment records.


select s.first_name, s.last_name
from students s
left join payments p on s.student_id = p.student_id
where p.student_id is null;




--8. Write a query to identify courses that have no enrollments. You'll need to use a LEFT JOIN
between the "Courses" table and the "Enrollments" table and filter for courses with NULL
enrollment records.



select c.course_name
from courses c
left join enrollments e on c.course_id = e.course_id
where e.course_id is null;




--9. Identify students who are enrolled in more than one course. Use a self-join on the "Enrollments"
table to find students with multiple enrollment records.

select distinct e1.student_id  
from enrollments e1  
join enrollments e2  
on e1.student_id = e2.student_id  
and e1.course_id <> e2.course_id; 



10. Find teachers who are not assigned to any courses. Use a LEFT JOIN between the "Teacher"
table and the "Courses" table and filter for teachers with NULL course assignments.

select t.teacher_id, t.first_name, t.last_name  
from teachers t  
left join courses c on t.teacher_id = c.teacher_id  
where c.course_id is null;  


Write an SQL query to calculate the average number of students enrolled in each course. Use
aggregate functions and subqueries to achieve this.


select avg(student_count) as avg_students_per_course
from (
    select course_id, count(student_id) as student_count
    from enrollments
    group by course_id
) as course_enrollments;






2. Identify the student(s) who made the highest payment. Use a subquery to find the maximum
payment amount and then retrieve the student(s) associated with that amount.



select student_id, first_name, last_name, amount
from students
join payments on students.student_id = payments.student_id
where amount = (select max(amount) from payments);











3. Retrieve a list of courses with the highest number of enrollments. Use subqueries to find the
course(s) with the maximum enrollment count.


select course_id, course_name
from courses
where course_id in (
    select course_id
    from enrollments
    group by course_id
    having count(student_id) = (
        select max(student_count)
        from (
            select course_id, count(student_id) as student_count
            from enrollments
            group by course_id
        ) as course_counts
    )
);











4. Calculate the total payments made to courses taught by each teacher. Use subqueries to sum
payments for each teacher course


select t.teacher_id, t.first_name, t.last_name, 
       (select sum(p.amount)
        from payments p 
        join courses c on p.course_id = c.course_id
        where c.teacher_id = t.teacher_id) as total_payments
from teachers t;





5. Identify students who are enrolled in all available courses. Use subqueries to compare a
student enrollments with the total number of courses.


select student_id, first_name, last_name
from students
where (select count(course_id) from enrollments where enrollments.student_id = students.student_id) =
      (select count(course_id) from courses);



6. Retrieve the names of teachers who have not been assigned to any courses. Use subqueries to
find teachers with no course assignments.


select teacher_id, first_name, last_name
from teachers
where teacher_id not in (select teacher_id from courses);





7. Calculate the average age of all students. Use subqueries to calculate the age of each student
based on their date of birth.



select avg(datediff(year, dob, getdate())) as avg_age
from students;






8. Identify courses with no enrollments. Use subqueries to find courses without enrollment
records.


select course_id, course_name
from courses
where course_id not in (select distinct course_id from enrollments);




9. Calculate the total payments made by each student for each course they are enrolled in. Use
subqueries and aggregate functions to sum payments.




select student_id, course_id, sum(amount) as total_payment
from payments
group by student_id, course_id;



10. Identify students who have made more than one payment. Use subqueries and aggregate
functions to count payments per student and filter for those with counts greater than one.


select student_id, count(payment_id) as payment_count
from payments
group by student_id
having count(payment_id) > 1;














11. Write an SQL query to calculate the total payments made by each student. Join the "Students"
table with the "Payments" table and use GROUP BY to calculate the sum of payments for each
student.



select s.student_id, s.first_name, s.last_name, sum(p.amount) as total_payments
from students s
join payments p on s.student_id = p.student_id
group by s.student_id, s.first_name, s.last_name;














12. Retrieve a list of course names along with the count of students enrolled in each course. Use
JOIN operations between the "Courses" table and the "Enrollments" table and GROUP BY to
count enrollments.

select c.course_name, count(e.student_id) as student_count
from courses c
left join enrollments e on c.course_id = e.course_id
group by c.course_name;















13. Calculate the average payment amount made by students. Use JOIN operations between the
"Students" table and the "Payments" table and GROUP BY to calculate the average


select s.student_id, s.first_name, s.last_name, avg(p.amount) as avg_payment
from students s
join payments p on s.student_id = p.student_id
group by s.student_id, s.first_name, s.last_name;
