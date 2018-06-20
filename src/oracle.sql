-----------oracleÊµÏÖ´úÂë
---------1.1
select count(1)
  from 
(select a.msisdn,
       sum(a.pv) pv
  from PAGEVISIT a,
       USER_INFO b
 where a.msisdn = b.msisdn
   and b.sex = 'ÄÐ'
   and a.record_day between '20171001' and '20171007'
 group by a.msisdn) a
where pv > 100;
-----------1.2
SELECT MSISDN
  FROM (
 SELECT MSISDN,
        SUM(RPAD(1,TO_DATE('20171008','YYYYMMDD')-TO_DATE(RECORD_DAY,'YYYYMMDD'),0)) VST_LIST
   FROM PAGEVISIT A
  WHERE A.RECORD_DAY BETWEEN '20171001' AND '20171007' 
    AND PV > 0 
  GROUP BY MSISDN)
WHERE INSTR(VST_LIST,'111') > 0;   
--2.1
select B.DEPT_NAME,
       A.NAME,
       A.SALARY
  from (select NAME,
               SALARY,
               DEPARTMENTID,
               DENSE_RANK() OVER(PARTITION BY DEPARTMENTID ORDER BY SALARY DESC) RN
          from EMPLOYEE )a,
       DEPARTMENT b   
 where A.DEPARTMENTID = B.DEPARTMENTID
   AND A.RN <= 3;
----3.1
SELECT A.REQUEST_AT,
       ROUND(SUM(CASE WHEN UPPER(STATUS) = 'COMPLETED' THEN 1 END)/COUNT(1),2)
  FROM TRIPS A,
       USERS B,
       USERS C
 WHERE A.REQUEST_AT BETWEEN '2013-10-01' AND '2013-10-03'
   AND B.BANNED = 'No'
   AND A.CLIEND_ID = B.USER_ID
   AND A.DRIVER_ID = C.USER_ID
   AND C.BANNED = 'No'
 GROUP BY A.REQUEST_AT;
