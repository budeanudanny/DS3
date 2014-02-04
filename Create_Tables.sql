DROP TABLE "CDs".Band cascade; 

DROP TABLE "CDs".Release cascade;

DROP TABLE "CDs".Song cascade;

DROP TABLE "CDs".mem cascade;

DROP TABLE "CDs".MemberOf cascade;

CREATE TABLE "CDs".Band(
	bid integer NOT NULL,
	name varchar(50) NOT NULL,
	country varchar(20),
	webpage varchar(120),
	PRIMARY KEY (bid)
);

CREATE TABLE "CDs".Release(
	rid integer NOT NULL,
	bid integer NOT NULL,
	title varchar(120) NOT NULL,
	year integer,
	type varchar(10) NOT NULL,
	rating integer,
	FOREIGN KEY (bid) REFERENCES "CDs".Band(bid),
	PRIMARY KEY (rid)
);

CREATE TABLE "CDs".Song(
	title varchar(120) NOT NULL,
	rid integer NOT NULL,
	cdbonus char(1),
	FOREIGN KEY (rid) REFERENCES "CDs".Release(rid),
	PRIMARY KEY (title, rid)
);

create table "CDs".mem(

	mid integer not null primary key,
	name varchar(50),
	stillalive char(1) 
	
);

create table "CDs".MemberOf (
	
	mid integer not null,
	bid integer not null,
	startyear integer,
	endyear integer,
	instrument varchar(15),
	unique (startyear, endyear),
	
	foreign key (mid) references "CDs".mem(mid),
	foreign key (bid) references "CDs".Band(bid),	

	primary key (mid, bid,startyear, endyear)
);
