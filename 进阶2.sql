#进阶2 ：条件查询
/*
语法：
	select 
		查询列表
	from
		表名
	where 
		筛选条件; 
		
分类：
	一、按条件表达式筛选
	条件运算符：< > =  !=  <>  >=  <= 
	
	二、按逻辑表达式:作用用于连接条件表达式
	逻辑运算符：&&   ||   ！
		    and  or   not

	三、模糊查询
		like
		between and 
		in
		is null
*/

# 一、按条件表达式筛选
# 案例1：查询工资>12000 的员工信息

# select  * from employees where salary > 12000;  

# 案例2：查询部门编号不等于90号的员工名和部门编号
# select last_name, department_id from employees where department_id <> 90;

# 二、按逻辑表达式筛选
# 案例1：查询工资在 1000 到 20000 之间的员工名、工资以及奖金
# select last_name,salary,commission_pct from emlpoyess where salary >= 10000 and salary <=20000;

# 案例2：查询部门编号不是在90到110之间的，或者工资高于15000 的员工信息
# a、select * from employees where department_id < 90 or department_id > 110 or salary > 15000;
SELECT * FROM employees WHERE NOT (department_id >= 90 AND department_id <= 110 ) OR salary > 15000;


#三、模糊查询

#1、like
/*
特点：
1、一般和通配符搭配使用
   通配符：
	% 任意多个字符,包含0个字符
	— 任意单个字符

*/
#案例1、查询员工中包含字符a的员工信息
# select * from emlpoyees where last_name like '%a%';

#案例2：查询员工名中第三个字符为e,第五个字符为a的员工名
# select last_name from employees where last_name like '__e_a%'

#案例3：查询员工名中第二个字符为 — 的员工名
# `\`转义
# select last_name from employees where last_name like '_\_%'
# ESCAPE :指定转义符
# SELECT last_name FROM employees WHERE last_name LIKE '_$_%'ESCAPE '$';

#2.between and 
/*
a.使用between and 可以提高语句的简洁度
b.包含临界值
c.两个临界值不要调换顺序
*/
#案例1：查询员工编号在100 到 120 之间的员工信息
# select * from employees where employees_id>=100 and employees_id <= 120;
# select * from employees where employees_id between 100 and  120;

#3.in
/*
含义：判断某字段的值是否属于 in 列表中的某一项
特点：
	a.使用in提高语句简洁度
	b.in 列表的值类型必须一致或兼容
*/
#案例：查询员工的工种编号是 IT_PROG，AD_VP，AD_PRES中的一个员工名和工种编号
# select last_name,job_id from employees where job_id = 'IT_PROG' or job_id = 'AD_VP' or job_id = 'AD_PRES';
# SELECT last_name,job_id FROM employees WHERE job_id in ( 'IT_PROG' , 'AD_VP' ,  'AD_PRES');

#4.is null 
/*
 = 或 <> 不能用于判断null值
 is null  或 is not null 可以判断null 值
*/
#案例1：查询没有奖金的员工名和奖金率
#不能使用 ： select last_name,commission_pct from employees where commission_pct = null;
#SELECT last_name,commission_pct FROM employees WHERE commission_pct is NULL;

# 有奖金的
#SELECT last_name,commission_pct FROM employees WHERE commission_pct IS not NULL;

#安全等于  <=>
#案例1：查询没有奖金的员工名和奖金率
#SELECT last_name,commission_pct FROM employees WHERE commission_pct <=> NULL;
#案例2：查询工资为12000的员工信息
#SELECT * FROM employees WHERE salary <=> 12000;

# is null , <=>
# is null : 仅仅可以判断 null 值，建议使用
# <=> :既可以判断null值，又可以判断普通的数值，可读性较低


