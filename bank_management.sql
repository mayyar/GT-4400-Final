-- CS4400: Introduction to Database Systems
-- Bank Management Project Phase 3 Physical Schema
-- Converting Relational Schema into a Database & Inserting Data
-- March 18th, 2022

drop database if exists bank_management;
create database if not exists bank_management;
use bank_management;

create table person (
	perID varchar(100),
    pwd varchar(100) not null,
    primary key (perID)
) engine=innodb;

insert into person values
('mmoss7','password1'),
('tmcgee1','password2'),
('dscully5','password3'),
('fmulder8','password4'),
('arwhite6','password5'),
('ealfaro4','password6'),
('mmcgill4','password7'),
('sville19','password8'),
('rnairn5','password9'),
('smcgill17','password10'),
('tjtalbot4','password11'),
('owalter6','password12'),
('rsanchez','password13'),
('msmith','password14'),
('lgibbs4','password15'),
('ghopper9','password16'),
('asantiago99','password17'),
('rholt99','password18'),
('jperalta99','password19'),
('glinetti99','password20'),
('cboyle99','password21'),
('rdiaz99','password22'),
('atrebek1','password23'),
('kjennings66','password24'),
('gburdell','password25'),
('pbeesly17','password26'),
('beyonce','password27');

create table system_admin (
	perID varchar(100),
    primary key (perID),
    constraint fk2 foreign key (perID) references person(perID)
) engine=innodb;

insert into system_admin values
('mmoss7'),
('tmcgee1'),
('dscully5'),
('fmulder8');

create table bank_user (
	perID varchar(100),
    taxID char(11) not null,
    birthdate date default null,
    firstName varchar(100) default null,
    lastName varchar(100) default null,
    dtJoined date default null,
    street varchar(100) default null,
    city varchar(100) default null,
    state char(2) default null,
    zip char(5) default null,
    primary key (perID),
    unique key (taxID),
    constraint fk3 foreign key (perID) references person(perID)
) engine=innodb;

insert into bank_user values
('arwhite6','053-87-1120','1960-06-06','Amelia-Rose','Whitehead','2021-12-03','60 Nightshade Court','Baltimore','MD','21217'),
('ealfaro4','278-78-7676','1960-06-06','Evie','Alfaro','2021-12-27','314 Five Fingers Way','Atlanta','GA','30301'),
('mmcgill4','623-09-0887','1955-06-23','Maheen','McGill','2020-09-08','741 Pan American Trace','East Cobb','GA','30304'),
('sville19','354-10-6263','1965-03-16','Sahar','Villegas','2020-06-16','10 Downing Road','East Cobb','GA','30304'),
('rnairn5','404-51-1036','1959-07-13','Roxanne','Nairn','2021-08-16','2048 Transparency Road','Atlanta','GA','30301'),
('smcgill17','238-40-5070','1954-06-02','Saqlain','McGill','2020-09-11','741 Pan American Trace','East Cobb','GA','30304'),
('tjtalbot4','203-46-3005','1978-05-10','TJ','Talbot','2020-03-25','101 Snoopy Woodstock Circle','Salt Lake City','UT','84108'),
('owalter6','346-51-9139','1971-10-23','Om','Walter','2020-04-29','143 Snoopy Woodstock Circle','Salt Lake City','UT','84108'),
('rsanchez','012-34-5678','1936-08-22','Rick','Sanchez',null,'137 Puget Run','Seattle','WA','98420'),
('msmith','246-80-1234','1999-04-04','Morty','Smith','2017-08-21','137 Puget Run','Seattle','WA','98420'),
('lgibbs4','304-39-1098','1954-11-21','Leroy','Gibbs','2021-06-16','50 Mountain Spur','Stillwater','PA','17878'),
('ghopper9','101-00-1111','1906-12-09','Grace','Hopper','2019-12-25','1 Broadway','New York','NY','10004'),
('asantiago99','765-43-2109','1983-07-04','Amy','Santiago','2018-03-09','1477 Park Avenue Apt. 82','New York','NY','11217'),
('rholt99','111-22-3333','1955-01-01','Raymond','Holt','2022-01-01','123 Main Street','Perth Amboy','NJ','08861'),
('jperalta99','775-33-6054','1981-09-04','Jake','Peralta','2018-03-09','1477 Park Avenue Apt. 82','New York','NY','11217'),
('glinetti99','233-76-0019','1986-03-20','Gina','Linetti','2019-04-04','75 Allure Drive','New York','NY','11220'),
('cboyle99','433-12-1200','1982-09-04','Charles','Boyle','2018-03-10','1477 Park Avenue Apt. 65','New York','NY','11217'),
('rdiaz99','687-54-1033','1984-11-30','Rosa','Diaz','2020-12-24','3 East Park Loop','Yonkers','NY','10112'),
('atrebek1','000-00-0000','1940-07-22','Alex','Trebek','2014-03-22','10202 West Washington Boulevard','Culver City','CA','90232'),
('kjennings66','004-52-2700','1974-05-23','Ken','Jennings','2005-09-07','74 Champions Heights','Edmonds','WA','98020'),
('gburdell','404-00-0000',null,null,null,null,null,null,null,null),
('pbeesly17','664-98-7654',null,'Pam','Beesly','2021-06-06',null,null,null,null),
('beyonce','444-55-666','1981-09-04','Beyonce',null,'2014-02-02','222 Star Grove','Houston','TX','77077');

create table employee (
	perID varchar(100),
    salary integer default null,
    payments integer default null,
    earned integer default null,
    primary key (perID),
    constraint fk4 foreign key (perID) references bank_user(perID),
    constraint employee_salary_positive check (salary >= 0)
) engine=innodb;

insert into employee values
('arwhite6',4700,6,28200),
('ealfaro4',5600,3,17100),
('mmcgill4',9400,3,29100),
('sville19',8000,4,35000),
('rnairn5',5100,5,27400),
('smcgill17',8800,3,33700),
('rsanchez',49500,10,654321),
('lgibbs4',null,null,null),
('ghopper9',49500,5,447999),
('rholt99',null,null,null),
('jperalta99',5400,3,5900),
('glinetti99',null,null,null),
('cboyle99',null,null,1200),
('kjennings66',2000,9,43000),
('gburdell',null,null,null),
('pbeesly17',8400,2,14000),
('beyonce',9800,6,320985);

create table customer (
	perID varchar(100),
    primary key (perID),
    constraint fk5 foreign key (perID) references bank_user(perID)
) engine=innodb;

insert into customer values
('arwhite6'),
('tjtalbot4'),
('owalter6'),
('rsanchez'),
('msmith'),
('asantiago99'),
('rholt99'),
('glinetti99'),
('cboyle99'),
('rdiaz99'),
('atrebek1'),
('kjennings66'),
('pbeesly17');

create table customer_contacts (
	perID varchar(100),
    contact_type varchar(100),
    info varchar(100),
    primary key (perID, contact_type, info),
    constraint fk6 foreign key (perID) references customer(perID)
) engine=innodb;

insert into customer_contacts values
('arwhite6','mobile','333-182-9303'),
('arwhite6','email','amelia_whitehead@me.com'),
('tjtalbot4','mobile','845-101-2760'),
('tjtalbot4','home','236-464-1023'),
('tjtalbot4','email','tj_forever@aol.com'),
('owalter6','home','370-186-5341'),
('rsanchez','phone','000-098-7654'),
('msmith','email','morty@rm.com'),
('asantiago99','email','asantiago99@nypd.org'),
('asantiago99','fax','334-444-1234 x276'),
('pbeesly17','email','pb@dunder.com'),
('pbeesly17','email','jh@dunder.com'),
('msmith','phone','000-098-7654');

create table corporation (
	corpID varchar(100),
    shortName varchar(100) not null,
    longName varchar(100) not null,
    resAssets integer default null,
    primary key (corpID),
    unique key (shortName),
    unique key (longName)
) engine=innodb;

insert into corporation values
('WF','Wells Fargo','Wells Fargo Bank National Association',33000000),
('BA','Bank of America','Bank of America Corporation',51000000),
('ST','Sun Trust','Sun Trust Banks/Truist Financial Corporation',39000000),
('NASA','NASA FCU','NASA Federal Credit Union',11000000),
('TD','TD Ameritrade','TD Ameritrade Holding Corporation',0),
('GS','Goldman Sachs','Goldman Sachs Group, Inc.',null);

create table bank (
	bankID varchar(100),
    bankName varchar(100) default null,
    street varchar(100) default null,
    city varchar(100) default null,
    state char(2) default null,
    zip char(5) default null,
    resAssets integer default null,
    corpID varchar(100) not null,
    manager varchar(100) not null,
    primary key (bankID),
    unique key (street, city, state, zip),
    unique key (manager),
    constraint fk12 foreign key (corpID) references corporation(corpID),
    constraint fk15 foreign key (manager) references employee(perID)
) engine=innodb;

insert into bank values
('WF_1','Wells Fargo #1 Bank','1010 Binary Way','Seattle','WA','98101',127000,'WF','sville19'),
('WF_2','Wells Fargo #2 Bank','337 Firefly Lane','Seattle','WA','98101',553000,'WF','mmcgill4'),
('BA_West','Bank of America West Region Bank','865 Black Gold Circle','Dallas','TX','75116',267000,'BA','smcgill17'),
('NASA_Goddard','NASA FCU at Goddard SFC','8800 Greenbelt Road','Greenbelt','MD','20771',140000,'NASA','rsanchez'),
('TD_Online',null,null,null,null,null,0,'TD','kjennings66'),
('TD_GT','TD Ameritrade Midtown Branch','47 Tech Parkway','Atlanta','GA','30333',null,'TD','gburdell'),
('NASA_KSC','NASA FCU at Kennedy Space Center','1 Space Commerce Way','Cape Canaveral','FL','45678',0,'NASA','rholt99'),
('BA_South','Bank of America Plaza-Midtown','600 Peachtree Street NE','Atlanta','GA','30333',42000,'BA','ghopper9'),
('NASA_HAL','NASA FCU at US Space & Rocket Center','1 Tranquility Base Suite 203','Huntsville','AL','35805',null,'NASA','pbeesly17');

create table bank_account (
	bankID varchar(100),
    accountID varchar(100),
    balance integer default null,
    primary key (bankID, accountID),
    constraint fk1 foreign key (bankID) references bank(bankID)
) engine=innodb;

insert into bank_account values
('WF_2','checking_A',2700),
('BA_West','checking_A',1000),
('NASA_Goddard','company_checking',null),
('NASA_KSC','company_checking',150000),
('TD_Online','company_checking',0),
('WF_2','market_X',27000),
('TD_Online','Roth_IRA',167000),
('TD_GT','Roth_IRA',15000),
('BA_South','GT_investments',16000),
('WF_2','savings_A',19400),
('BA_West','savings_B',8000),
('NASA_Goddard','company_savings',1000000),
('TD_GT','savings_A',8500),
('BA_South','GT_savings',9999);

create table interest_bearing (
	bankID varchar(100),
	accountID varchar(100),
    interest_rate integer default null,
    dtDeposit date default null,
    primary key (bankID, accountID),
    constraint fk8 foreign key (bankID, accountID) references bank_account(bankID, accountID)
) engine=innodb;

insert into interest_bearing values
('WF_2', 'market_X', 20, '2021-12-23'),
('TD_Online', 'Roth_IRA', 12, '2022-01-03'),
('TD_GT', 'Roth_IRA', 8, '2021-01-01'),
('BA_South', 'GT_investments', 4, '2020-03-11'),
('WF_2', 'savings_A', 10, '2021-11-05'),
('BA_West', 'savings_B', 6,' 2021-09-01'),
('NASA_Goddard', 'company_savings', null, null),
('TD_GT', 'savings_A', null, null),
('BA_South', 'GT_savings', 2, null);

create table interest_bearing_fees (
	bankID varchar(100),
    accountID varchar(100),
    fee varchar(100),
    primary key (bankID, accountID, fee),
    constraint fk9 foreign key (bankID, accountID) references interest_bearing(bankID, accountID)
) engine=innodb;

insert into interest_bearing_fees values
('WF_2','savings_A','low balance'),
('BA_West','savings_B','low balance'),
('BA_West','savings_B','overdraft'),
('WF_2','market_X','administrative'),
('WF_2','market_X','frequency'),
('WF_2','market_X','fee'),
('TD_Online','Roth_IRA','low balance'),
('TD_Online','Roth_IRA','withdrawal'),
('NASA_Goddard','company_savings','credit union'),
('BA_South','GT_investments','withdrawal');

create table savings (
	bankID varchar(100),
    accountID varchar(100),
    minBalance integer default null,
    primary key (bankID, accountID),
    constraint fk10 foreign key (bankID, accountID) references interest_bearing(bankID, accountID)
) engine=innodb;

insert into savings values
('WF_2','savings_A',15000),
('BA_West','savings_B',10000),
('NASA_Goddard','company_savings',0),
('TD_GT','savings_A',0),
('BA_South','GT_savings',2000);

create table market (
	bankID varchar(100),
    accountID varchar(100),
    maxWithdrawals integer default null,
    numWithdrawals integer default null,
    primary key (bankID, accountID),
    constraint fk11 foreign key (bankID, accountID) references interest_bearing(bankID, accountID)
) engine=innodb;

insert into market values
('WF_2','market_X',2,1),
('TD_Online','Roth_IRA',0,0),
('TD_GT','Roth_IRA',null,null),
('BA_South','GT_investments',10,5);

create table checking (
	bankID varchar(100),
    accountID varchar(100),
    protectionBank varchar(100) default null,
    protectionAccount varchar(100) default null,	
    amount integer default null,
    dtOverdraft date default null,
    primary key (bankID, accountID),
    unique key (protectionBank, protectionAccount),
    constraint fk7 foreign key (bankID, accountID) references bank_account(bankID, accountID),
    constraint fk18 foreign key (protectionBank, protectionAccount) references savings(bankID, accountID)
) engine=innodb;

insert into checking values
('WF_2','checking_A', null, null, null, null),
('BA_West','checking_A','BA_West', 'savings_B', 600, '2021-12-08'),
('NASA_Goddard','company_checking', null, null, null, null),
('NASA_KSC','company_checking', null, null, null, null),
('TD_Online','company_checking', null, null, null, null);

create table workFor (
	bankID varchar(100),
    perID varchar(100),
    primary key (bankID, perID),
	constraint fk13 foreign key (bankID) references bank(bankID),
	constraint fk14 foreign key (perID) references employee(perID)
) engine=innodb;

insert into workFor values
('WF_2','arwhite6'),
('WF_1','ealfaro4'),
('WF_2','ealfaro4'),
('BA_West','rnairn5'),
('BA_South','beyonce'),
('NASA_Goddard','beyonce'),
('TD_Online','beyonce'),
('TD_GT','jperalta99'),
('TD_GT','cboyle99'),
('NASA_KSC','jperalta99'),
('NASA_KSC','cboyle99'),
('NASA_HAL','jperalta99'),
('BA_West','glinetti99'),
('TD_Online','glinetti99');

create table access (
	perID varchar(100),
	bankID varchar(100),
    accountID varchar(100),
    dtShareStart date not null,
    dtAction date default null,
    primary key (bankID, perID, accountID),
	constraint fk16 foreign key (perID) references customer(perID),
    constraint fk17 foreign key (bankID, accountID) references bank_account(bankID, accountID)
) engine=innodb;

insert into access values
('arwhite6','WF_2','checking_A','2021-08-10','2022-01-26'),
('arwhite6','WF_2','savings_A','2021-08-10','2021-11-11'),
('tjtalbot4','WF_2','savings_A','2021-08-17','2022-02-03'),
('owalter6','BA_West','checking_A','2020-09-02',null),
('owalter6','BA_West','savings_B','2020-09-02',null),
('msmith','NASA_Goddard','company_checking','2018-10-11',null),
('rsanchez','NASA_Goddard','company_checking','2018-10-10','2022-02-04'),
('rsanchez','NASA_KSC','company_checking','2018-10-10','2022-01-13'),
('tjtalbot4','TD_Online','company_checking','2020-12-07','2020-12-07'),
('rholt99','WF_2','market_X','2022-02-02','2020-02-04'),
('asantiago99','WF_2','market_X','2020-02-02','2020-02-04'),
('cboyle99','TD_Online','Roth_IRA','2021-09-26',null),
('glinetti99','TD_Online','Roth_IRA','2019-12-24',null),
('msmith','TD_GT','Roth_IRA','2021-01-01','2022-01-01'),
('kjennings66','BA_South','GT_investments','2009-08-09',null),
('rsanchez','NASA_Goddard','company_savings','2014-08-16',null),
('pbeesly17','TD_GT','savings_A','2021-09-09',null),
('atrebek1','BA_South','GT_savings','2015-12-31','2017-03-22'),
('kjennings66','BA_South','GT_savings','2010-08-09','2022-02-21');

-- Team 50
-- CS4400: Introduction to Database Systems
-- Bank Management Project - Phase 3 (v2)
-- Generating Stored Procedures & Functions for the Use Cases
-- April 4th, 2022

-- implement these functions and stored procedures on the project database
use bank_management;

set global sql_mode='';

-- [1] create_corporation()
-- This stored procedure creates a new corporation
drop procedure if exists create_corporation;
delimiter //
create procedure create_corporation (in ip_corpID varchar(100),
    in ip_shortName varchar(100), in ip_longName varchar(100),
    in ip_resAssets integer)
begin
	-- Implement your code here
    insert into corporation (corpID, shortName,longName, resAssets) values (ip_corpID, ip_shortName, ip_longName, ip_resAssets);
end //
delimiter ;
-- Test Case: 
-- call create_corporation("CHASE", "Chase", "Chase Bank", "22000000"); 

-- [2] create_bank()
-- This stored procedure creates a new bank that is owned by an existing corporation
-- The corporation must also be managed by a valid employee [being a manager doesn't leave enough time for other jobs]
drop procedure if exists create_bank;
delimiter //
create procedure create_bank (in ip_bankID varchar(100), in ip_bankName varchar(100),
	in ip_street varchar(100), in ip_city varchar(100), in ip_state char(2),
    in ip_zip char(5), in ip_resAssets integer, in ip_corpID varchar(100),
    in ip_manager varchar(100), in ip_bank_employee varchar(100))
begin
	-- Implement your code here
    if exists(select * from corporation where corpID = ip_corpID) and 
		ip_manager in (select perID from employee) and ip_bank_employee in (select perID from employee) and
        not exists(select * from bank where manager = ip_bank_employee) and 
        ip_manager not in (select perID from workFor) then
        
		insert into bank (bankID, bankName, street, city, state, zip, resAssets, corpID, manager) values (ip_bankID, ip_bankName, ip_street, ip_city, ip_state, ip_zip, ip_resAssets, ip_corpID, ip_manager);
        insert into workFor (bankID, perID) values (ip_bankID, ip_bank_employee);
	end if;
end //
delimiter ;
-- Test Case: 
-- call create_bank('BA_North','Bank of America New York','150 Broadway','New York','NY','10038', 359000,'BA', 'lgibbs4', 'cboyle99'); 

-- [3] start_employee_role()
-- If the person exists as an admin or employee then don't change the database state [not allowed to be admin along with any other person-based role]
-- If the person doesn't exist then this stored procedure creates a new employee
-- If the person exists as a customer then the employee data is added to create the joint customer-employee role
drop procedure if exists start_employee_role;
delimiter //
create procedure start_employee_role (in ip_perID varchar(100), in ip_taxID char(11),
	in ip_firstName varchar(100), in ip_lastName varchar(100), in ip_birthdate date,
    in ip_street varchar(100), in ip_city varchar(100), in ip_state char(2),
    in ip_zip char(5), in ip_dtJoined date, in ip_salary integer,
    in ip_payments integer, in ip_earned integer, in emp_password  varchar(100))
sp_main: begin
	-- Implement your code here
    if exists(select * from system_admin where perID = ip_perID) or exists(select * from customer where perID = ip_perID) then
        leave sp_main;
    else
		if not exists(select * from person where perID = ip_perID) then 
			insert into person values (ip_perID, emp_password);
            insert into bank_user values (ip_perID, ip_taxID, ip_birthdate, ip_firstName, ip_lastName, ip_dtJoined, ip_street, ip_city, ip_state, ip_zip);
			insert into employee values (ip_perID, ip_salary, ip_payments, ip_earned);
		else
			if exists(select * from customer where perID = ip_perID) then
				insert into employee values (ip_perID, ip_salary, ip_payments, ip_earned);
            end if;
        end if;
    end if;
end //
delimiter ;

-- [4] start_customer_role()
-- If the person exists as an admin or customer then don't change the database state [not allowed to be admin along with any other person-based role]
-- If the person doesn't exist then this stored procedure creates a new customer
-- If the person exists as an employee then the customer data is added to create the joint customer-employee role
drop procedure if exists start_customer_role;
delimiter //
create procedure start_customer_role (in ip_perID varchar(100), in ip_taxID char(11),
	in ip_firstName varchar(100), in ip_lastName varchar(100), in ip_birthdate date,
    in ip_street varchar(100), in ip_city varchar(100), in ip_state char(2),
    in ip_zip char(5), in ip_dtJoined date, in cust_password varchar(100))
sp_main: begin
	-- Implement your code here
    if exists(select * from system_admin where perID=ip_perID) or exists(select* from customer where perID=ip_perID) then
        leave sp_main;
    else
		if not exists(select * from person where perID=ip_perID) then 
			insert into person values (ip_perID, cust_password);
            insert into bank_user values (ip_perID, ip_taxID, ip_birthdate, ip_firstName, ip_lastName, ip_dtjoined, ip_street, ip_city, ip_state, ip_zip);
			insert into customer values (ip_perID);
		else
			if exists(select * from employee where perID=ip_perID) then
				insert into customer values (ip_perID);
            end if;
        end if;
    end if;
end //
delimiter ;
-- testcase
-- call start_customer_role('cbabbage99', '553-27-0005', 'Charles', 'Babbage', '1980-04-12', 'Augusta Byron Dr NE', 'Atlanta', 'GA', '30333', '2010-02-01', 'password103');

-- [5] stop_employee_role()
-- If the person doesn't exist as an employee then don't change the database state
-- If the employee manages a bank or is the last employee at a bank then don't change the database state [each bank must have a manager and at least one employee]
-- If the person exists in the joint customer-employee role then the employee data must be removed, but the customer information must be maintained
-- If the person exists only as an employee then all related person data must be removed
drop procedure if exists stop_employee_role;
delimiter //
create procedure stop_employee_role (in ip_perID varchar(100))
sp_main: begin
	-- Implement your code here
    if not exists(select * from employee where perID = ip_perID) then
		leave sp_main;
	else
        if exists(select * from bank where manager = ip_perID) or exists(select * from workFor where perID = ip_perID and bankID in (select bankID from workFor group by bankID having count(*) = 1)) then
			leave sp_main;
		else
			if exists (select * from customer where perID = ip_perID) then
				delete from workFor where perID = ip_perID;
				delete from employee where perID = ip_perID;
			else
				delete from workFor where perID = ip_perID;
				delete from employee where perID = ip_perID;
                delete from bank_user where perID = ip_perID;
				delete from person where perID = ip_perID;
            end if;
        end if;
    end if;
end //
delimiter ;

-- [6] stop_customer_role()
-- If the person doesn't exist as an customer then don't change the database state
-- If the customer is the only holder of an account then don't change the database state [each account must have at least one holder]
-- If the person exists in the joint customer-employee role then the customer data must be removed, but the employee information must be maintained
-- If the person exists only as a customer then all related person data must be removed
drop procedure if exists stop_customer_role;
delimiter //
create procedure stop_customer_role (in ip_perID varchar(100))
sp_main: begin
	-- Implement your code here
    if not exists(select * from customer where perID = ip_perID) then
		leave sp_main;
	else
		if exists(select * from access where perID= ip_perID and (bankID, accountID) in(select bankID, accountID from access group by bankID, accountID having count(*)=1) ) then
			leave sp_main;
		else
			if exists (select * from employee where perID = ip_perID) then
				delete from access where perID=ip_perID;
				delete from customer_contacts where perID=ip_perID;
				delete from customer where perID=ip_perID;
			else
				delete from access where perID=ip_perID;
                delete from customer_contacts where perID=ip_perID;
				delete from customer where perID=ip_perID;
                delete from bank_user where perID=ip_perID;
				delete from person where perID=ip_perID;

            end if;
        end if;
    end if;
    
end //
delimiter ;
-- testcase
-- call stop_customer_role("asantiago99");
-- call stop_customer_role("rholt99");


-- [7] hire_worker()
-- If the person is not an employee then don't change the database state
-- If the worker is a manager then then don't change the database state [being a manager doesn't leave enough time for other jobs]
-- Otherwise, the person will now work at the assigned bank in addition to any other previous work assignments
-- Also, adjust the employee's salary appropriately
drop procedure if exists hire_worker;
delimiter //
create procedure hire_worker (in ip_perID varchar(100), in ip_bankID varchar(100),
	in ip_salary integer)
sp_main: begin
	-- Implement your code here
	if not exists(select * from employee where perID = ip_perID) then
        leave sp_main;
    else
		if exists(select * from bank where manager = ip_perID) then
        leave sp_main;
        else
			insert into workFor values (ip_bankID, ip_perID);
			update employee set salary = IFNULL(salary, 0) + ip_salary where perID = ip_perID;
		end if;
    end if;
end //
delimiter ;

-- [8] replace_manager()
-- If the new person is not an employee then don't change the database state
-- If the new person is a manager or worker at any bank then don't change the database state [being a manager doesn't leave enough time for other jobs]
-- Otherwise, replace the previous manager at that bank with the new person
-- The previous manager's association as manager of that bank must be removed
-- Adjust the employee's salary appropriately
drop procedure if exists replace_manager;
delimiter //
create procedure replace_manager (in ip_perID varchar(100), in ip_bankID varchar(100),
	in ip_salary integer)
sp_main: begin 
	-- Implement your code here
	if not exists(select * from employee where perID = ip_perID) then
        leave sp_main;
    else
        if exists(select * from bank where manager = ip_perID) or exists(select * from workFor where perID = ip_perID) then
			leave sp_main;
		else
			update bank set manager = ip_perID where bankID = ip_bankID;
			update employee set salary = IFNULL(salary, 0) + ip_salary where perID = ip_perID;
		end if;
    end if;
end //
delimiter ;

-- [9] add_account_access()
-- If the account does not exist, create a new account. If the account exists, add the customer to the account
-- When creating a new account:
    -- If the person opening the account is not an admin then don't change the database state
    -- If the intended customer (i.e. ip_customer) is not a customer then don't change the database state
    -- Otherwise, create a new account owned by the designated customer
    -- The account type will be determined by the enumerated ip_account_type variable
    -- ip_account_type in {checking, savings, market}
-- When adding a customer to an account:
    -- If the person granting access is not an admin or someone with access to the account then don't change the database state
    -- If the intended customer (i.e. ip_customer) is not a customer then don't change the database state
    -- Otherwise, add the new customer to the existing account
drop procedure if exists add_account_access;
delimiter //
create procedure add_account_access (in ip_requester varchar(100), in ip_customer varchar(100),
	in ip_account_type varchar(10), in ip_bankID varchar(100),
    in ip_accountID varchar(100), in ip_balance integer, in ip_interest_rate integer,
    in ip_dtDeposit date, in ip_minBalance integer, in ip_numWithdrawals integer,
    in ip_maxWithdrawals integer, in ip_dtShareStart date)
sp_main: begin
	-- Implement your code here
    if not exists(select * from bank_account where bankID = ip_bankID and accountID = ip_accountID) then
		-- create a new account
        if not exists(select * from system_admin where perID = ip_requester) then
			leave sp_main;
		end if;
        
		if not exists(select * from customer where perID = ip_customer) then
			leave sp_main;
		end if;
        
        if ip_account_type = 'checking' then
			insert into bank_account values (ip_bankID, ip_accountID, ip_balance);
			insert into checking values (ip_bankID, ip_accountID, null, null, null, null);
            insert into access values (ip_customer, ip_bankID, ip_accountID, ip_dtShareStart, null);
        end if;
        
        if ip_account_type = 'savings' then
			insert into bank_account values (ip_bankID, ip_accountID, ip_balance);
            insert into interest_bearing values (ip_bankID, ip_accountID, ip_interest_rate, ip_dtDeposit);
			insert into savings values (ip_bankID, ip_accountID, ip_minBalance);
            insert into access values (ip_customer, ip_bankID, ip_accountID, ip_dtShareStart, null);
        end if;
        
        if ip_account_type = 'market' then
			insert into bank_account values (ip_bankID, ip_accountID, ip_balance);
            insert into interest_bearing values (ip_bankID, ip_accountID, ip_interest_rate, ip_dtDeposit);
            insert into market (bankID, accountID, maxWithdrawals, numWithdrawals) values (ip_bankID, ip_accountID, ip_maxWithdrawals, ip_numWithdrawals);
            insert into access values (ip_customer, ip_bankID, ip_accountID, ip_dtShareStart, null);
        end if;
        leave sp_main;
    end if;
    
    if exists(select * from bank_account where bankID = ip_bankID and accountID = ip_accountID) then
		-- add customer to account
		if not exists(select * from system_admin where perID = ip_requester) 
			and 
            not exists(select * from access where perID = ip_requester and bankID = ip_bankID and accountID = ip_accountID) then
			leave sp_main;
		end if;
        
		if not exists(select * from customer where perID = ip_customer) then
			leave sp_main;
		end if;
        
        insert into access values (ip_customer, ip_bankID, ip_accountID, ip_dtShareStart, null);
    end if;
end //
delimiter ;

-- call  add_account_access('mmoss7', 'atrebek1', 'market', 'TD_GT', 'new_market', 4000, 12, null, null, 0, 4, '2022-03-04');
-- call add_account_access('mmoss7', 'pbeesly17', 'checking', 'TD_GT', 'new_checking', 600, null, null, null, null, null, '2022-01-01'); 

-- [10] remove_account_access()
-- Remove a customer's account access. If they are the last customer with access to the account, close the account
-- When just revoking access:
    -- If the person revoking access is not an admin or someone with access to the account then don't change the database state
    -- Otherwise, remove the designated sharer from the existing account
-- When closing the account:
    -- If the customer to be removed from the account is NOT the last remaining owner/sharer then don't close the account
    -- If the person closing the account is not an admin or someone with access to the account then don't change the database state
    -- Otherwise, the account must be closed
drop procedure if exists remove_account_access;
delimiter //
create procedure remove_account_access (in ip_requester varchar(100), in ip_sharer varchar(100),
	in ip_bankID varchar(100), in ip_accountID varchar(100))
sp_main: begin
	-- Implement your code here
    if not exists(select * from system_admin where perID = ip_requester) and 
		not exists(select * from access where perID = ip_requester and bankID = ip_bankID and accountID = ip_accountID) then
		leave sp_main;
	end if;
    if not exists(select * from access where perID = ip_sharer and bankID = ip_bankID and accountID = ip_accountID) then
		leave sp_main;
	end if;
    if (select count(perID) from access where bankID = ip_bankID and accountID = ip_accountID) = 1 then
		-- revoke and close
        delete from access where perID = ip_sharer and bankID = ip_bankID and accountID = ip_accountID;
        delete from checking where bankID = ip_bankID and accountID = ip_accountID;
        delete from savings where bankID = ip_bankID and accountID = ip_accountID;
        delete from market where bankID = ip_bankID and accountID = ip_accountID;
        delete from interest_bearing_fees where bankID = ip_bankID and accountID = ip_accountID;
        delete from interest_bearing where bankID = ip_bankID and accountID = ip_accountID;
        delete from bank_account where bankID = ip_bankID and accountID = ip_accountID;
		leave sp_main;
    end if;
    -- only revoke
    delete from access where perID = ip_sharer and bankID = ip_bankID and accountID = ip_accountID;
    
end //
delimiter ;
-- call remove_account_access('mmoss7', 'rsanchez', 'NASA_Goddard', 'company_savings'); 


-- [11] create_fee()
drop procedure if exists create_fee;
delimiter //
create procedure create_fee (in ip_bankID varchar(100), in ip_accountID varchar(100),
	in ip_fee_type varchar(100))
sp_main: begin
	-- Implement your code here
    if not exists(select * from bank_account where bankID = ip_bankID and accountID = ip_accountID) then
		leave sp_main;
    end if;
    insert into interest_bearing_fees values (ip_bankID, ip_accountID, ip_fee_type);

end //
delimiter ;
-- call create_fee('WF_3', 'market_X', 'new fee'); 

-- [12] start_overdraft()
drop procedure if exists start_overdraft;
delimiter //
create procedure start_overdraft (in ip_requester varchar(100),
	in ip_checking_bankID varchar(100), in ip_checking_accountID varchar(100),
    in ip_savings_bankID varchar(100), in ip_savings_accountID varchar(100))
sp_main: begin
	-- Implement your code here
    -- Not sure about the rule of ip_requester. Assume that the requeseter must be system_admin or someone who have accessed to both the savings and checking account
    if not exists(select * from system_admin where perID = ip_requester) and 
		not (exists (select * from access where perID = ip_requester and bankID = ip_checking_bankID and accountID = ip_checking_accountID) and 
			exists (select * from access where perID = ip_requester and bankID = ip_savings_bankID and accountID = ip_savings_accountID)) then
		leave sp_main;
	end if;
    if exists(select * from checking where protectionBank = ip_savings_bankID and protectionAccount = ip_savings_accountID) then
		leave sp_main;
    end if;
    if exists(select * from checking where bankID = ip_checking_bankID and accountID = ip_checking_accountID and protectionBank is not null and protectionAccount is not null) then
		leave sp_main;
    end if;
    update checking set protectionBank = ip_savings_bankID, protectionAccount = ip_savings_accountID, amount = null, dtOverdraft = null where bankID = ip_checking_bankID and accountID = ip_checking_accountID;
end //
delimiter ;
-- call start_overdraft('tjtalbot4', 'WF_2', 'checking_A', 'WF_2', 'savings_A'); 
-- call start_overdraft('mmoss7', 'TD_Online', 'company_checking', 'TD_GT', 'savings_A'); 

-- [13] stop_overdraft()
drop procedure if exists stop_overdraft;
delimiter //
create procedure stop_overdraft (in ip_requester varchar(100),
	in ip_checking_bankID varchar(100), in ip_checking_accountID varchar(100))
sp_main: begin
	-- Implement your code here
	-- Not sure about the rule of ip_requester. Assume that the requeseter must be system_admin or someone who have accessed to the checking account
    if not exists(select * from system_admin where perID = ip_requester) and 
		not exists (select * from access where perID = ip_requester and bankID = ip_checking_bankID and accountID = ip_checking_accountID) then
		leave sp_main;
	end if;
    -- in the example, they did not set amount and dtOverdraft to null
    update checking set protectionBank = null, protectionAccount = null where bankID = ip_checking_bankID and accountID = ip_checking_accountID;
end //
delimiter ;
-- call stop_overdraft("owalter6", "BA_West", "checking_A"); 

-- [14] account_deposit()
-- If the person making the deposit does not have access to the account then don't change the database state
-- Otherwise, the account balance and related info must be modified appropriately
drop procedure if exists account_deposit;
delimiter //
create procedure account_deposit (in ip_requester varchar(100), in ip_deposit_amount integer,
	in ip_bankID varchar(100), in ip_accountID varchar(100), in ip_dtAction date)
sp_main: begin
	-- Implement your code here	
    if ip_deposit_amount<0 then
		leave sp_main;
    end if;    
    if not exists(select * from access where ip_requester=perID and ip_accountID=accountID and ip_bankID=bankID) then
		leave sp_main;
    else
		update bank_account set balance = ifnull(balance, 0)+ip_deposit_amount where ip_accountID=accountID and ip_bankID=bankID;
        update access set dtAction=ip_dtAction where ip_requester=perID and ip_accountID=accountID and ip_bankID=bankID;
    end if;
end //
delimiter ;
-- testcase
-- call account_deposit("msmith", 500, "BA_West", "checking_A", "2022-02-02");
-- call account_deposit("owalter6", 500, "BA_West", "checking_A", "2022-02-02");

-- [15] account_withdrawal()
-- If the person making the withdrawal does not have access to the account then don't change the database state
-- If the withdrawal amount is more than the account balance for a savings or market account then don't change the database state [the account balance must be positive]
-- If the withdrawal amount is more than the account balance + the overdraft balance (i.e., from the designated savings account) for a checking account then don't change the database state [the account balance must be positive]
-- Otherwise, the account balance and related info must be modified appropriately (amount deducted from the primary account first, and second from the overdraft account as needed)
drop procedure if exists account_withdrawal;
delimiter //
create procedure account_withdrawal (in ip_requester varchar(100), in ip_withdrawal_amount integer,
	in ip_bankID varchar(100), in ip_accountID varchar(100), in ip_dtAction date)
sp_main: begin
	-- Implement your code here
    declare checking_balance int default 0;
    declare total_balance int default 0;
    declare overdraft_amount int default 0;
    if ip_withdrawal_amount<0 then
		leave sp_main;
    end if;
    if not exists(select * from access where ip_requester=perID and ip_accountID=accountID and ip_bankID=bankID)then
		leave sp_main;
    else
		-- is a checking account
		if exists(select * from checking where ip_accountID=accountID and ip_bankID=bankID) then
			select ifnull(b1.balance,0)+ifnull(b2.balance,0) into total_balance from checking as c 
            join bank_account as b1 on c.bankID=b1.bankID and c.accountID =b1.accountID 
            left join bank_account as b2 on c.protectionBank=b2.bankID and c.protectionAccount =b2.accountID 
            where ip_accountID=c.accountID and ip_bankID=c.bankID;
            -- withdrawal_amount is more than total balance
			if ip_withdrawal_amount> (select total_balance) then
				leave sp_main;
			else
				select ifnull(balance, 0) into checking_balance from bank_account where ip_accountID=accountID and ip_bankID=bankID;
                -- update information on two accounts
				if ip_withdrawal_amount> (select checking_balance) then
                    set overdraft_amount=ip_withdrawal_amount-(select checking_balance);
                    update bank_account set balance=0 where ip_accountID=accountID and ip_bankID=bankID;
                    update bank_account set balance=balance - (select overdraft_amount) where (accountID,bankID) in(select protectionAccount, protectionBank from checking where ip_accountID=accountID and ip_bankID=bankID);
                    update checking set amount=overdraft_amount where ip_accountID=accountID and ip_bankID=bankID;
                    update checking set dtOverdraft=ip_dtAction where ip_accountID=accountID and ip_bankID=bankID;
                    update access set dtAction=ip_dtAction where perID=ip_requester and ip_accountID=accountID and ip_bankID=bankID;
                    update access set dtAction=ip_dtAction where perID=ip_requester and (accountID,bankID) in(select protectionAccount, protectionBank from checking where ip_accountID=accountID and ip_bankID=bankID);
                else
					update bank_account set balance=balance-ip_withdrawal_amount where ip_accountID=accountID and ip_bankID=bankID;
                    update access set dtAction=ip_dtAction where perID=ip_requester and ip_accountID=accountID and ip_bankID=bankID;
                end if;
			end if;
        else 
			-- is a saving or market account
			if ip_withdrawal_amount> (select ifnull(balance, 0) from bank_account where ip_accountID=accountID and ip_bankID=bankID) then
				leave sp_main;
			else
				update bank_account set balance=balance-ip_withdrawal_amount where ip_accountID=accountID and ip_bankID=bankID;
                update access set dtAction=ip_dtAction where ip_requester=perID and ip_accountID=accountID and ip_bankID=bankID;
                if exists(select * from market where ip_accountID=accountID and ip_bankID=bankID) then
					update market set numWithdrawals=ifnull(numWithdrawals,0)+1 where ip_accountID=accountID and ip_bankID=bankID;
                end if;
			end if;
		end if;
    end if;
end //
delimiter ;
-- testcase
-- 2-1 call account_withdrawal("rsanchez", 20000000, "NASA_KSC","company_checking", "2022-02-02");
-- 2-2 call account_withdrawal("rsanchez", 160000, "NASA_KSC","company_checking", "2022-02-02");
-- 2-3 call account_withdrawal("rsanchez", 140000, "NASA_KSC","company_checking", "2022-02-02");
-- 3-1 call account_withdrawal("rsanchez", 2000000, "NASA_Goddard","company_savings", "2022-02-02");
-- 3-2 call account_withdrawal("rsanchez", 200, "NASA_Goddard","company_savings", "2022-02-02");
-- call account_withdrawal("owalter6", 1500, "BA_West", "checking_A", "2022-02-02");

-- [16] account_transfer()
-- If the person making the transfer does not have access to both accounts then don't change the database state
-- If the withdrawal amount is more than the account balance for a savings or market account then don't change the database state [the account balance must be positive]
-- If the withdrawal amount is more than the account balance + the overdraft balance (i.e., from the designated savings account) for a checking account then don't change the database state [the account balance must be positive]
-- Otherwise, the account balance and related info must be modified appropriately (amount deducted from the withdrawal account first, and second from the overdraft account as needed, and then added to the deposit account)
drop procedure if exists account_transfer;
delimiter //
create procedure account_transfer (in ip_requester varchar(100), in ip_transfer_amount integer,
	in ip_from_bankID varchar(100), in ip_from_accountID varchar(100),
    in ip_to_bankID varchar(100), in ip_to_accountID varchar(100), in ip_dtAction date)
sp_main: begin
	-- Implement your code here
    declare checking_balance int default 0;
    declare total_balance int default 0;
    declare overdraft_amount int default 0;
    if ip_transfer_amount<0 then 
		leave sp_main;
	end if;
    -- Doesn't have the access right
    if not exists(select * from access where perID=ip_requester and ip_from_accountID=accountID and ip_from_bankID=bankID) or not exists(select * from access where perID=ip_requester and ip_to_accountID=accountID and ip_to_bankID=bankID)then
		leave sp_main;
	else
		if exists(select * from checking where ip_from_accountID=accountID and ip_from_bankID=bankID) then
        -- is a checking account
			select ifnull(b1.balance,0)+ifnull(b2.balance,0) into total_balance from checking as c 
            join bank_account as b1 on c.bankID=b1.bankID and c.accountID =b1.accountID 
            left join bank_account as b2 on c.protectionBank=b2.bankID and c.protectionAccount =b2.accountID 
            where ip_from_accountID=c.accountID and ip_from_bankID=c.bankID;
            -- withdrawal_amount is more than total balance
			if ip_transfer_amount> (select total_balance) then
				leave sp_main;
			else
				select ifnull(balance, 0) into checking_balance from bank_account where ip_from_accountID=accountID and ip_from_bankID=bankID;
				if ip_transfer_amount> (select checking_balance) then
                -- update information on two accounts
                    set overdraft_amount=ip_transfer_amount-(select checking_balance);
                    update bank_account set balance=ifnull(balance, 0)+ip_transfer_amount where ip_to_accountID=accountID and ip_to_bankID=bankID;
                    update bank_account set balance=0 where ip_from_accountID=accountID and ip_from_bankID=bankID;
                    update bank_account set balance=balance - (select overdraft_amount) where (accountID,bankID) in(select protectionAccount, protectionBank from checking where ip_from_accountID=accountID and ip_from_bankID=bankID);
                    update checking set amount= overdraft_amount where ip_from_accountID=accountID and ip_from_bankID=bankID;
                    update checking set dtOverdraft=ip_dtAction where ip_accountID=accountID and ip_bankID=bankID;
                    update access set dtAction=ip_dtAction where perID=ip_requester and ip_from_accountID=accountID and ip_from_bankID=bankID;
                    update access set dtAction=ip_dtAction where perID=ip_requester and ip_to_accountID=accountID and ip_to_bankID=bankID;
                    update access set dtAction=ip_dtAction where perID=ip_requester and (accountID,bankID) in(select protectionAccount, protectionBank from checking where ip_from_accountID=accountID and ip_from_bankID=bankID);
                else
					update bank_account set balance=ifnull(balance, 0)+ip_transfer_amount where ip_to_accountID=accountID and ip_to_bankID=bankID;
					update bank_account set balance=balance-ip_transfer_amount where ip_from_accountID=accountID and ip_from_bankID=bankID;
                    update access set dtAction=ip_dtAction where perID=ip_requester and ip_from_accountID=accountID and ip_from_bankID=bankID;
                    update access set dtAction=ip_dtAction where perID=ip_requester and ip_to_accountID=accountID and ip_to_bankID=bankID;
                end if;
			end if;
        else 
			-- is a saving or market account
			if ip_transfer_amount> (select ifnull(balance, 0) from bank_account where ip_from_accountID=accountID and ip_from_bankID=bankID) then
				leave sp_main;
			else
                update bank_account set balance=ifnull(balance, 0)+ip_transfer_amount where ip_to_accountID=accountID and ip_to_bankID=bankID;
				update bank_account set balance=balance-ip_transfer_amount where ip_from_accountID=accountID and ip_from_bankID=bankID;
                update access set dtAction=ip_dtAction where perID=ip_requester and ip_from_accountID=accountID and ip_from_bankID=bankID;
				update access set dtAction=ip_dtAction where perID=ip_requester and ip_to_accountID=accountID and ip_to_bankID=bankID;
			end if;
		end if;
    end if;
end //
delimiter ;
-- testcase
-- 1 call account_transfer('msmith', 2000, 'WF_2', 'checking_A', 'WF_2','savings_A', '2022-02-02');
-- 2-1 call account_transfer('arwhite6', 5000, 'WF_2', 'checking_A', 'WF_2','savings_A', '2022-02-02');
-- 2-2 call account_transfer('rsanchez', 160000, 'NASA_KSC', 'company_checking', 'NASA_Goddard','company_checking', '2022-02-02');
-- 2-3 call account_transfer('arwhite6', 2000, 'WF_2', 'checking_A', 'WF_2','savings_A', '2022-02-02');
-- 3-1 call account_transfer('kjennings66', 20000, 'BA_South', 'GT_savings', 'BA_South','GT_investments', '2022-02-02');
-- 3-2 call account_transfer('kjennings66', 2000, 'BA_South', 'GT_savings', 'BA_South','GT_investments', '2022-02-02');

-- [17] pay_employees()
-- Increase each employee's pay earned so far by the monthly salary
-- Deduct the employee's pay from the banks reserved assets
-- If an employee works at more than one bank, then deduct the (evenly divided) monthly pay from each of the affected bank's reserved assets
-- Truncate any fractional results to an integer before further calculations
drop procedure if exists pay_employees;
delimiter //
create procedure pay_employees ()
begin
    -- Implement your code here
    update employee 
	inner join employee as e on employee.perID = e.perID
	set employee.payments = IFNULL(employee.payments, 0) + 1, employee.earned = IFNULL(e.salary, 0) + employee.earned;
    
	update bank 
	inner join 
	(select b.bankID as bankID, IFNULL(b.resAssets, 0) - sum(Per.even) as resAssets
	from workFor as w
	join (select w.perID as perID, truncate(e.salary/count(*), 0) as even
	from workFor as w, employee as e 
	where w.perID = e.perID
	group by w.perID) Per
	on w.perID = Per.perID
	left join bank as b on b.bankID = w.bankID
	group by w.bankID) as deduct
    on bank.bankID = deduct.bankID
	set bank.resAssets = deduct.resAssets;

end //
delimiter ;

-- [18] penalize_accounts()
-- For each savings account that is below the minimum balance, deduct the smaller of $100 or 10% of the current balance from the account
-- For each market account that has exceeded the maximum number of withdrawals, deduct the smaller of $500 per excess withdrawal or 20% of the current balance from the account
-- Add all deducted amounts to the reserved assets of the bank that owns the account
-- Truncate any fractional results to an integer before further calculations
drop procedure if exists penalize_accounts;
delimiter //
create procedure penalize_accounts ()
begin
	-- Implement your code here
    update bank set resAssets = 0 where resAssets is null;
    
    create or replace view bank_account_savings as
    select bank_account.bankID, bank_account.accountID, balance, minBalance 
    from bank_account, savings 
    where bank_account.bankID = savings.bankID and bank_account.accountID = savings.accountID and balance < minBalance;
	
    
    create or replace view penalize_savings as select bank.bankID, resAssets, balance, case when 100 < balance * 0.1 then 100 
				else truncate(balance * 0.1, 0) 
				end as saving_penalty
	from bank, bank_account_savings
    where bank.bankID = bank_account_savings.bankID;

	create or replace view bank_account_market as
    select bank_account.bankID, bank_account.accountID, balance, numWithdrawals, maxWithdrawals 
    from bank_account, market 
    where bank_account.bankID = market.bankID and bank_account.accountID = market.accountID and numWithdrawals - maxWithdrawals > 0;
	
    
	create or replace view penalize_market as select bank.bankID, resAssets, balance, case when 500 * (numWithdrawals - maxWithdrawals) < balance * 0.2 then 500 * (numWithdrawals - maxWithdrawals)
				else truncate(balance * 0.2, 0)
				end as market_penalty
	from bank, bank_account_market
	where bank.bankID = bank_account_market.bankID;

	update penalize_savings set resAssets = resAssets + saving_penalty;
	update penalize_market set resAssets = resAssets + market_penalty;
    
    update penalize_savings set balance = balance - saving_penalty;
    update penalize_market set balance = balance - market_penalty;
    
end //
delimiter ;

-- TEST:
-- call penalize_accounts();
-- select * from bank_account;

-- [19] accrue_interest()
-- For each interest-bearing account that is "in good standing", increase the balance based on the designated interest rate
-- A savings account is "in good standing" if the current balance is equal to or above the designated minimum balance
-- A market account is "in good standing" if the current number of withdrawals is less than or equal to the maximum number of allowed withdrawals
-- Subtract all paid amounts from the reserved assets of the bank that owns the account                                                                       
-- Truncate any fractional results to an integer before further calculations
drop procedure if exists accrue_interest;
delimiter //
create procedure accrue_interest ()
begin
	-- Implement your code here
    -- update bank set resAssets = 0 where resAssets is null;
    
    create or replace view interest_bearing_bank_account as
	select interest_bearing.bankID, interest_bearing.accountID, interest_rate, balance from interest_bearing, bank_account
	where interest_bearing.bankID = bank_account.bankID and interest_bearing.accountID = bank_account.accountID;
    
    create or replace view savings_interest as
    select savings.bankID, savings.accountID, balance, truncate(balance * interest_rate / 100, 0) as interest
	from savings, interest_bearing_bank_account
	where savings.bankID = interest_bearing_bank_account.bankID and savings.accountID = interest_bearing_bank_account.accountID and balance >= minBalance;
    
    create or replace view bank_savings as
    select bank.bankID, resAssets, interest from bank, savings_interest where bank.bankID = savings_interest.bankID;
    
    create or replace view market_interest as 
    select market.bankID, market.accountID, balance, truncate(balance * interest_rate / 100, 0) as interest
	from market, interest_bearing_bank_account
	where interest_bearing_bank_account.bankID = market.bankID and interest_bearing_bank_account.accountID = market.accountID and (numWithdrawals <= maxWithdrawals or maxWithdrawals is null);

	create or replace view bank_market as
    select bank.bankID, resAssets, interest from bank, market_interest where bank.bankID = market_interest.bankID;

    update bank_savings set resAssets = resAssets - interest where resAssets - interest >= 0;
    update bank_market set resAssets = resAssets - interest where resAssets - interest >= 0;
    
    update savings_interest set balance = balance + interest;
    update market_interest set balance = balance + interest;
    
    
end //
delimiter ;
-- call accrue_interest();
-- select * from bank;
-- select * from bank_account;

-- [20] display_account_stats()
-- Display the simple and derived attributes for each account, along with the owning bank
create or replace view display_account_stats(name_of_bank, account_identifier, account_assets, number_of_owners) as
	select bank.bankName, bank_account.accountID, bank_account.balance, owners from bank, bank_account, (select bankID, accountID, count(perID) as owners from access group by bankID, accountID) as access
	where bank.bankID = bank_account.bankID and access.bankID = bank_account.bankID and access.accountID = bank_account.accountID;

-- select * from display_account_stats;
	-- Uncomment above line and implement your code here

-- [21] display_bank_stats()
-- Display the simple and derived attributes for each bank, along with the owning corporation
create or replace view display_bank_stats as
    select bank.bankID as bank_identifier, shortName as name_of_corporation, bankName as name_of_bank, street, city, state, zip, number_of_accounts, bank.resAssets as bank_assets, coalesce(bank.resAssets, 0) + coalesce(accountAssets, 0) as total_assets from bank
    left join
    (select * from corporation) as corp
    on bank.corpID = corp.corpID
    left join
    (select bankID, count(*) as number_of_accounts, sum(balance) as accountAssets from bank_account group by bankID) as bankAccount
    on bank.bankID = bankAccount.bankID;
    
-- select * from display_bank_stats;

-- [22] display_corporation_stats()
-- Display the simple and derived attributes for each corporation
create or replace view display_corporation_stats as
	
	select corporation.corpID as corporation_identifier, shortName as short_name, longName as formal_name, number_of_banks, corporation.resAssets as corporation_assets, corporation.resAssets + coalesce(bankAssets,0) + coalesce(bankAccountAssets,0) as total_assets from corporation
	left join
 	(select corpID, count(*) as number_of_banks, sum(resAssets) as bankAssets from bank group by corpID) as corp_bank
 	on corporation.corpID = corp_bank.corpID
	left join
 	(select bank.bankID, corpID, resAssets, sum(balance) as bankAccountAssets from bank, bank_account where bank.bankID = bank_account.bankID group by corpID) as bank_bankAccount
 	on corporation.corpID = bank_bankAccount.corpID;

-- select * from display_corporation_stats;

-- [23] display_customer_stats()
-- Display the simple and derived attributes for each customer
create or replace view display_customer_stats(person_identifier, tax_identifier, customer_name, date_of_birth, joined_system, street, city, state, zip, number_of_accounts, customer_assets) as
	select distinct c.perID, b.taxID, concat(b.firstName," ", b.lastName), b.birthdate, b.dtjoined, b.street, b.city, b.state, b.zip, assets.number_of_accounts, ifnull(assets.customer_assets, 0) as customer_assets
	from customer as c join bank_user as b on c.perID=b.perID 
	left join(select perID, count(*) as number_of_accounts, sum(balance) as customer_assets from access as a join bank_account as b on b.accountID=a.accountID and b.bankID=a.bankID group by perID) as assets on assets.perID= c.perID
	order by c.perID;
    -- Uncomment above line and implement your code here
-- testcase
-- select * from display_customer_stats;

-- [24] display_employee_stats()
-- Display the simple and derived attributes for each employee
-- create or replace view display_employee_stats as
    -- Uncomment above line and implement your code here
create or replace view display_employee_stats(person_identifier, tax_identifier, employee_name, date_of_birth, joined_system, street, city, state, zip, number_of_banks, bank_assets) as
	select e.perID, b.taxID, concat(b.firstName," ", b.lastName), b.birthdate, b.dtjoined, b.street, b.city, b.state, b.zip, num.number_of_banks, total_assets.total
	from employee as e 
	join bank_user as b
	on e.perID = b.perID 
	left join
	(select perID, count(*) as number_of_banks from workFor group by perID) 
	as num on num.perID = e.perID
	left join
	(select perID, sum(b.assets) as total from workFor 
	left join 
	(select bank.bankID as bankID, IFNULL(a.a_assets, 0) + IFNULL(resAssets, 0) as assets from bank
	left join
	(select bankID, sum(balance) as a_assets
	from bank_account
	group by bankID) as a
	on bank.bankID = a.bankID) as b
	on workFor.bankID = b.bankID
	group by perID) as total_assets
	on total_assets.perID = e.perID;
    
