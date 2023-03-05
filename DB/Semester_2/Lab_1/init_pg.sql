drop table params;
drop table attributes;
drop table objects;
drop table object_types;

-- Create tables
Create table object_types (
	object_type_id Numeric(20,0) NOT NULL ,
	parent_id Numeric (20,0),
	name Varchar(100),
	description Varchar(1000));

Create table objects (
	object_id Numeric(20,0) NOT NULL ,
	parent_id Numeric(20,0),
	object_type_id Numeric(20,0) NOT NULL ,
	name Varchar);

Create table attributes (
	attr_id Numeric(20,0) NOT NULL ,
	object_type_id Numeric(20,0) NOT NULL ,
	name Varchar(100));

Create table params (
	object_id Numeric(20,0) NOT NULL ,
	attr_id Numeric(20,0) NOT NULL ,
	text_value Varchar(1000),
	Numeric_value Numeric(20,0),
	date_value DATE);

-- Create primary keys
Alter table object_types add primary key (object_type_id);
Alter table objects add primary key (object_id);
Alter table attributes add primary key (attr_id);

-- Create indexes
Create Index xif1_params ON params (object_id);

-- Create foreign keys
Alter table objects
add Constraint r_5 foreign key (object_type_id)
references object_types (object_type_id)  on delete cascade;

Alter table object_types
add Constraint r_8 foreign key (parent_id)
references object_types (object_type_id)  on delete cascade;

Alter table attributes
add  foreign key (object_type_id)
references object_types (object_type_id) ;

Alter table objects
add Constraint r_1 foreign key (parent_id)
references objects (object_id)  on delete cascade;

Alter table params
add Constraint r_6 foreign key (object_id)
references objects (object_id) ;

Alter table params
add Constraint r_7 foreign key (attr_id)
references attributes (attr_id) ;


commit;

insert into OBJECT_TYPES values(1, NULL, 'emp','Employee');
insert into OBJECT_TYPES values(2, NULL, 'salgrade','Salgrade');
insert into OBJECT_TYPES values(3, NULL, 'dept','Department');
insert into OBJECT_TYPES values(4, NULL, 'g_object','Geo objects');
insert into OBJECT_TYPES values(5, NULL, 'b_part','Buildings parts');
insert into OBJECT_TYPES values(6, NULL, 'equip','Equipments');


insert into OBJECT_TYPES values(7, 4, 'rg','Region');
insert into OBJECT_TYPES values(8, 4, 'city','City');
insert into OBJECT_TYPES values(9, 4, 'st','Street');
insert into OBJECT_TYPES values(10, 4, 'bg','Building');

insert into OBJECT_TYPES values(11, 5, 'flr','Floor');
insert into OBJECT_TYPES values(12, 5, 'flt','Flat');

insert into OBJECT_TYPES values(13, 6, 'net_equip','Network equipment');
insert into OBJECT_TYPES values(14, 6, 'kitch_equip','Kitchen equipment');

-- From Course

insert into OBJECT_TYPES values(15, NULL, 'office','Office');
insert into OBJECT_TYPES values(16, NULL, 'car','Car for rent');


commit;

insert into Attributes values(1,1,'job');
insert into Attributes values(2,1,'hiredate');
insert into Attributes values(3,1,'sal');
insert into Attributes values(4,1,'comm');
insert into Attributes values(5,1,'deptno');
insert into Attributes values(6,2,'minsal');
insert into Attributes values(7,2,'hisal');
insert into Attributes values(8,3,'loc');

commit;

insert into objects values(7839,null,1,'KING');
insert into objects values(7698,7839,1,'BLAKE');
insert into objects values(7782,7839,1,'CLARK');
insert into objects values(7566,7839,1,'JONES');
insert into objects values(7654,7698,1,'MARTIN');
insert into objects values(7499,7698,1,'ALLEN');
insert into objects values(7844,7698,1,'TURNER');
insert into objects values(7900,7698,1,'JAMES');
insert into objects values(7521,7698,1,'WARD');
insert into objects values(7902,7566,1,'FORD');
insert into objects values(7369,7902,1,'SMITH');
insert into objects values(7788,7566,1,'SCOTT');
insert into objects values(7876,7788,1,'ADAMS');
insert into objects values(7934,7782,1,'MILLER');
insert into objects values(1,NULL,2,'1');
insert into objects values(2,NULL,2,'2');
insert into objects values(3,NULL,2,'3');
insert into objects values(4,NULL,2,'4');
insert into objects values(5,NULL,2,'5');
insert into objects values(10,NULL,3,'ACCOUNTING');
insert into objects values(20,NULL,3,'RESEARCH');
insert into objects values(30,NULL,3,'SALES');
insert into objects values(40,NULL,3,'OPERATIONS');

insert into objects values(1006,NULL,7,'Sumy oblast`');
insert into objects values(1007,1006,8,'Ohtyrka');
	insert into objects values(1008,1007,9,'Kharkivska st.');
		insert into objects values(1009,1008,10,'House 1');
			insert into objects values(1010,1009,11,'Floor 1');
				insert into objects values(1022,1010,12,'Flat 1');
					insert into objects values(1042,1022,13,'Computer');
					insert into objects values(1043,1022,13,'Router');
					insert into objects values(1045,1022,14,'Coffe machine');

insert into objects values(1011,1006,8,'Sumy');
	
	insert into objects values(1012,1011,9,'Kharkivska st.');
		insert into objects values(1014,1012,10,'House 1');
			insert into objects values(1015,1014,11,'Floor 1');
				insert into objects values(1022,1014,12,'Flat 1');
					insert into objects values(1029,1022,13,'Computer');
					insert into objects values(1030,1022,13,'Router');
					insert into objects values(1031,1022,14,'Coffe machine');
				
	insert into objects values(1013,1011,9,'Mykoly Sumtsova');
		insert into objects values(1016,1013,10,'House 1');
			insert into objects values(1018,1016,11,'Floor 1');
				insert into objects values(1023,1018,12,'Flat 1');
					insert into objects values(1026,1023,13,'Computer');
					insert into objects values(1027,1023,13,'Router');
					insert into objects values(1028,1023,14,'Coffe machine');

			insert into objects values(1019,1016,11,'Floor 2');
				insert into objects values(1024,1019,12,'Flat 2');
					insert into objects values(1032,1024,13,'Laptop');
					insert into objects values(1033,1024,13,'Switch');
					insert into objects values(1034,1024,14,'Oven');

		insert into objects values(1017,1013,10,'House 2');
			insert into objects values(1020,1017,11,'Floor 1');
				insert into objects values(1025,1020,12,'Flat 1');
					insert into objects values(1035,1025,13,'Laptop');
					insert into objects values(1036,1025,13,'Router');

			insert into objects values(1021,1017,11,'Floor 2');

-- From course

insert into objects values(1037,NULL,15,'Sumy office');
	insert into objects values(1038,1037,16,'Nissan Juke');
	insert into objects values(1039,1037,16,'Ford Fiesta');
	insert into objects values(1040,1037,16,'Toyota Cresta');

insert into objects values(1041,NULL,15,'Chernihiv office');
	insert into objects values(1042,1041,16,'Renault Logan');
	insert into objects values(1043,1041,16,'Citroen C4');



commit;




insert into Params values(7839,1,'PRESEDENT',NULL,NULL);
insert into Params values(7844,1,'SALESMAN',NULL,NULL);
insert into Params values(7900,1,'CLERK',NULL,NULL);
insert into Params values(7521,1,'SALESMAN',NULL,NULL);
insert into Params values(7902,1,'ANALYST',NULL,NULL);
insert into Params values(7369,1,'CLERK',NULL,NULL);
insert into Params values(7788,1,'ANALYST',NULL,NULL);
insert into Params values(7876,1,'CLERK',NULL,NULL);
insert into Params values(7934,1,'CLERK',NULL,NULL);
insert into Params values(7839,2,NULL,NULL,TO_DATE('17.11.1981','dd.mm.yyyy'));
insert into Params values(7698,2,NULL,NULL,TO_DATE('01.05.1981','dd.mm.yyyy'));
insert into Params values(7844,3,NULL,1500,NULL);
insert into Params values(7900,3,NULL,950,NULL);
insert into Params values(7521,3,NULL,1250,NULL);
insert into Params values(7654,5,NULL,30,NULL);
insert into Params values(7499,5,NULL,30,NULL);
insert into Params values(7844,5,NULL,30,NULL);
insert into Params values(7900,5,NULL,30,NULL);
insert into Params values(7521,5,NULL,30,NULL);
insert into Params values(7902,5,NULL,20,NULL);
insert into Params values(7369,5,NULL,20,NULL);
insert into Params values(7788,5,NULL,20,NULL);
insert into Params values(7876,5,NULL,20,NULL);
insert into Params values(7934,5,NULL,10,NULL);
insert into Params values(1,6,NULL,700,NULL);
insert into Params values(2,6,NULL,1201,NULL);
insert into Params values(3,6,NULL,1401,NULL);
insert into Params values(4,6,NULL,2001,NULL);
insert into Params values(5,6,NULL,3001,NULL);
insert into Params values(1,7,NULL,1200,NULL);
insert into Params values(2,7,NULL,1400,NULL);
insert into Params values(3,7,NULL,2000,NULL);
insert into Params values(4,7,NULL,3000,NULL);
insert into Params values(10,8,'NEW_YORK',NULL,NULL);
insert into Params values(20,8,'DALLAS',NULL,NULL);
insert into Params values(7698,1,'MANAGER',NULL,NULL);
insert into Params values(7782,1,'MANAGER',NULL,NULL);
insert into Params values(7566,1,'MANAGER',NULL,NULL);
insert into Params values(7654,1,'SALESMAN',NULL,NULL);
insert into Params values(7499,1,'SALESMAN',NULL,NULL);
insert into Params values(7782,2,NULL,NULL,TO_DATE('09.06.1981','dd.mm.yyyy'));
insert into Params values(7566,2,NULL,NULL,TO_DATE('02.04.1981','dd.mm.yyyy'));
insert into Params values(7654,2,NULL,NULL,TO_DATE('28.09.1981','dd.mm.yyyy'));
insert into Params values(7499,2,NULL,NULL,TO_DATE('20.02.1981','dd.mm.yyyy'));
insert into Params values(7844,2,NULL,NULL,TO_DATE('08.09.1981','dd.mm.yyyy'));
insert into Params values(7900,2,NULL,NULL,TO_DATE('03.12.1981','dd.mm.yyyy'));
insert into Params values(7900,2,NULL,NULL,TO_DATE('03.12.1981','dd.mm.yyyy'));
insert into Params values(7521,2,NULL,NULL,TO_DATE('22.02.1981','dd.mm.yyyy'));
insert into Params values(7902,2,NULL,NULL,TO_DATE('03.12.1981','dd.mm.yyyy'));
insert into Params values(7369,2,NULL,NULL,TO_DATE('17.12.1980','dd.mm.yyyy'));
insert into Params values(7788,2,NULL,NULL,TO_DATE('09.12.1982','dd.mm.yyyy'));
insert into Params values(7876,2,NULL,NULL,TO_DATE('12.01.1983','dd.mm.yyyy'));
insert into Params values(7934,2,NULL,NULL,TO_DATE('23.01.1982','dd.mm.yyyy'));
insert into Params values(7839,3,NULL,5000,NULL);
insert into Params values(7698,3,NULL,2850,NULL);
insert into Params values(7782,3,NULL,1500,NULL);
insert into Params values(7566,3,NULL,2975,NULL);
insert into Params values(7654,3,NULL,1250,NULL);
insert into Params values(7499,3,NULL,1600,NULL);
insert into Params values(7902,3,NULL,3000,NULL);
insert into Params values(7369,3,NULL,800,NULL);
insert into Params values(7788,3,NULL,3000,NULL);
insert into Params values(7876,3,NULL,1100,NULL);
insert into Params values(7934,3,NULL,1300,NULL);
insert into Params values(7654,4,NULL,1400,NULL);
insert into Params values(7499,4,NULL,300,NULL);
insert into Params values(7844,4,NULL,0,NULL);
insert into Params values(7521,4,NULL,500,NULL);
insert into Params values(7839,5,NULL,10,NULL);
insert into Params values(7698,5,NULL,30,NULL);
insert into Params values(7782,5,NULL,10,NULL);
insert into Params values(7566,5,NULL,20,NULL);
insert into Params values(30,8,'CHICAGO',NULL,NULL);
insert into Params values(40,8,'BOSTON',NULL,NULL);

commit;