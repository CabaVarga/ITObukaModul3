-- Zadatak 1.
select nazk
from katedra
order by nazk desc;

-- Zadatak 2.
select concat(imen, ' ', prezn) 'Ime i prezime'
from nastavnik
order by prezn asc;

-- Zadatak 3.
select count(*) 'Broj predmeta'
from predmet
where sem = 1;

-- Zadatak 4.
select spr 'Sifra', nazp 'Naziv'
from predmet
where nazp like '%e%';

-- Zadatak 5.
insert into katedra values ('K5', 'Automatika');
commit;

-- Zadatak 6.
select sum(fond) 'Fond casova', avg(fond) 'Prosecan broj casova'
from predaje
where idn = 'N1';

-- Zadatak 7.
select imen 'Ime', prezn 'Prezime'
from nastavnik
where 
	idk = (select idk from katedra where nazk = 'Algebra') and 
	idn in (select idn from predaje where spr in (select spr from predmet where sem = 1));
    
-- Zadatak 8. (Sa commit-ovanim zadatkom 5 pojavice se i Automatika, pored Numerike)
select nazk
from katedra
where idk not in (select idk from nastavnik);

-- Zadatak 9.
select distinct sem 'Semestar'
from predmet
where spr in (select spr from predaje)
order by sem desc;

-- Zadatak 10.
update nastavnik 
set idk = (select idk from katedra where nazk = 'K2') 
where imen like 'M%';
