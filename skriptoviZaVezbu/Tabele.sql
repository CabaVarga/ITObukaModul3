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

