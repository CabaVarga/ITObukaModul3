create database Fakultet;
use Fakultet;

CREATE TABLE Katedra(
	 IDK varchar(10) NOT NULL,
	 NAZK varchar(30) NOT NULL,	      	 
	 CONSTRAINT katedra_PK PRIMARY KEY (IDK)		      	 
);

CREATE TABLE Nastavnik(
	 IDN varchar(10) NOT NULL,
	 IMEN varchar(30) NOT NULL,
	 PREZN varchar(30) NOT NULL, 
         ZVANJE varchar(30), 
         IDK varchar(10),
	 CONSTRAINT Nastavnik_PK PRIMARY KEY (IDN),
	 CONSTRAINT Nastavnik_FK FOREIGN KEY (IDK) REFERENCES Katedra(IDK)	      	 
);

CREATE TABLE Predmet(
	 SPR varchar(10) NOT NULL,
	 NAZP varchar(35) NOT NULL,	
         SEM integer,
	 CONSTRAINT Predmet_PK PRIMARY KEY (SPR)	      	 
);

CREATE TABLE Predaje
	(
	 IDN varchar(10) NOT NULL,	 
	 SPR varchar(10) NOT NULL,
         FOND integer NOT NULL,
         CONSTRAINT Predaje_PK PRIMARY KEY (IDN, SPR),
	 CONSTRAINT Predaje_Nastavnik_FK FOREIGN KEY (IDN) REFERENCES Nastavnik(IDN),
	 CONSTRAINT Predaje_Predmet_FK FOREIGN KEY (SPR) REFERENCES Predmet(SPR)         
);

-- prvo se insertuju vrednosti za katedre
insert into katedra values ('K1', 'Analiza');
insert into katedra values ('K2', 'Algebra');
insert into katedra values ('K3', 'Numerika');
insert into katedra values ('K4', 'Informatika');
commit;

-- zatim idu vrednosti za nastavnike
insert into nastavnik values ('N1', 'Sava', 'Savic', 'Docent', 'K1');
insert into nastavnik values ('N2', 'Mara', 'Maric', 'Asistent', 'K1');
insert into nastavnik values ('N3', 'Petar', 'Peric', 'Asistent', 'K2');
insert into nastavnik values ('N4', 'Mira', 'Ilic', null, 'K4');
insert into nastavnik values ('N5', 'Ivan', 'Ivic', 'Asistent', 'K4');
commit;

-- posle nastavnika idu predmeti
insert into predmet values ('P1', 'Analiza 1', 1);
insert into predmet values ('P2', 'Analiza 2', 2);
insert into predmet values ('P3', 'Logika', 1);
insert into predmet values ('P4', 'Baze podataka', 3);
insert into predmet values ('P5', 'Informacioni sistemi', 4);
commit;

-- konacno, povezuju se predmeti sa nastavnicima
insert into predaje values ('N1', 'P1', 3);
insert into predaje values ('N1', 'P2', 2);
insert into predaje values ('N4', 'P4', 3);
insert into predaje values ('N5', 'P5', 3);
insert into predaje values ('N3', 'P3', 2);
insert into predaje values ('N4', 'P5', 2);
insert into predaje values ('N5', 'P4', 4);
insert into predaje values ('N1', 'P3', 1);
insert into predaje values ('N1', 'P4', 2);
insert into predaje values ('N1', 'P5', 2);
commit;