# 进阶3：排序查询
/*
语法 ：
	select 查询列表
	from 表
	【where 筛选条件】
	order by 排序列表 【asc|desc】;

特点：
	1、asc 代表升序，desc 代表降序，默认是升序
	2、order by 子句中可以支持单个字段、多个字段、表达式、函数、别名
	3、order by 子句一般是放在查询语句的最后面，limit 子句除外
*/
#案例1：查询员工信息，要求工资从高到底排序
#select * from employees order by salary desc;
#案例2：查询部门编号>=90 的员工信息，按入职时间的先后进行排序【添加筛选条件】
#select * from employees where department_id>=90 order by hiredate ;
#案例3：按年薪的高低显示员工的信息和年薪【按表达式排序】
#select * ,salary *12*(1+ifnull (commission_pct,0)) 年薪 from empoyees order by salary *12*(1+IFNULL (commission_pct,0))  desc;
#案例4：按年薪的高低显示员工的信息和年薪【按别名排序】
#select * ,salary *12*(1+ifnull (commission_pct,0)) 年薪 from empoyees order by 年薪 desc;
#案例5：按姓名的长度显示员工和工资【按函数排序】
#select length(last_name) 字节长度, * ,salary from eployees order by LENGTH(last_name) desc;
#案例6：查询员工信息，要求先按工资升序，再按员工编号降序【按多个字段排序】
#select * from order by salary asc, employees_id desc;