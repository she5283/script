-- : query
select * from emp where 1=0; -- 조건을 거짓으로 줘서 확인함(구조확인용->컬럽명)
desc emp;

select e.empno, e.ename, e.sal from emp e;

desc student;
select s.studno, s.name, s.birthday, s.tel from student s;

desc professor;
select p.profno, p.name, p.position, p.pay from professor p;

desc emp2;
select e.name, e.hobby, e.position, e.pay from emp2 e;

-- 데이터 사전, 데이터 딕셔너리, 메타데이터
-- select * from user_?
-- 읽기는 가능하지만 쓰기는 불가능(DDL을 실행하면 오라클이 갱신)

-- 인덱스를 타면 검색이 빨라진다
-- 클러스터 인덱스 : 인덱스 순서와 데이터 순서가 일치(책의 목차) - 기본키 인덱스
-- 비클러스터 인덱스 : 순서 불일치
select * from user_indexes where table_name='BOARD';

create table board (
    bno number(7) constraint board_pk_bno primary key,
    title varchar2(100 char),
    content clob,
    writer varchar2(10 char),
    writeTIme date,
    readCnt number(3)
);


select * from user_constraints;
-- 제약조건 : DB는 부적절한 데이터는 입력을 거부
-- 기본키에 대한 제약조건( not null, unique) : 개체 무결성 제약조건

select * from user_sequences;
create sequence b;
insert into board values(b.nextval, 'aaa', 'bbb', 'spring',sysdate,0);
commit;
select * from board;

select job from emp;
-- 중복을 제거한다음에 읽는다? 읽어온 다음 중복을 제거한다?
select distinct job from emp;

-- where절이 없다면 테이블과 검색 결과의 카디널리티는 항상 같다
-- 직위 정보는 교수와 별개. 분리가 바람직
select distinct position from professor;

-- index를 타면서 검색하기를 원하는데 안타는경우 hint로 가르쳐주자
-- where에 인덱스가 걸려있는 컬럼으로 의미없는 조건을 건다.
select * from emp where empno>0 order by empno asc;

-- order by는 무시무시하게 느리다
select * from emp order by empno asc;
-- 힌트를 이용해서 인덱스순으로 출력하게 하면(인덱스는 오름차순)
select /*+ index(emp pk_emp)*/ * from emp;

select * from emp order by empno desc;
-- 힌트를 이용해서 인덱스 역순으로 출력하게 하면
select /*+ index_desc(emp pk_emp) */ * from emp;

select * from emp where empno=7369;
select * from emp where empno=7369 and rownum<=1;

select * from emp order by sal desc;
select * from emp order by sal desc, empno asc;

-- from이 첫번째, select가 마지막에서 두번째, order by가 마지막
select empno, ename, sal from emp order by 1 asc;

select * from tab;
select * from emp order by hiredate;
select * from insa order by basicpay desc;
select * from professor order by name;

select * from emp where job='MANAGER';

select empno, ename, job, deptno from emp where deptno=20;

-- 1982년이후 입사자 출력
select * from emp where hiredate>='1982-01-01';

-- 급여가 3000미만인 사원의 사번, 이름, 급여를 출력
select empno, ename, sal from emp where sal<3000;

-- null은 연산이 안된다
select * from emp where comm is null;
select * from emp where comm is not null;
-- null연산 nvl 함수 : nvl(값1, 값2)

select sal, comm, nvl(sal+comm, sal) from emp;

-- and(&&), or(||)
-- 급여가 2000이상이고 부서번호가 20
select * from emp where sal>=2000 and deptno=20;
-- 급여가 2000이상이거나 부서번호가 20
select * from emp where sal>=2000 or deptno=20;

-- 부서가 20이고 comm을 받는 사원
select * from emp where deptno=20 and comm is not null;
-- 1981년에 입사한 30번 부서 사원
select * from emp where hiredate>='1981-01-01' and hiredate<='1981-12-31' and deptno=30;

-- 조건이 and로 범위
select * from emp where sal>=2000 and sal<=3000;
select * from emp where sal between 2000 and 3000;
select * from emp where sal not between 2000 and 3000;

-- 조건이 or로 범위
select * from emp where deptno=10 or deptno=20 or deptno=30;
select * from emp where deptno in (10,20,30);
select * from emp where deptno not in (10,20,30);

select * from emp where deptno in (10,20) order by ename;

select * from board;

create sequence board_seq;
select * from user_sequences;