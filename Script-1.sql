SELECT * FROM employees;

-- 전체 직원 조회
SELECT * FROM EMPLOYEES e ;

--아 회사의 모든 부서, 부서명, 부서장 조회
SELECT * FROM DEPARTMENTS d ;

SELECT employee_id, first_name, last_name
FROM employees;
---원하는 컬럼만 조회하기(원하는 컬럼 이름을 지정)


SELECT EMPLOYEE_ID,  
       e.FIRST_NAME,
       e.LAST_NAME 
FROM EMPLOYEES e ;

SELECT e.first_name,
	   e.PHONE_NUMBER,
	   e.HIRE_DATE,
	   e.SALARY
FROM EMPLOYEES e ;


SELECT e.FIRST_NAME,
	   e.LAST_NAME,
	   e.SALARY,
	   e.PHONE_NUMBER,
	   e.EMAIL,
	   e.HIRE_DATE
FROM EMPLOYEES e ;

SELECT employee_id AS empNO,
	   first_name "E-name",
	   salary "연 봉"
FROM EMPLOYEES;
       

--사원의 사원번호,이름(first_name), 성(last_name), 급여, 전화번호, 이메일, 입사일 로 표
--시되도록출력하세요

SELECT e.employee_id "사원번호",
       e.FIRST_NAME "이름",
	   e.LAST_NAME "성",
	   e.SALARY "급여",
	   e.PHONE_NUMBER "전화번호",
	   e.EMAIL "이메일",
	   e.HIRE_DATE "입사일"
FROM  EMPLOYEES e ;


SELECT FIRST_NAME || ' ' || LAST_NAME  
FROM employees;

---||을 concat으로 사용가능하지만 가독성부분에서 ||를 더 많이 사용
SELECT CONCAT(CONCAT(first_name,' '),last_name)		
FROM employees;

SELECT first_name || ' hire date is ' || hire_date
FROM employees;


SELECT first_name, 
       salary,
       salary*12,
       (salary+300)*12
FROM employees;



SELECT first_name || '-' || last_name "성명",
       salary "급여",
       salary*12 "연봉",
       (salary*12+5000) "연봉2",
       PHONE_NUMBER "전화번호"
FROM employees;

--부서번호가 10번인 사원의 이름을 구하시오
SELECT FIRST_name
FROM employees
WHERE department_id = 10;

--급여가15000 이상인 사원들의 이름과 급여와연봉을출력하세요
SELECT FIRST_NAME,
	   SALARY,
	   salary*12
FROM employees
WHERE salary >= 15000;

--07/01/01 일 이후에 입사한 사원들의 이름과 입사일을출력하세요
SELECT  e.FIRST_NAME "이름" ,
        e.HIRE_DATE "입사일"
FROM EMPLOYEES e 
WHERE HIRE_DATE > '2007.01.01';


--이름이 Lex인 직원의 연봉을출력하세요
SELECT e.salary*12 "연봉"
FROM EMPLOYEES e 
WHERE FIRST_NAME = 'Lex';


--조건이 두개
-- 급여가14000 이상 17000이하인 사원의 이름과연봉을구하시오
SELECT e.FIRST_NAME "이름" ,
       e.SALARY "급여",
	   e.salary *12 "연봉"
FROM EMPLOYEES e 
WHERE salary >= 14000
AND salary <= 17000;


--연봉이 14000 이하이거나 17000 이상인 사원의 이름과 연봉을 출력하세요
SELECT e.FIRST_NAME "이름" ,
	   e.salary *12 "연봉"
FROM EMPLOYEES e 
WHERE (salary*12) <= 14000
OR (salary*12) >= 17000;


--입사일이04/01/01 에서 05/12/31 사이에 입사한 사원의 이름과 입사일을 출력하세요
SELECT e.FIRST_NAME "이름" ,
       e.HIRE_DATE "입사일"
FROM EMPLOYEES e 
WHERE HIRE_DATE >= '2004.01.01'
AND HIRE_DATE <= '2005.12.31';

--연봉이14000 이상 17000이하인 사원의이름과연봉을구하시오
SELECT e.FIRST_NAME "이름" ,
	   e.salary *12 "연봉"
FROM EMPLOYEES e 
WHERE salary BETWEEN 14000 and  17000;


-- IN으로 묶으면 'OR'  '이거나'로 묶임 
SELECT FIRST_NAME , 
       LAST_NAME ,
       SALARY 
FROM EMPLOYEES
WHERE FIRST_NAME IN ('Neena','Lex','John') ;

--급여가 2100, 3100, 4100, 5100 인 사원의 이름과 급여을 구하시오
SELECT FIRST_NAME "이름", 
       SALARY "급여"
FROM EMPLOYEES
WHERE SALARY  IN ('2100','3100','4100','5100') ;

--Like 연산자로 비슷한것들모두찾기
--'%':임의의 길이의 문자열(공백문자가능),'_':한글자 길이
SELECT e.FIRST_NAME,
	   e.LAST_NAME ,
	   e.SALARY
FROM EMPLOYEES e
WHERE first_name LIKE 'L%';

--이름에 am 을포함한사원의이름과연봉을출력하세요
SELECT e.FIRST_NAME "이름",
	   e.SALARY*12 "연봉"
FROM EMPLOYEES e 
WHERE first_name LIKE '%am%';
--이름의 두번째글자가a 인사원의이름과연봉을출력하세요
SELECT e.FIRST_NAME "이름",
	   e.SALARY*12 "연봉"
FROM EMPLOYEES e 
WHERE first_name LIKE '_a%';
--이름의 네번째글자가a 인사원의이름을출력하세요
SELECT e.FIRST_NAME "이름"
FROM EMPLOYEES e 
WHERE first_name LIKE '___a%';
--이름이 4글자인사원중끝에서두번째글자가a인사원의이름을출력하세요
SELECT e.FIRST_NAME "이름"
FROM EMPLOYEES e 
WHERE first_name LIKE '__a_';

--is null :없는    is not null : 있는
 select first_name, salary, commission_pct
 from employees
 where commission_pct is null;

--커미션비율이있는사원의이름과연봉커미션비율을출력하세요
 select first_name "이름", 
        salary * 12 "연봉"
 from employees
 WHERE  COMMISSION_PCT IS NOT NULL;

--담당매니저가없고커미션비율이없는직원의이름을출력하세요
select FIRST_NAME "이름",
       manager_id "매니저 검증",
       COMMISSION_PCT "커미션 검증"
from employees
WHERE manager_id IS null AND COMMISSION_PCT IS null ;


--order by 절을 사용해 보기좋게정렬하기 (asc:정순(생략가능)(작은순서부터) ,  desc:역순(큰순서부터)

-- 부서번호를오름차순으로정렬하고부서번호, 급여, 이름을출력하세요


SELECT department_id,
       salary,
       first_name
FROM employees
ORDER BY 1 ;

-- 급여가5000 이상인 직원의 이름, 급여를급여가큰직원부터출력하세요
SELECT first_name,
       salary
FROM employees
WHERE salary >= 5000
ORDER BY 2 DESC;

--부서번호를오름차순으로정렬하고부서번호가같으면급여가높은사람부터 부서번호, 급여, 이름을출력하세요
SELECT department_id "부서번호",
       salary "급여",
       first_name "이름"
FROM EMPLOYEES
ORDER BY 1,2 DESC;  




SELECT chr(97)
FROM dual;

SELECT  ascii('a')
FROM dual;


SELECT INITCAP('apple')
FROM dual;

--영어의첫글자만대문자로출력하고나머지는전부소문자로출력하는함수(initcap)
--입력되는값을전부소문자(upper)/대문자로변경하는함수(lower)
SELECT email, INITCAP(email), department_id, FIRST_NAME, LOWER(FIRST_NAME), upper(FIRST_NAME )
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 100;

--SUBSTR(컬럼명, 시작위치, 글자수) 주어진문자열에서특정길이의문자열을구하는함수
SELECT FIRST_NAME  "이름",
       SUBSTR(FIRST_NAME,1,3),
       SUBSTR(FIRST_NAME,-3,2)
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 100;

--LPAD(컬럼명, 자리수, ‘채울문자’)왼쪽 공백에 ,RPAD(컬럼명, 자리수, ‘채울문자’)오른쪽 공백에

SELECT FIRST_NAME ,
       lpad(FIRST_NAME,10,'*'),
       RPAD(FIRST_NAME,10,'*')
FROM EMPLOYEES;


--REPLACE (컬럼명, 문자1, 문자2)  컬럼명에서문자1을문자2로바꾸는함수

 SELECT  FIRST_NAME,  
         REPLACE(FIRST_NAME, 'a', '*'), 
         REPLACE(FIRST_NAME,SUBSTR(FIRST_NAME, 2, 3), '***')
FROM EMPLOYEES 
where department_id =100;

--숫자함수–ROUND(숫자, 출력을 원하는자리수)  주어진숫자의반올림을하는함수
select round(123.346, 2) "r2",
 round(123.456, 0) "r0",
 round(123.456, -1) "r-1"
 from dual;

--숫자함수–TRUNC(숫자, 출력을 원하는 자리수) 주어진숫자의버림을하는함수
select trunc(123.346, 2) "r2",
 trunc(123.456, 0) "r0",
 trunc(123.456, -1) "r-1"
 from dual;


SELECT sysdate
FROM dual;

select sysdate
 from EMPLOYEES;

select FIRST_NAME, 
       months_between(sysdate, hire_date) 
from employees
where department_id = 110;

SELECT FIRST_NAME "이름" ,
       TO_CHAR(SALARY, '$999,999.99') "급여",
       TO_CHAR(SALARY*12, '$999,999.99') "연봉"
FROM EMPLOYEES
WHERE DEPARTMENT_ID  = 110;


SELECT sysdate,
       TO_CHAR(sysdate, 'yyyy-mm-dd-day HH24:MI:SS')
FROM dual;


select commission_pct, nvl2(commission_pct,1, 0)
 from employees;


--담당 매니저가 배정되어있으나 커미션비율이 없고 월급이 3000초과인 직원의 이름, 매니저아이디,커미션 비율,월급 출력

SELECT FIRST_NAME "이름",
       MANAGER_ID  "매니저아이디" ,
       COMMISSION_PCT "커미션비율", 
       SALARY "월급"
FROM EMPLOYEES
WHERE MANAGER_ID  IS NOT NULL
  AND COMMISSION_PCT  IS NULL 
  AND SALARY  > 3000;


SELECT *
FROM JOBS;

--최고월급(max_salary)이 10000이상인 업무의 이름(job_title)과 최고월급(max_salary)을 최고월급 (max_salary) 내림차순 (desc)로 정렬하여 출력

SELECT job_title,
       max_salary
FROM jobs
WHERE max_salary >= 10000
ORDER BY max_salary DESC;

SELECT  AVG(SALARY)
FROM EMPLOYEES;

SELECT DEPARTMENT_ID "부서별아이디" ,
       MAX(SALARY ) "부서별 평균임금"
FROM EMPLOYEES 
GROUP BY DEPARTMENT_ID 
ORDER BY DEPARTMENT_ID ;

--마지막으로 신입사원이 들어온 날은 언제 입니까
SELECT TO_CHAR(MAX(hire_date), 'YYYY"년" MM"월" DD"일"')  "마지막입사"
FROM employees;


SELECT DEPARTMENT_ID "부서번호", 
       avg(salary) "평균임금",
       max(salary) "최고임금",
       min(salary) "최저임금"
FROM employees
GROUP BY DEPARTMENT_ID 
order BY department_id DESC;

SELECT JOB_ID "업무별", 
       avg(salary) "평균임금",
       max(salary) "최고임금",
       min(salary) "최저임금"
FROM employees
GROUP BY JOB_ID 
order BY JOB_ID DESC;

SELECT TO_CHAR(min(hire_date), 'YYYY"년" MM"월" DD"일"')  "장기근무"
FROM employees;

SELECT DEPARTMENT_ID,
       COUNT(*),
       SUM(SALARY)
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
HAVING SUM(salary) > 20000;

--
SELECT DEPARTMENT_ID "부서번호", 
       avg(salary) "평균임금",
       min(salary) "최저임금",
       (avg(salary))-(min(salary)) "평균임금-최저임금"
FROM employees
GROUP BY DEPARTMENT_ID 
HAVING (avg(salary))-(min(salary))<2000
order BY (avg(salary)-min(salary)) DESC;



SELECT JOB_ID "업무별", 
       max(salary) "최고임금",
       min(salary) "최저임금",
       max(salary)-min(salary) "최고-최저"
FROM employees
GROUP BY JOB_ID 
order BY 4 DESC;


SELECT employee_id, 
salary,
 CASE WHEN job_id = 'AC_ACCOUNT' THEN salary + salary * 0.1
 WHEN job_id = 'AC_MGR' THEN salary + salary *0.2
 ELSE salary
 END job_id
 FROM employees
 
 --직원의 이름,부서코드,팀을 출력하세요
 --팀은 부서코드로 결정하며 부서코드가 10~50이면 'A-TEAM' 60~100이면 'B-TEAM' 110~150이면 'C-TEAM'나머지는 '팀없음'으로 출력하세요
 
 
SELECT FIRST_NAME "직원 이름",    
        DEPARTMENT_ID "부서코드", 
CASE WHEN department_id BETWEEN 10 AND 50 THEN 'A-TEAM'
     WHEN department_id BETWEEN 60 AND 100 THEN 'B-TEAM'
     WHEN department_id BETWEEN 110 AND 150 THEN 'C-TEAM'
     ELSE '팀없음'
     END team
FROM employees;


 select first_name, department_name
 from employees, departments;
 
 
  select first_name, em.department_id, 
department_name, de.department_id
 from   employees em, departments de
 where  em.department_id = de.department_id
 ORDER BY 2 DESC;
  
  
select FIRST_NAME ,
       em.JOB_ID, 
       j.JOB_TITLE ,
       j.JOB_ID
from   EMPLOYEES em,  JOBS j 
where  em.JOB_ID = j.JOB_ID;



--모든 직원이름, 부서이름, 업무명 을 출력하세요
SELECT em.FIRST_NAME ,
       d.DEPARTMENT_NAME ,
       j.JOB_TITLE
FROM EMPLOYEES em, JOBS j, DEPARTMENTS d 
WHERE em.JOB_ID = j.JOB_ID 
and em.DEPARTMENT_ID = d.department_id;



 Select emp.first_name, d.DEPARTMENT_NAME 
 From employees emp, DEPARTMENTS d 
 Where emp.DEPARTMENT_ID   = d.DEPARTMENT_ID(+) ;
  
 
select e.department_id, e.first_name, d.department_name
 from employees e FULL outer join departments d
 on e.department_id = d.department_id ; 


SELECT e.EMPLOYEE_ID ,e.FIRST_NAME,d.DEPARTMENT_NAME,m.FIRST_NAME 
FROM EMPLOYEES e, DEPARTMENTS d, EMPLOYEES m
WHERE e.MANAGER_ID = m.EMPLOYEE_ID
AND e.DEPARTMENT_ID = d.DEPARTMENT_ID ;



--지역에 속한 나라들을 지역이름(region_name),나라이름(country_name)으로 입력하되 지역이름,나라이름 순서대로 내림차순으로 정렬하세요

SELECT r.REGION_NAME , 
       c.country_name
FROM COUNTRIES c ,REGIONS r 
WHERE r.REGION_ID  = c.REGION_ID 
ORDER BY 1 DESC , 2 DESC ;



SELECT jh.employee_id,
       e.first_name || ' ' || e.last_name  "이름",
       j.JOB_TITLE 
FROM job_history jh, jobs j, employees e
WHERE jh.job_id = j.job_id
AND jh.employee_id = e.employee_id
AND j.job_title = 'Public Accountant'; --과거 직무 중 Public Accountant에 해당하는 이력만 필터링



SELECT *
FROM DEPARTMENTS  ;

--각 사원(employee)에 대해서 사번(employee_id),이름(first_name), 부서명(department_name), 매니저(manager)의
--이름(first_name)을 조회    //105 Em = e De=d Em=m
--employee_id - manager_id   department_id-department_id
--
SELECT e.EMPLOYEE_ID "사번",
       e.FIRST_NAME  "이름",
       d.DEPARTMENT_NAME   "부서명",
       m.FIRST_NAME "매니저 이름"
FROM EMPLOYEES e, DEPARTMENTS d, EMPLOYEES m
WHERE e.DEPARTMENT_ID = d.DEPARTMENT_ID
AND   e.MANAGER_ID = m.EMPLOYEE_ID;





