# 1.Query the existence of 1 course
SELECT IFNULL(
(SELECT 'YES' from ita.course where id = 1 limit 1)
,'NO')
# 2.Query the presence of both 1 and 2 courses
SELECT * FROM ita.course
where id=1 or id =2;
# 3.Query the student number and student name and average score of students whose average score is 60 or higher.
select s.id,s.name,avg(sc.score)
from student s,student_course sc
where s.id = sc.studentId
group by s.id
having avg(sc.score)>=60
# 4.Query the SQL statement of student information that does not have grades in the student_course table
select *
from student
where id not in(
    select studentId from student_course
)
# 5.Query all SQL with grades
select * from student_course;
# 6.Inquire about the information of classmates who have numbered 1 andalso studied the course numbered 2
select student.*
from student,student_course
where id = studentId and courseId=1 and id in (select id
from student,student_course
where id = studentId and courseId=2);
# 7.Retrieve 1 student score with less than 60 scores in descending order
select student.id,student.name,student.age,student.sex
from student,student_course
where courseId = 1 and score<60 and studentId = id
order by score desc;
# 8.Query the average grade of each course. The results are ranked in descending order of average grade. When the average grades are the same, they are sorted in ascending order by course number.
select courseId,name, avg(score) sc
from course,student_course
where id = courseId
group by courseId
order by sc desc,courseId asc;
# 9.Query the name and score of a student whose course name is "Math" and whose score is less than 60
select student.name,score
from student,student_course
where   courseId = (
select id
from course
where name = 'Math') and student.id = studentId and score<60;