-- : query
select * from emp where 1=0; -- ������ �������� �༭ Ȯ����(����Ȯ�ο�->�÷���)
desc emp;

select e.empno, e.ename, e.sal from emp e;

desc student;
select s.studno, s.name, s.birthday, s.tel from student s;

desc professor;
select p.profno, p.name, p.position, p.pay from professor p;

desc emp2;
select e.name, e.hobby, e.position, e.pay from emp2 e;

-- ������ ����, ������ ��ųʸ�, ��Ÿ������
-- select * from user_?
-- �б�� ���������� ����� �Ұ���(DDL�� �����ϸ� ����Ŭ�� ����)

-- �ε����� Ÿ�� �˻��� ��������
-- Ŭ������ �ε��� : �ε��� ������ ������ ������ ��ġ(å�� ����) - �⺻Ű �ε���
-- ��Ŭ������ �ε��� : ���� ����ġ
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
-- �������� : DB�� �������� �����ʹ� �Է��� �ź�
-- �⺻Ű�� ���� ��������( not null, unique) : ��ü ���Ἲ ��������

select * from user_sequences;
create sequence b;
insert into board values(b.nextval, 'aaa', 'bbb', 'spring',sysdate,0);
commit;
select * from board;

select job from emp;
-- �ߺ��� �����Ѵ����� �д´�? �о�� ���� �ߺ��� �����Ѵ�?
select distinct job from emp;

-- where���� ���ٸ� ���̺�� �˻� ����� ī��θ�Ƽ�� �׻� ����
-- ���� ������ ������ ����. �и��� �ٶ���
select distinct position from professor;

-- index�� Ÿ�鼭 �˻��ϱ⸦ ���ϴµ� ��Ÿ�°�� hint�� ����������
-- where�� �ε����� �ɷ��ִ� �÷����� �ǹ̾��� ������ �Ǵ�.
select * from emp where empno>0 order by empno asc;

-- order by�� ���ù����ϰ� ������
select * from emp order by empno asc;
-- ��Ʈ�� �̿��ؼ� �ε��������� ����ϰ� �ϸ�(�ε����� ��������)
select /*+ index(emp pk_emp)*/ * from emp;

select * from emp order by empno desc;
-- ��Ʈ�� �̿��ؼ� �ε��� �������� ����ϰ� �ϸ�
select /*+ index_desc(emp pk_emp) */ * from emp;

select * from emp where empno=7369;
select * from emp where empno=7369 and rownum<=1;

select * from emp order by sal desc;
select * from emp order by sal desc, empno asc;

-- from�� ù��°, select�� ���������� �ι�°, order by�� ������
select empno, ename, sal from emp order by 1 asc;

select * from tab;
select * from emp order by hiredate;
select * from insa order by basicpay desc;
select * from professor order by name;

select * from emp where job='MANAGER';

select empno, ename, job, deptno from emp where deptno=20;

-- 1982������ �Ի��� ���
select * from emp where hiredate>='1982-01-01';

-- �޿��� 3000�̸��� ����� ���, �̸�, �޿��� ���
select empno, ename, sal from emp where sal<3000;

-- null�� ������ �ȵȴ�
select * from emp where comm is null;
select * from emp where comm is not null;
-- null���� nvl �Լ� : nvl(��1, ��2)

select sal, comm, nvl(sal+comm, sal) from emp;

-- and(&&), or(||)
-- �޿��� 2000�̻��̰� �μ���ȣ�� 20
select * from emp where sal>=2000 and deptno=20;
-- �޿��� 2000�̻��̰ų� �μ���ȣ�� 20
select * from emp where sal>=2000 or deptno=20;

-- �μ��� 20�̰� comm�� �޴� ���
select * from emp where deptno=20 and comm is not null;
-- 1981�⿡ �Ի��� 30�� �μ� ���
select * from emp where hiredate>='1981-01-01' and hiredate<='1981-12-31' and deptno=30;

-- ������ and�� ����
select * from emp where sal>=2000 and sal<=3000;
select * from emp where sal between 2000 and 3000;
select * from emp where sal not between 2000 and 3000;

-- ������ or�� ����
select * from emp where deptno=10 or deptno=20 or deptno=30;
select * from emp where deptno in (10,20,30);
select * from emp where deptno not in (10,20,30);

select * from emp where deptno in (10,20) order by ename;

select * from board;

create sequence board_seq;
select * from user_sequences;