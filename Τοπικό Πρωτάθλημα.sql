CREATE TABLE `Team` (
	AFM INT NOT NULL,
	Name varchar(50) NOT NULL UNIQUE,
	Division varchar(2) NOT NULL,
	League INT NOT NULL,
	Founded varchar(20) NOT NULL,
	Location varchar(50) NOT NULL,
	Owner varchar(50) NOT NULL,
	Colors varchar(50) NOT NULL,
	President varchar(50) NOT NULL,
	PRIMARY KEY (AFM)
);

CREATE TABLE `Basketball_Kits` (
	Team_AFM INT NOT NULL,
	Team_Kit varchar(50) NOT NULL,
	image varchar(255)  NULL,
	PRIMARY KEY (Team_AFM,Team_Kit)
);

CREATE TABLE `Standings` (
	Year YEAR NOT NULL,
    Devision VARCHAR(10) NOT NULL,
	Team varchar(50) NOT NULL,
	Position INT NOT NULL,
	Points INT NOT NULL,
	Total_Matches INT NOT NULL,
	Losses INT NOT NULL,
	Wins INT NOT NULL,
	Away_Wins INT NOT NULL,
	Home_Wins INT NOT NULL,
	Points_Difference VARCHAR(255) NOT NULL,
	PRIMARY KEY (Year,Team)
);

CREATE TABLE `Stadium` (
	Stadium_ID INT NOT NULL,
	manufacturing_date varchar(20) NOT NULL,
	surface VARCHAR(255) NOT NULL,
	Owner VARCHAR(255) NOT NULL,
	Address VARCHAR(255) NOT NULL,
	Location VARCHAR(255) NOT NULL,
	Name VARCHAR(255) NOT NULL UNIQUE,
	Capacity INT NOT NULL,
	PRIMARY KEY (Stadium_ID)
);

CREATE TABLE `Matches` (
	Match_ID INT NOT NULL,
	Stadium varchar(255) NOT NULL,
	Date_Time varchar(20) NOT NULL,
	DNP VARCHAR(50),
	Match_Day INT NOT NULL,
	Score_Home_Team INT NOT NULL,
	Score_Away_Team INT NOT NULL,
	Home_Team VARCHAR(255) NOT NULL,
	Away_Team VARCHAR(255) NOT NULL,
	PRIMARY KEY (Match_ID)
);

CREATE TABLE `Match_Day` (
	Number INT NOT NULL,
	Year Varchar(20) NOT NULL,
	PRIMARY KEY (Number,Year)
);

CREATE TABLE `Referee` (
	Referee_ID INT NOT NULL,
	Career_starting_Date varchar(20) NOT NULL,
	Nationality VARCHAR(255) NOT NULL,
	Birth_Day varchar(20) NOT NULL,
	FirstName VARCHAR(255) NOT NULL,
	Surname VARCHAR(255) NOT NULL,
	PRIMARY KEY (Referee_ID)
);

CREATE TABLE `arbitrates` (
	Referee_ID INT NOT NULL,
	MatchNo INT NOT NULL,
	Position VARCHAR(255) NOT NULL,
	PRIMARY KEY (Referee_ID,MatchNo)
);

CREATE TABLE `Team_base_Stadium` (
	Stadium_ID INT NOT NULL,
	Team_in_this_Base varchar(255) NOT NULL,
	PRIMARY KEY (Stadium_ID,Team_in_this_Base)
);

CREATE TABLE `Coach_Career` (
	Coach_contract_ID varchar(50) NOT NULL,
	Coach_ID varchar(50) NOT NULL,
	Team varchar(50) NOT NULL,
	Total_earnings Varchar(20) NOT NULL,
	Contract_starting_Date varchar(20) NOT NULL,
	Contract_expire_Date varchar(20) NOT NULL,
	PRIMARY KEY (Coach_contract_ID,Coach_ID)
);


CREATE TABLE `Coach` (
	Coach_contract_ID varchar(50) NOT NULL,
	Birth_Date varchar(20) NOT NULL,
	Nationality VARCHAR(255) NOT NULL,
	Experience varchar(50) NOT NULL,
	FirstName varchar(50) NOT NULL,
	Surname varchar(50) NOT NULL,
	Coaching_team varchar(50) NOT NULL,
	PRIMARY KEY (Coach_contract_ID)
);

CREATE TABLE `Player_Career` (
	Player_contract_ID varchar(50) NOT NULL,
	Player_ID varchar(50) NOT NULL,
	Team varchar(50) NOT NULL,
	Player_position varchar(20) NOT NULL,
	Contract_starting_Date varchar(20) NOT NULL,
	Contract_expire_Date varchar(20) NOT NULL,
	Total_earnings VARCHAR (20) NOT NULL,
	PRIMARY KEY (Player_contract_ID,Player_ID)
);


CREATE TABLE `Player` (
	Player_ID varchar(50) NOT NULL,
	FirstName varchar(50) NOT NULL,
	Surname varchar(50) NOT NULL,
	Nationality VARCHAR(255) NOT NULL,
	Career_starting_Date varchar(20) NOT NULL,
	Salary varchar(20) NOT NULL,
	Hight FLOAT NOT NULL,
	WeightP FLOAT NOT NULL,
	Birth_Date varchar(20) NOT NULL,
	Image VARCHAR(255) NULL,
	PRIMARY KEY (Player_ID)
);

CREATE TABLE `Player_Statistics` (
	Year INT NOT NULL,
	Player_ID varchar(50) NOT NULL,
	PPG FLOAT NOT NULL,
	GAMESPLAYED INT NOT NULL,
	2PM_A varchar(20) NOT NULL,
	3PM_A varchar(20) NOT NULL,
	FTM_A varchar(20) NOT NULL,
	REBS INT NOT NULL,
	DREBS INT NOT NULL,
	OREBS INT NOT NULL,
	AST INT NOT NULL,
	BLK INT NOT NULL,
	STL INT NOT NULL,
	TO_PER_GAME FLOAT NOT NULL,
	MPG FLOAT NOT NULL,
	PRIMARY KEY (Year,Player_ID)
);


ALTER TABLE Basketball_Kits ADD CONSTRAINT Basketball_Kits_fk0 FOREIGN KEY (Team_AFM) REFERENCES Team(AFM);

ALTER TABLE Standings ADD CONSTRAINT Standings_fk0 FOREIGN KEY (Team) REFERENCES Team(Name);

ALTER TABLE Matches ADD CONSTRAINT Matches_fk0 FOREIGN KEY (Stadium) REFERENCES Stadium(Name);

ALTER TABLE Matches ADD CONSTRAINT Matches_fk1 FOREIGN KEY (Match_Day) REFERENCES Match_Day(Number);

ALTER TABLE Matches ADD CONSTRAINT Matches_fk2 FOREIGN KEY (Home_Team) REFERENCES Team(Name);

ALTER TABLE Matches ADD CONSTRAINT Matches_fk3 FOREIGN KEY (Away_Team) REFERENCES Team(Name);

ALTER TABLE arbitrates ADD CONSTRAINT arbitrates_fk0 FOREIGN KEY (Referee_ID) REFERENCES Referee(Referee_ID);

ALTER TABLE arbitrates ADD CONSTRAINT arbitrates_fk1 FOREIGN KEY (MatchNo) REFERENCES Matches(Match_ID);

ALTER TABLE Team_base_Stadium ADD CONSTRAINT Team_base_Stadium_fk0 FOREIGN KEY (Stadium_ID) REFERENCES Stadium(Stadium_ID);

ALTER TABLE Team_base_Stadium ADD CONSTRAINT Team_base_Stadium_fk1 FOREIGN KEY (Team_in_this_Base) REFERENCES Team(Name);

ALTER TABLE Coach_Career ADD CONSTRAINT Coach_Career_fk0 FOREIGN KEY (Coach_ID) REFERENCES Coach(Coach_contract_ID);

ALTER TABLE Coach ADD CONSTRAINT Coach_fk0 FOREIGN KEY (Coaching_team) REFERENCES Team(Name);

ALTER TABLE Player_Career ADD CONSTRAINT Player_Career_fk0 FOREIGN KEY (Player_ID) REFERENCES Player(Player_ID);

ALTER TABLE Player_Career ADD CONSTRAINT Player_Career_fk1 FOREIGN KEY (Team) REFERENCES team(Name);

ALTER TABLE Player_Statistics ADD CONSTRAINT Player_Statistics_fk0 FOREIGN KEY (Player_ID) REFERENCES Player(Player_ID);



insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('1', 'Rolph', 'Hellwing', 'France', '7-15-2017', '€2580,67', '1.87', '80.4', '5-5-1994','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('2', 'Farrell', 'Kernes', 'France', '10-12-2018', '€966,84', '1.91', '112.1', '12-26-1985','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('3', 'Charmain', 'Ogbourne', 'Poland', '7-7-2016', '€2050,60', '1.7', '78.2', '9-18-1990','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('4', 'Hermine', 'Robertshaw', 'Poland', '12-28-2019', '€3596,90', '1.85', '128.6', '2-15-1998','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('5', 'Currie', 'Taplin', 'Germany', '8-15-2020', '€2692,21', '1.65', '99.5', '5-3-2000','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('6', 'Harriott', 'Havercroft', 'Greece', '4-22-2018', '€1695,83', '1.8', '92.6', '5-2-1991','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('7', 'Minerva', 'Larmett', 'United States', '5-21-2018', '€2564,49', '1.82', '111.9', '12-31-1992','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('8', 'Marcello', 'Tie', 'United States', '10-16-2017', '€4138,69', '1.90', '124.0', '8-19-1987','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('9', 'Angie', 'Saxelby', 'France', '10-30-2016', '€3692,09', '1.79', '103.8', '2-5-1992','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('10', 'Shaylynn', 'Exter', 'Poland', '6-13-2019', '€3700,61', '1.79', '118.0', '11-11-1986','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('11', 'Vivi', 'Shucksmith', 'France', '5-20-2019', '€3145,55', '1.74', '99.9', '5-14-1997','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('12', 'Evelin', 'Antunes', 'Spain', '10-13-2020', '€1178,68', '1.77', '99.8', '3-17-1998','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('13', 'Dario', 'Manuele', 'Poland', '1-26-2016', '€2789,03', '1.83', '116.9', '2-24-1987','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('14', 'Chandra', 'Bubbins', 'Poland', '10-3-2019', '€4295,81', '1.77', '123.6', '7-13-1992','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('15', 'Allayne', 'Burnside', 'United States', '9-9-2015', '€1132,92', '2.0', '126.2', '1-18-1995','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('16', 'Marieann', 'Starcks', 'Poland', '6-26-2017', '€4947,84', '1.93', '75.1', '12-21-1984','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('17', 'Binny', 'Marchbank', 'United States', '3-13-2020', '€4600,68', '1.76', '118.7', '11-13-1992','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('18', 'Kipp', 'Gellion', 'United States', '9-5-2020', '€1720,45', '1.83', '129.9', '12-21-1994','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('19', 'Dianna', 'Rugieri', 'France', '6-27-2019', '€4881,46', '1.69', '95.8', '11-12-2000','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('20', 'Mersey', 'Emeney', 'France', '7-20-2020', '€867,59', '1.95', '92.8', '3-4-2001','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('21', 'Sella', 'Soff', 'Greece', '7-22-2016', '€1760,34', '1.77', '106.7', '7-28-1988','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('22', 'Nerte', 'Snary', 'Greece', '7-12-2017', '€4566,26', '1.82', '86.5', '11-30-1998','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('23', 'Brietta', 'Marrow', 'France', '7-10-2017', '€3027,96', '1.67', '117.6', '3-2-1999','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('24', 'Hoyt', 'Cancelier', 'Greece', '12-7-2016', '€3121,34', '1.94', '112.0', '5-28-1999','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('25', 'Iormina', 'Wakefield', 'France', '1-26-2017', '€4288,52', '1.75', '88.5', '11-27-1994','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('26', 'West', 'Mewton', 'France', '12-6-2020', '€2877,22', '1.68', '89.9', '1-15-2001','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('27', 'Calla', 'Rapsey', 'Poland', '8-26-2016', '€4704,71', '1.63', '94.0', '4-4-1989','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('28', 'Clemente', 'Dawby', 'Poland', '1-26-2020', '€2549,61', '1.82', '120.3', '3-2-1984','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('29', 'Eugenius', 'Skyrme', 'United States', '6-13-2020', '€4695,75', '1.74', '127.0', '7-31-2000','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('30', 'Kelsey', 'McGuff', 'Poland', '3-31-2017', '€3438,00', '1.96', '98.4', '3-24-1996','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('31', 'Carine', 'Summerson', 'Poland', '10-8-2019', '€3790,13', '1.82', '106.1', '9-16-1990','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('32', 'Robb', 'Stitcher', 'Germany', '1-24-2019', '€2097,56', '1.95', '104.1', '9-27-1996','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('33', 'Deeyn', 'Timbs', 'France', '10-15-2018', '€2485,13', '1.70', '122.1', '9-6-1986','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('34', 'Trent', 'Ferrarin', 'France', '9-13-2016', '€4243,77', '1.90', '98.1', '2-7-1989','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('35', 'Adamo', 'O''Duilleain', 'France', '7-17-2019', '€3643,32', '1.63', '137.5', '6-29-2002','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('36', 'Octavius', 'Scougal', 'Greece', '7-13-2019', '€2413,10', '1.70', '127.5', '9-28-1999','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('37', 'Mathias', 'Le Clercq', 'United States', '4-15-2019', '€3423,49', '1.90', '130.5', '11-17-1985','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('38', 'Cristin', 'Fyldes', 'Greece', '11-23-2017', '€4347,78', '1.81', '117.3', '7-5-1997', '/img/pl3.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('39', 'Cloe', 'Cripin', 'France', '7-14-2018', '€2202,69', '1.92', '105.6', '7-2-1995','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('40', 'Simon', 'Lismer', 'United States', '12-13-2020', '€2754,58', '1.88', '105.5', '5-25-1995','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('41', 'Laura', 'Dutnall', 'United States', '6-25-2016', '€4857,53', '1.85', '94.3', '9-23-1983','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('42', 'Nissie', 'Filer', 'United States', '4-12-2019', '€750,03', '1.95', '76.0', '7-1-1991','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('43', 'Olive', 'Holbie', 'United States', '1-27-2017', '€2063,11', '1.68', '78.1', '12-29-1991','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('44', 'Krispin', 'Aizikovitz', 'France', '9-27-2018', '€4759,62', '1.97', '119.4', '10-10-1988','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('45', 'Farlay', 'Edson', 'Germany', '10-23-2019', '€2321,80', '1.92', '110.5', '2-2-1993','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('46', 'Lambert', 'O''Fihillie', 'France', '2-24-2017', '€2118,13', '1.97', '83.0', '7-4-1993','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('47', 'Laural', 'Boutell', 'France', '5-21-2019', '€1553,44', '1.78', '83.8', '3-29-1986','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('48', 'Linzy', 'Stalf', 'France', '10-26-2016', '€1434,77', '1.82', '117.2', '10-6-1990','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('49', 'Blake', 'Yakovich', 'United Kingdom', '4-6-2019', '€1566,54', '1.92', '114.1', '9-14-1995','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('50', 'Wanids', 'Wetherburn', 'Greece', '11-2-2018', '€1783,56', '1.78', '88.8', '8-27-1997','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('51', 'Noah', 'Yude', 'France', '6-18-2017', '€1118,92', '1.99', '79.6', '12-24-1987','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('52', 'Heindrick', 'Yarrington', 'France', '11-12-2018', '€1622,23', '1.87', '114.3', '8-14-1991','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('53', 'Barnabe', 'Coushe', 'France', '10-20-2016', '€2827,35', '1.75', '132.2', '12-29-1986','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('54', 'Moyna', 'Scutcheon', 'France', '10-7-2016', '€2879,30', '1.67', '131.9', '4-4-1996','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('55', 'Scot', 'Bocking', 'United States', '10-25-2016', '€1413,09', '1.74', '83.6', '6-19-2001','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('56', 'Allan', 'Donlon', 'Poland', '2-22-2018', '€3658,27', '1.63', '125.4', '5-17-1992','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('57', 'Kikelia', 'Dodge', 'France', '7-15-2016', '€3317,63', '1.88', '78.7', '4-2-1991','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('58', 'Taryn', 'Coales', 'France', '12-7-2017', '€897,90', '1.91', '106.8', '4-27-1983','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('59', 'Sada', 'Wickenden', 'France', '5-30-2018', '€2379,87', '1.97', '125.8', '9-3-1983','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('60', 'Nicolea', 'Ginnelly', 'Lithuania', '2-24-2020', '€2964,09', '1.94', '120.2', '10-26-1996','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('61', 'Joseito', 'Artharg', 'United States', '4-12-2019', '€1975,05', '1.75', '125.9', '3-16-1999','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('62', 'Alexandre', 'Girault', 'Poland', '4-23-2018', '€1418,54', '1.74', '134.0', '11-18-1990','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('63', 'Lovell', 'Sheehan', 'Greece', '4-21-2019', '€1906,34', '2.02', '132.5', '3-27-1993','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('64', 'Rachelle', 'Prestidge', 'France', '12-7-2017', '€3122,56', '1.96', '104.0', '4-7-1985','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('65', 'Suzanne', 'Wattam', 'Poland', '11-2-2015', '€2649,19', '2.12', '125.1', '6-30-1997','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('66', 'Noella', 'Allonby', 'France', '6-27-2019', '€3790,76', '1.94', '114.1', '10-11-1992','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('67', 'Lauree', 'Crutchfield', 'Greece', '2-12-2019', '€2016,51', '1.92', '102.8', '5-27-1986','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('68', 'Toinette', 'McIleen', 'Poland', '7-30-2016', '€4194,85', '1.99', '104.7', '12-25-1993', '/img/pl1.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('69', 'Obidiah', 'Doddridge', 'France', '6-16-2020', '€951,40', '1.68', '79.0', '10-29-1990','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('70', 'Cam', 'Aymer', 'Germany', '11-18-2015', '€4516,29', '2.12', '121.9', '11-20-1994','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('71', 'Rhianna', 'Ferre', 'United States', '6-2-2018', '€953,29', '1.85', '88.4', '4-14-1998','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('72', 'Perle', 'Stoeckle', 'Poland', '10-4-2019', '€4887,30', '1.71', '81.4', '1-24-1997','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('73', 'Frazier', 'Brendel', 'Poland', '11-18-2015', '€1304,23', '1.89', '126.6', '3-20-1987','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('74', 'Moyra', 'Landal', 'United States', '8-20-2018', '€3914,74', '1.95', '119.4', '1-11-2002','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('75', 'Ettore', 'Evequot', 'Poland', '1-20-2016', '€4468,30', '1.93', '92.8', '8-31-1986','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('76', 'Megan', 'Batterton', 'France', '5-13-2020', '€2848,80', '1.84', '108.0', '6-5-1983','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('77', 'Perl', 'Pitrollo', 'Poland', '12-21-2017', '€2497,38', '1.91', '104.3', '2-3-1997','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('78', 'Zebedee', 'Cardenas', 'France', '8-20-2020', '€575,14', '1.71', '78.7', '5-14-1983','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('79', 'Delaney', 'Orford', 'Italy', '7-14-2019', '€2226,71', '1.92', '97.7', '7-19-1995','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('80', 'Cheryl', 'See', 'France', '9-10-2017', '€1210,20', '1.99', '92.2', '11-27-1995','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('81', 'Geralda', 'Knevet', 'Poland', '11-15-2019', '€2238,07', '1.75', '76.1', '2-25-1997','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('82', 'Luz', 'Lobbe', 'France', '1-16-2018', '€1563,98', '1.93', '100.3', '8-19-1990','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('83', 'Loy', 'Lodwick', 'Poland', '5-20-2019', '€3844,56', '1.88', '87.8', '10-1-1988','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('84', 'Markos', 'Foux', 'France', '5-12-2016', '€723,78', '1.91', '100.7', '11-27-1986','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('85', 'Hyacinth', 'Illing', 'Poland', '10-13-2018', '€3032,13', '1.97', '95.7', '10-25-2002','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('86', 'Fanny', 'Aylen', 'Greece', '8-31-2020', '€2248,26', '1.96', '93.5', '5-5-2001','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('87', 'Neill', 'Broadfield', 'Poland', '8-25-2020', '€2489,31', '1.85', '91.5', '2-7-1997','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('88', 'Tibold', 'Cohan', 'Greece', '11-1-2020', '€2055,48', '1.91', '90.8', '3-26-1989','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('89', 'Sophronia', 'McNeilley', 'Germany', '8-4-2019', '€3412,62', '1.89', '85.6', '6-1-1993','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('90', 'Ward', 'Torre', 'Lithuania', '1-19-2016', '€890,58', '1.96', '105.5', '8-25-1989','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('91', 'Adina', 'Streater', 'United States', '2-17-2018', '€2408,67', '1.83', '94.2', '1-11-1999','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('92', 'Evie', 'Stannard', 'Poland', '2-3-2018', '€762,02', '1.92', '108.6', '6-1-1997','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('93', 'Karlis', 'Lambard', 'United States', '7-15-2019', '€1926,62', '1.91', '93.1', '9-22-1983','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('94', 'Rachelle', 'Rabl', 'Poland', '7-23-2020', '€3810,04', '2.02', '101.2', '10-27-1988','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('95', 'Lezley', 'Dicey', 'France', '2-13-2016', '€1858,56', '1.87', '95.4', '1-17-1998','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('96', 'Ashlan', 'Cruikshank', 'France', '1-10-2016', '€2544,46', '2.15', '112.3', '5-15-1983','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('97', 'Darren', 'McEachern', 'United States', '2-9-2019', '€4916,04', '1.91', '90.7', '6-9-1985','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('98', 'Kele', 'Smithies', 'Poland', '7-31-2019', '€4182,31', '1.84', '81.7', '5-26-1986','/img/pl2.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('99', 'Richard', 'Doerr', 'Greece', '4-10-2019', '€3122,28', '1.88', '75.1', '4-21-1999','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('100', 'Garrott', 'Alten', 'Poland', '2-21-2016', '€3152,44', '1.90', '98.4', '3-13-1988','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('101', 'Brandais', 'Blaik', 'United States', '10-30-2017', '€1098,04', '1.68', '73.9', '5-16-1983','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('102', 'Ladonna', 'Daldry', 'Greece', '2-28-2016', '€2532,88', '1.86', '85.3', '8-4-1995','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('103', 'Bartholomew', 'Bayfield', 'France', '5-10-2018', '€1400,79', '1.96', '95.0', '10-18-1988','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('104', 'Nollie', 'Devanney', 'United States', '3-5-2020', '€1089,03', '1.82', '98.5', '9-8-1992','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('105', 'Ciro', 'Aizik', 'United States', '3-9-2017', '€1552,86', '1.87', '87.5', '7-28-1990','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('106', 'Griz', 'Dunguy', 'United States', '9-20-2016', '€1132,86', '1.79', '75.9', '4-13-1985','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('107', 'Valli', 'Tattersill', 'France', '1-4-2020', '€668,08', '1.93', '107.2', '7-29-1996','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('108', 'Kelsey', 'Fauning', 'France', '7-7-2020', '€801,15', '1.86', '86.8', '11-7-1999','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('109', 'Tera', 'Wynn', 'France', '7-28-2018', '€3414,57', '1.90', '98.8', '4-27-1983','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('110', 'Darbie', 'Pontin', 'United States', '6-8-2016', '€2159,73', '1.97', '102.3', '1-13-1989','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('111', 'Georas', 'Wasbey', 'Poland', '7-27-2018', '€2824,13', '1.95', '103.2', '10-3-1985','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('112', 'Morten', 'Rawnsley', 'France', '2-21-2019', '€3958,87', '1.82', '91.0', '8-17-1986','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('113', 'Karita', 'Sanpere', 'Poland', '10-26-2020', '€957,49', '1.75', '73.1', '12-5-1992','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('114', 'Clarisse', 'Boutwell', 'France', '6-13-2018', '€2708,66', '1.92', '100.4', '7-3-1998','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('115', 'Klarrisa', 'Probart', 'United States', '4-4-2019', '€3971,15', '1.95', '105.8', '1-30-1987','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('116', 'Patric', 'Verma', 'United States', '6-19-2020', '€4132,39', '1.89', '100.7', '4-2-2000','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('117', 'Odie', 'Robbert', 'Spain', '3-6-2016', '€816,96', '1.97', '97.6', '2-21-1985','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('118', 'Philippe', 'Tharme', 'Poland', '11-2-2016', '€4973,81', '1.85', '94.4', '2-27-2002','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('119', 'Tildy', 'Dreinan', 'United States', '8-24-2019', '€4278,39', '1.84', '98.0', '2-2-1990','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('120', 'Forster', 'Sansome', 'Poland', '12-2-2017', '€1773,21', '1.98', '90.8', '11-12-1986','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('121', 'Margalit', 'Trenchard', 'United States', '4-14-2020', '€4826,48', '1.69', '75.1', '12-1-1996','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('122', 'Rae', 'Parcells', 'France', '6-9-2020', '€3099,87', '1.86', '87.6', '12-3-1992','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('123', 'Conant', 'Davydenko', 'United States', '2-11-2017', '€3423,08', '1.91', '92.2', '2-1-1985','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('124', 'Corenda', 'Hackworth', 'Poland', '6-15-2019', '€4958,00', '1.67', '75.0', '2-18-1986','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('125', 'Rab', 'Hattersley', 'France', '9-3-2019', '€1367,94', '1.89', '81.6', '5-12-1993','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('126', 'Amandy', 'Witard', 'France', '8-11-2017', '€3638,80', '1.74', '77.6', '5-15-1992','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('127', 'Belia', 'Draijer', 'United States', '7-5-2016', '€3617,86', '1.82', '89.3', '7-21-1993','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('128', 'Yehudit', 'Tchir', 'Poland', '7-13-2016', '€3851,86', '1.91', '90.7', '4-11-1994','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('129', 'Geraldine', 'Gerrels', 'United States', '5-6-2017', '€4135,29', '1.88', '77.1', '12-26-1997','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('130', 'Curry', 'Kolakowski', 'United States', '12-4-2018', '€4152,33', '1.89', '85.9', '2-19-1993','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('131', 'Desmond', 'Bertenshaw', 'France', '4-3-2020', '€1750,00', '1.94', '94.0', '8-5-1996','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('132', 'Monti', 'Brunelli', 'Poland', '11-19-2015', '€2672,21', '1.95', '87.6', '8-7-1998','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('133', 'Estel', 'Meas', 'Poland', '12-14-2015', '€3447,50', '1.71', '74.2', '5-24-1990','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('134', 'Anjanette', 'Stannett', 'United States', '5-11-2019', '€1100,26', '1.73', '71.9', '11-10-1996','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('135', 'Jacques', 'Tourle', 'France', '11-6-2015', '€3328,54', '1.88', '91.1', '6-24-1988','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('136', 'Pinchas', 'Jinkins', 'France', '5-20-2017', '€1616,58', '1.89', '78.9', '9-25-1985','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('137', 'Georas', 'Jost', 'Greece', '6-30-2016', '€1685,12', '1.76', '81.2', '5-16-1985','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('138', 'Rosemary', 'Lightning', 'Germany', '1-3-2020', '€4416,62', '1.97', '99.5', '9-5-1991','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('139', 'Rosie', 'Dowers', 'France', '9-10-2020', '€2252,46', '1.85', '82.3', '4-2-2000','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('140', 'Tallie', 'Rennison', 'United States', '8-10-2016', '€2391,05', '1.79', '80.4', '3-21-1986','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('141', 'Corry', 'Fido', 'France', '7-20-2020', '€1493,25', '1.92', '107.1', '12-29-2001','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('142', 'Terencio', 'Heddy', 'Greece', '10-28-2016', '€1654,19', '1.85', '81.5', '10-20-1997','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('143', 'Georgette', 'Shine', 'France', '6-5-2018', '€2807,59', '1.97', '85.9', '5-29-2001','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('144', 'Rodolfo', 'Jannings', 'United States', '9-13-2016', '€3476,69', '1.96', '100.4', '1-9-1983','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('145', 'Kalila', 'Tattersill', 'Poland', '3-6-2017', '€3667,67', '1.88', '86.9', '1-22-1986','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('146', 'Alasdair', 'Wastie', 'France', '11-29-2017', '€2183,22', '1.94', '98.6', '1-5-1983','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('147', 'Samara', 'Guesford', 'United States', '12-1-2017', '€4349,23', '1.87', '90.0', '12-27-1985','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('148', 'Gunilla', 'Eck', 'United Kingdom', '12-5-2015', '€1385,32', '1.93', '83.1', '3-25-1990','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('149', 'Wren', 'Winship', 'United States', '11-20-2019', '€782,56', '1.80', '87.2', '6-13-1987','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('150', 'Ermina', 'Cardwell', 'France', '7-6-2020', '€2153,88', '1.68', '70.5', '5-7-1995','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('151', 'Elyn', 'Tithecote', 'Poland', '7-2-2016', '€3239,62', '1.75', '76.7', '9-2-1987','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('152', 'Maritsa', 'Willock', 'United States', '9-21-2017', '€1384,42', '1.76', '76.6', '1-20-1992','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('153', 'Maggee', 'Warwick', 'France', '1-12-2019', '€4048,46', '1.84', '92.2', '4-1-1997','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('154', 'Rollo', 'Moller', 'France', '1-30-2020', '€1930,49', '1.88', '93.4', '11-5-1999','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('155', 'Juliann', 'McCorley', 'Spain', '10-13-2019', '€590,50', '1.90', '76.0', '5-10-1991','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('156', 'Ardath', 'Witts', 'United States', '5-31-2019', '€1615,14', '1.82', '83.8', '10-1-1998','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('157', 'Judas', 'Dobel', 'Greece', '10-26-2019', '€4680,76', '1.92', '115.0', '4-20-1984','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('158', 'Ula', 'Overnell', 'France', '12-20-2019', '€901,75', '1.94', '95.5', '4-30-1983','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('159', 'Nehemiah', 'Skea', 'France', '12-7-2016', '€3433,57', '1.86', '90.5', '12-29-2000','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('160', 'Marietta', 'O''Mullaney', 'Poland', '7-14-2018', '€3617,37', '1.96', '85.5', '11-18-1987','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('161', 'Ronalda', 'Vaskov', 'United States', '11-11-2020', '€2629,59', '1.87', '80.4', '11-20-1984','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('162', 'Dave', 'McKimm', 'Poland', '3-11-2018', '€4042,27', '1.96', '98.6', '8-16-2000','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('163', 'Billy', 'Skipton', 'France', '10-10-2020', '€1086,35', '1.70', '79.1', '5-6-1991','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('164', 'Daven', 'Pointin', 'Poland', '4-1-2017', '€2096,93', '1.81', '80.4', '7-14-1988','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('165', 'Waring', 'Pickworth', 'Poland', '10-22-2017', '€3178,48', '1.71', '73.2', '11-2-1987','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('166', 'Maxy', 'Ramirez', 'United States', '12-10-2020', '€1365,66', '1.85', '82.3', '3-9-1989','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('167', 'Trent', 'Burtonwood', 'Poland', '11-19-2017', '€3076,50', '1.73', '80.8', '3-23-1990','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('168', 'Edwin', 'Rainon', 'Greece', '2-11-2020', '€2880,82', '2.03', '114.8', '1-26-1986','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('169', 'Wilow', 'Elmes', 'Greece', '9-10-2017', '€777,41', '2.01', '104.3', '7-29-1995','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('170', 'Gerrilee', 'Brizland', 'Poland', '12-12-2018', '€3356,81', '1.88', '92.7', '4-18-2001','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('171', 'Dayle', 'Goldthorp', 'Poland', '9-6-2016', '€1046,87', '1.78', '74.9', '7-12-1991','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('172', 'Onofredo', 'Fawley', 'Poland', '7-7-2019', '€2427,40', '1.66', '65.8', '5-14-1997','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('173', 'Georgie', 'Werlock', 'Spain', '9-20-2020', '€1115,28', '1.63', '80.5', '6-1-2001','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('174', 'Sile', 'Carley', 'France', '11-13-2015', '€2974,85', '1.95', '86.9', '11-5-1987','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('175', 'Sascha', 'Ervine', 'France', '7-21-2018', '€4914,54', '1.98', '98.4', '11-25-1991','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('176', 'Sydel', 'Langstone', 'France', '8-14-2017', '€757,84', '2.09', '106.1', '11-7-1991','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('177', 'Lorna', 'Lamb-shine', 'Poland', '2-12-2018', '€4714,27', '1.94', '106.4', '3-24-1997','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('178', 'Friederike', 'Brumfitt', 'France', '3-10-2019', '€1268,01', '1.73', '84.8', '12-26-1982','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('179', 'Nixie', 'Girth', 'United Arab Emirates', '6-8-2017', '€708,38', '1.92', '99.2', '12-6-1999','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('180', 'Daveta', 'Sheehan', 'Germany', '1-10-2019', '€1489,56', '1.98', '100.6', '9-20-1984','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('181', 'Debee', 'Wastell', 'France', '4-28-2018', '€4508,48', '1.93', '89.9', '10-4-1983','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('182', 'Grenville', 'Spincke', 'Poland', '7-22-2018', '€1109,98', '1.76', '78.7', '1-19-1985','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('183', 'Aili', 'Norcop', 'Poland', '2-5-2016', '€4065,92', '2.08', '108.5', '8-28-1995','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('184', 'Deerdre', 'Petche', 'France', '12-26-2016', '€2325,98', '1.76', '79.2', '12-19-1988','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('185', 'Donnamarie', 'Meco', 'United States', '6-9-2019', '€4224,70', '1.85', '83.1', '1-19-1999','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('186', 'Peggi', 'Bradnum', 'Greece', '6-21-2020', '€1462,62', '2.16', '113.7', '11-25-1997','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('187', 'Jacobo', 'McGeechan', 'Poland', '9-29-2017', '€996,56', '1.72', '77.2', '1-22-1984','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('188', 'Seward', 'Sorey', 'Poland', '8-29-2016', '€607,72', '1.85', '96.3', '3-31-1987','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('189', 'Adelind', 'Pickavant', 'France', '8-26-2020', '€1595,67', '1.73', '86.3', '8-25-1997','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('190', 'Twyla', 'Errol', 'Poland', '3-13-2016', '€1061,61', '2.06', '105.7', '3-3-1987','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('191', 'Roddie', 'Mitskevich', 'Poland', '12-4-2020', '€3287,52', '1.87', '88.8', '2-7-1999','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('192', 'Dan', 'Millgate', 'United States', '10-6-2016', '€4552,97', '1.77', '94.2', '10-19-1986','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('193', 'Nelson', 'Androlli', 'Poland', '9-29-2020', '€3446,21', '1.74', '88.1', '10-15-1998','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('194', 'Alan', 'Eslinger', 'United States', '11-13-2019', '€733,38', '1.91', '97.2', '1-6-2001','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('195', 'Weylin', 'Tomaszek', 'France', '3-23-2017', '€2260,22', '1.93', '91.6', '8-5-1991','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('196', 'Tara', 'Szymonowicz', 'France', '4-8-2019', '€1524,11', '1.92', '100.7', '7-12-2002','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('197', 'Korella', 'O''Currine', 'Poland', '2-20-2020', '€2288,27', '1.77', '90.1', '6-25-1989','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('198', 'Marwin', 'Sysland', 'Poland', '5-23-2016', '€4484,03', '1.88', '98.8', '3-8-1984','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('199', 'Noni', 'McCord', 'France', '11-5-2019', '€3941,99', '1.96', '99.6', '4-15-1989','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('200', 'Gardener', 'Wyse', 'Poland', '9-2-2018', '€892,31', '1.89', '88.4', '6-6-1990','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('201', 'Hakeem', 'Keets', 'France', '10-25-2015', '€867,25', '1.84', '84.0', '10-16-2001','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('202', 'Aeriela', 'Harring', 'Poland', '8-31-2016', '€4800,06', '1.73', '76.9', '3-13-1998','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('203', 'Jerrie', 'Calwell', 'Poland', '1-4-2016', '€531,60', '1.68', '66.8', '12-10-2000','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('204', 'Carl', 'Cropper', 'United States', '2-6-2019', '€3680,27', '1.91', '92.5', '3-8-1993','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('205', 'Hamel', 'Gummary', 'France', '11-4-2020', '€4148,93', '1.78', '78.6', '3-6-1990','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('206', 'Lotty', 'Ralls', 'Poland', '9-20-2016', '€3826,41', '1.96', '99.2', '5-15-1986','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('207', 'Gwyneth', 'Bauduccio', 'France', '5-28-2016', '€1010,91', '1.93', '80.6', '4-28-1998','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('208', 'Joela', 'Quinby', 'Germany', '10-5-2015', '€3151,04', '1.74', '84.4', '8-22-1991','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('209', 'Dorette', 'Antonin', 'France', '1-9-2017', '€1319,51', '1.85', '89.7', '12-19-2000','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('210', 'Randa', 'McElroy', 'Italy', '12-4-2016', '€2843,10', '1.97', '97.5', '10-15-1994','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('211', 'Cordula', 'Caldes', 'France', '9-26-2019', '€4339,63', '1.84', '83.4', '10-22-1989','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('212', 'Noami', 'Pautard', 'Greece', '1-1-2020', '€2482,80', '1.94', '95.8', '4-21-1984','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('213', 'Sofia', 'Dirkin', 'Poland', '2-17-2016', '€2319,01', '1.97', '94.5', '2-23-1994','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('214', 'Marchall', 'Godsmark', 'United States', '4-20-2016', '€4673,52', '1.82', '81.2', '1-7-1991','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('215', 'Aristotle', 'Rawsthorne', 'France', '12-3-2018', '€1472,42', '1.89', '94.5', '5-10-1999','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('216', 'Ashlan', 'Messenbird', 'Poland', '6-17-2020', '€507,23', '1.77', '71.7', '2-10-1996','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('217', 'Denney', 'Dallaway', 'Poland', '4-23-2020', '€1318,31', '2.06', '119.1', '2-25-1994','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('218', 'Winnifred', 'Tanswill', 'Poland', '4-30-2017', '€1743,01', '1.94', '99.1', '3-16-1997','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('219', 'Emmet', 'Paver', 'Poland', '11-7-2017', '€1990,37', '1.86', '82.4', '5-1-1995','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('220', 'Phebe', 'Pizer', 'Poland', '2-19-2020', '€4359,06', '1.79', '76.1', '6-19-2002','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('221', 'Illa', 'MacGorrie', 'France', '9-26-2016', '€3667,84', '1.84', '85.0', '8-24-2002','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('222', 'Pepita', 'Thunnercliff', 'France', '12-10-2020', '€2008,67', '2.13', '108.6', '2-2-1984','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('223', 'Andie', 'Asker', 'Greece', '11-20-2019', '€2383,74', '1.98', '103.8', '5-25-1998','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('224', 'Alvina', 'Dewick', 'United States', '2-29-2016', '€1582,96', '2.09', '109.7', '11-8-1994','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('225', 'Garv', 'Schottli', 'United States', '7-28-2018', '€986,21', '2.02', '102.7', '8-28-1997','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('226', 'Maisey', 'Georgelin', 'Poland', '8-29-2016', '€1502,80', '1.67', '73.2', '5-5-1996','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('227', 'Hunter', 'Sail', 'Poland', '4-19-2018', '€1002,70', '1.88', '80.7', '6-14-1992','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('228', 'Craggy', 'Cavill', 'Poland', '4-9-2018', '€2188,15', '1.96', '91.9', '9-3-2000','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('229', 'Blane', 'Leroy', 'United States', '6-20-2018', '€2361,79', '1.87', '86.4', '3-1-2002','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('230', 'Clarie', 'Jerger', 'France', '3-9-2020', '€2393,28', '1.73', '77.9', '3-19-1989','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('231', 'Lewiss', 'Lambourne', 'France', '10-17-2020', '€1428,62', '1.77', '79.8', '6-6-1994','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('232', 'Jocelyn', 'Brushneen', 'Greece', '3-26-2019', '€847,76', '1.87', '83.0', '9-9-2002','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('233', 'Dolli', 'Strangeways', 'France', '5-22-2018', '€1900,72', '1.81', '76.3', '6-30-1999','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('234', 'Kenon', 'Klimus', 'United Arab Emirates', '1-7-2017', '€2464,50', '1.82', '89.7', '4-16-1992','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('235', 'Shina', 'Aiskrigg', 'Greece', '12-1-2020', '€3786,04', '1.74', '83.5', '6-21-1990','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('236', 'Rudy', 'Clell', 'France', '10-1-2018', '€3060,74', '1.95', '77.7', '7-4-1994','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('237', 'Roseanna', 'Guilloux', 'Poland', '3-5-2018', '€2325,31', '1.83', '88.1', '12-9-1996','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('238', 'Elvera', 'Glazer', 'Poland', '1-29-2019', '€4115,93', '2.05', '109.3', '9-10-1990','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('239', 'Angy', 'Sandal', 'France', '5-12-2017', '€3223,97', '1.91', '99.6', '4-3-1991','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('240', 'Bridie', 'Mingo', 'United States', '7-25-2020', '€4785,39', '1.91', '99.1', '11-16-1984','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('241', 'Fiann', 'Pudding', 'Poland', '3-21-2020', '€4728,85', '1.91', '98.7', '4-11-1989','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('242', 'Murielle', 'Dumbellow', 'Poland', '8-1-2019', '€1021,61', '2.08', '103.9', '6-14-1984','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('243', 'Veronica', 'Connold', 'France', '6-7-2019', '€825,03', '1.88', '94.2', '12-23-1998','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('244', 'Arman', 'Grenkov', 'Poland', '4-6-2019', '€1449,67', '1.89', '87.4', '12-31-1989','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('245', 'Bertina', 'Hinkens', 'United States', '4-12-2016', '€2908,47', '1.90', '91.3', '3-26-2001','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('246', 'Kelly', 'Rubinfajn', 'France', '4-8-2019', '€4904,30', '1.79', '76.9', '12-28-1986','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('247', 'Ferguson', 'Mathivat', 'France', '11-13-2019', '€3473,06', '1.89', '81.8', '7-4-1997','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('248', 'Clarissa', 'Paulus', 'Spain', '5-16-2018', '€3026,67', '1.92', '85.8', '11-8-1992','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('249', 'Wilek', 'Borrett', 'Spain', '3-2-2017', '€3974,25', '1.88', '94.1', '7-4-1987','/img/R.jpg');
insert into Player (Player_ID, FirstName, Surname, Nationality, Career_starting_Date, Salary, Hight, WeightP, Birth_Date, Image) values ('250', 'Audi', 'Bunce', 'Poland', '12-29-2016', '€3180,54', '1.83', '86.1', '7-11-1990','/img/R.jpg');


insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '1', '0.9', '6', '53.2', '15.7', '76.9', '1.5', '6.0', '14.3', '3.7', '2.5', '2.7', '1.4', '25.1');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '2', '0.2', '7', '56.4', '13.4', '74.4', '0.2', '7.3', '0.1', '5.0', '1.6', '0.2', '6.0', '35.0');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '3', '6.2', '6', '23.4', '47.1', '89.0', '22.8', '10.3', '13.5', '9.3', '0.4', '2.8', '2.7', '17.7');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '4', '20.8', '2', '32.8', '31.5', '53.4', '2.6', '2.0', '13.2', '0.2', '0.8', '0.1', '4.6', '12.7');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '5', '20.2', '2', '25.2', '17.3', '65.2', '7.4', '13.8', '11.5', '4.3', '2.2', '2.0', '5.9', '16.0');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '6', '10.8', '5', '42.5', '17.5', '66.1', '21.1', '0.8', '4.1', '7.3', '0.3', '2.4', '1.9', '10.7');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '7', '23.2', '8', '62.6', '38.2', '88.6', '3.2', '2.1', '11.8', '6.6', '2.6', '2.8', '5.4', '15.1');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '8', '22.2', '4', '42.7', '17.0', '87.5', '9.1', '1.5', '4.9', '5.8', '0.1', '1.0', '3.8', '13.7');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '9', '22.3', '3', '31.8', '28.6', '63.1', '3.6', '6.2', '3.9', '0.1', '3.1', '2.6', '5.7', '5.7');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '10', '20.4', '7', '21.2', '39.3', '60.1', '21.6', '2.9', '6.3', '5.7', '2.6', '2.0', '4.8', '25.1');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '11', '7.0', '8', '26.2', '42.5', '61.0', '16.7', '1.6', '9.4', '2.9', '2.6', '1.9', '0.6', '14.0');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '12', '16.4', '6', '36.9', '28.7', '63.4', '24.7', '8.0', '13.2', '8.8', '2.6', '1.3', '5.3', '37.6');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '13', '5.0', '5', '40.5', '45.5', '74.7', '9.0', '2.9', '8.9', '3.1', '2.0', '0.9', '3.4', '13.7');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '14', '15.1', '5', '48.7', '24.9', '70.0', '20.3', '11.2', '0.3', '3.7', '3.8', '2.7', '3.8', '7.9');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '15', '22.4', '7', '41.8', '31.7', '78.1', '0.6', '5.1', '5.2', '6.8', '1.7', '1.5', '5.0', '9.5');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '16', '9.1', '4', '68.7', '23.3', '76.5', '4.5', '10.8', '1.9', '4.7', '2.1', '2.3', '0.5', '24.1');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '17', '17.6', '6', '19.9', '14.7', '63.3', '22.2', '12.7', '4.6', '2.9', '0.9', '1.4', '3.0', '32.6');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '18', '4.9', '7', '20.6', '24.1', '68.7', '17.1', '6.2', '6.7', '2.1', '3.6', '2.1', '0.1', '39.8');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '19', '19.5', '2', '44.9', '39.5', '51.5', '6.8', '12.3', '1.2', '6.3', '2.8', '0.4', '5.5', '26.3');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '20', '20.5', '6', '56.5', '29.4', '73.4', '0.9', '5.1', '6.7', '2.9', '1.6', '1.3', '2.7', '37.0');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '21', '19.3', '2', '47.3', '10.4', '60.1', '3.0', '11.7', '1.4', '7.5', '2.5', '0.7', '2.4', '6.7');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '22', '13.4', '8', '25.4', '20.3', '82.8', '17.7', '8.4', '5.6', '8.8', '3.8', '1.2', '3.1', '30.1');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '23', '13.5', '4', '46.9', '12.1', '52.8', '1.4', '12.9', '3.7', '0.8', '1.2', '1.5', '4.4', '3.6');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '24', '20.9', '7', '27.7', '16.2', '60.1', '9.0', '14.9', '6.1', '2.7', '0.6', '2.9', '3.0', '17.2');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '25', '11.9', '4', '64.0', '38.0', '55.7', '19.5', '0.2', '5.9', '3.8', '0.5', '0.3', '1.8', '17.7');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '26', '2.5', '2', '49.5', '23.5', '58.0', '17.4', '6.2', '1.4', '7.4', '4.0', '2.6', '4.6', '32.0');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '27', '23.1', '6', '53.1', '38.2', '70.1', '11.6', '5.9', '3.2', '2.2', '1.6', '1.7', '5.6', '5.8');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '28', '7.1', '3', '53.1', '25.1', '50.2', '1.3', '0.7', '0.9', '1.7', '3.7', '2.8', '0.7', '22.0');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '29', '6.4', '4', '51.0', '47.1', '56.2', '2.3', '7.4', '2.6', '6.6', '0.3', '0.7', '0.8', '8.5');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '30', '2.4', '7', '29.5', '41.5', '86.8', '3.2', '9.7', '3.2', '8.5', '2.6', '0.1', '5.3', '22.6');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '31', '3.3', '3', '29.5', '27.4', '84.6', '24.7', '13.4', '10.3', '2.3', '3.9', '2.5', '0.9', '2.8');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '32', '9.1', '7', '59.8', '41.1', '83.4', '3.4', '10.2', '12.4', '7.2', '0.8', '0.3', '2.7', '5.7');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '33', '5.5', '2', '45.3', '17.9', '70.4', '9.0', '7.4', '3.5', '1.6', '2.2', '1.4', '2.7', '12.0');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '34', '14.1', '5', '42.2', '35.5', '50.8', '22.2', '11.6', '1.2', '8.8', '3.5', '2.0', '3.5', '12.5');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '35', '21.0', '3', '52.6', '40.4', '85.2', '7.7', '4.2', '5.9', '0.2', '2.7', '2.3', '5.0', '23.4');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '36', '17.7', '8', '48.8', '29.1', '56.7', '20.9', '13.8', '10.2', '4.4', '3.9', '0.7', '1.4', '34.2');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '37', '8.9', '8', '58.7', '49.0', '65.3', '12.7', '11.2', '11.7', '5.1', '2.4', '1.7', '4.4', '17.2');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '38', '23.9', '8', '38.4', '46.1', '87.6', '17.8', '2.9', '6.2', '6.0', '0.3', '2.1', '4.4', '30.5');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '39', '16.4', '8', '27.9', '32.2', '66.0', '20.8', '10.0', '14.0', '1.0', '3.9', '1.3', '4.0', '36.6');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '40', '19.5', '2', '46.5', '15.5', '85.9', '22.6', '10.9', '0.9', '9.7', '1.1', '0.9', '4.0', '13.6');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '41', '0.7', '8', '47.8', '19.4', '53.9', '9.3', '5.3', '6.8', '8.0', '0.2', '1.4', '5.7', '39.2');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '42', '12.4', '7', '30.5', '28.4', '51.7', '16.8', '14.4', '1.9', '9.5', '0.2', '2.4', '1.4', '38.7');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '43', '9.8', '2', '21.8', '36.2', '67.7', '7.4', '7.2', '13.4', '8.7', '3.5', '1.3', '4.4', '19.8');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '44', '16.6', '5', '35.0', '47.8', '65.8', '18.3', '11.5', '8.7', '3.7', '0.5', '1.3', '2.3', '1.4');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '45', '18.0', '8', '44.0', '47.3', '71.1', '13.0', '13.2', '2.7', '4.3', '1.9', '2.7', '3.5', '12.6');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '46', '4.1', '5', '68.2', '35.8', '57.1', '15.6', '12.5', '11.1', '0.4', '3.2', '1.7', '0.3', '23.1');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '47', '9.5', '2', '54.0', '45.3', '69.2', '24.7', '5.6', '0.9', '0.2', '1.5', '0.4', '5.2', '38.5');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '48', '14.7', '8', '58.8', '28.6', '77.8', '5.5', '8.5', '4.0', '9.8', '0.9', '0.2', '4.8', '13.3');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '49', '9.5', '4', '29.3', '20.9', '88.2', '14.2', '2.8', '4.2', '1.9', '3.4', '2.4', '1.0', '2.2');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '50', '7.6', '2', '65.0', '38.0', '80.9', '11.3', '2.3', '1.2', '4.5', '0.5', '0.0', '3.7', '16.6');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '51', '15.8', '2', '25.8', '47.4', '63.2', '23.9', '0.3', '3.4', '2.2', '2.5', '1.8', '5.2', '9.1');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '52', '9.8', '6', '18.4', '22.7', '83.7', '1.9', '3.0', '13.9', '4.5', '0.7', '1.0', '1.8', '15.7');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '53', '23.9', '3', '48.0', '40.9', '73.8', '10.5', '5.5', '5.6', '4.3', '3.6', '0.8', '3.5', '27.2');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '54', '17.1', '4', '20.3', '25.5', '79.5', '19.2', '9.1', '7.4', '9.7', '3.2', '2.0', '4.4', '7.2');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '55', '4.3', '4', '41.9', '17.6', '58.3', '23.6', '5.1', '5.1', '4.7', '1.0', '2.7', '0.1', '2.9');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '56', '21.4', '6', '22.3', '48.2', '69.0', '1.5', '3.1', '2.7', '7.6', '0.1', '0.1', '5.8', '20.9');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '57', '22.4', '6', '29.6', '41.4', '83.4', '20.2', '12.8', '3.2', '3.4', '1.5', '2.2', '1.7', '35.0');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '58', '23.4', '3', '24.0', '20.5', '64.6', '3.3', '7.8', '13.8', '5.9', '2.9', '0.8', '1.8', '28.3');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '59', '20.0', '4', '43.8', '26.7', '68.1', '5.9', '7.0', '9.2', '2.5', '1.1', '1.0', '5.1', '16.0');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '60', '16.0', '6', '32.5', '35.3', '60.2', '17.1', '2.0', '0.7', '2.7', '4.0', '0.8', '2.2', '38.6');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '61', '10.0', '6', '63.0', '36.6', '79.8', '7.1', '1.8', '2.2', '0.7', '2.1', '2.0', '4.2', '8.5');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '62', '13.3', '4', '25.7', '33.1', '50.3', '6.1', '8.8', '10.5',' 1.9', '2.3', '1.3', '1.5', '18.4');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '63', '3.6', '6', '63.8', '36.5', '58.9', '18.9', '5.0', '5.4', '7.0', '1.4', '2.4', '4.1', '4.7');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '64', '16.6', '7', '34.1', '36.2', '82.0', '19.5', '4.9', '5.3', '6.7', '1.0', '0.6', '5.3', '15.0');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '65', '2.8', '7', '18.4', '39.0', '67.0', '19.8', '7.4', '4.3', '3.2', '1.9', '1.1', '4.6', '23.4');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '66', '2.7', '3', '33.0', '21.9', '62.7', '10.5', '2.2', '14.0',' 8.7', '0.1', '1.3', '5.7', '9.8');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '67', '23.6', '2', '58.9', '16.0', '55.5', '17.5', '6.2', '9.5', '3.4', '3.5', '2.7', '5.7', '19.5');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '68', '24.3', '5', '64.9', '17.9', '63.6', '15.5', '0.7', '5.3', '3.3', '0.9', '2.0', '5.2', '15.0');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '69', '17.8', '2', '37.6', '44.6', '60.9', '2.0', '1.9', '10.2', '5.6', '0.4', '1.0', '1.7', '27.2');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '70', '13.4', '7', '21.5', '11.7', '57.9', '24.1', '6.0', '11.1', '5.6', '2.5', '1.0', '3.3', '26.0');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '71', '0.4', '5', '34.6', '14.5', '59.5', '11.6', '5.4', '1.8', '4.1', '0.5', '2.9', '1.5', '22.8');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '72', '21.0', '5', '69.9', '46.5', '87.1', '23.6', '4.7', '5.6', '6.8', '1.5', '1.9', '1.3', '14.6');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '73', '13.9', '8', '50.0', '18.7', '55.5', '20.9', '9.2', '10.9', '3.2', '1.7', '0.2', '0.0', '8.9');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '74', '7.2', '3', '20.7', '35.3', '61.9', '15.9', '7.4', '0.7', '9.7', '1.7', '2.7', '5.4', '34.4');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '75', '8.8', '6', '38.7', '31.0', '73.2', '2.2', '2.3', '11.9', '6.0', '2.4', '0.2', '1.6', '29.3');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '76', '22.4', '6', '34.8', '15.8', '76.9', '19.0', '7.0', '8.0', '2.9', '1.3', '2.4', '3.4', '11.5');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '77', '10.2', '3', '49.2', '30.4', '85.3', '8.8', '0.6', '9.3', '6.0', '1.9', '2.1', '4.7', '19.8');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '78', '23.1', '7', '51.7', '35.8', '69.3', '4.9', '8.4', '2.6', '8.7', '0.3', '2.3', '1.3', '7.2');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '79', '20.9', '2', '41.2', '27.4', '78.1', '0.0', '8.2', '7.0', '9.7', '3.0', '1.5', '3.8', '38.4');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '80', '8.6', '2', '60.5', '21.7', '79.7', '24.4', '5.3', '3.8', '3.7', '3.3', '2.6', '0.5', '4.9');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '81', '5.2', '4', '63.4', '48.5', '57.4', '0.8', '6.6', '12.3', '0.0', '2.6', '0.5', '2.4', '10.9');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '82', '0.9', '7', '50.3', '42.6', '78.6', '13.7', '3.8', '9.9', '1.9', '0.6', '2.2', '2.0', '6.8');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '83', '12.8', '3', '33.4', '13.8', '80.9', '2.3', '8.7', '1.2', '1.7', '0.8', '2.5', '3.2', '36.6');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '84', '3.0', '8', '37.0', '22.4', '69.3', '5.9', '11.3', '4.0', '1.7', '0.6', '1.7', '4.3', '9.6');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '85', '15.0', '3', '38.2', '30.2', '62.8', '5.2', '12.5', '4.6', '1.6', '3.7', '2.9', '0.1', '35.5');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '86', '15.2', '3', '19.4', '19.6', '76.0', '18.8', '8.1', '6.0', '4.0', '2.6', '0.5', '0.1', '34.0');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '87', '17.8', '4', '34.1', '22.3', '77.3', '8.8', '3.5', '10.9', '9.2', '2.6', '2.9', '0.3', '18.1');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '88', '0.1', '7', '30.4', '46.6', '67.1', '16.5', '6.9', '2.5', '3.9', '2.8', '2.4', '0.9', '28.7');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '89', '15.0', '2', '32.2', '20.9', '79.2', '3.3', '14.9', '7.8', '7.6', '0.0', '2.0', '4.5', '16.6');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '90', '2.4', '7', '29.5', '41.5', '86.8', '3.2', '9.7', '3.2', '8.5', '2.6', '0.1', '5.3', '22.6');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '91', '3.3', '3', '29.5', '27.4', '84.6', '24.7', '13.4', '10.3', '2.3', '3.9', '2.5', '0.9', '2.8');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '92', '9.1', '7', '59.8', '41.1', '83.4', '3.4', '10.2', '12.4', '7.2', '0.8', '0.3', '2.7', '5.7');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '93', '5.5', '2', '45.3', '17.9', '70.4', '9.0', '7.4', '3.5', '1.6', '2.2', '1.4', '2.7', '12.0');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '94', '14.1', '5', '42.2', '35.5', '50.8', '22.2', '11.6', '1.2', '8.8', '3.5', '2.0', '3.5', '12.5');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '95', '21.0', '3', '52.6', '40.4', '85.2', '7.7', '4.2', '5.9', '0.2', '2.7', '2.3', '5.0', '23.4');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '96', '17.7', '8', '48.8', '29.1', '56.7', '20.9', '13.8', '10.2', '4.4', '3.9', '0.7', '1.4', '34.2');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '97', '8.9', '8', '58.7', '49.0', '65.3', '12.7', '11.2', '11.7', '5.1', '2.4', '1.7', '4.4', '17.2');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '98', '23.9', '8', '38.4', '46.1', '87.6', '17.8', '2.9', '6.2', '6.0', '0.3', '2.1', '4.4', '30.5');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '99', '16.4', '8', '27.9', '32.2', '66.0', '20.8', '10.0', '14.0', '1.0', '3.9', '1.3', '4.0', '36.6');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '100', '19.5', '2', '46.5', '15.5', '85.9', '22.6', '10.9', '0.9', '9.7', '1.1', '0.9', '4.0', '13.6');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '101', '0.7', '8', '47.8', '19.4', '53.9', '9.3', '5.3', '6.8', '8.0', '0.2', '1.4', '5.7', '39.2');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '102', '12.4', '7', '30.5', '28.4', '51.7', '16.8', '14.4', '1.9', '9.5', '0.2', '2.4', '1.4', '38.7');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '103', '9.8', '2', '21.8', '36.2', '67.7', '7.4', '7.2', '13.4', '8.7', '3.5', '1.3', '4.4', '19.8');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '104', '16.6', '5', '35.0', '47.8', '65.8', '18.3', '11.5', '8.7', '3.7', '0.5', '1.3', '2.3', '1.4');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '105', '18.0', '8', '44.0', '47.3', '71.1', '13.0', '13.2', '2.7', '4.3', '1.9', '2.7', '3.5', '12.6');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '106', '4.1', '5', '68.2', '35.8', '57.1', '15.6', '12.5', '11.1', '0.4', '3.2', '1.7', '0.3', '23.1');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '107', '9.5', '2', '54.0', '45.3', '69.2', '24.7', '5.6', '0.9', '0.2', '1.5', '0.4', '5.2', '38.5');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '108', '14.7', '8', '58.8', '28.6', '77.8', '5.5', '8.5', '4.0', '9.8', '0.9', '0.2', '4.8', '13.3');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '109', '9.5', '4', '29.3', '20.9', '88.2', '14.2', '2.8', '4.2', '1.9', '3.4', '2.4', '1.0', '2.2');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '110', '7.6', '2', '65.0', '38.0', '80.9', '11.3', '2.3', '1.2', '4.5', '0.5', '0.0', '3.7', '16.6');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '111', '17.8', '2', '37.6', '44.6', '60.9', '2.0', '1.9', '10.2', '5.6', '0.4', '1.0', '1.7', '27.2');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '112', '13.4', '7', '21.5', '11.7', '57.9', '24.1', '6.0', '11.1', '5.6', '2.5', '1.0', '3.3', '26.0');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '113', '0.4', '5', '34.6', '14.5', '59.5', '11.6', '5.4', '1.8', '4.1', '0.5', '2.9', '1.5', '22.8');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '114', '21.0', '5', '69.9', '46.5', '87.1', '23.6', '4.7', '5.6', '6.8', '1.5', '1.9', '1.3', '14.6');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '115', '13.9', '8', '50.0', '18.7', '55.5', '20.9', '9.2', '10.9', '3.2', '1.7', '0.2', '0.0', '8.9');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '116', '7.2', '3', '20.7', '35.3', '61.9', '15.9', '7.4', '0.7', '9.7', '1.7', '2.7', '5.4', '34.4');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '117', '8.8', '6', '38.7', '31.0', '73.2', '2.2', '2.3', '11.9', '6.0', '2.4', '0.2', '1.6', '29.3');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '118', '22.4', '6', '34.8', '15.8', '76.9', '19.0', '7.0', '8.0', '2.9', '1.3', '2.4', '3.4', '11.5');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '119', '10.2', '3', '49.2', '30.4', '85.3', '8.8', '0.6', '9.3', '6.0', '1.9', '2.1', '4.7', '19.8');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '120', '23.1', '7', '51.7', '35.8', '69.3', '4.9', '8.4', '2.6', '8.7', '0.3', '2.3', '1.3', '7.2');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '121', '0.9', '6', '53.2', '15.7', '76.9', '1.5', '6.0', '14.3', '3.7', '2.5', '2.7', '1.4', '25.1');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '122', '0.2', '7', '56.4', '13.4', '74.4', '0.2', '7.3', '0.1', '5.0', '1.6', '0.2', '6.0', '35.0');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '123', '6.2', '6', '23.4', '47.1', '89.0', '22.8', '10.3', '13.5', '9.3', '0.4', '2.8', '2.7', '17.7');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '124', '20.8', '2', '32.8', '31.5', '53.4', '2.6', '2.0', '13.2', '0.2', '0.8', '0.1', '4.6', '12.7');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '125', '20.2', '2', '25.2', '17.3', '65.2', '7.4', '13.8', '11.5', '4.3', '2.2', '2.0', '5.9', '16.0');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '126', '10.8', '5', '42.5', '17.5', '66.1', '21.1', '0.8', '4.1', '7.3', '0.3', '2.4', '1.9', '10.7');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '127', '23.2', '8', '62.6', '38.2', '88.6', '3.2', '2.1', '11.8', '6.6', '2.6', '2.8', '5.4', '15.1');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '128', '22.2', '4', '42.7', '17.0', '87.5', '9.1', '1.5', '4.9', '5.8', '0.1', '1.0', '3.8', '13.7');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '129', '22.3', '3', '31.8', '28.6', '63.1', '3.6', '6.2', '3.9', '0.1', '3.1', '2.6', '5.7', '5.7');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '130', '20.4', '7', '21.2', '39.3', '60.1', '21.6', '2.9', '6.3', '5.7', '2.6', '2.0', '4.8', '25.1');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '131', '7.0', '8', '26.2', '42.5', '61.0', '16.7', '1.6', '9.4', '2.9', '2.6', '1.9', '0.6', '14.0');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '132', '16.4', '6', '36.9', '28.7', '63.4', '24.7', '8.0', '13.2', '8.8', '2.6', '1.3', '5.3', '37.6');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '133', '5.0', '5', '40.5', '45.5', '74.7', '9.0', '2.9', '8.9', '3.1', '2.0', '0.9', '3.4', '13.7');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '134', '15.1', '5', '48.7', '24.9', '70.0', '20.3', '11.2', '0.3', '3.7', '3.8', '2.7', '3.8', '7.9');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '135', '22.4', '7', '41.8', '31.7', '78.1', '0.6', '5.1', '5.2', '6.8', '1.7', '1.5', '5.0', '9.5');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '136', '9.1', '4', '68.7', '23.3', '76.5', '4.5', '10.8', '1.9', '4.7', '2.1', '2.3', '0.5', '24.1');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '137', '17.6', '6', '19.9', '14.7', '63.3', '22.2', '12.7', '4.6', '2.9', '0.9', '1.4', '3.0', '32.6');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '138', '4.9', '7', '20.6', '24.1', '68.7', '17.1', '6.2', '6.7', '2.1', '3.6', '2.1', '0.1', '39.8');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '139', '19.5', '2', '44.9', '39.5', '51.5', '6.8', '12.3', '1.2', '6.3', '2.8', '0.4', '5.5', '26.3');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '140', '20.5', '6', '56.5', '29.4', '73.4', '0.9', '5.1', '6.7', '2.9', '1.6', '1.3', '2.7', '37.0');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '141', '19.3', '2', '47.3', '10.4', '60.1', '3.0', '11.7', '1.4', '7.5', '2.5', '0.7', '2.4', '6.7');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '142', '13.4', '8', '25.4', '20.3', '82.8', '17.7', '8.4', '5.6', '8.8', '3.8', '1.2', '3.1', '30.1');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '143', '13.5', '4', '46.9', '12.1', '52.8', '1.4', '12.9', '3.7', '0.8', '1.2', '1.5', '4.4', '3.6');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '144', '20.9', '7', '27.7', '16.2', '60.1', '9.0', '14.9', '6.1', '2.7', '0.6', '2.9', '3.0', '17.2');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '145', '11.9', '4', '64.0', '38.0', '55.7', '19.5', '0.2', '5.9', '3.8', '0.5', '0.3', '1.8', '17.7');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '146', '2.5', '2', '49.5', '23.5', '58.0', '17.4', '6.2', '1.4', '7.4', '4.0', '2.6', '4.6', '32.0');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '147', '23.1', '6', '53.1', '38.2', '70.1', '11.6', '5.9', '3.2', '2.2', '1.6', '1.7', '5.6', '5.8');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '148', '7.1', '3', '53.1', '25.1', '50.2', '1.3', '0.7', '0.9', '1.7', '3.7', '2.8', '0.7', '22.0');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '149', '6.4', '4', '51.0', '47.1', '56.2', '2.3', '7.4', '2.6', '6.6', '0.3', '0.7', '0.8', '8.5');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '150', '2.4', '7', '29.5', '41.5', '86.8', '3.2', '9.7', '3.2', '8.5', '2.6', '0.1', '5.3', '22.6');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '151', '3.3', '3', '29.5', '27.4', '84.6', '24.7', '13.4', '10.3', '2.3', '3.9', '2.5', '0.9', '2.8');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '152', '9.1', '7', '59.8', '41.1', '83.4', '3.4', '10.2', '12.4', '7.2', '0.8', '0.3', '2.7', '5.7');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '153', '5.5', '2', '45.3', '17.9', '70.4', '9.0', '7.4', '3.5', '1.6', '2.2', '1.4', '2.7', '12.0');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '154', '14.1', '5', '42.2', '35.5', '50.8', '22.2', '11.6', '1.2', '8.8', '3.5', '2.0', '3.5', '12.5');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '155', '21.0', '3', '52.6', '40.4', '85.2', '7.7', '4.2', '5.9', '0.2', '2.7', '2.3', '5.0', '23.4');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '156', '17.7', '8', '48.8', '29.1', '56.7', '20.9', '13.8', '10.2', '4.4', '3.9', '0.7', '1.4', '34.2');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '157', '8.9', '8', '58.7', '49.0', '65.3', '12.7', '11.2', '11.7', '5.1', '2.4', '1.7', '4.4', '17.2');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '158', '23.9', '8', '38.4', '46.1', '87.6', '17.8', '2.9', '6.2', '6.0', '0.3', '2.1', '4.4', '30.5');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '159', '16.4', '8', '27.9', '32.2', '66.0', '20.8', '10.0', '14.0', '1.0', '3.9', '1.3', '4.0', '36.6');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '160', '19.5', '2', '46.5', '15.5', '85.9', '22.6', '10.9', '0.9', '9.7', '1.1', '0.9', '4.0', '13.6');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '161', '0.7', '8', '47.8', '19.4', '53.9', '9.3', '5.3', '6.8', '8.0', '0.2', '1.4', '5.7', '39.2');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '162', '12.4', '7', '30.5', '28.4', '51.7', '16.8', '14.4', '1.9', '9.5', '0.2', '2.4', '1.4', '38.7');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '163', '9.8', '2', '21.8', '36.2', '67.7', '7.4', '7.2', '13.4', '8.7', '3.5', '1.3', '4.4', '19.8');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '164', '16.6', '5', '35.0', '47.8', '65.8', '18.3', '11.5', '8.7', '3.7', '0.5', '1.3', '2.3', '1.4');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '165', '18.0', '8', '44.0', '47.3', '71.1', '13.0', '13.2', '2.7', '4.3', '1.9', '2.7', '3.5', '12.6');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '166', '4.1', '5', '68.2', '35.8', '57.1', '15.6', '12.5', '11.1', '0.4', '3.2', '1.7', '0.3', '23.1');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '167', '9.5', '2', '54.0', '45.3', '69.2', '24.7', '5.6', '0.9', '0.2', '1.5', '0.4', '5.2', '38.5');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '168', '14.7', '8', '58.8', '28.6', '77.8', '5.5', '8.5', '4.0', '9.8', '0.9', '0.2', '4.8', '13.3');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '169', '9.5', '4', '29.3', '20.9', '88.2', '14.2', '2.8', '4.2', '1.9', '3.4', '2.4', '1.0', '2.2');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '170', '7.6', '2', '65.0', '38.0', '80.9', '11.3', '2.3', '1.2', '4.5', '0.5', '0.0', '3.7', '16.6');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '171', '17.8', '2', '37.6', '44.6', '60.9', '2.0', '1.9', '10.2', '5.6', '0.4', '1.0', '1.7', '27.2');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '172', '13.4', '7', '21.5', '11.7', '57.9', '24.1', '6.0', '11.1', '5.6', '2.5', '1.0', '3.3', '26.0');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '173', '0.4', '5', '34.6', '14.5', '59.5', '11.6', '5.4', '1.8', '4.1', '0.5', '2.9', '1.5', '22.8');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '174', '21.0', '5', '69.9', '46.5', '87.1', '23.6', '4.7', '5.6', '6.8', '1.5', '1.9', '1.3', '14.6');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '175', '13.9', '8', '50.0', '18.7', '55.5', '20.9', '9.2', '10.9', '3.2', '1.7', '0.2', '0.0', '8.9');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '176', '7.2', '3', '20.7', '35.3', '61.9', '15.9', '7.4', '0.7', '9.7', '1.7', '2.7', '5.4', '34.4');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '177', '8.8', '6', '38.7', '31.0', '73.2', '2.2', '2.3', '11.9', '6.0', '2.4', '0.2', '1.6', '29.3');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '178', '22.4', '6', '34.8', '15.8', '76.9', '19.0', '7.0', '8.0', '2.9', '1.3', '2.4', '3.4', '11.5');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '179', '10.2', '3', '49.2', '30.4', '85.3', '8.8', '0.6', '9.3', '6.0', '1.9', '2.1', '4.7', '19.8');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '180', '23.1', '7', '51.7', '35.8', '69.3', '4.9', '8.4', '2.6', '8.7', '0.3', '2.3', '1.3', '7.2');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '181', '0.9', '6', '53.2', '15.7', '76.9', '1.5', '6.0', '14.3', '3.7', '2.5', '2.7', '1.4', '25.1');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '182', '0.2', '7', '56.4', '13.4', '74.4', '0.2', '7.3', '0.1', '5.0', '1.6', '0.2', '6.0', '35.0');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '183', '6.2', '6', '23.4', '47.1', '89.0', '22.8', '10.3', '13.5', '9.3', '0.4', '2.8', '2.7', '17.7');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '184', '20.8', '2', '32.8', '31.5', '53.4', '2.6', '2.0', '13.2', '0.2', '0.8', '0.1', '4.6', '12.7');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '185', '20.2', '2', '25.2', '17.3', '65.2', '7.4', '13.8', '11.5', '4.3', '2.2', '2.0', '5.9', '16.0');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '186', '10.8', '5', '42.5', '17.5', '66.1', '21.1', '0.8', '4.1', '7.3', '0.3', '2.4', '1.9', '10.7');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '187', '23.2', '8', '62.6', '38.2', '88.6', '3.2', '2.1', '11.8', '6.6', '2.6', '2.8', '5.4', '15.1');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '188', '22.2', '4', '42.7', '17.0', '87.5', '9.1', '1.5', '4.9', '5.8', '0.1', '1.0', '3.8', '13.7');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '189', '22.3', '3', '31.8', '28.6', '63.1', '3.6', '6.2', '3.9', '0.1', '3.1', '2.6', '5.7', '5.7');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '190', '20.4', '7', '21.2', '39.3', '60.1', '21.6', '2.9', '6.3', '5.7', '2.6', '2.0', '4.8', '25.1');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '191', '7.0', '8', '26.2', '42.5', '61.0', '16.7', '1.6', '9.4', '2.9', '2.6', '1.9', '0.6', '14.0');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '192', '16.4', '6', '36.9', '28.7', '63.4', '24.7', '8.0', '13.2', '8.8', '2.6', '1.3', '5.3', '37.6');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '193', '5.0', '5', '40.5', '45.5', '74.7', '9.0', '2.9', '8.9', '3.1', '2.0', '0.9', '3.4', '13.7');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '194', '15.1', '5', '48.7', '24.9', '70.0', '20.3', '11.2', '0.3', '3.7', '3.8', '2.7', '3.8', '7.9');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '195', '22.4', '7', '41.8', '31.7', '78.1', '0.6', '5.1', '5.2', '6.8', '1.7', '1.5', '5.0', '9.5');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '196', '9.1', '4', '68.7', '23.3', '76.5', '4.5', '10.8', '1.9', '4.7', '2.1', '2.3', '0.5', '24.1');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '197', '17.6', '6', '19.9', '14.7', '63.3', '22.2', '12.7', '4.6', '2.9', '0.9', '1.4', '3.0', '32.6');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '198', '4.9', '7', '20.6', '24.1', '68.7', '17.1', '6.2', '6.7', '2.1', '3.6', '2.1', '0.1', '39.8');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '199', '19.5', '2', '44.9', '39.5', '51.5', '6.8', '12.3', '1.2', '6.3', '2.8', '0.4', '5.5', '26.3');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '200', '20.5', '6', '56.5', '29.4', '73.4', '0.9', '5.1', '6.7', '2.9', '1.6', '1.3', '2.7', '37.0');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '201', '0.9', '6', '53.2', '15.7', '76.9', '1.5', '6.0', '14.3', '3.7', '2.5', '2.7', '1.4', '25.1');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '202', '0.2', '7', '56.4', '13.4', '74.4', '0.2', '7.3', '0.1', '5.0', '1.6', '0.2', '6.0', '35.0');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '203', '6.2', '6', '23.4', '47.1', '89.0', '22.8', '10.3', '13.5', '9.3', '0.4', '2.8', '2.7', '17.7');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '204', '20.8', '2', '32.8', '31.5', '53.4', '2.6', '2.0', '13.2', '0.2', '0.8', '0.1', '4.6', '12.7');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '205', '20.2', '2', '25.2', '17.3', '65.2', '7.4', '13.8', '11.5', '4.3', '2.2', '2.0', '5.9', '16.0');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '206', '10.8', '5', '42.5', '17.5', '66.1', '21.1', '0.8', '4.1', '7.3', '0.3', '2.4', '1.9', '10.7');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '207', '23.2', '8', '62.6', '38.2', '88.6', '3.2', '2.1', '11.8', '6.6', '2.6', '2.8', '5.4', '15.1');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '208', '22.2', '4', '42.7', '17.0', '87.5', '9.1', '1.5', '4.9', '5.8', '0.1', '1.0', '3.8', '13.7');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '209', '22.3', '3', '31.8', '28.6', '63.1', '3.6', '6.2', '3.9', '0.1', '3.1', '2.6', '5.7', '5.7');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '210', '20.4', '7', '21.2', '39.3', '60.1', '21.6', '2.9', '6.3', '5.7', '2.6', '2.0', '4.8', '25.1');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '211', '7.0', '8', '26.2', '42.5', '61.0', '16.7', '1.6', '9.4', '2.9', '2.6', '1.9', '0.6', '14.0');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '212', '16.4', '6', '36.9', '28.7', '63.4', '24.7', '8.0', '13.2', '8.8', '2.6', '1.3', '5.3', '37.6');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '213', '5.0', '5', '40.5', '45.5', '74.7', '9.0', '2.9', '8.9', '3.1', '2.0', '0.9', '3.4', '13.7');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '214', '15.1', '5', '48.7', '24.9', '70.0', '20.3', '11.2', '0.3', '3.7', '3.8', '2.7', '3.8', '7.9');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '215', '22.4', '7', '41.8', '31.7', '78.1', '0.6', '5.1', '5.2', '6.8', '1.7', '1.5', '5.0', '9.5');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '216', '9.1', '4', '68.7', '23.3', '76.5', '4.5', '10.8', '1.9', '4.7', '2.1', '2.3', '0.5', '24.1');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '217', '17.6', '6', '19.9', '14.7', '63.3', '22.2', '12.7', '4.6', '2.9', '0.9', '1.4', '3.0', '32.6');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '218', '4.9', '7', '20.6', '24.1', '68.7', '17.1', '6.2', '6.7', '2.1', '3.6', '2.1', '0.1', '39.8');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '219', '19.5', '2', '44.9', '39.5', '51.5', '6.8', '12.3', '1.2', '6.3', '2.8', '0.4', '5.5', '26.3');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '220', '20.5', '6', '56.5', '29.4', '73.4', '0.9', '5.1', '6.7', '2.9', '1.6', '1.3', '2.7', '37.0');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '221', '19.3', '2', '47.3', '10.4', '60.1', '3.0', '11.7', '1.4', '7.5', '2.5', '0.7', '2.4', '6.7');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '222', '13.4', '8', '25.4', '20.3', '82.8', '17.7', '8.4', '5.6', '8.8', '3.8', '1.2', '3.1', '30.1');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '223', '13.5', '4', '46.9', '12.1', '52.8', '1.4', '12.9', '3.7', '0.8', '1.2', '1.5', '4.4', '3.6');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '224', '20.9', '7', '27.7', '16.2', '60.1', '9.0', '14.9', '6.1', '2.7', '0.6', '2.9', '3.0', '17.2');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '225', '11.9', '4', '64.0', '38.0', '55.7', '19.5', '0.2', '5.9', '3.8', '0.5', '0.3', '1.8', '17.7');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '226', '2.5', '2', '49.5', '23.5', '58.0', '17.4', '6.2', '1.4', '7.4', '4.0', '2.6', '4.6', '32.0');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '227', '23.1', '6', '53.1', '38.2', '70.1', '11.6', '5.9', '3.2', '2.2', '1.6', '1.7', '5.6', '5.8');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '228', '7.1', '3', '53.1', '25.1', '50.2', '1.3', '0.7', '0.9', '1.7', '3.7', '2.8', '0.7', '22.0');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '229', '6.4', '4', '51.0', '47.1', '56.2', '2.3', '7.4', '2.6', '6.6', '0.3', '0.7', '0.8', '8.5');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '230', '2.4', '7', '29.5', '41.5', '86.8', '3.2', '9.7', '3.2', '8.5', '2.6', '0.1', '5.3', '22.6');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '231', '3.3', '3', '29.5', '27.4', '84.6', '24.7', '13.4', '10.3', '2.3', '3.9', '2.5', '0.9', '2.8');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '232', '9.1', '7', '59.8', '41.1', '83.4', '3.4', '10.2', '12.4', '7.2', '0.8', '0.3', '2.7', '5.7');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '233', '5.5', '2', '45.3', '17.9', '70.4', '9.0', '7.4', '3.5', '1.6', '2.2', '1.4', '2.7', '12.0');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '234', '14.1', '5', '42.2', '35.5', '50.8', '22.2', '11.6', '1.2', '8.8', '3.5', '2.0', '3.5', '12.5');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '235', '21.0', '3', '52.6', '40.4', '85.2', '7.7', '4.2', '5.9', '0.2', '2.7', '2.3', '5.0', '23.4');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '236', '17.7', '8', '48.8', '29.1', '56.7', '20.9', '13.8', '10.2', '4.4', '3.9', '0.7', '1.4', '34.2');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '237', '8.9', '8', '58.7', '49.0', '65.3', '12.7', '11.2', '11.7', '5.1', '2.4', '1.7', '4.4', '17.2');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '238', '23.9', '8', '38.4', '46.1', '87.6', '17.8', '2.9', '6.2', '6.0', '0.3', '2.1', '4.4', '30.5');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '239', '16.4', '8', '27.9', '32.2', '66.0', '20.8', '10.0', '14.0', '1.0', '3.9', '1.3', '4.0', '36.6');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '240', '19.5', '2', '46.5', '15.5', '85.9', '22.6', '10.9', '0.9', '9.7', '1.1', '0.9', '4.0', '13.6');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '241', '0.7', '8', '47.8', '19.4', '53.9', '9.3', '5.3', '6.8', '8.0', '0.2', '1.4', '5.7', '39.2');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '242', '12.4', '7', '30.5', '28.4', '51.7', '16.8', '14.4', '1.9', '9.5', '0.2', '2.4', '1.4', '38.7');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '243', '9.8', '2', '21.8', '36.2', '67.7', '7.4', '7.2', '13.4', '8.7', '3.5', '1.3', '4.4', '19.8');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '244', '16.6', '5', '35.0', '47.8', '65.8', '18.3', '11.5', '8.7', '3.7', '0.5', '1.3', '2.3', '1.4');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '245', '18.0', '8', '44.0', '47.3', '71.1', '13.0', '13.2', '2.7', '4.3', '1.9', '2.7', '3.5', '12.6');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '246', '4.1', '5', '68.2', '35.8', '57.1', '15.6', '12.5', '11.1', '0.4', '3.2', '1.7', '0.3', '23.1');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '247', '9.5', '2', '54.0', '45.3', '69.2', '24.7', '5.6', '0.9', '0.2', '1.5', '0.4', '5.2', '38.5');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '248', '14.7', '8', '58.8', '28.6', '77.8', '5.5', '8.5', '4.0', '9.8', '0.9', '0.2', '4.8', '13.3');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '249', '9.5', '4', '29.3', '20.9', '88.2', '14.2', '2.8', '4.2', '1.9', '3.4', '2.4', '1.0', '2.2');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2020' , '250', '7.6', '2', '65.0', '38.0', '80.9', '11.3', '2.3', '1.2', '4.5', '0.5', '0.0', '3.7', '16.6');



insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2019', '1', '21.0', '3', '52.6', '40.4', '85.2', '7.7', '4.2', '5.9', '0.2', '2.7', '2.3', '5.0', '23.4');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2019', '2', '17.7', '8', '48.8', '29.1', '56.7', '20.9', '13.8', '10.2', '4.4', '3.9', '0.7', '1.4', '34.2');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2019', '3', '8.9', '8', '58.7', '49.0', '65.3', '12.7', '11.2', '11.7', '5.1', '2.4', '1.7', '4.4', '17.2');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2019', '4', '23.9', '8', '38.4', '46.1', '87.6', '17.8', '2.9', '6.2', '6.0', '0.3', '2.1', '4.4', '30.5');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2019', '5', '16.4', '8', '27.9', '32.2', '66.0', '20.8', '10.0', '14.0', '1.0', '3.9', '1.3', '4.0', '36.6');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2019', '6', '19.5', '2', '46.5', '15.5', '85.9', '22.6', '10.9', '0.9', '9.7', '1.1', '0.9', '4.0', '13.6');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2019', '7', '0.7', '8', '47.8', '19.4', '53.9', '9.3', '5.3', '6.8', '8.0', '0.2', '1.4', '5.7', '39.2');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2019', '8', '12.4', '7', '30.5', '28.4', '51.7', '16.8', '14.4', '1.9', '9.5', '0.2', '2.4', '1.4', '38.7');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2019', '9', '9.8', '2', '21.8', '36.2', '67.7', '7.4', '7.2', '13.4', '8.7', '3.5', '1.3', '4.4', '19.8');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2019', '10', '16.6', '5', '35.0', '47.8', '65.8', '18.3', '11.5', '8.7', '3.7', '0.5', '1.3', '2.3', '1.4');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2019', '11', '18.0', '8', '44.0', '47.3', '71.1', '13.0', '13.2', '2.7', '4.3', '1.9', '2.7', '3.5', '12.6');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2019', '12', '4.1', '5', '68.2', '35.8', '57.1', '15.6', '12.5', '11.1', '0.4', '3.2', '1.7', '0.3', '23.1');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2019', '20', '9.5', '2', '54.0', '45.3', '69.2', '24.7', '5.6', '0.9', '0.2', '1.5', '0.4', '5.2', '38.5');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2019', '30', '14.7', '8', '58.8', '28.6', '77.8', '5.5', '8.5', '4.0', '9.8', '0.9', '0.2', '4.8', '13.3');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2019', '40', '9.5', '4', '29.3', '20.9', '88.2', '14.2', '2.8', '4.2', '1.9', '3.4', '2.4', '1.0', '2.2');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2019', '50', '7.6', '2', '65.0', '38.0', '80.9', '11.3', '2.3', '1.2', '4.5', '0.5', '0.0', '3.7', '16.6');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2019', '60', '15.8', '2', '25.8', '47.4', '63.2', '23.9', '0.3', '3.4', '2.2', '2.5', '1.8', '5.2', '9.1');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2019', '70', '9.8', '6', '18.4', '22.7', '83.7', '1.9', '3.0', '13.9', '4.5', '0.7', '1.0', '1.8', '15.7');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2019', '80', '23.9', '3', '48.0', '40.9', '73.8', '10.5', '5.5', '5.6', '4.3', '3.6', '0.8', '3.5', '27.2');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2019', '90', '17.1', '4', '20.3', '25.5', '79.5', '19.2', '9.1', '7.4', '9.7', '3.2', '2.0', '4.4', '7.2');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2019', '100', '4.3', '4', '41.9', '17.6', '58.3', '23.6', '5.1', '5.1', '4.7', '1.0', '2.7', '0.1', '2.9');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2019', '110', '21.4', '6', '22.3', '48.2', '69.0', '1.5', '3.1', '2.7', '7.6', '0.1', '0.1', '5.8', '20.9');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2019', '120', '22.4', '6', '29.6', '41.4', '83.4', '20.2', '12.8', '3.2', '3.4', '1.5', '2.2', '1.7', '35.0');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2019', '130', '23.4', '3', '24.0', '20.5', '64.6', '3.3', '7.8', '13.8', '5.9', '2.9', '0.8', '1.8', '28.3');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2019', '140', '20.0', '4', '43.8', '26.7', '68.1', '5.9', '7.0', '9.2', '2.5', '1.1', '1.0', '5.1', '16.0');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2019', '150', '16.0', '6', '32.5', '35.3', '60.2', '17.1', '2.0', '0.7', '2.7', '4.0', '0.8', '2.2', '38.6');


insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2018', '1', '23.6', '7', '23.2', '25.9', '89.2', '3.1', '2.8', '2.0', '0.5', '0.6', '2.9', '3.4', '10.5');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2018', '2', '14.8', '6', '39.6', '49.1', '66.6', '0.2', '4.0', '13.3', '7.8', '1.2', '3.0', '2.1', '21.7');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2018', '3', '6.1', '5', '35.9', '23.2', '89.2', '15.2', '0.4', '12.3', '8.9', '3.1', '1.1', '4.5', '28.0');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2018', '4', '1.3', '6', '65.7', '40.4', '62.4', '11.3', '5.3', '11.9', '8.2', '1.3', '0.3', '2.8', '10.8');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2018', '5', '4.3', '8', '39.2', '38.3', '85.8', '17.5', '13.3', '11.3', '1.8', '1.0', '2.5', '5.3', '7.2');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2018', '6', '12.7', '6', '60.6', '22.1', '70.0', '16.6', '1.0', '5.2', '9.4', '1.3', '0.7', '6.0', '16.3');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2018', '7', '0.9', '6', '53.2', '15.7', '76.9', '1.5', '6.0', '14.3', '3.7', '2.5', '2.7', '1.4', '25.1');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2018', '8', '0.2', '7', '56.4', '13.4', '74.4', '0.2', '7.3', '0.1', '5.0', '1.6', '0.2', '6.0', '35.0');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2018', '9', '6.2', '6', '23.4', '47.1', '89.0', '22.8', '10.3', '13.5', '9.3', '0.4', '2.8', '2.7', '17.7');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2018', '10', '20.8', '2', '32.8', '31.5', '53.4', '2.6', '2.0', '13.2', '0.2', '0.8', '0.1', '4.6', '12.7');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2018', '11', '20.2', '2', '25.2', '17.3', '65.2', '7.4', '13.8', '11.5', '4.3', '2.2', '2.0', '5.9', '16.0');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2018', '12', '10.8', '5', '42.5', '17.5', '66.1', '21.1', '0.8', '4.1', '7.3', '0.3', '2.4', '1.9', '10.7');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2018', '20', '23.2', '8', '62.6', '38.2', '88.6', '3.2', '2.1', '11.8', '6.6', '2.6', '2.8', '5.4', '15.1');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2018', '30', '22.2', '4', '42.7', '17.0', '87.5', '9.1', '1.5', '4.9', '5.8', '0.1', '1.0', '3.8', '13.7');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2018', '40', '22.3', '3', '31.8', '28.6', '63.1', '3.6', '6.2', '3.9', '0.1', '3.1', '2.6', '5.7', '5.7');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2018', '50', '20.4', '7', '21.2', '39.3', '60.1', '21.6', '2.9', '6.3', '5.7', '2.6', '2.0', '4.8', '25.1');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2018', '60', '7.0', '8', '26.2', '42.5', '61.0', '16.7', '1.6', '9.4', '2.9', '2.6', '1.9', '0.6', '14.0');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2018', '70', '16.4', '6', '36.9', '28.7', '63.4', '24.7', '8.0', '13.2', '8.8', '2.6', '1.3', '5.3', '37.6');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2018', '80', '5.0', '5', '40.5', '45.5', '74.7', '9.0', '2.9', '8.9', '3.1', '2.0', '0.9', '3.4', '13.7');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2018', '90', '15.1', '5', '48.7', '24.9', '70.0', '20.3', '11.2', '0.3', '3.7', '3.8', '2.7', '3.8', '7.9');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2018', '100', '22.4', '7', '41.8', '31.7', '78.1', '0.6', '5.1', '5.2', '6.8', '1.7', '1.5', '5.0', '9.5');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2018', '110', '9.1', '4', '68.7', '23.3', '76.5', '4.5', '10.8', '1.9', '4.7', '2.1', '2.3', '0.5', '24.1');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2018', '120', '17.6', '6', '19.9', '14.7', '63.3', '22.2', '12.7', '4.6', '2.9', '0.9', '1.4', '3.0', '32.6');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2018', '130', '4.9', '7', '20.6', '24.1', '68.7', '17.1', '6.2', '6.7', '2.1', '3.6', '2.1', '0.1', '39.8');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2018', '140', '19.5', '2', '44.9', '39.5', '51.5', '6.8', '12.3', '1.2', '6.3', '2.8', '0.4', '5.5', '26.3');
insert into Player_Statistics (  Year, Player_ID, PPG, GAMESPLAYED, 2PM_A, 3PM_A, FTM_A, REBS, DREBS, OREBS, AST, BLK, STL, TO_PER_GAME, MPG) values ( '2018', '150', '20.5', '6', '56.5', '29.4', '73.4', '0.9', '5.1', '6.7', '2.9', '1.6', '1.3', '2.7', '37.0');



insert into Team (Division, AFM, Name, Founded, Location, Owner, Colors, President) values ('Α', '1', 'Παναχαϊκή', '5-2-1975', 'Πάτρα', 'Γεώργιος Καλαμπόκης', 'Turquoise', 'Sigfried Brindley');
insert into Team (Division, AFM, Name, Founded, Location, Owner, Colors, President) values ('Γ', '2', 'Αχαϊκή', '1-31-1999', 'Πάτρα', 'Δημήτριος Γιαννόπουλος ', 'Goldenrod', 'Carolina Barrie');
insert into Team (Division, AFM, Name, Founded, Location, Owner, Colors, President) values ('Α', '3', 'Οβρϋά', '8-3-1980', 'Οβρυά', 'Κώστας Κωστόπουλος', 'Red', 'Devon Ramirez');
insert into Team (Division, AFM, Name, Founded, Location, Owner, Colors, President) values ('Β', '4', 'Πανεπιστήμιο Πατρών', '12-5-2000', 'Πανεπιστήμιο Πάτρας', 'Lora Bernholt', 'Aquamarine', 'Lora Huxton');
insert into Team (Division, AFM, Name, Founded, Location, Owner, Colors, President) values ('Β', '5', 'ΕΑΠ', '9-2-1960', 'Νόρμαν', 'Χαράλαμπος Χαραλαμπόπουλος', 'Green', 'Anatol Clapson');
insert into Team (Division, AFM, Name, Founded, Location, Owner, Colors, President) values ('Α', '6', 'Ηρακλής Πατρών', '11-2-2005', 'Ζαρουχλέϊκα', 'Παναγιώτης Βασιλάκος', 'Fuscia', 'Bendick Micah');
insert into Team (Division, AFM, Name, Founded, Location, Owner, Colors, President) values ('Γ', '7', 'Ολυμπιακός Πατρών', '1-8-2005', 'Πάτρα', 'Κωνσταντινος Β��ρθαλίτης', 'Indigo', 'Albertine Leall');
insert into Team (Division, AFM, Name, Founded, Location, Owner, Colors, President) values ('Α', '8', 'Παναθηναϊκός Πατρών', '12-9-2001', 'Πάτρα', 'Μιχαήλ Ιορδάνης', 'Red', 'Ashli Blackden');
insert into Team (Division, AFM, Name, Founded, Location, Owner, Colors, President) values ('Α', '9', 'Πάοκ Πατρών', '3-5-1965', 'Πάτρα', 'Νίκος Γκάλης', 'Mauv', 'Yorgo Ablewhite');
insert into Team (Division, AFM, Name, Founded, Location, Owner, Colors, President) values ('Γ', '10', 'Άεκ Πατρών', '11-3-1965', 'Πάτρα', 'Θεώδορος Παπαλουκάς', 'Indigo', 'Pascale Scripps');
insert into Team (Division, AFM, Name, Founded, Location, Owner, Colors, President) values ('Β', '11', 'Προμηθέας Β', '10-21-1989', 'Αμπελόκηπους', 'Πέτρος Γλαυκής', 'Blue', 'Shaun Mulryan');
insert into Team (Division, AFM, Name, Founded, Location, Owner, Colors, President) values ('Γ', '12', 'Δρομέας', '1-30-1996', 'Μιτιλόγλη', 'Αχιλλέας Πετρόπουλος', 'Purple', 'Micki Pogue');
insert into Team (Division, AFM, Name, Founded, Location, Owner, Colors, President) values ('Α', '13', 'Αετός', '3-6-1996', 'Γλαύκος', 'Μαρία Συναντζάκη', 'Aquamarine', 'Doretta Qualtrough');
insert into Team (Division, AFM, Name, Founded, Location, Owner, Colors, President) values ('Α', '14', 'Πατίστας', '3-17-1992', 'Πάτρα', 'Δημήτρης Λαρόσκου', 'Purple', 'Tulley Warnock');
insert into Team (Division, AFM, Name, Founded, Location, Owner, Colors, President) values ('Β', '15', 'Βραχνέικα', '1-21-1984', 'Βραχνέϊκα', 'Νικόλαος Παπαμιχαλής', 'Violet', 'Iosep McGlynn');
insert into Team (Division, AFM, Name, Founded, Location, Owner, Colors, President) values ('Β', '16', 'Αίγιο', '7-13-1974', 'Αίγιο', 'Σωτήριος Χιμένεζ', 'Red', 'Gustavo Rospars');
insert into Team (Division, AFM, Name, Founded, Location, Owner, Colors, President) values ('Β', '17', 'Καλάβρυτα', '9-10-1976', 'Καλάβρυτα', 'Αλέκα Παπαρηγοπούλου', 'Maroon', 'Cort Grisedale');
insert into Team (Division, AFM, Name, Founded, Location, Owner, Colors, President) values ('Α', '18', 'Διογένης', '10-25-1987', 'Πάτρα', 'Κωνσταντίνος Μητσοτακόπουλος', 'Teal', 'Obie Keirle');
insert into Team (Division, AFM, Name, Founded, Location, Owner, Colors, President) values ('Γ', '19', 'Εργοτέλης Πατρών', '10-28-1987', 'Πάτρα', 'Αλέξανδρος Τσιπρακίδης', 'Fuscia', 'Wandie Padula');
insert into Team (Division, AFM, Name, Founded, Location, Owner, Colors, President) values ('Γ', '20', 'Αγυά', '3-1-2010', 'Αγυά', 'Ειρήνη Μοσχολιού', 'Teal', 'Jerald Cornall');
insert into Team (Division, AFM, Name, Founded, Location, Owner, Colors, President) values ('Β', '21', 'Μιτιλόγλη', '12-4-1990', 'Μιτιλόγλη', 'Κωνσταντίνος Κατακουζινός', 'Purple', 'Delinda Dukes');
insert into Team (Division, AFM, Name, Founded, Location, Owner, Colors, President) values ('Β', '22', 'Θησέας', '1-18-1987', 'Πάτρα', 'Γεώργιος Αλέφαντος', 'Aquamarine', 'Berty Willishire');
insert into Team (Division, AFM, Name, Founded, Location, Owner, Colors, President) values ('Γ', '23', 'Ακάδημος', '1-5-1983', 'Κιάτο', 'Νίκος Κούκος', 'Blue', 'Britta Macewan');
insert into Team (Division, AFM, Name, Founded, Location, Owner, Colors, President) values ('Γ', '24', 'Ίκαρος Πατρών', '10-9-1992', 'Πάτρα', 'Δήμητρης Γιαννακόπουλος', 'Crimson', 'Claudio Morling');



insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('9692', '1', 'Παναχαϊκή', 'PG', '1-25-2016', '2-28-2027', '€1731,75');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('7054', '2', 'Παναχαϊκή', 'PG', '11-9-2016', '5-30-2023', '€426,32');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('2571', '3', 'Παναχαϊκή', 'SG', '4-5-2016', '1-14-2022', '€2571,28');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('4748', '4', 'Παναχαϊκή', 'SG', '7-22-2016', '12-9-2023', '€4594,26');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('1679', '5', 'Παναχαϊκή', 'SF', '11-11-2011', '8-25-2021', '€2289,78');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('4353', '6', 'Παναχαϊκή', 'SF', '3-9-2015', '7-26-2021', '€367,26');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('4738', '7', 'Παναχαϊκή', 'F', '11-10-2018', '2-15-2023', '€1270,21');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('9248', '8', 'Παναχαϊκή', 'F', '12-5-2020', '12-7-2027', '€1753,35');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('7549', '9', 'Παναχαϊκή', 'C', '10-20-2016', '11-4-2026', '€483,83');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('9417', '10', 'Παναχαϊκή', 'C', '6-23-2017', '6-23-2024', '€1367,98');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('5008', '11', 'Προμηθέας Β', 'PG', '3-22-2010', '8-15-2022', '€359,83');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('1641', '12', 'Προμηθέας Β', 'PG', '12-11-2014', '11-25-2024', '€1321,34');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('5124', '13', 'Προμηθέας Β', 'SG', '9-9-2016', '4-24-2023', '€3569,51');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('1704', '14', 'Προμηθέας Β', 'SG', '10-27-2015', '7-30-2021', '€4383,86');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('3768', '15', 'Αχαϊκή', 'PG', '2-19-2016', '11-20-2021', '€3355,94');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('3370', '16', 'Αχαϊκή', 'SG', '3-22-2012', '3-8-2022', '€1504,16');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('8359', '17', 'Αχαϊκή', 'SG', '2-11-2018', '11-18-2025', '€2073,70');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('8827', '18', 'Αχαϊκή', 'SF', '8-19-2020', '3-19-2024', '€1912,91');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('7181', '19', 'Αχαϊκή', 'SF', '12-6-2015', '9-22-2025', '€3786,28');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('8584', '20', 'Αχαϊκή', 'F', '11-19-2019', '11-18-2023', '€931,67');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('4340', '21', 'Αχαϊκή', 'F', '7-19-2016', '12-30-2022', '€3868,50');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('9313', '22', 'Αχαϊκή', 'C', '8-30-2018', '2-9-2024', '€1655,66');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('4260', '23', 'Αχαϊκή', 'C', '12-29-2019', '7-8-2027', '€4685,71');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('6903', '24', 'Αχαϊκή', 'PG', '3-25-2015', '2-10-2021', '€4090,13');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('4363', '25', 'Προμηθέας Β', 'SF', '6-8-2016', '2-19-2024', '€1492,28');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('3652', '26', 'Προμηθέας Β', 'SF', '9-4-2020', '9-23-2025', '€802,00');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('2627', '27', 'Οβρϋά', 'SG', '1-16-2014', '5-2-2024', '€3666,33');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('8909', '28', 'Οβρϋά', 'SG', '8-3-2012', '4-16-2021', '€2210,54');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('2360', '29', 'Οβρϋά', 'SF', '3-27-2015', '6-1-2022', '€730,17');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('7384', '30', 'Οβρϋά', 'SF', '1-18-2019', '8-8-2022', '€3474,50');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('9522', '31', 'Οβρϋά', 'F', '12-30-2020', '5-13-2023', '€2216,36');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('6824', '32', 'Οβρϋά', 'F', '9-24-2014', '5-8-2022', '€3509,89');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('3618', '33', 'Οβρϋά', 'C', '4-11-2017', '11-11-2023', '€4806,73');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('7284', '34', 'Οβρϋά', 'C', '10-2-2011', '4-20-2025', '€2274,39');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('9196', '35', 'Οβρϋά', 'PG', '3-2-2016', '12-18-2024', '€428,13');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('2532', '36', 'Οβρϋά', 'PG', '1-3-2015', '7-6-2024', '€3317,83');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('7553', '37', 'Προμηθέας Β', 'F', '9-2-2015', '11-22-2023', '€2747,76');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('8337', '38', 'Προμηθέας Β', 'F', '8-12-2015', '8-19-2025', '€1861,31');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('8396', '39', 'Μιτιλόγλη', 'SG', '12-3-2016', '11-10-2021', '€1320,58');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('7492', '40', 'Μιτιλόγλη', 'SG', '8-19-2014', '5-3-2025', '€2394,12');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('4872', '41', 'Μιτιλόγλη', 'SF', '11-29-2012', '7-14-2022', '€3048,02');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('9599', '42', 'Μιτιλόγλη', 'SF', '10-18-2013', '10-1-2023', '€2168,49');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('6215', '43', 'Μιτιλόγλη', 'F', '11-5-2016', '12-21-2025', '€523,81');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('4688', '44', 'Μιτιλόγλη', 'F', '12-13-2017', '6-14-2022', '€1826,25');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('2470', '45', 'Μιτιλόγλη', 'C', '1-3-2015', '12-9-2025', '€2644,28');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('2932', '46', 'Μιτιλόγλη', 'C', '2-22-2014', '10-27-2022', '€4313,73');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('5140', '47', 'Μιτιλόγλη', 'PG', '6-28-2014', '3-13-2023', '€3593,73');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('5267', '48', 'Μιτιλόγλη', 'PG', '5-13-2012', '5-19-2026', '€4253,72');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('1217', '49', 'Προμηθέας Β', 'C', '8-6-2016', '3-31-2021', '€1962,71');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('2234', '50', 'Προμηθέας Β', 'C', '8-11-2017', '8-7-2024', '€1210,66');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('5091', '51', 'Βραχνέικα', 'SG', '3-10-2018', '3-21-2026', '€1686,46');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('4605', '52', 'Βραχνέικα', 'SG', '2-8-2015', '11-10-2021', '€1469,11');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('6867', '53', 'Βραχνέικα', 'SG', '4-21-2019', '3-22-2021', '€1912,88');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('4513', '54', 'Βραχνέικα', 'SF', '9-25-2019', '6-29-2022', '€4872,94');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('6952', '55', 'Βραχνέικα', 'SF', '1-5-2016', '7-3-2023', '€2349,93');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('6627', '56', 'Βραχνέικα', 'SF', '4-9-2014', '1-5-2023', '€1998,85');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('9890', '57', 'Βραχνέικα', 'F', '4-10-2020', '10-1-2023', '€2961,98');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('7781', '58', 'Βραχνέικα', 'F', '5-28-2019', '5-19-2021', '€473,63');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('9262', '59', 'Βραχνέικα', 'C', '6-9-2019', '3-23-2022', '€3098,51');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('3940', '60', 'Βραχνέικα', 'C', '4-18-2017', '9-9-2025', '€3517,56');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('9708', '61', 'Εργοτέλης Πατρών', 'PG', '7-19-2018', '8-22-2024', '€3627,10');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('9234', '62', 'Εργοτέλης Πατρών', 'PG', '8-14-2020', '12-19-2023', '€4897,64');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('2806', '63', 'Αετός', 'SG', '3-24-2018', '2-25-2024', '€4911,00');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('9637', '64', 'Αετός', 'SG', '6-22-2018', '8-21-2021', '€4692,58');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('4121', '65', 'Αετός', 'SF', '3-26-2017', '11-12-2022', '€4483,85');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('3191', '66', 'Αετός', 'SF', '2-11-2017', '4-23-2022', '€152,68');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('9429', '67', 'Αετός', 'SF', '8-13-2019', '12-13-2023', '€1096,70');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('9638', '68', 'Αετός', 'F', '12-3-2015', '12-9-2023', '€1168,47');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('3880', '69', 'Αετός', 'F', '1-19-2020', '1-30-2024', '€4665,66');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('5995', '70', 'Αετός', 'C', '12-29-2016', '12-7-2021', '€361,24');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('4676', '71', 'Αετός', 'C', '10-22-2018', '12-6-2022', '€1228,01');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('2976', '72', 'Αετός', 'SG', '3-17-2019', '9-25-2022', '€1817,57');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('2148', '73', 'Εργοτέλης Πατρών', 'SG', '2-26-2018', '3-11-2025', '€1062,64');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('1477', '74', 'Εργοτέλης Πατρών', 'SG', '3-5-2015', '6-9-2021', '€1572,48');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('5029', '75', 'Ακάδημος', 'SG', '11-9-2020', '8-29-2027', '€1216,85');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('1668', '76', 'Ακάδημος', 'SG', '12-28-2016', '12-22-2022', '€4527,98');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('5524', '77', 'Ακάδημος', 'PG', '4-10-2019', '8-21-2023', '€2424,68');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('8889', '78', 'Ακάδημος', 'SF', '5-11-2013', '9-15-2026', '€373,43');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('2601', '79', 'Ακάδημος', 'SF', '7-9-2017', '10-15-2021', '€4503,28');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('5188', '80', 'Ακάδημος', 'F', '12-4-2018', '11-20-2025', '€3805,48');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('8303', '81', 'Ακάδημος', 'F', '11-9-2018', '11-12-2020', '€1602,53');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('5289', '82', 'Ακάδημος', 'F', '11-13-2019', '4-2-2020', '€1533,27');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('5127', '83', 'Ακάδημος', 'C', '11-1-2020', '5-8-2026', '€1549,59');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('9366', '84', 'Ακάδημος', 'C', '9-12-2018', '6-5-2021', '€376,34');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('4665', '85', 'Εργοτέλης Πατρών', 'SF', '7-10-2019', '5-4-2025', '€3372,30');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('8203', '86', 'Εργοτέλης Πατρών', 'SF', '10-28-2017', '2-25-2023', '€1218,10');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('5547', '87', 'Παναθηναϊκός Πατρών', 'SG', '8-4-2020', '7-25-2023', '€325,48');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('8340', '88', 'Παναθηναϊκός Πατρών', 'SG', '5-16-2018', '6-28-2024', '€1150,88');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('5016', '89', 'Παναθηναϊκός Πατρών', 'SG', '2-19-2019', '12-21-2024', '€755,43');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('9450', '90', 'Παναθηναϊκός Πατρών', 'SF', '6-23-2014', '12-19-2025', '€4804,01');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('7855', '91', 'Παναθηναϊκός Πατρών', 'SF', '1-27-2017', '6-22-2021', '€3696,46');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('3903', '92', 'Παναθηναϊκός Πατρών', 'F', '2-3-2017', '4-24-2022', '€4058,99');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('3134', '93', 'Παναθηναϊκός Πατρών', 'F', '2-14-2019', '1-10-2022', '€1943,70');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('8881', '94', 'Παναθηναϊκός Πατρών', 'C', '8-29-2018', '5-5-2023', '€4529,88');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('2260', '95', 'Παναθηναϊκός Πατρών', 'C', '12-7-2017', '10-10-2022', '€2376,11');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('5387', '96', 'Παναθηναϊκός Πατρών', 'C', '2-26-2018', '5-4-2021', '€1013,93');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('7444', '97', 'Παοκ Πατρών', 'PG', '1-9-2019', '5-18-2027', '€1158,68');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('4622', '98', 'Παοκ Πατρών', 'PG', '12-14-2014', '4-1-2025', '€1327,20');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('6941', '99', 'Παοκ Πατρών', 'SG', '9-20-2013', '7-18-2021', '€260,06');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('6029', '100', 'Παοκ Πατρών', 'SG', '5-20-2011', '6-25-2027', '€4126,81');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('6432', '101', 'Παοκ Πατρών', 'SF', '5-31-2016', '11-25-2023', '€144,55');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('1176', '102', 'Παοκ Πατρών', 'SF', '6-14-2019', '5-4-2023', '€3786,98');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('9912', '103', 'Παοκ Πατρών', 'F', '10-27-2015', '4-11-2023', '€4411,07');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('4804', '104', 'Παοκ Πατρών', 'F', '10-14-2016', '2-18-2024', '€1334,46');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('6797', '105', 'Παοκ Πατρών', 'C', '6-4-2018', '3-6-2025', '€4921,90');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('4593', '106', 'Παοκ Πατρών', 'C', '7-9-2012', '12-20-2024', '€3818,06');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('8370', '107', 'Αεκ Πατρών', 'PG', '11-1-2012', '2-7-2022', '€3247,02');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('6782', '108', 'Αεκ Πατρών', 'PG', '5-28-2019', '11-23-2023', '€4581,49');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('2535', '109', 'Αεκ Πατρών', 'SG', '10-23-2013', '7-27-2021', '€1072,55');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('6795', '110', 'Αεκ Πατρών', 'SG', '10-10-2012', '1-19-2023', '€587,17');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('4691', '111', 'Αεκ Πατρών', 'SF', '7-15-2018', '11-4-2023', '€1791,07');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('8624', '112', 'Αεκ Πατρών', 'SF', '8-6-2018', '1-9-2021', '€176,06');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('6795', '113', 'Αεκ Πατρών', 'F', '6-13-2015', '7-4-2022', '€2813,37');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('1890', '114', 'Αεκ Πατρών', 'F', '4-16-2017', '4-11-2027', '€2270,64');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('7426', '115', 'Αεκ Πατρών', 'C', '9-20-2012', '11-6-2024', '€2899,88');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('1921', '116', 'Αεκ Πατρών', 'C', '3-27-2012', '3-21-2021', '€2272,88');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('7661', '117', 'Ολυμπιακός Πατρών', 'PG', '8-6-2011', '3-27-2023', '€2898,89');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('8250', '118', 'Ολυμπιακός Πατρών', 'PG', '3-12-2012', '4-16-2024', '€4766,36');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('8358', '119', 'Ολυμπιακός Πατρών', 'SG', '5-13-2010', '11-28-2022', '€4076,98');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('5870', '120', 'Ολυμπιακός Πατρών', 'SG', '6-14-2011', '9-3-2024', '€1202,27');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('2290', '121', 'Ολυμπιακός Πατρών', 'SF', '7-2-2012', '10-19-2022', '€4979,77');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('7625', '122', 'Ολυμπιακός Πατρών', 'SF', '12-22-2011', '1-15-2023', '€4129,71');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('6121', '123', 'Ολυμπιακός Πατρών', 'F', '3-2-2014', '4-18-2021', '€2462,20');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('7042', '124', 'Ολυμπιακός Πατρών', 'F', '4-23-2013', '8-26-2022', '€770,27');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('6231', '125', 'Ολυμπιακός Πατρών', 'C', '8-9-2014', '4-28-2022', '€707,93');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('6788', '126', 'Ολυμπιακός Πατρών', 'C', '7-7-2014', '6-8-2024', '€424,38');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('1139', '127', 'Καλάβρυτα', 'PG', '2-20-2016', '12-19-2023', '€4248,25');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('5301', '128', 'Καλάβρυτα', 'PG', '3-5-2017', '9-9-2022', '€1822,97');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('5848', '129', 'Καλάβρυτα', 'SG', '10-5-2016', '4-22-2026', '€151,93');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('1902', '130', 'Καλάβρυτα', 'SG', '7-9-2014', '5-16-2023', '€1971,00');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('2407', '131', 'Καλάβρυτα', 'SF', '10-8-2015', '8-5-2022', '€2896,27');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('5432', '132', 'Καλάβρυτα', 'SF', '5-12-2014', '5-16-2022', '€112,73');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('5982', '133', 'Καλάβρυτα', 'F', '12-8-2011', '8-11-2023', '€1060,90');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('7179', '134', 'Καλάβρυτα', 'F', '5-15-2013', '7-24-2025', '€4198,96');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('4605', '135', 'Καλάβρυτα', 'C', '7-18-2013', '10-9-2022', '€1410,73');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('1228', '136', 'Καλάβρυτα', 'C', '11-23-2015', '2-11-2023', '€1069,71');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('6537', '137', 'Πατίστας', 'PG', '12-18-2011', '4-5-2022', '€461,25');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('8895', '138', 'Πατίστας', 'PG', '8-26-2014', '3-4-20024', '€4729,03');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('6786', '139', 'Πατίστας', 'SG', '6-9-2017', '2-17-2022', '€2712,42');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('6051', '140', 'Πατίστας', 'SG', '4-27-2015', '3-14-2022', '€3903,35');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('4867', '141', 'Πατίστας', 'SF', '11-5-2013', '1-26-2022', '€2139,58');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('4106', '142', 'Πατίστας', 'SF', '7-23-2014', '9-20-2022', '€2650,90');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('3875', '143', 'Πατίστας', 'F', '11-3-2017', '9-14-2024', '€2627,91');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('3335', '144', 'Πατίστας', 'F', '1-6-2015', '2-13-2022', '€249,05');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('5023', '145', 'Πατίστας', 'C', '5-5-2015', '11-3-2024', '€221,85');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('9742', '146', 'Πατίστας', 'C', '12-30-2017', '10-20-2023', '€4770,45');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('4004', '147', 'Δρομέας', 'PG', '12-16-2014', '9-2-2025', '€1905,42');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('7638', '148', 'Δρομέας', 'PG', '6-9-2017', '10-8-2022', '€2018,59');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('8935', '149', 'Δρομέας', 'SG', '11-1-2019', '8-5-2024', '€1035,88');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('4703', '150', 'Δρομέας', 'SG', '4-22-2016', '6-6-2025', '€2810,57');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('7239', '151', 'Δρομέας', 'SF', '7-23-2017', '12-27-2021', '€4650,97');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('8988', '152', 'Δρομέας', 'SF', '6-21-2012', '2-23-2023', '€4098,96');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('7421', '153', 'Δρομέας', 'F', '12-22-2018', '1-16-2026', '€4881,91');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('9481', '154', 'Δρομέας', 'F', '8-14-2018', '5-11-2022', '€4538,25');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('5582', '155', 'Δρομέας', 'C', '2-2-2019', '8-27-2022', '€3701,53');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('6933', '156', 'Δρομέας', 'C', '6-20-2016', '3-2-2023', '€1393,73');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('8850', '157', 'ΕΑΠ', 'PG', '8-23-2019', '4-26-2025', '€3274,09');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('8805', '158', 'ΕΑΠ', 'PG', '6-7-2016', '7-16-2025', '€479,11');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('3856', '159', 'ΕΑΠ', 'SG', '5-6-2019', '11-22-2023', '€1156,79');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('5183', '160', 'ΕΑΠ', 'SG', '6-15-2017', '10-9-2022', '€1799,33');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('2908', '161', 'ΕΑΠ', 'SF', '10-18-2020', '1-19-2025', '€1241,14');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('1783', '162', 'ΕΑΠ', 'SF', '12-18-2011', '8-10-2025', '€642,70');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('6395', '163', 'ΕΑΠ', 'F', '1-14-2018', '10-25-2022', '€679,52');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('2602', '164', 'ΕΑΠ', 'F', '7-13-2018', '12-17-2022', '€2809,04');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('5808', '165', 'ΕΑΠ', 'C', '12-11-2020', '5-26-2022', '€4613,11');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('4821', '166', 'ΕΑΠ', 'C', '2-2-2013', '8-20-2023', '€1527,44');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('4383', '167', 'Ηρακλής Πατρών', 'PG', '9-12-2018', '3-2-2024', '€353,66');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('8283', '168', 'Ηρακλής Πατρών', 'PG', '7-6-2019', '12-15-2024', '€3066,13');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('2922', '169', 'Ηρακλής Πατρών', 'SG', '11-5-2015', '1-23-2023', '€1490,71');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('5666', '170', 'Ηρακλής Πατρών', 'SG', '3-25-2016', '3-8-2023', '€2725,13');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('3730', '171', 'Ηρακλής Πατρών', 'SF', '12-23-2012', '11-22-2026', '€2075,10');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('8813', '172', 'Ηρακλής Πατρών', 'SF', '1-26-2016', '6-18-2022', '€1563,39');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('2237', '173', 'Ηρακλής Πατρών', 'F', '10-2-2020', '11-6-2025', '€2167,01');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('7638', '174', 'Ηρακλής Πατρών', 'F', '1-31-2013', '4-27-2022', '€460,21');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('6537', '175', 'Ηρακλής Πατρών', 'C', '11-12-2014', '1-5-2025', '€1559,17');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('2659', '176', 'Ηρακλής Πατρών', 'C', '5-5-2016', '10-26-2024', '€1582,36');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('1412', '177', 'Διογένης', 'PG', '9-18-2012', '4-22-2023', '€3744,50');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('9961', '178', 'Διογένης', 'PG', '2-4-2020', '1-4-2022', '€3454,04');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('6842', '179', 'Διογένης', 'SG', '7-17-2019', '12-25-2022', '€1736,45');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('3813', '180', 'Διογένης', 'SG', '5-18-2016', '5-14-2023', '€3123,18');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('1002', '181', 'Διογένης', 'SF', '9-5-2017', '4-8-2025', '€2638,53');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('3218', '182', 'Διογένης', 'SF', '1-13-2016', '5-2-2023', '€1982,33');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('2602', '183', 'Διογένης', 'F', '12-17-2019', '8-29-2027', '€1599,46');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('8719', '184', 'Διογένης', 'F', '11-19-2015', '11-22-2025', '€3220,29');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('8884', '185', 'Διογένης', 'C', '8-2-2015', '11-29-2022', '€3407,52');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('9679', '186', 'Διογένης', 'C', '9-27-2016', '5-18-2024', '€218,72');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('3226', '187', 'Αγυά', 'PG', '5-16-2015', '10-24-2023', '€2702,65');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('6721', '188', 'Αγυά', 'PG', '3-14-2016', '1-11-2022', '€241,29');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('7724', '189', 'Αγυά', 'SG', '12-11-2018', '2-6-2022', '€4952,18');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('3928', '190', 'Αγυά', 'SG', '1-5-2016', '5-7-2023', '€2808,99');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('7003', '191', 'Αγυά', 'SF', '8-2-2020', '12-25-2026', '€2369,32');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('3687', '192', 'Αγυά', 'SF', '9-21-2015', '2-2-2024', '€4109,74');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('7955', '193', 'Αγυά', 'F', '3-22-2016', '11-8-2025', '€2415,59');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('2924', '194', 'Αγυά', 'F', '12-16-2015', '3-8-2025', '€178,08');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('3214', '195', 'Αγυά', 'C', '4-30-2019', '3-24-2023', '€4960,83');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('6483', '196', 'Αγυά', 'C', '12-31-2017', '7-10-2025', '€4347,34');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('8727', '197', 'Αίγιο', 'PG', '3-14-2018', '9-5-2023', '€4968,40');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('3103', '198', 'Αίγιο', 'PG', '6-3-2016', '3-25-2022', '€3513,11');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('4835', '199', 'Αίγιο', 'SG', '5-1-2018', '1-6-2023', '€3547,68');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('7291', '200', 'Αίγιο', 'SG', '4-25-2019', '2-1-2024', '€3790,49');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('1760', '201', 'Αίγιο', 'SF', '1-31-2019', '3-13-2023', '€2525,37');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('8534', '202', 'Αίγιο', 'SF', '8-18-2018', '8-24-2024', '€4975,22');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('2542', '203', 'Αίγιο', 'F', '5-4-2016', '10-13-2022', '€1278,50');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('4483', '204', 'Αίγιο', 'F', '4-24-2017', '11-7-2025', '€3953,82');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('8374', '205', 'Αίγιο', 'C', '5-22-2017', '8-7-2022', '€1197,64');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('2096', '206', 'Αίγιο', 'C', '3-12-2019', '11-4-2022', '€3916,41');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('3429', '207', 'Ίκαρος Πατρών', 'PG', '10-29-2015', '2-25-2023', '€2765,50');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('5865', '208', 'Ίκαρος Πατρών', 'PG', '10-31-2013', '3-22-2025', '€249,20');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('6856', '209', 'Ίκαρος Πατρών', 'SG', '1-8-2013', '4-25-2022', '€2739,87');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('2756', '210', 'Ίκαρος Πατρών', 'SG', '2-26-2014', '11-1-2024', '€268,27');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('6833', '211', 'Ίκαρος Πατρών', 'SF', '4-14-2016', '1-4-2024', '€4781,17');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('3267', '212', 'Ίκαρος Πατρών', 'SF', '2-14-2017', '4-12-2022', '€3218,09');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('3760', '213', 'Ίκαρος Πατρών', 'F', '8-23-2018', '5-24-2023', '€4180,32');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('2193', '214', 'Ίκαρος Πατρών', 'F', '8-23-2018', '6-26-2024', '€1785,87');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('9861', '215', 'Ίκαρος Πατρών', 'C', '11-2-2014', '2-5-2024', '€2361,44');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('5564', '216', 'Ίκαρος Πατρών', 'C', '3-22-2017', '4-28-2022', '€2893,18');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('4988', '217', 'Παναθηναϊκός Πατρών', 'PG', '8-2-2018', '5-10-2025', '€1102,17');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('3791', '218', 'Παναθηναϊκός Πατρών', 'PG', '2-12-2017', '5-29-2024', '€1852,03');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('4909', '219', 'Παναθηναϊκός Πατρών', 'SG', '2-16-2018', '7-22-2025', '€1397,68');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('1239', '220', 'Παναθηναϊκός Πατρών', 'SG', '9-7-2015', '11-30-2024', '€1380,01');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('2658', '221', 'Παναθηναϊκός Πατρών', 'SF', '10-13-2015', '12-29-2025', '€3421,30');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('5683', '222', 'Παναθηναϊκός Πατρών', 'SF', '12-30-2018', '8-14-2022', '€2882,71');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('3575', '223', 'Παναθηναϊκός Πατρών', 'F', '11-29-2019', '5-11-2022', '€4653,99');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('9457', '224', 'Παναθηναϊκός Πατρών', 'F', '4-22-2020', '11-5-2023', '€4753,29');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('4817', '225', 'Παναθηναϊκός Πατρών', 'C', '6-24-2016', '2-12-2024', '€2873,36');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('9492', '226', 'Παναθηναϊκός Πατρών', 'C', '1-27-2016', '12-4-2022', '€3143,09');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('4230', '227', 'Εργοτέλης Πατρών', 'F', '11-21-2013', '3-21-2022', '€3172,93');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('5230', '228', 'Εργοτέλης Πατρών', 'F', '2-18-2018', '5-8-2025', '€4331,84');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('4897', '229', 'Εργοτέλης Πατρών', 'C', '5-12-2016', '3-31-2025', '€4669,20');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('5746', '230', 'Εργοτέλης Πατρών', 'C', '11-29-2016', '10-26-2024', '€1043,82');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('1991', '231', 'Θησέας', 'PG', '1-14-2015', '1-28-2023', '€1420,66');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('4175', '232', 'Θησέας', 'PG', '11-18-2016', '11-16-2023', '€1914,57');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('6034', '233', 'Θησέας', 'SG', '3-2-2019', '6-14-2023', '€3330,09');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('8274', '234', 'Θησέας', 'SG', '11-6-2015', '4-3-2026', '€472,24');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('6079', '235', 'Θησέας', 'SF', '6-20-2015', '2-3-2025', '€1594,16');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('9685', '236', 'Θησέας', 'SF', '5-7-2016', '8-9-2024', '€1791,99');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('4550', '237', 'Θησέας', 'F', '9-25-2017', '6-19-2025', '€3621,20');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('3443', '238', 'Θησέας', 'F', '7-14-2018', '11-22-2023', '€4436,15');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('5286', '239', 'Θησέας', 'C', '8-12-2018', '1-9-2024', '€998,79');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('9319', '240', 'Θησέας', 'C', '10-16-2020', '12-18-2022', '€1240,97');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('4253', '241', 'Πανεπιστήμιο Πατρών', 'PG', '1-4-2018', '12-28-2023', '€1731,21');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('8681', '242', 'Πανεπιστήμιο Πατρών', 'PG', '8-10-2013', '9-29-2024', '€1568,52');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('2102', '243', 'Πανεπιστήμιο Πατρών', 'SG', '3-23-2018', '10-20-2024', '€4877,04');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('4710', '244', 'Πανεπιστήμιο Πατρών', 'SG', '6-29-2019', '12-19-2024', '€3948,63');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('8084', '245', 'Πανεπιστήμιο Πατρών', 'SF', '8-16-2017', '6-6-2023', '€3275,74');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('5748', '246', 'Πανεπιστήμιο Πατρών', 'SF', '8-24-2017', '5-27-2023', '€4299,69');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('5297', '247', 'Πανεπιστήμιο Πατρών', 'F', '8-23-2017', '10-22-2024', '€3077,45');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('1758', '248', 'Πανεπιστήμιο Πατρών', 'F', '3-30-2017', '11-9-2023', '€2028,50');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('8715', '249', 'Πανεπιστήμιο Πατρών', 'C', '5-21-2016', '4-18-2023', '€3501,60');
insert into Player_Career (Player_contract_ID, Player_ID, Team, Player_position, Contract_starting_Date, Contract_expire_Date, Total_earnings) values ('9161', '250', 'Πανεπιστήμιο Πατρών', 'C', '4-7-2017', '8-22-2024', '€1236,90');




insert into Stadium (Stadium_ID, manufacturing_date, surface, Owner, Address, Location, Name, Capacity) values ('1', '1-25-1980', 'Παρκέ', 'Idalina Hammill', 'Γεωργίου 80', 'Πάτρα', 'Παμπελλοπονησιακό', '703');
insert into Stadium (Stadium_ID, manufacturing_date, surface, Owner, Address, Location, Name, Capacity) values ('2', '4-19-1997', 'Παρκέ', 'Davie Thormwell', 'Υψηλάντου 49', 'Πάτρα', 'ΕΑΠ', '2911');
insert into Stadium (Stadium_ID, manufacturing_date, surface, Owner, Address, Location, Name, Capacity) values ('3', '6-1-1962', 'Παρκέ', 'Evita Wigginton', 'Κορίνθου 50', 'Πάτρα', 'Παναχαϊκής', '1400');
insert into Stadium (Stadium_ID, manufacturing_date, surface, Owner, Address, Location, Name, Capacity) values ('4', '10-13-2005', 'Παρκέ', 'Lusa Nowick', 'Πλησίον 1ου Λυκείου', 'Οβρϋά', 'Δημοτικό Στάδιο Οβρϋάς', '2538');
insert into Stadium (Stadium_ID, manufacturing_date, surface, Owner, Address, Location, Name, Capacity) values ('5', '3-7-2010', 'Παρκέ', 'Tresa McRannell', 'Πλησίον Δημαρχείου', 'Βραχνέικα', 'Αθλητικό Κέντρο Βραχνέικων', '4034');
insert into Stadium (Stadium_ID, manufacturing_date, surface, Owner, Address, Location, Name, Capacity) values ('6', '6-22-1990', 'Παρκέ', 'Allard Castro', 'Κέντρο', 'Μιτιλόγλη', 'Τέντα Μιτιλογλίου', '2374');
insert into Stadium (Stadium_ID, manufacturing_date, surface, Owner, Address, Location, Name, Capacity) values ('7', '8-10-1969', 'Παρκέ', 'Rachel Behne', 'Παπαναστασίου 95', 'Αίγιο', 'Γήπεδο Ανδρέας Παπανδρέου', '561');


-- team base stadium
insert into Team_base_Stadium (Stadium_ID, Team_in_this_Base) values (1, 'Παναθηναϊκός Πατρών');
insert into Team_base_Stadium (Stadium_ID, Team_in_this_Base) values (1,'Ολυμπιακός Πατρών');
insert into Team_base_Stadium (Stadium_ID, Team_in_this_Base) values (1,'Άεκ Πατρών');
insert into Team_base_Stadium (Stadium_ID, Team_in_this_Base) values (1,'Παοκ Πατρών');
insert into Team_base_Stadium (Stadium_ID, Team_in_this_Base) values (1,'Ίκαρος Πατρών');
insert into Team_base_Stadium (Stadium_ID, Team_in_this_Base) values (1,'Ηρακλής Πατρών');
insert into Team_base_Stadium (Stadium_ID, Team_in_this_Base) values (1,'Προμηθέας Β');
insert into Team_base_Stadium (Stadium_ID, Team_in_this_Base) values (2, 'ΕΑΠ');
insert into Team_base_Stadium (Stadium_ID, Team_in_this_Base) values (2, 'Αγυά');
insert into Team_base_Stadium (Stadium_ID, Team_in_this_Base) values (2, 'Ακάδημος');
insert into Team_base_Stadium (Stadium_ID, Team_in_this_Base) values (3, 'Παναχαϊκή');
insert into Team_base_Stadium (Stadium_ID, Team_in_this_Base) values (3, 'Αχαϊκή');
insert into Team_base_Stadium (Stadium_ID, Team_in_this_Base) values (3, 'Καλάβρυτα');
insert into Team_base_Stadium (Stadium_ID, Team_in_this_Base) values (4, 'Αετός');
insert into Team_base_Stadium (Stadium_ID, Team_in_this_Base) values (4, 'Διογένης');
insert into Team_base_Stadium (Stadium_ID, Team_in_this_Base) values (4, 'Οβρϋά');
insert into Team_base_Stadium (Stadium_ID, Team_in_this_Base) values (5, 'Βραχνέικα');
insert into Team_base_Stadium (Stadium_ID, Team_in_this_Base) values (5, 'Πατίστας');
insert into Team_base_Stadium (Stadium_ID, Team_in_this_Base) values (6,'Δρομέας'); 
insert into Team_base_Stadium (Stadium_ID, Team_in_this_Base) values (6, 'Μιτιλόγλη');
insert into Team_base_Stadium (Stadium_ID, Team_in_this_Base) values (7, 'Θησέας');
insert into Team_base_Stadium (Stadium_ID, Team_in_this_Base) values (7, 'Πανεπιστήμιο Πατρών');
insert into Team_base_Stadium (Stadium_ID, Team_in_this_Base) values (7, 'Εργοτέλης Πατρών');
insert into Team_base_Stadium (Stadium_ID, Team_in_this_Base) values (7, 'Αίγιο');


insert into Coach (Coach_contract_ID, FirstName, Surname, Nationality, Birth_Date, Coaching_team,  Experience) values ('1', 'Cornelia', 'Matussevich', 'Greece', '2-5-1974', 'Οβρϋά', '9');
insert into Coach (Coach_contract_ID, FirstName, Surname, Nationality, Birth_Date, Coaching_team,  Experience) values ('2', 'Nan', 'Stancer', 'Greece', '7-2-1981', 'Παναχαϊκή', '10');
insert into Coach (Coach_contract_ID, FirstName, Surname, Nationality, Birth_Date, Coaching_team,  Experience) values ('3', 'Casi', 'Wozencroft', 'Greece', '6-30-1977', 'Μιτιλόγλη', '15');
insert into Coach (Coach_contract_ID, FirstName, Surname, Nationality, Birth_Date, Coaching_team,  Experience) values ('4', 'Meredith', 'Allitt', 'Greece', '4-1-1986', 'ΕΑΠ', '15');
insert into Coach (Coach_contract_ID, FirstName, Surname, Nationality, Birth_Date, Coaching_team,  Experience) values ('5', 'Madelena', 'Tenman', 'Greece', '6-19-1972', 'Παναθηναϊκός Πατρών', '20');
insert into Coach (Coach_contract_ID, FirstName, Surname, Nationality, Birth_Date, Coaching_team,  Experience) values ('6', 'Felicle', 'Hysom', 'Greece', '10-19-1976', 'Ολυμπιακός Πατρών', '14');
insert into Coach (Coach_contract_ID, FirstName, Surname, Nationality, Birth_Date, Coaching_team,  Experience) values ('7', 'Shaylah', 'Iskowicz', 'Greece', '5-27-1981', 'Άεκ Πατρών', '14');
insert into Coach (Coach_contract_ID, FirstName, Surname, Nationality, Birth_Date, Coaching_team,  Experience) values ('8', 'Ian', 'Gossling', 'Greece', '8-9-1981', 'Αχαϊκή', '18');
insert into Coach (Coach_contract_ID, FirstName, Surname, Nationality, Birth_Date, Coaching_team,  Experience) values ('9', 'Skye', 'Domenichini', 'Greece', '9-24-1983', 'Παοκ Πατρών', '11');
insert into Coach (Coach_contract_ID, FirstName, Surname, Nationality, Birth_Date, Coaching_team,  Experience) values ('10', 'Diahann', 'Meas', 'Greece', '1-19-1984', 'Αετός', '15');
insert into Coach (Coach_contract_ID, FirstName, Surname, Nationality, Birth_Date, Coaching_team,  Experience) values ('11', 'Kalinda', 'Uridge', 'Greece', '3-2-1988', 'Πατίστας', '15');
insert into Coach (Coach_contract_ID, FirstName, Surname, Nationality, Birth_Date, Coaching_team,  Experience) values ('12', 'Katha', 'Krimmer', 'Greece', '1-2-1983', 'Αγυά', '14');
insert into Coach (Coach_contract_ID, FirstName, Surname, Nationality, Birth_Date, Coaching_team,  Experience) values ('13', 'Tiebout', 'Barnet', 'Greece', '5-11-1984', 'Ακάδημος', '12');
insert into Coach (Coach_contract_ID, FirstName, Surname, Nationality, Birth_Date, Coaching_team,  Experience) values ('14', 'Tait', 'Guttridge', 'Greece', '3-21-1982', 'Ίκαρος Πατρών', '15');
insert into Coach (Coach_contract_ID, FirstName, Surname, Nationality, Birth_Date, Coaching_team,  Experience) values ('15', 'Yves', 'Rosario', 'Greece', '6-14-1986', 'Θησέας', '10');
insert into Coach (Coach_contract_ID, FirstName, Surname, Nationality, Birth_Date, Coaching_team,  Experience) values ('16', 'Trudie', 'Beldum', 'Greece', '6-13-1978', 'Εργοτέλης Πατρών', '21');
insert into Coach (Coach_contract_ID, FirstName, Surname, Nationality, Birth_Date, Coaching_team,  Experience) values ('17', 'Claudia', 'Skillings', 'Greece', '4-11-1975', 'Πανεπιστήμιο Πατρών',  '21');
insert into Coach (Coach_contract_ID, FirstName, Surname, Nationality, Birth_Date, Coaching_team,  Experience) values ('18', 'Allyn', 'Barnewille', 'Greece', '8-21-1976', 'Αίγιο', '25');
insert into Coach (Coach_contract_ID, FirstName, Surname, Nationality, Birth_Date, Coaching_team,  Experience) values ('19', 'Jacobo', 'Mathes', 'Greece', '4-4-1979', 'Καλάβρυτα', '12');
insert into Coach (Coach_contract_ID, FirstName, Surname, Nationality, Birth_Date, Coaching_team,  Experience) values ('20', 'Fleming', 'Tunuy', 'Greece', '11-2-1972', 'Προμηθέας Β', '22');
insert into Coach (Coach_contract_ID, FirstName, Surname, Nationality, Birth_Date, Coaching_team,  Experience) values ('21', 'Lolita', 'Fairchild', 'Greece', '9-12-1990', 'Δρομέας', '8');
insert into Coach (Coach_contract_ID, FirstName, Surname, Nationality, Birth_Date, Coaching_team,  Experience) values ('22', 'Kaela', 'Paulino', 'Greece', '4-3-1986', 'Βραχνέικα','17');
insert into Coach (Coach_contract_ID, FirstName, Surname, Nationality, Birth_Date, Coaching_team,  Experience) values ('23', 'Jone', 'Menary', 'Greece', '12-9-1980', 'Ηρακλής Πατρών', '18');
insert into Coach (Coach_contract_ID, FirstName, Surname, Nationality, Birth_Date, Coaching_team,  Experience) values ('24', 'Fara', 'Ditch', 'Greece', '1-10-1990', 'Διογένης', '8');



insert into Coach_Career (Coach_contract_ID, Coach_ID, Team, Total_earnings, Contract_starting_Date, Contract_expire_Date) values ('23436', '1', 'Οβρϋά', '€4194,87', '11-14-2013', '12-3-2022');
insert into Coach_Career (Coach_contract_ID, Coach_ID, Team, Total_earnings, Contract_starting_Date, Contract_expire_Date) values ('81477', '2', 'Παναχαϊκή', '€853,50', '10-1-2019', '10-7-2021');
insert into Coach_Career (Coach_contract_ID, Coach_ID, Team, Total_earnings, Contract_starting_Date, Contract_expire_Date) values ('26530', '3', 'Μιτιλόγλη', '€2879,93', '2-20-2017', '5-22-2022');
insert into Coach_Career (Coach_contract_ID, Coach_ID, Team, Total_earnings, Contract_starting_Date, Contract_expire_Date) values ('87757', '4', 'ΕΑΠ', '€3011,95', '10-3-2020', '9-5-2021');
insert into Coach_Career (Coach_contract_ID, Coach_ID, Team, Total_earnings, Contract_starting_Date, Contract_expire_Date) values ('78034', '5', 'Παναθηναϊκός Πατρών', '€2632,09', '3-27-2019', '4-28-2023');
insert into Coach_Career (Coach_contract_ID, Coach_ID, Team, Total_earnings, Contract_starting_Date, Contract_expire_Date) values ('63029', '6', 'Ολυμπιακός Πατρών', '€8049,76', '6-18-2010', '1-16-2025');
insert into Coach_Career (Coach_contract_ID, Coach_ID, Team, Total_earnings, Contract_starting_Date, Contract_expire_Date) values ('46509', '7', 'Άεκ Πατρών', '€619,78', '8-20-2018', '3-10-2021');
insert into Coach_Career (Coach_contract_ID, Coach_ID, Team, Total_earnings, Contract_starting_Date, Contract_expire_Date) values ('91948', '8', 'Αχαϊκή', '€3663,90', '10-25-2018', '8-30-2022');
insert into Coach_Career (Coach_contract_ID, Coach_ID, Team, Total_earnings, Contract_starting_Date, Contract_expire_Date) values ('81515', '9', 'Παοκ Πατρών', '€4859,18', '11-12-2016', '9-8-2021');
insert into Coach_Career (Coach_contract_ID, Coach_ID, Team, Total_earnings, Contract_starting_Date, Contract_expire_Date) values ('73856', '10', 'Αετός', '€1860,82', '2-7-2017', '4-20-2022');
insert into Coach_Career (Coach_contract_ID, Coach_ID, Team, Total_earnings, Contract_starting_Date, Contract_expire_Date) values ('49047', '11', 'Πατίστας', '€2956,59', '2-12-2014', '10-31-2024');
insert into Coach_Career (Coach_contract_ID, Coach_ID, Team, Total_earnings, Contract_starting_Date, Contract_expire_Date) values ('28267', '12', 'Αγυά', '€4603,53', '11-9-2020', '5-5-2024');
insert into Coach_Career (Coach_contract_ID, Coach_ID, Team, Total_earnings, Contract_starting_Date, Contract_expire_Date) values ('60439', '13', 'Ακάδημος', '€330,48', '1-2-2021', '10-11-2025');
insert into Coach_Career (Coach_contract_ID, Coach_ID, Team, Total_earnings, Contract_starting_Date, Contract_expire_Date) values ('86051', '14', 'Ίκαρος Πατρών', '€3170,41', '11-18-2013', '7-8-2022');
insert into Coach_Career (Coach_contract_ID, Coach_ID, Team, Total_earnings, Contract_starting_Date, Contract_expire_Date) values ('97845', '15', 'Θησέας', '€2060,60', '9-28-2019', '9-11-2024');
insert into Coach_Career (Coach_contract_ID, Coach_ID, Team, Total_earnings, Contract_starting_Date, Contract_expire_Date) values ('95872', '16', 'Εργοτέλης Πατρών', '€568,65', '6-20-2020', '1-6-2022');
insert into Coach_Career (Coach_contract_ID, Coach_ID, Team, Total_earnings, Contract_starting_Date, Contract_expire_Date) values ('98817', '17', 'Πανεπιστήμιο Πατρών', '€3455,03', '7-5-2016', '3-5-2024');
insert into Coach_Career (Coach_contract_ID, Coach_ID, Team, Total_earnings, Contract_starting_Date, Contract_expire_Date) values ('97964', '18', 'Αίγιο', '€4266,40', '5-11-2016', '11-17-2022');
insert into Coach_Career (Coach_contract_ID, Coach_ID, Team, Total_earnings, Contract_starting_Date, Contract_expire_Date) values ('50389', '19', 'Καλάβρυτα', '€4779,50', '5-24-2012', '11-22-2021');
insert into Coach_Career (Coach_contract_ID, Coach_ID, Team, Total_earnings, Contract_starting_Date, Contract_expire_Date) values ('39127', '20', 'Προμηθέας Β', '€4375,95', '7-21-2015', '9-10-2024');
insert into Coach_Career (Coach_contract_ID, Coach_ID, Team, Total_earnings, Contract_starting_Date, Contract_expire_Date) values ('12654', '21', 'Δρομέας', '€4010,22', '4-23-2018', '5-16-2024');
insert into Coach_Career (Coach_contract_ID, Coach_ID, Team, Total_earnings, Contract_starting_Date, Contract_expire_Date) values ('12691', '22', 'Βραχνέικα', '€2013,45', '9-8-2018', '4-24-2021');
insert into Coach_Career (Coach_contract_ID, Coach_ID, Team, Total_earnings, Contract_starting_Date, Contract_expire_Date) values ('72108', '23', 'Ηρακλής Πατρών', '€4282,10', '8-21-2016', '11-18-2024');
insert into Coach_Career (Coach_contract_ID, Coach_ID, Team, Total_earnings, Contract_starting_Date, Contract_expire_Date) values ('86689', '24', 'Διογένης', '€3484,47', '5-28-2018', '7-18-2023');


insert into Coach_Career (Coach_contract_ID, Coach_ID, Team, Total_earnings, Contract_starting_Date, Contract_expire_Date) values ('32436', '1', 'Εργοτέλη', '€4194,87', '11-14-2012', '10-14-2013');
insert into Coach_Career (Coach_contract_ID, Coach_ID, Team, Total_earnings, Contract_starting_Date, Contract_expire_Date) values ('62530', '3', 'Καλαμάτα', '€2879,93', '2-20-2015', '1-20-2017');
insert into Coach_Career (Coach_contract_ID, Coach_ID, Team, Total_earnings, Contract_starting_Date, Contract_expire_Date) values ('80034', '5', 'Ηλισιακό', '€2632,09', '3-27-2010', '2-27-2019');
insert into Coach_Career (Coach_contract_ID, Coach_ID, Team, Total_earnings, Contract_starting_Date, Contract_expire_Date) values ('36029', '6', 'Μαρούσι', '€8049,76', '6-18-2006', '5-18-2010');
insert into Coach_Career (Coach_contract_ID, Coach_ID, Team, Total_earnings, Contract_starting_Date, Contract_expire_Date) values ('64509', '7', 'Μεσολόγγι', '€619,78', '8-20-2016', '7-20-2018');
insert into Coach_Career (Coach_contract_ID, Coach_ID, Team, Total_earnings, Contract_starting_Date, Contract_expire_Date) values ('19948', '8', 'Κιάτο', '€3663,90', '10-25-2012', '10-25-2018');
insert into Coach_Career (Coach_contract_ID, Coach_ID, Team, Total_earnings, Contract_starting_Date, Contract_expire_Date) values ('69051', '14', 'Κόρινθος', '€3170,41', '11-18-2005', '10-18-2013');
insert into Coach_Career (Coach_contract_ID, Coach_ID, Team, Total_earnings, Contract_starting_Date, Contract_expire_Date) values ('88817', '17', 'Σπαρτιατικός', '€3455,03', '7-5-2009', '6-5-2016');
insert into Coach_Career (Coach_contract_ID, Coach_ID, Team, Total_earnings, Contract_starting_Date, Contract_expire_Date) values ('77964', '18', 'Αρκαδικός', '€4266,40', '5-11-2005', '4-11-2016');
insert into Coach_Career (Coach_contract_ID, Coach_ID, Team, Total_earnings, Contract_starting_Date, Contract_expire_Date) values ('33389', '19', 'Ηλιούπολη', '€4779,50', '5-24-2008', '4-24-2012');
insert into Coach_Career (Coach_contract_ID, Coach_ID, Team, Total_earnings, Contract_starting_Date, Contract_expire_Date) values ('93127', '20', 'Καβάλα', '€4375,95', '7-21-2005', '6-21-2015');



insert into Referee (Referee_ID, Career_starting_Date, Nationality, Birth_Day, FirstName, Surname) values ('1', '3-11-2005', 'Greece', '1-2-1981', 'Mill', 'Isham');
insert into Referee (Referee_ID, Career_starting_Date, Nationality, Birth_Day, FirstName, Surname) values ('2', '10-30-2007', 'Greece', '7-16-1992', 'Tyrone', 'Foulstone');
insert into Referee (Referee_ID, Career_starting_Date, Nationality, Birth_Day, FirstName, Surname) values ('3', '4-18-2006', 'Greece', '10-13-1987', 'Rafe', 'Skermer');
insert into Referee (Referee_ID, Career_starting_Date, Nationality, Birth_Day, FirstName, Surname) values ('4', '3-22-2001', 'Greece', '1-25-1995', 'Baxie', 'Fussie');
insert into Referee (Referee_ID, Career_starting_Date, Nationality, Birth_Day, FirstName, Surname) values ('5', '3-20-2008', 'Greece', '4-11-1984', 'Merill', 'Baughan');
insert into Referee (Referee_ID, Career_starting_Date, Nationality, Birth_Day, FirstName, Surname) values ('6', '11-16-2001', 'Greece', '1-16-1985', 'Fabian', 'Biddulph');
insert into Referee (Referee_ID, Career_starting_Date, Nationality, Birth_Day, FirstName, Surname) values ('7', '7-2-2003', 'Greece', '2-4-1985', 'Kellen', 'Storre');
insert into Referee (Referee_ID, Career_starting_Date, Nationality, Birth_Day, FirstName, Surname) values ('8', '6-30-2000', 'Greece', '9-1-1987', 'Xenos', 'Hendren');
insert into Referee (Referee_ID, Career_starting_Date, Nationality, Birth_Day, FirstName, Surname) values ('9','7-8-2003', 'Greece', '1-10-1983', 'Ramsay', 'Garatty');
insert into Referee (Referee_ID, Career_starting_Date, Nationality, Birth_Day, FirstName, Surname) values ('10', '9-24-2011', 'Greece', '11-27-1992', 'Karoly', 'Cuthill');
insert into Referee (Referee_ID, Career_starting_Date, Nationality, Birth_Day, FirstName, Surname) values ('11', '8-26-2000', 'Greece', '5-13-1993', 'Jermaine', 'Bolletti');
insert into Referee (Referee_ID, Career_starting_Date, Nationality, Birth_Day, FirstName, Surname) values ('12', '9-6-2005', 'Greece', '3-13-1981', 'West', 'Harland');
insert into Referee (Referee_ID, Career_starting_Date, Nationality, Birth_Day, FirstName, Surname) values ('13', '11-13-2016', 'Greece', '9-11-1996', 'Gustavo', 'Ullrich');
insert into Referee (Referee_ID, Career_starting_Date, Nationality, Birth_Day, FirstName, Surname) values ('14', '8-27-2010', 'Greece', '12-7-1981', 'Costa', 'Penman');
insert into Referee (Referee_ID, Career_starting_Date, Nationality, Birth_Day, FirstName, Surname) values ('15', '10-16-2007', 'Greece', '2-1-1997', 'Tedman', 'Coggill');
insert into Referee (Referee_ID, Career_starting_Date, Nationality, Birth_Day, FirstName, Surname) values ('16', '4-2-2015', 'Greece', '12-17-1998', 'Sim', 'Agastina');
insert into Referee (Referee_ID, Career_starting_Date, Nationality, Birth_Day, FirstName, Surname) values ('17', '3-8-2011', 'Greece', '11-20-1987', 'Ancell', 'Bhatia');
insert into Referee (Referee_ID, Career_starting_Date, Nationality, Birth_Day, FirstName, Surname) values ('18', '7-3-2017', 'Greece', '9-15-1991', 'Stephen', 'Glasgow');
insert into Referee (Referee_ID, Career_starting_Date, Nationality, Birth_Day, FirstName, Surname) values ('19', '3-28-2009', 'Greece', '12-12-1992', 'Colman', 'Bengtsson');
insert into Referee (Referee_ID, Career_starting_Date, Nationality, Birth_Day, FirstName, Surname) values ('20', '12-21-1998', 'Greece', '9-16-1981', 'Harley', 'Loines');
insert into Referee (Referee_ID, Career_starting_Date, Nationality, Birth_Day, FirstName, Surname) values ('21', '8-2-1998', 'Greece', '12-12-1986', 'Yuri', 'Biesty');
insert into Referee (Referee_ID, Career_starting_Date, Nationality, Birth_Day, FirstName, Surname) values ('22', '9-9-2003', 'Greece', '4-8-1989', 'Lindsay', 'Tort');
insert into Referee (Referee_ID, Career_starting_Date, Nationality, Birth_Day, FirstName, Surname) values ('23', '10-4-2010', 'Greece', '6-15-1987', 'Jose', 'Snoding');
insert into Referee (Referee_ID, Career_starting_Date, Nationality, Birth_Day, FirstName, Surname) values ('24', '8-4-2014', 'Greece', '4-18-1982', 'Thurston', 'MacCarter');


insert into Standings (Devision, Year, Position, Team, Points, Total_Matches, Wins, Losses, Home_Wins, Away_Wins, Points_Difference) values ('A', '2021', '1', 'Αετός', '15', '8', '7', '1', '5', '2', '+86');
insert into Standings (Devision, Year, Position, Team, Points, Total_Matches, Wins, Losses, Home_Wins, Away_Wins, Points_Difference) values ('A', '2021', '2', 'Παναχαϊκή', '14', '8', '6', '2', '4', '2', '+6');
insert into Standings (Devision, Year, Position, Team, Points, Total_Matches, Wins, Losses, Home_Wins, Away_Wins, Points_Difference) values ('A', '2021', '3', 'Παοκ Πατρών', '11', '8', '3', '5', '0', '3', '+14');
insert into Standings (Devision, Year, Position, Team, Points, Total_Matches, Wins, Losses, Home_Wins, Away_Wins, Points_Difference) values ('A', '2021', '4', 'Διογένης', '11', '8', '3', '5', '0', '3', '+39');
insert into Standings (Devision, Year, Position, Team, Points, Total_Matches, Wins, Losses, Home_Wins, Away_Wins, Points_Difference) values ('A', '2021', '5', 'Παναθηναϊκός Πατρών', '11', '8', '3', '5', '1', '2', '-6');
insert into Standings (Devision, Year, Position, Team, Points, Total_Matches, Wins, Losses, Home_Wins, Away_Wins, Points_Difference) values ('A', '2021', '6', 'Πατίστας', '10', '8', '2', '6', '2', '0', '-55');
insert into Standings (Devision, Year, Position, Team, Points, Total_Matches, Wins, Losses, Home_Wins, Away_Wins, Points_Difference) values ('A', '2021', '7', 'Οβρϋά', '10', '8', '2', '6', '1', '1', '-74');
insert into Standings (Devision, Year, Position, Team, Points, Total_Matches, Wins, Losses, Home_Wins, Away_Wins, Points_Difference) values ('A', '2021', '8', 'Ηρακλής Πατρών', '10', '8', '2', '6', '1', '1', '-70');


insert into Standings (Devision, Year, Position, Team, Points, Total_Matches, Wins, Losses, Home_Wins, Away_Wins, Points_Difference) values ('B', '2021', '1', 'Μιτιλόγλη', '14', '8', '6', '2', '4', '2', '+86');
insert into Standings (Devision, Year, Position, Team, Points, Total_Matches, Wins, Losses, Home_Wins, Away_Wins, Points_Difference) values ('B', '2021', '2', 'Προμηθέας Β', '13', '8', '5', '3', '2', '3', '+6');
insert into Standings (Devision, Year, Position, Team, Points, Total_Matches, Wins, Losses, Home_Wins, Away_Wins, Points_Difference) values ('B', '2021', '3', 'Βραχνέικα', '12', '8', '4', '4', '4', '0', '+14');
insert into Standings (Devision, Year, Position, Team, Points, Total_Matches, Wins, Losses, Home_Wins, Away_Wins, Points_Difference) values ('B', '2021', '4', 'Καλάβρυτα', '11', '8', '3', '5', '1', '2', '+39');
insert into Standings (Devision, Year, Position, Team, Points, Total_Matches, Wins, Losses, Home_Wins, Away_Wins, Points_Difference) values ('B', '2021', '5', 'Αίγιο', '11', '8', '3', '5', '1', '2', '-6');
insert into Standings (Devision, Year, Position, Team, Points, Total_Matches, Wins, Losses, Home_Wins, Away_Wins, Points_Difference) values ('B', '2021', '6', 'Πανεπιστήμιο Πατρών', '11', '8', '3', '5', '3', '0', '-55');
insert into Standings (Devision, Year, Position, Team, Points, Total_Matches, Wins, Losses, Home_Wins, Away_Wins, Points_Difference) values ('B', '2021', '7', 'Θησέας', '10', '8', '2', '6', '2', '0', '-74');
insert into Standings (Devision, Year, Position, Team, Points, Total_Matches, Wins, Losses, Home_Wins, Away_Wins, Points_Difference) values ('B', '2021', '8', 'ΕΑΠ', '9', '8', '1', '7', '1', '0', '-70');


insert into Standings (Devision, Year, Position, Team, Points, Total_Matches, Wins, Losses, Home_Wins, Away_Wins, Points_Difference) values ('C', '2021', '1', 'Αγυά', '15', '8', '7', '1', '7', '0', '+86');
insert into Standings (Devision, Year, Position, Team, Points, Total_Matches, Wins, Losses, Home_Wins, Away_Wins, Points_Difference) values ('C', '2021', '2', 'Ολυμπιακός Πατρών', '14', '8', '6', '2', '6', '0', '+6');
insert into Standings (Devision, Year, Position, Team, Points, Total_Matches, Wins, Losses, Home_Wins, Away_Wins, Points_Difference) values ('C', '2021', '3', 'Άεκ Πατρών', '13', '8', '5', '3', '4', '1', '+14');
insert into Standings (Devision, Year, Position, Team, Points, Total_Matches, Wins, Losses, Home_Wins, Away_Wins, Points_Difference) values ('C', '2021', '4', 'Αχαϊκή', '13', '8', '5', '3', '4', '1', '+39');
insert into Standings (Devision, Year, Position, Team, Points, Total_Matches, Wins, Losses, Home_Wins, Away_Wins, Points_Difference) values ('C', '2021', '5', 'Δρομέας', '12', '8', '4', '4', '4', '0', '-6');
insert into Standings (Devision, Year, Position, Team, Points, Total_Matches, Wins, Losses, Home_Wins, Away_Wins, Points_Difference) values ('C', '2021', '6', 'Ίκαρος Πατρών', '11', '8', '3', '5', '3', '0', '-55');
insert into Standings (Devision, Year, Position, Team, Points, Total_Matches, Wins, Losses, Home_Wins, Away_Wins, Points_Difference) values ('C', '2021', '7', 'Ακάδημος', '11', '8', '3', '5', '3', '0', '-74');
insert into Standings (Devision, Year, Position, Team, Points, Total_Matches, Wins, Losses, Home_Wins, Away_Wins, Points_Difference) values ('C', '2021', '8', 'Εργοτέλης Πατρών', '10', '8', '2', '6', '1', '1', '-70');






insert into Standings (Devision, Year, Position, Team, Points, Total_Matches, Wins, Losses, Home_Wins, Away_Wins, Points_Difference) values ('A', '2020', '1', 'Αετός', '29', '14', '13', '1', '7', '6', '+86');
insert into Standings (Devision, Year, Position, Team, Points, Total_Matches, Wins, Losses, Home_Wins, Away_Wins, Points_Difference) values ('A', '2020', '2', 'Παναχαϊκή', '28', '14', '12', '2', '6', '6', '+6');
insert into Standings (Devision, Year, Position, Team, Points, Total_Matches, Wins, Losses, Home_Wins, Away_Wins, Points_Difference) values ('A', '2020', '3', 'Παοκ Πατρών', '25', '14', '9', '5', '4', '5', '+14');
insert into Standings (Devision, Year, Position, Team, Points, Total_Matches, Wins, Losses, Home_Wins, Away_Wins, Points_Difference) values ('A', '2020', '4', 'Διογένης', '25', '14', '9', '5', '7', '2', '+39');
insert into Standings (Devision, Year, Position, Team, Points, Total_Matches, Wins, Losses, Home_Wins, Away_Wins, Points_Difference) values ('A', '2020', '5', 'Παναθηναϊκός Πατρών', '23', '14', '7', '5', '5', '2', '-6');
insert into Standings (Devision, Year, Position, Team, Points, Total_Matches, Wins, Losses, Home_Wins, Away_Wins, Points_Difference) values ('A', '2020', '6', 'Πατίστας', '19', '14', '3', '11', '3', '0', '-55');
insert into Standings (Devision, Year, Position, Team, Points, Total_Matches, Wins, Losses, Home_Wins, Away_Wins, Points_Difference) values ('A', '2020', '7', 'Οβρϋά', '17', '14', '1', '13', '1', '0', '-74');
insert into Standings (Devision, Year, Position, Team, Points, Total_Matches, Wins, Losses, Home_Wins, Away_Wins, Points_Difference) values ('A', '2020', '8', 'Μιτιλόγλη', '17', '14', '1', '13', '1', '0', '-70');


insert into Standings (Devision, Year, Position, Team, Points, Total_Matches, Wins, Losses, Home_Wins, Away_Wins, Points_Difference) values ('B', '2020', '1', 'Ηρακλής Πατρών', '28', '14', '12', '2', '6', '6', '+86');
insert into Standings (Devision, Year, Position, Team, Points, Total_Matches, Wins, Losses, Home_Wins, Away_Wins, Points_Difference) values ('B', '2020', '2', 'Προμηθέας Β', '27', '14', '11', '3', '5', '6', '+6');
insert into Standings (Devision, Year, Position, Team, Points, Total_Matches, Wins, Losses, Home_Wins, Away_Wins, Points_Difference) values ('B', '2020', '3', 'Βραχνέικα', '25', '14', '9', '5', '4', '5', '+14');
insert into Standings (Devision, Year, Position, Team, Points, Total_Matches, Wins, Losses, Home_Wins, Away_Wins, Points_Difference) values ('B', '2020', '4', 'Καλάβρυτα', '24', '14', '8', '6', '6', '2', '+39');
insert into Standings (Devision, Year, Position, Team, Points, Total_Matches, Wins, Losses, Home_Wins, Away_Wins, Points_Difference) values ('B', '2020', '5', 'Αίγιο', '23', '14', '7', '7', '5', '2', '-6');
insert into Standings (Devision, Year, Position, Team, Points, Total_Matches, Wins, Losses, Home_Wins, Away_Wins, Points_Difference) values ('B', '2020', '6', 'Πανεπιστήμιο Πατρών', '19', '14', '3', '11', '3', '0', '-55');
insert into Standings (Devision, Year, Position, Team, Points, Total_Matches, Wins, Losses, Home_Wins, Away_Wins, Points_Difference) values ('B', '2020', '7', 'Θησέας', '18', '14', '2', '12', '2', '0', '-74');
insert into Standings (Devision, Year, Position, Team, Points, Total_Matches, Wins, Losses, Home_Wins, Away_Wins, Points_Difference) values ('B', '2020', '8', 'Αγυά', '17', '14', '1', '13', '1', '0', '-70');


insert into Standings (Devision, Year, Position, Team, Points, Total_Matches, Wins, Losses, Home_Wins, Away_Wins, Points_Difference) values ('C', '2020', '1', 'ΕΑΠ', '29', '14', '13', '1', '7', '6', '+86');
insert into Standings (Devision, Year, Position, Team, Points, Total_Matches, Wins, Losses, Home_Wins, Away_Wins, Points_Difference) values ('C', '2020', '2', 'Ολυμπιακός Πατρών', '28', '14', '12', '2', '6', '6', '+6');
insert into Standings (Devision, Year, Position, Team, Points, Total_Matches, Wins, Losses, Home_Wins, Away_Wins, Points_Difference) values ('C', '2020', '3', 'Άεκ Πατρών', '25', '14', '9', '5', '4', '5', '+14');
insert into Standings (Devision, Year, Position, Team, Points, Total_Matches, Wins, Losses, Home_Wins, Away_Wins, Points_Difference) values ('C', '2020', '4', 'Αχαϊκή', '25', '14', '9', '5', '7', '2', '+39');
insert into Standings (Devision, Year, Position, Team, Points, Total_Matches, Wins, Losses, Home_Wins, Away_Wins, Points_Difference) values ('C', '2020', '5', 'Δρομέας', '23', '14', '7', '7', '5', '2', '-6');
insert into Standings (Devision, Year, Position, Team, Points, Total_Matches, Wins, Losses, Home_Wins, Away_Wins, Points_Difference) values ('C', '2020', '6', 'Ίκαρος Πατρών', '19', '14', '3', '11', '3', '0', '-55');
insert into Standings (Devision, Year, Position, Team, Points, Total_Matches, Wins, Losses, Home_Wins, Away_Wins, Points_Difference) values ('C', '2020', '7', 'Ακάδημος', '17', '14', '1', '13', '1', '0', '-74');
insert into Standings (Devision, Year, Position, Team, Points, Total_Matches, Wins, Losses, Home_Wins, Away_Wins, Points_Difference) values ('C', '2020', '8', 'Εργοτέλης Πατρών', '17', '14', '1', '13', '1', '0', '-70');

-- Match days
insert into Match_Day (Number, Year) values ('1', '2020-2021');
insert into Match_Day (Number, Year) values ('2', '2020-2021');
insert into Match_Day (Number, Year) values ('3', '2020-2021');
insert into Match_Day (Number, Year) values ('4', '2020-2021');
insert into Match_Day (Number, Year) values ('5', '2020-2021');
insert into Match_Day (Number, Year) values ('6', '2020-2021');
insert into Match_Day (Number, Year) values ('7', '2020-2021');
insert into Match_Day (Number, Year) values ('8', '2020-2021');
insert into Match_Day (Number, Year) values ('9', '2020-2021');
insert into Match_Day (Number, Year) values ('10', '2020-2021');
insert into Match_Day (Number, Year) values ('11', '2020-2021');
insert into Match_Day (Number, Year) values ('12', '2020-2021');
insert into Match_Day (Number, Year) values ('13', '2020-2021');
insert into Match_Day (Number, Year) values ('14', '2020-2021');
insert into Match_Day (Number, Year) values ('1', '2019-2020');
insert into Match_Day (Number, Year) values ('2', '2019-2020');
insert into Match_Day (Number, Year) values ('3', '2019-2020');
insert into Match_Day (Number, Year) values ('4', '2019-2020');
insert into Match_Day (Number, Year) values ('5', '2019-2020');
insert into Match_Day (Number, Year) values ('6', '2019-2020');
insert into Match_Day (Number, Year) values ('7', '2019-2020');
insert into Match_Day (Number, Year) values ('8', '2019-2020');
insert into Match_Day (Number, Year) values ('9', '2019-2020');
insert into Match_Day (Number, Year) values ('10', '2019-2020');
insert into Match_Day (Number, Year) values ('11', '2019-2020');
insert into Match_Day (Number, Year) values ('12', '2019-2020');
insert into Match_Day (Number, Year) values ('13', '2019-2020');
insert into Match_Day (Number, Year) values ('14', '2019-2020');



insert into Matches (Match_ID, Stadium, Date_Time, DNP, Match_Day, Score_Home_Team, Score_Away_Team, Home_Team, Away_Team) values ('1', 'Παναχαϊκής', '2020-09-20 15:00:00', 'FALSE', '1', '90', '88', 'Αετός', 'Παναχαϊκή');
insert into Matches (Match_ID, Stadium, Date_Time, DNP, Match_Day, Score_Home_Team, Score_Away_Team, Home_Team, Away_Team) values ('2', 'Παμπελλοπονησιακό', '2020-09-20 15:00:00', 'FALSE', '1', '80', '76', 'Παοκ Πατρών', 'Διογένης');
insert into Matches (Match_ID, Stadium, Date_Time, DNP, Match_Day, Score_Home_Team, Score_Away_Team, Home_Team, Away_Team) values ('3', 'Γήπεδο Ανδρέας Παπανδρέου', '2020-09-20 15:00:00', 'FALSE', '1', '75', '70', 'Παναθηναϊκός Πατρών', 'Πατίστας');
insert into Matches (Match_ID, Stadium, Date_Time, DNP, Match_Day, Score_Home_Team, Score_Away_Team, Home_Team, Away_Team) values ('4', 'Δημοτικό Στάδιο Οβρϋάς', '2020-09-20 15:00:00', 'FALSE', '1', '60', '65', 'Οβρϋά', 'Μιτιλόγλη');


insert into Matches (Match_ID, Stadium, Date_Time, DNP, Match_Day, Score_Home_Team, Score_Away_Team, Home_Team, Away_Team) values ('11', 'Γήπεδο Ανδρέας Παπανδρέου', '2020-10-10 15:00:00', 'FALSE', '2', '60', '61', 'Αετός', 'Διογένης');
insert into Matches (Match_ID, Stadium, Date_Time, DNP, Match_Day, Score_Home_Team, Score_Away_Team, Home_Team, Away_Team) values ('12', 'Παναχαϊκής', '2020-10-10 15:00:00', 'FALSE', '2', '65','80', 'Οβρϋά', 'Παναχαϊκή');
insert into Matches (Match_ID, Stadium, Date_Time, DNP, Match_Day, Score_Home_Team, Score_Away_Team, Home_Team, Away_Team) values ('13', 'Παμπελλοπονησιακό', '2020-10-10 15:00:00', 'FALSE', '2', '105','70', 'Παοκ Πατρών', 'Πατίστας');
insert into Matches (Match_ID, Stadium, Date_Time, DNP, Match_Day, Score_Home_Team, Score_Away_Team, Home_Team, Away_Team) values ('14', 'Τέντα Μιτιλογλίου', '2020-10-10 15:00:00', 'FALSE', '2', '55','49', 'Παναθηναϊκός Πατρών', 'Μιτιλόγλη');


insert into Matches (Match_ID, Stadium, Date_Time, DNP, Match_Day, Score_Home_Team, Score_Away_Team, Home_Team, Away_Team) values ('21', 'Γήπεδο Ανδρέας Παπανδρέου', '2020-10-20 15:00:00', 'FALSE', '3', '79','70', 'Αετός', 'Πατίστας');
insert into Matches (Match_ID, Stadium, Date_Time, DNP, Match_Day, Score_Home_Team, Score_Away_Team, Home_Team, Away_Team) values ('22', 'Τέντα Μιτιλογλίου', '2020-10-20 15:00:00', 'FALSE', '3', '50','59', 'Παοκ Πατρών', 'Μιτιλόγλη');
insert into Matches (Match_ID, Stadium, Date_Time, DNP, Match_Day, Score_Home_Team, Score_Away_Team, Home_Team, Away_Team) values ('23', 'Αθλητικό Κέντρο Βραχνέικων', '2020-10-20 15:00:00', 'FALSE', '3', '65','60', 'Παναθηναϊκός Πατρών', 'Παναχαϊκή');
insert into Matches (Match_ID, Stadium, Date_Time, DNP, Match_Day, Score_Home_Team, Score_Away_Team, Home_Team, Away_Team) values ('24', 'Παμπελλοπονησιακό', '2020-10-20 15:00:00', 'FALSE', '3', '90','49', 'Διογένης', 'Οβρϋά');


insert into Matches (Match_ID, Stadium, Date_Time, DNP, Match_Day, Score_Home_Team, Score_Away_Team, Home_Team, Away_Team) values ('31', 'ΕΑΠ', '2020-11-10 15:00:00', 'FALSE', '4', '75','80', 'Αετός', 'Μιτιλόγλη');
insert into Matches (Match_ID, Stadium, Date_Time, DNP, Match_Day, Score_Home_Team, Score_Away_Team, Home_Team, Away_Team) values ('32', 'Παμπελλοπονησιακό', '2020-11-10 15:00:00', 'FALSE', '4', '55','60', 'Παοκ Πατρών', 'Οβρϋά');
insert into Matches (Match_ID, Stadium, Date_Time, DNP, Match_Day, Score_Home_Team, Score_Away_Team, Home_Team, Away_Team) values ('33', 'Παναχαϊκής', '2020-11-10 15:00:00', 'FALSE', '4', '80','75', 'Παναθηναϊκός Πατρών', 'Παναχαϊκή');
insert into Matches (Match_ID, Stadium, Date_Time, DNP, Match_Day, Score_Home_Team, Score_Away_Team, Home_Team, Away_Team) values ('34', 'Δημοτικό Στάδιο Οβρϋάς', '2020-11-10 15:00:00', 'FALSE', '4', '70','71', 'Πατίστας', 'Διογένης');


insert into Matches (Match_ID, Stadium, Date_Time, DNP, Match_Day, Score_Home_Team, Score_Away_Team, Home_Team, Away_Team) values ('41', 'Αθλητικό Κέντρο Βραχνέικων', '2020-11-20 15:00:00', 'FALSE', '5', '60','58', 'Αετός', 'Παναθηναϊκός Πατρών');
insert into Matches (Match_ID, Stadium, Date_Time, DNP, Match_Day, Score_Home_Team, Score_Away_Team, Home_Team, Away_Team) values ('42', 'Τέντα Μιτιλογλίου', '2020-11-20 15:00:00', 'FALSE', '5', '90','60', 'Παοκ Πατρών', 'Παναχαϊκή');
insert into Matches (Match_ID, Stadium, Date_Time, DNP, Match_Day, Score_Home_Team, Score_Away_Team, Home_Team, Away_Team) values ('43', 'Παναχαϊκής', '2020-11-20 15:00:00', 'FALSE', '5', '60','70', 'Πατίστας', 'Οβρϋά');
insert into Matches (Match_ID, Stadium, Date_Time, DNP, Match_Day, Score_Home_Team, Score_Away_Team, Home_Team, Away_Team) values ('44', 'Παμπελλοπονησιακό', '2020-11-20 15:00:00', 'FALSE', '5', '65','70', 'Διογένης', 'Μιτιλόγλη');


insert into Matches (Match_ID, Stadium, Date_Time, DNP, Match_Day, Score_Home_Team, Score_Away_Team, Home_Team, Away_Team) values ('51', 'Γήπεδο Ανδρέας Παπανδρέου', '2020-12-10 15:00:00', 'FALSE', '6', '80','90', 'Αετός', 'Οβρϋά');
insert into Matches (Match_ID, Stadium, Date_Time, DNP, Match_Day, Score_Home_Team, Score_Away_Team, Home_Team, Away_Team) values ('52', 'Παναχαϊκής', '2020-12-10 15:00:00', 'FALSE', '6', '95','65', 'Πατίστας', 'Παναχαϊκή');
insert into Matches (Match_ID, Stadium, Date_Time, DNP, Match_Day, Score_Home_Team, Score_Away_Team, Home_Team, Away_Team) values ('53', 'Τέντα Μιτιλογλίου', '2020-12-10 15:00:00', 'FALSE', '6', '80','90', 'Παοκ Πατρών', 'Παναθηναϊκός Πατρών');
insert into Matches (Match_ID, Stadium, Date_Time, DNP, Match_Day, Score_Home_Team, Score_Away_Team, Home_Team, Away_Team) values ('54', 'Παμπελλοπονησιακό', '2020-12-10 15:00:00', 'FALSE', '6', '70','105', 'Διογένης', 'Μιτιλόγλη');


insert into Matches (Match_ID, Stadium, Date_Time, DNP, Match_Day, Score_Home_Team, Score_Away_Team, Home_Team, Away_Team) values ('61', 'ΕΑΠ', '2020-12-20 15:00:00', 'FALSE', '7', '61','60', 'Αετός', 'Παοκ Πατρών');
insert into Matches (Match_ID, Stadium, Date_Time, DNP, Match_Day, Score_Home_Team, Score_Away_Team, Home_Team, Away_Team) values ('62', 'Παναχαϊκής', '2020-12-20 15:00:00', 'FALSE', '7', '62','80', 'Διογένης', 'Παναχαϊκή');
insert into Matches (Match_ID, Stadium, Date_Time, DNP, Match_Day, Score_Home_Team, Score_Away_Team, Home_Team, Away_Team) values ('63', 'Παμπελλοπονησιακό', '2020-12-20 15:00:00', 'FALSE', '7', '80','81', 'Πατίστας', 'Παναθηναϊκός Πατρών');
insert into Matches (Match_ID, Stadium, Date_Time, DNP, Match_Day, Score_Home_Team, Score_Away_Team, Home_Team, Away_Team) values ('64', 'Αθλητικό Κέντρο Βραχνέικων', '2020-12-20 15:00:00', 'FALSE', '7', '90','93', 'Μιτιλόγλη', 'Οβρϋά');


insert into Matches (Match_ID, Stadium, Date_Time, DNP, Match_Day, Score_Home_Team, Score_Away_Team, Home_Team, Away_Team) values ('71', 'Γήπεδο Ανδρέας Παπανδρέου', '2021-01-10 15:00:00', 'FALSE', '8', '85','87', 'Παναχαϊκή', 'Αετός');
insert into Matches (Match_ID, Stadium, Date_Time, DNP, Match_Day, Score_Home_Team, Score_Away_Team, Home_Team, Away_Team) values ('72', 'Παμπελλοπονησιακό', '2021-01-10 15:00:00', 'FALSE', '8', '78','59', 'Οβρϋά', 'Παοκ Πατρών');
insert into Matches (Match_ID, Stadium, Date_Time, DNP, Match_Day, Score_Home_Team, Score_Away_Team, Home_Team, Away_Team) values ('73', 'Αθλητικό Κέντρο Βραχνέικων', '2021-01-10 15:00:00', 'FALSE', '8', '95','90', 'Μιτιλόγλη', 'Παναθηναϊκός Πατρών');
insert into Matches (Match_ID, Stadium, Date_Time, DNP, Match_Day, Score_Home_Team, Score_Away_Team, Home_Team, Away_Team) values ('74', 'ΕΑΠ', '2021-01-10 15:00:00', 'FALSE', '8', '90','85', 'Πατίστας', 'Διογένης');


insert into Matches (Match_ID, Stadium, Date_Time, DNP, Match_Day, Score_Home_Team, Score_Away_Team, Home_Team, Away_Team) values ('75', 'Παμπελλοπονησιακό', '2021-01-20 15:00:00', 'UNKNOWN', '9', '0', '0', 'Παοκ Πατρών', 'Αετός');
insert into Matches (Match_ID, Stadium, Date_Time, DNP, Match_Day, Score_Home_Team, Score_Away_Team, Home_Team, Away_Team) values ('76', 'Παναχαϊκής', '2021-01-20 15:00:00', 'UNKNOWN', '9', '0', '0', 'Παναχαϊκή', 'Διογένης');
insert into Matches (Match_ID, Stadium, Date_Time, DNP, Match_Day, Score_Home_Team, Score_Away_Team, Home_Team, Away_Team) values ('77', 'Αθλητικό Κέντρο Βραχνέικων', '2021-01-20 15:00:00', 'UNKNOWN', '9', '0', '0', 'Παναθηναϊκός Πατρών', 'Οβρϋά');
insert into Matches (Match_ID, Stadium, Date_Time, DNP, Match_Day, Score_Home_Team, Score_Away_Team, Home_Team, Away_Team) values ('78', 'ΕΑΠ', '2021-01-20 15:00:00', 'UNKNOWN', '9', '0', '0', 'Μιτιλόγλη', 'Πατίστας');


insert into Matches (Match_ID, Stadium, Date_Time, DNP, Match_Day, Score_Home_Team, Score_Away_Team, Home_Team, Away_Team) values ('81', 'Γήπεδο Ανδρέας Παπανδρέου', '2021-02-10 15:00:00', 'UNKNOWN', '10', '0', '0', 'Διογένης', 'Αετός');
insert into Matches (Match_ID, Stadium, Date_Time, DNP, Match_Day, Score_Home_Team, Score_Away_Team, Home_Team, Away_Team) values ('82', 'Παναχαϊκής', '2021-02-10 15:00:00', 'UNKNOWN', '10', '0', '0', 'Παναχαϊκή', 'Πατίστας');
insert into Matches (Match_ID, Stadium, Date_Time, DNP, Match_Day, Score_Home_Team, Score_Away_Team, Home_Team, Away_Team) values ('83', 'Αθλητικό Κέντρο Βραχνέικων', '2021-02-10 15:00:00', 'UNKNOWN', '10', '0', '0', 'Μιτιλόγλη', 'Παοκ Πατρών');
insert into Matches (Match_ID, Stadium, Date_Time, DNP, Match_Day, Score_Home_Team, Score_Away_Team, Home_Team, Away_Team) values ('84', 'Παμπελλοπονησιακό', '2021-02-10 15:00:00', 'UNKNOWN', '10', '0', '0', 'Οβρϋά', 'Παναθηναϊκός Πατρών');


insert into Matches (Match_ID, Stadium, Date_Time, DNP, Match_Day, Score_Home_Team, Score_Away_Team, Home_Team, Away_Team) values ('91', 'Παμπελλοπονησιακό', '2021-02-20 15:00:00', 'UNKNOWN', '11', '0', '0', 'Μιτιλόγλη', 'Αετός');
insert into Matches (Match_ID, Stadium, Date_Time, DNP, Match_Day, Score_Home_Team, Score_Away_Team, Home_Team, Away_Team) values ('92', 'Παναχαϊκής', '2021-02-20 15:00:00', 'UNKNOWN', '11', '0', '0', 'Παναχαϊκή', 'Παναθηναϊκός Πατρών');
insert into Matches (Match_ID, Stadium, Date_Time, DNP, Match_Day, Score_Home_Team, Score_Away_Team, Home_Team, Away_Team) values ('93', 'Δημοτικό Στάδιο Οβρϋάς', '2021-02-20 15:00:00', 'UNKNOWN', '11', '0', '0', 'Διογένης', 'Παοκ Πατρών');
insert into Matches (Match_ID, Stadium, Date_Time, DNP, Match_Day, Score_Home_Team, Score_Away_Team, Home_Team, Away_Team) values ('94', 'Γήπεδο Ανδρέας Παπανδρέου', '2021-02-20 15:00:00', 'UNKNOWN', '11', '0', '0', 'Οβρϋά', 'Πατίστας');


insert into Matches (Match_ID, Stadium, Date_Time, DNP, Match_Day, Score_Home_Team, Score_Away_Team, Home_Team, Away_Team) values ('101', 'Παμπελλοπονησιακό', '2021-03-10 15:00:00', 'UNKNOWN', '12', '0', '0', 'Οβρϋά', 'Αετός');
insert into Matches (Match_ID, Stadium, Date_Time, DNP, Match_Day, Score_Home_Team, Score_Away_Team, Home_Team, Away_Team) values ('102', 'Παναχαϊκής', '2021-03-10 15:00:00', 'UNKNOWN', '12', '0', '0', 'Παναχαϊκή', 'Παοκ Πατρών');
insert into Matches (Match_ID, Stadium, Date_Time, DNP, Match_Day, Score_Home_Team, Score_Away_Team, Home_Team, Away_Team) values ('103', 'ΕΑΠ', '2021-03-10 15:00:00', 'UNKNOWN', '12', '0', '0', 'Μιτιλόγλη', 'Πατίστας');
insert into Matches (Match_ID, Stadium, Date_Time, DNP, Match_Day, Score_Home_Team, Score_Away_Team, Home_Team, Away_Team) values ('104', 'Γήπεδο Ανδρέας Παπανδρέου', '2021-03-10 15:00:00', 'UNKNOWN', '12', '0', '0', 'Διογένης', 'Παναθηναϊκός Πατρών');


insert into Matches (Match_ID, Stadium, Date_Time, DNP, Match_Day, Score_Home_Team, Score_Away_Team, Home_Team, Away_Team) values ('111', 'Παμπελλοπονησιακό', '2021-03-20 15:00:00', 'UNKNOWN', '13', '0', '0', 'Πατίστας', 'Αετός');
insert into Matches (Match_ID, Stadium, Date_Time, DNP, Match_Day, Score_Home_Team, Score_Away_Team, Home_Team, Away_Team) values ('112', 'Παναχαϊκής', '2021-03-20 15:00:00', 'UNKNOWN', '13', '0', '0', 'Παναχαϊκή', 'Μιτιλόγλη');
insert into Matches (Match_ID, Stadium, Date_Time, DNP, Match_Day, Score_Home_Team, Score_Away_Team, Home_Team, Away_Team) values ('113', 'ΕΑΠ', '2021-03-20 15:00:00', 'UNKNOWN', '13', '0', '0', 'Παναθηναϊκός Πατρών', 'Παοκ Πατρών');
insert into Matches (Match_ID, Stadium, Date_Time, DNP, Match_Day, Score_Home_Team, Score_Away_Team, Home_Team, Away_Team) values ('114', 'Γήπεδο Ανδρέας Παπανδρέου', '2021-03-20 15:00:00', 'UNKNOWN', '13', '0', '0', 'Οβρϋά', 'Διογένης');


insert into Matches (Match_ID, Stadium, Date_Time, DNP, Match_Day, Score_Home_Team, Score_Away_Team, Home_Team, Away_Team) values ('121', 'Παμπελλοπονησιακό', '2021-04-10 15:00:00', 'UNKNOWN', '14', '0', '0', 'Παναθηναϊκός Πατρών', 'Αετός');
insert into Matches (Match_ID, Stadium, Date_Time, DNP, Match_Day, Score_Home_Team, Score_Away_Team, Home_Team, Away_Team) values ('122', 'Παναχαϊκής', '2021-04-10 15:00:00', 'UNKNOWN', '14', '0', '0', 'Παναχαϊκή', 'Οβρϋά');
insert into Matches (Match_ID, Stadium, Date_Time, DNP, Match_Day, Score_Home_Team, Score_Away_Team, Home_Team, Away_Team) values ('123', 'Δημοτικό Στάδιο Οβρϋάς', '2021-04-10 15:00:00', 'UNKNOWN', '14', '0', '0', 'Πατίστας', 'Παοκ Πατρών');
insert into Matches (Match_ID, Stadium, Date_Time, DNP, Match_Day, Score_Home_Team, Score_Away_Team, Home_Team, Away_Team) values ('124', 'Γήπεδο Ανδρέας Παπανδρέου', '2021-04-10 15:00:00', 'UNKNOWN', '14', '0', '0', 'Μιτιλόγλη', 'Διογένης');



insert into Matches (Match_ID, Stadium, Date_Time, DNP, Match_Day, Score_Home_Team, Score_Away_Team, Home_Team, Away_Team) values ('10', 'Παναχαϊκής', '2020-09-20 18:00:00', 'TRUE', '1', '0', '0', 'Ηρακλής Πατρών', 'Προμηθέας Β');
insert into Matches (Match_ID, Stadium, Date_Time, DNP, Match_Day, Score_Home_Team, Score_Away_Team, Home_Team, Away_Team) values ('20', 'Παμπελλοπονησιακό', '2020-09-20 18:00:00', 'FALSE', '1', '80','76', 'Βραχνέικα', 'Αίγιο');
insert into Matches (Match_ID, Stadium, Date_Time, DNP, Match_Day, Score_Home_Team, Score_Away_Team, Home_Team, Away_Team) values ('30', 'Γήπεδο Ανδρέας Παπανδρέου', '2020-09-20 18:00:00', 'FALSE', '1', '75','70', 'ΕΑΠ', 'Θησέας');
insert into Matches (Match_ID, Stadium, Date_Time, DNP, Match_Day, Score_Home_Team, Score_Away_Team, Home_Team, Away_Team) values ('40', 'Δημοτικό Στάδιο Οβρϋάς', '2020-09-20 18:00:00', 'FALSE', '1', '60','65', 'Πανεπιστήμιο Πατρών', 'Καλάβρυτα');


insert into Matches (Match_ID, Stadium, Date_Time, DNP, Match_Day, Score_Home_Team, Score_Away_Team, Home_Team, Away_Team) values ('110', 'Γήπεδο Ανδρέας Παπανδρέου', '2020-10-10 18:00:00', 'FALSE', '2', '60','61', 'Ηρακλής Πατρών', 'Καλάβρυτα');
insert into Matches (Match_ID, Stadium, Date_Time, DNP, Match_Day, Score_Home_Team, Score_Away_Team, Home_Team, Away_Team) values ('120', 'Παναχαϊκής', '2020-10-10 18:00:00', 'FALSE', '2', '65','80', 'Βραχνέικα', 'Προμηθέας Β');
insert into Matches (Match_ID, Stadium, Date_Time, DNP, Match_Day, Score_Home_Team, Score_Away_Team, Home_Team, Away_Team) values ('130', 'Παμπελλοπονησιακό', '2020-10-10 18:00:00', 'FALSE', '2', '105','70', 'Θησέας', 'Πανεπιστήμιο Πατρών');
insert into Matches (Match_ID, Stadium, Date_Time, DNP, Match_Day, Score_Home_Team, Score_Away_Team, Home_Team, Away_Team) values ('140', 'Τέντα Μιτιλογλίου', '2020-10-10 18:00:00', 'FALSE', '2', '55','49', 'Αίγιο', 'ΕΑΠ');


insert into Matches (Match_ID, Stadium, Date_Time, DNP, Match_Day, Score_Home_Team, Score_Away_Team, Home_Team, Away_Team) values ('210', 'Γήπεδο Ανδρέας Παπανδρέου', '2020-10-20 18:00:00', 'FALSE', '3', '79','70', 'Ηρακλής Πατρών', 'Αίγιο');
insert into Matches (Match_ID, Stadium, Date_Time, DNP, Match_Day, Score_Home_Team, Score_Away_Team, Home_Team, Away_Team) values ('220', 'Τέντα Μιτιλογλίου', '2020-10-20 18:00:00', 'FALSE', '3', '50','59', 'Πανεπιστήμιο Πατρών', 'Προμηθέας Β');
insert into Matches (Match_ID, Stadium, Date_Time, DNP, Match_Day, Score_Home_Team, Score_Away_Team, Home_Team, Away_Team) values ('230', 'Αθλητικό Κέντρο Βραχνέικων', '2020-10-20 18:00:00', 'FALSE', '3', '65','60', 'Βραχνέικα', 'Καλάβρυτα');
insert into Matches (Match_ID, Stadium, Date_Time, DNP, Match_Day, Score_Home_Team, Score_Away_Team, Home_Team, Away_Team) values ('240', 'Παμπελλοπονησιακό', '2020-10-20 18:00:00', 'FALSE', '3', '90','49', 'Θησέας', 'ΕΑΠ');


insert into Matches (Match_ID, Stadium, Date_Time, DNP, Match_Day, Score_Home_Team, Score_Away_Team, Home_Team, Away_Team) values ('310', 'ΕΑΠ', '2020-11-10 18:00:00', 'FALSE', '4', '75','80', 'Ηρακλής Πατρών', 'Βραχνέικα');
insert into Matches (Match_ID, Stadium, Date_Time, DNP, Match_Day, Score_Home_Team, Score_Away_Team, Home_Team, Away_Team) values ('320', 'Παμπελλοπονησιακό', '2020-11-10 18:00:00', 'TRUE', '4', '0', '0', 'ΕΑΠ', 'Προμηθέας Β');
insert into Matches (Match_ID, Stadium, Date_Time, DNP, Match_Day, Score_Home_Team, Score_Away_Team, Home_Team, Away_Team) values ('330', 'Παναχαϊκής', '2020-11-10 18:00:00', 'TRUE', '4', '0', '0', 'Αίγιο', 'Θησέας');
insert into Matches (Match_ID, Stadium, Date_Time, DNP, Match_Day, Score_Home_Team, Score_Away_Team, Home_Team, Away_Team) values ('340', 'Δημοτικό Στάδιο Οβρϋάς', '2020-11-10 18:00:00', 'FALSE', '4', '70','71', 'Πανεπιστήμιο Πατρών', 'Καλάβρυτα');


insert into Matches (Match_ID, Stadium, Date_Time, DNP, Match_Day, Score_Home_Team, Score_Away_Team, Home_Team, Away_Team) values ('410', 'Αθλητικό Κέντρο Βραχνέικων', '2020-11-20 18:00:00', 'FALSE', '5', '60','58', 'Ηρακλής Πατρών', 'ΕΑΠ');
insert into Matches (Match_ID, Stadium, Date_Time, DNP, Match_Day, Score_Home_Team, Score_Away_Team, Home_Team, Away_Team) values ('420', 'Τέντα Μιτιλογλίου', '2020-11-20 18:00:00', 'FALSE', '5', '90','60', 'Καλάβρυτα', 'Προμηθέας Β');
insert into Matches (Match_ID, Stadium, Date_Time, DNP, Match_Day, Score_Home_Team, Score_Away_Team, Home_Team, Away_Team) values ('430', 'Παναχαϊκής', '2020-11-20 18:00:00', 'FALSE', '5', '60','70', 'Βραχνέικα', 'Θησέας');
insert into Matches (Match_ID, Stadium, Date_Time, DNP, Match_Day, Score_Home_Team, Score_Away_Team, Home_Team, Away_Team) values ('440', 'Παμπελλοπονησιακό', '2020-11-20 18:00:00', 'FALSE', '5', '65','70', 'Πανεπιστήμιο Πατρών', 'Αίγιο');


insert into Matches (Match_ID, Stadium, Date_Time, DNP, Match_Day, Score_Home_Team, Score_Away_Team, Home_Team, Away_Team) values ('510', 'Γήπεδο Ανδρέας Παπανδρέου', '2020-12-10 18:00:00', 'FALSE', '6', '80','90', 'Ηρακλής Πατρών', 'Θησέας');
insert into Matches (Match_ID, Stadium, Date_Time, DNP, Match_Day, Score_Home_Team, Score_Away_Team, Home_Team, Away_Team) values ('520', 'Παναχαϊκής', '2020-12-10 18:00:00', 'FALSE', '6', '95','65', 'Πανεπιστήμιο Πατρών', 'Προμηθέας Β');
insert into Matches (Match_ID, Stadium, Date_Time, DNP, Match_Day, Score_Home_Team, Score_Away_Team, Home_Team, Away_Team) values ('530', 'Τέντα Μιτιλογλίου', '2020-12-10 18:00:00', 'FALSE', '6', '80','90', 'Βραχνέικα', 'ΕΑΠ');
insert into Matches (Match_ID, Stadium, Date_Time, DNP, Match_Day, Score_Home_Team, Score_Away_Team, Home_Team, Away_Team) values ('540', 'Παμπελλοπονησιακό', '2020-12-10 18:00:00', 'FALSE', '6', '70','105', 'Αίγιο', 'Καλάβρυτα');


insert into Matches (Match_ID, Stadium, Date_Time, DNP, Match_Day, Score_Home_Team, Score_Away_Team, Home_Team, Away_Team) values ('610', 'ΕΑΠ', '2020-12-20 18:00:00', 'FALSE', '7', '61','60', 'Ηρακλής Πατρών', 'Θησέας');
insert into Matches (Match_ID, Stadium, Date_Time, DNP, Match_Day, Score_Home_Team, Score_Away_Team, Home_Team, Away_Team) values ('620', 'Παναχαϊκής', '2020-12-20 18:00:00', 'FALSE', '7', '62','80', 'Αίγιο', 'Προμηθέας Β');
insert into Matches (Match_ID, Stadium, Date_Time, DNP, Match_Day, Score_Home_Team, Score_Away_Team, Home_Team, Away_Team) values ('630', 'Παμπελλοπονησιακό', '2020-12-20 18:00:00', 'FALSE', '7', '80','81', 'Βραχνέικα', 'Πανεπιστήμιο Πατρών');
insert into Matches (Match_ID, Stadium, Date_Time, DNP, Match_Day, Score_Home_Team, Score_Away_Team, Home_Team, Away_Team) values ('640', 'Αθλητικό Κέντρο Βραχνέικων', '2020-12-20 18:00:00', 'FALSE', '7', '90','93', 'Καλάβρυτα', 'ΕΑΠ');


insert into Matches (Match_ID, Stadium, Date_Time, DNP, Match_Day, Score_Home_Team, Score_Away_Team, Home_Team, Away_Team) values ('710', 'Παμπελλοπονησιακό', '2021-01-10 18:00:00', 'FALSE', '8', '85','87', 'Προμηθέας Β', 'Ηρακλής Πατρών');
insert into Matches (Match_ID, Stadium, Date_Time, DNP, Match_Day, Score_Home_Team, Score_Away_Team, Home_Team, Away_Team) values ('720', 'Παναχαϊκής', '2021-01-10 18:00:00', 'FALSE', '8', '78','59', 'Βραχνέικα', 'Θησέας');
insert into Matches (Match_ID, Stadium, Date_Time, DNP, Match_Day, Score_Home_Team, Score_Away_Team, Home_Team, Away_Team) values ('730', 'Αθλητικό Κέντρο Βραχνέικων', '2021-01-10 18:00:00', 'FALSE', '8', '95','90', 'Καλάβρυτα', 'Αίγιο');
insert into Matches (Match_ID, Stadium, Date_Time, DNP, Match_Day, Score_Home_Team, Score_Away_Team, Home_Team, Away_Team) values ('740', 'ΕΑΠ', '2021-01-10 18:00:00', 'FALSE', '8', '90','85', 'Πανεπιστήμιο Πατρών', 'ΕΑΠ');


insert into Matches (Match_ID, Stadium, Date_Time, DNP, Match_Day, Score_Home_Team, Score_Away_Team, Home_Team, Away_Team) values ('711', 'Παμπελλοπονησιακό', '2021-01-20 18:00:00', 'UNKNOWN', '9', '0', '0', 'ΕΑΠ', 'Ηρακλής Πατρών');
insert into Matches (Match_ID, Stadium, Date_Time, DNP, Match_Day, Score_Home_Team, Score_Away_Team, Home_Team, Away_Team) values ('722', 'Παναχαϊκής', '2021-01-20 18:00:00', 'UNKNOWN', '9', '0', '0', 'Προμηθέας Β', 'Βραχνέικα');
insert into Matches (Match_ID, Stadium, Date_Time, DNP, Match_Day, Score_Home_Team, Score_Away_Team, Home_Team, Away_Team) values ('733', 'Αθλητικό Κέντρο Βραχνέικων', '2021-01-20 18:00:00', 'UNKNOWN', '9', '0', '0', 'Καλάβρυτα', 'Πανεπιστήμιο Πατρών');
insert into Matches (Match_ID, Stadium, Date_Time, DNP, Match_Day, Score_Home_Team, Score_Away_Team, Home_Team, Away_Team) values ('744', 'ΕΑΠ', '2021-01-20 18:00:00', 'UNKNOWN', '9', '0', '0', 'Θησέας', 'Αίγιο');


insert into Matches (Match_ID, Stadium, Date_Time, DNP, Match_Day, Score_Home_Team, Score_Away_Team, Home_Team, Away_Team) values ('810', 'Γήπεδο Ανδρέας Παπανδρέου', '2021-02-10 18:00:00', 'UNKNOWN', '10', '0', '0', 'Θησέας', 'Ηρακλής Πατρών');
insert into Matches (Match_ID, Stadium, Date_Time, DNP, Match_Day, Score_Home_Team, Score_Away_Team, Home_Team, Away_Team) values ('820', 'Παναχαϊκής', '2021-02-10 18:00:00', 'UNKNOWN', '10', '0', '0', 'Προμηθέας Β', 'Καλάβρυτα');
insert into Matches (Match_ID, Stadium, Date_Time, DNP, Match_Day, Score_Home_Team, Score_Away_Team, Home_Team, Away_Team) values ('830', 'Αθλητικό Κέντρο Βραχνέικων', '2021-02-10 18:00:00', 'UNKNOWN', '10', '0', '0', 'ΕΑΠ', 'Βραχνέικα');
insert into Matches (Match_ID, Stadium, Date_Time, DNP, Match_Day, Score_Home_Team, Score_Away_Team, Home_Team, Away_Team) values ('840', 'Παμπελλοπονησιακό', '2021-02-10 18:00:00', 'UNKNOWN', '10', '0', '0', 'Αίγιο', 'Πανεπιστήμιο Πατρών');


insert into Matches (Match_ID, Stadium, Date_Time, DNP, Match_Day, Score_Home_Team, Score_Away_Team, Home_Team, Away_Team) values ('910', 'Παμπελλοπονησιακό', '2021-02-20 18:00:00', 'UNKNOWN', '11', '0', '0', 'Αίγιο', 'Ηρακλής Πατρών');
insert into Matches (Match_ID, Stadium, Date_Time, DNP, Match_Day, Score_Home_Team, Score_Away_Team, Home_Team, Away_Team) values ('920', 'Παναχαϊκής', '2021-02-20 18:00:00', 'UNKNOWN', '11', '0', '0', 'Προμηθέας Β', 'ΕΑΠ');
insert into Matches (Match_ID, Stadium, Date_Time, DNP, Match_Day, Score_Home_Team, Score_Away_Team, Home_Team, Away_Team) values ('930', 'Δημοτικό Στάδιο Οβρϋάς', '2021-02-20 18:00:00', 'UNKNOWN', '11', '0', '0', 'Θησέας', 'Καλάβρυτα');
insert into Matches (Match_ID, Stadium, Date_Time, DNP, Match_Day, Score_Home_Team, Score_Away_Team, Home_Team, Away_Team) values ('940', 'Γήπεδο Ανδρέας Παπανδρέου', '2021-02-20 18:00:00', 'UNKNOWN', '11', '0', '0', 'Πανεπιστήμιο Πατρών', 'Βραχνέικα');


insert into Matches (Match_ID, Stadium, Date_Time, DNP, Match_Day, Score_Home_Team, Score_Away_Team, Home_Team, Away_Team) values ('1010', 'Παμπελλοπονησιακό', '2021-03-10 18:00:00', 'UNKNOWN', '12', '0', '0', 'Καλάβρυτα', 'Ηρακλής Πατρών');
insert into Matches (Match_ID, Stadium, Date_Time, DNP, Match_Day, Score_Home_Team, Score_Away_Team, Home_Team, Away_Team) values ('1020', 'Παναχαϊκής', '2021-03-10 18:00:00', 'UNKNOWN', '12', '0', '0', 'Προμηθέας Β', 'Πανεπιστήμιο Πατρών');
insert into Matches (Match_ID, Stadium, Date_Time, DNP, Match_Day, Score_Home_Team, Score_Away_Team, Home_Team, Away_Team) values ('1030', 'ΕΑΠ', '2021-03-10 18:00:00', 'UNKNOWN', '12', '0', '0', 'Θησέας', 'Βραχνέικα');
insert into Matches (Match_ID, Stadium, Date_Time, DNP, Match_Day, Score_Home_Team, Score_Away_Team, Home_Team, Away_Team) values ('1040', 'Γήπεδο Ανδρέας Παπανδρέου', '2021-03-10 18:00:00', 'UNKNOWN', '12', '0', '0', 'ΕΑΠ', 'Αίγιο');


insert into Matches (Match_ID, Stadium, Date_Time, DNP, Match_Day, Score_Home_Team, Score_Away_Team, Home_Team, Away_Team) values ('1110', 'Παμπελλοπονησιακό', '2021-03-20 18:00:00', 'UNKNOWN', '13', '0', '0', 'Θησέας', 'Ηρακλής Πατρών');
insert into Matches (Match_ID, Stadium, Date_Time, DNP, Match_Day, Score_Home_Team, Score_Away_Team, Home_Team, Away_Team) values ('1120', 'Παναχαϊκής', '2021-03-20 18:00:00', 'UNKNOWN', '13', '0', '0', 'Προμηθέας Β', 'Αίγιο');
insert into Matches (Match_ID, Stadium, Date_Time, DNP, Match_Day, Score_Home_Team, Score_Away_Team, Home_Team, Away_Team) values ('1130', 'ΕΑΠ', '2021-03-20 18:00:00', 'UNKNOWN', '13', '0', '0', 'ΕΑΠ', 'Πανεπιστήμιο Πατρών');
insert into Matches (Match_ID, Stadium, Date_Time, DNP, Match_Day, Score_Home_Team, Score_Away_Team, Home_Team, Away_Team) values ('1140', 'Γήπεδο Ανδρέας Παπανδρέου', '2021-03-20 18:00:00', 'UNKNOWN', '13', '0', '0', 'Καλάβρυτα', 'Βραχνέικα');


insert into Matches (Match_ID, Stadium, Date_Time, DNP, Match_Day, Score_Home_Team, Score_Away_Team, Home_Team, Away_Team) values ('12100', 'Παμπελλοπονησιακό', '2021-04-10 18:00:00', 'UNKNOWN', '14', '0', '0', 'Θησέας', 'Ηρακλής Πατρών');
insert into Matches (Match_ID, Stadium, Date_Time, DNP, Match_Day, Score_Home_Team, Score_Away_Team, Home_Team, Away_Team) values ('12200', 'Παναχαϊκής', '2021-04-10 18:00:00', 'UNKNOWN', '14', '0', '0', 'Προμηθέας Β', 'Πανεπιστήμιο Πατρών');
insert into Matches (Match_ID, Stadium, Date_Time, DNP, Match_Day, Score_Home_Team, Score_Away_Team, Home_Team, Away_Team) values ('12300', 'Δημοτικό Στάδιο Οβρϋάς', '2021-04-10 18:00:00', 'UNKNOWN', '14', '0', '0', 'ΕΑΠ', 'Καλάβρυτα');
insert into Matches (Match_ID, Stadium, Date_Time, DNP, Match_Day, Score_Home_Team, Score_Away_Team, Home_Team, Away_Team) values ('12400', 'Γήπεδο Ανδρέας Παπανδρέου', '2021-04-10 18:00:00', 'UNKNOWN', '14', '0', '0', 'Αίγιο', 'Βραχνέικα');


delimiter //
CREATE PROCEDURE count (i INT)
AS
DECLARE i INT;
SET i = 1;
GO;//
delimiter;



delimiter //
CREATE TRIGGER `Standings_Update` AFTER UPDATE ON  `Matches` 
FOR EACH ROW
	IF (New.Score_Home_Team > New.Score_Away_Team) 
    THEN
		UPDATE `Standings` SET Points = Points+2, Total_Matches = Total_Matches+1, Wins = Wins+1, Home_Wins = Home_Wins + 1 WHERE Team = New.Home_Team;
		UPDATE `Standings` SET Points = Points+1, Total_Matches = Total_Matches+1, Losses = Losses+1 WHERE Team = New.Away_Team;
	ELSE
		UPDATE `Standings` SET Points = Points+2, Total_Matches = Total_Matches+1, Wins = Wins+1, Away_Wins = Away_Wins + 1 WHERE Team = New.Away_Team;
		UPDATE `Standings` SET Points = Points+1, Total_Matches = Total_Matches+1, Losses = Losses+1 WHERE Team = New.Home_Team;
	END IF
//
delimiter ;

delimiter //
CREATE TRIGGER `DNP_Update` AFTER UPDATE ON  `Matches` 
FOR EACH ROW 
	IF( New.Score_Home_Team <> '0' AND New.Score_Away_Team <> '0')
	THEN
		INSERT INTO Matches(DNP) VALUES('FALSE') ;
	ELSE
		INSERT INTO Matches(DNP) VALUES('TRUE') ;
	END IF
//
delimiter ;
