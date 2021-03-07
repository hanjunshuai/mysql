# 进阶1：基础查询
/*
语法：
select 查询列表 from 表名;

类似于：System.out.println();

特点：
1、查询列表可以是：表中的字段、常量值、表达式、函数
2、查询的结果是一个虚拟的表格
*/

USE mysql;

#1.查询表中的单个字段

SELECT Select_priv FROM db;

#2.查询表中的多个字段
SELECT `Select_priv`,`Insert_priv` FROM db ;
		
#3. 查询表中的所有字段
SELECT * FROM db;

#4. 查询常量值
SELECT 100;
SELECT 'john';

#5.查询表达式
SELECT 
  100 % 98 ;

#6.查询函数
SELECT 
  VERSION() ;

#7.起别名
/*
a.便于理解
b.如果要查询的字段有重名的情况，使用别名可以区分开来
*/

#方式一：使用as
SELECT 
  100 % 98 AS 结果 ;

SELECT 
  Select_priv AS 姓,
  Update_priv AS 名 
FROM
  db ;

#方式二：使用空格
SELECT Select_priv 姓,Update_priv 名
FROM
 db;

 #案例：查询 salary(薪资)，显示结果为 out put
 # 建议双引号，单引号也可以
 # select salary as "out put" from db

#8.去重(DISTINCT)

#案例：查询员工表中涉及到的所有的部门编号
# select id from db;
# select distinct id from db;

#9.+号的作用
/*
java 中的 + 号：
a.运算符，两个操作数都为数值型
b.连接符，只要有一个操作数为字符串

mysql 中的 + 号：
仅仅只有一个功能：运算符

select 100 + 99;  两个操作数都为数值型，则做加法运算
select '100' + 99; 其中一个为字符型，试图将字符型转换成数值型
		   如果转换成功，则继续做加法运算
select 'a' + 99;   如果转换失败，则将字符型转换成 0 。
select null + 10;  只要其中一方为null , 则结果肯定为 null。
		   
*/
#案例：查询员工名和姓连接成员一个字段，并显示为 姓名

#CONCAT 拼接
SELECT CONCAT('a','b','c') AS 结果;

SELECT 
  IFNULL(`Insert_priv`, 0) AS 结果 ,
  Insert_priv
FROM 
  db;

#SELECT 
#	CONCAT(last_name,first_name) AS 姓名 
#FROM 
#	db;
 