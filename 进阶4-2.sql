#二、分组函数
/*
功能：用作统计使用，又称为聚合函数或统计函数或组函数
分类：
sum 求和、avg平均值、max最大值、min 最小值、count 计算个数

特点：
1、sum 、avg 一般用于处理数值型
   max、min、count 可以处理任何类型
2、以上分组函数都忽略null值
3、可以和distinct 搭配实现去重的运算
4、count 函数单独介绍
   一般使用count(*)用作统计行行数
5、
*/

#1、简单的使用
#select sum(salary) from employees;
#SELECT AVG(salary) FROM employees;
#SELECT max(salary) FROM employees;
#SELECT min(salary) FROM employees;
#SELECT count(salary) FROM employees;
#select sum(salary) 和,avg(salary) 平均值 FROM employees;

SELECT COUNT(salary)FROM employees;
SELECT COUNT(*) FROM employees;
SELECT COUNT(1) FROM employees;
/*
效率：
MYISAM 存储引擎下，count(*)的效率高
INNODB 存储引擎下，count(*)和count(1)的效率差不多，比count(字段)要高一些

*/




