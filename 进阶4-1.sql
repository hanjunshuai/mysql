#进阶4：常见函数
/*
概念：类似于java的方法，将一组逻辑语句封装在方法中，对外暴露方法名
好处：1、隐藏了实现细节  2、提高代码的重用性
调用：select 函数名(实参列表) 【from 表】;
特点：1、叫什么（函数名）
      2、干什么（函数功能）
分类：1、单行函数
	如：concat 、length、ifnull等
      2、分组函数
	功能：做统计使用，又称为统计函数、聚合函数、组函数

常见函数：
	字符函数：
	length、concat、substr、instr、trim、upper、lower、lpad、rpad、replace
	数字函数：
	round、ceil、floor、truncate、mod
	日期函数
	now、cutdate、curtime、year、month、day、hour、minute、second、str_to_date、date_format
	其他函数
	version、database、user
	控制函数
	if、case
*/

#一、字符函数
#1、length 获取参数值的字节数
SELECT LENGTH('john');
SELECT LENGTH('韩dddd');
SHOW VARIABLES LIKE '%char%'
#2、concat 拼接字符
SELECT CONCAT('a','哈哈');
#3、upper、lower
SELECT UPPER('hjs');
SELECT LOWER('sF');
#示例：将姓变大写，名小写，然后拼接
# select concat(upper(last_name),lower(first_name)) 姓名 from employees;

#4、substr、substring
#注意：索引从 1 开始
#截取从指定索引处后面所有的字符
SELECT SUBSTR('123456789',6);
#截取从指定索引处指定字符长度的字符
SELECT SUBSTR('123456789',1,3);

#案例:姓名中首字母大写，其他的小写然后用下划线拼接
SELECT CONCAT(UPPER(SUBSTR(last_name,1,1)),LOWER(SUBSTR(last_name,2)),'_',first_name) FROM employees;

#5、instr 返回字符串第一次出现的索引，如果找不到返回 0 
SELECT INSTR('殷六侠杨不悔爱上了殷六侠','殷六侠') AS out_put ;

#6、trim
SELECT LENGTH(TRIM('  sss sss  '));
SELECT TRIM('a' FROM 'aaaaaaa111111111111aaaaaaaaa1111aaaaaaaaaaaaa') AS out_put;

#7、lpad 用指定的字符实现左填充指定长度
SELECT LPAD('1234ssss',2,'*') AS out_put;

#8、rpad 用指定的字符实现左填充指定长度
SELECT RPAD('1234ssss',12,'*') AS out_put;

#9、replace 替换
SELECT REPLACE ('hzzq111dhzzdasdsa','hzz','hjs') AS out_put;

#二、数学函数
#1、round 四舍五入
SELECT ROUND(1.65);
SELECT ROUND(1.45);
SELECT ROUND(1.567,2);

#2、ceil 向上取整,返回>=该参数的最小整数
SELECT CEIL(1.002);
#3、floor 向下取整,返回<=该参数的最大整数
SELECT FLOOR(-9.999);
#4、truncate 截断
SELECT TRUNCATE(1.653333,1);
#5、mod取余,相当于 % 
/*
MOD(a,b):  a-a/b*b
MOD(-10,-3); -10 - (-10)/(-3)* (-3) = -1
*/
SELECT MOD(10,3);

#三、日期函数
#1、now 返回当前系统日期 + 时间
SELECT NOW();
#2、curdate 返回当前系统日期，不包含时间
SELECT CURDATE();
#3、curtime 返回当前时间，不包含日期
SELECT CURTIME();
#4、可以获取指定的部分，年、月、日、小时、分钟、秒
SELECT YEAR(NOW()) 年;
SELECT YEAR('1996-03-02') 年;
#select year(字段名) from 表;
SELECT MONTH(NOW()) 月;
SELECT MONTHNAME(NOW()) 月;
#5、str_to_date 将字符通过指定的格式转换成日期
SELECT STR_TO_DATE('1998-3-2','%Y-%c-%d') out_put;
#查询入职日期为1992-4-3的员工信息
SELECT * FROM employees WHERE hiredate = '1992-4-3';
SELECT * FROM employees WHERE hiredate = STR_TO_DATE('4-3 1992','%c-%d %Y');

#6、date_format 将日期转换成字符
SELECT DATE_FORMAT(NOW(),'%y年%m月%d日') out_put;

#查询有奖金的员工名和入职日期(xx月/xx日 xx年)
#select last_name,date_format('1996-03-02','%m月%d日 %Y年')入职时间 from 表 where 奖金 is not null ;

#四、其他函数
SELECT VERSION();
SELECT DATABASE();
SELECT USER();

#五、流程控制函数
#1、if 函数：if else 的效果
SELECT IF(10 > 5,'大','小');

#2、case 函数的使用一：swith case 的效果
/*
case 要判断的字段或表达式
when 常量1 then 要显示的值1 或 语句1;
when 常量1 then 要显示的值2 或 语句2;
... 值后面不加 分号 语句后面加分号
else 要显示的值n或语句n;
end
*/
/* 
案例：查询员工的工资，要求
部门号=30 ,显示的工资为1.1倍
部门号=40 ,显示的工资为1.2倍
部门号=50 ,显示的工资为1.5倍
其他部门，显示的工资为原工资
*/
/*
select salary ,id ,
case id
when 30 then salary*1.1
WHEN 40 THEN salary*1.2
WHEN 50 THEN salary*1.5
else salary
end as 新salary
from employees;
*/

#2、case 函数的使用二：多重if
/*
case 
when 条件1 then 要显示的值1 或 语句1
when 条件2 then 要显示的值2 或 语句2
....
else 要显示的值n或语句n
end 
*/
/*
案例：查询员工的工资情况
如果工资>20000,显示A级别
如果工资>15000,显示B级别
如果工资>10000,显示C级别
否则，显示D级别
*/
SELECT salary ,
CASE
WHEN salary > 20000 THEN 'A'
WHEN salary > 15000 THEN 'B'
WHEN salary > 10000 THEN 'C'
ELSE 'D'
END AS 工资级别
FROM employees;