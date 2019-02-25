alter database minerva_kreacija character set utf8 collate utf8_general_ci;
use minerva_kreacija;

create table korisnik(
sifra 						int not null primary key auto_increment,
korisnickoime 				varchar(20) not null,
datumreg					datetime not null,
ime 						varchar(50) not null,
prezime 					varchar(50) not null,
email 						varchar(100) not null,
telefon 					varchar(20) not null
/*,lozinka					char(60) not null,
oib 						char(11),
datumrodenja 				datetime,
omeni 						varchar(255),
profilnaslika 				varchar(255)*/
);

create table kategorija(
sifra 						int not null primary key auto_increment,
naziv 						varchar(100) not null /*,
nadredjena					int */
);

create table oglas(
sifra 						int not null primary key auto_increment,
pocetnidatum 				datetime not null,
datumisteka 				datetime,
korisnik					int not null,
vrsta						varchar(50) not null,
naziv 						varchar(100) not null,
tekstponude					varchar(255),
kategorija 					int not null,
javljamse_korisnik			int
);

create table ocjena (
sifra 						int not null primary key auto_increment,
datumocjene					datetime,
ocjena						int not null,
oglas						int not null,
javljamse_korisnik			int
);

create table kategorija_oglas(
kategorija					int,
oglas						int
);

/*alter table kategorija add foreign key (nadredjena) references kategorija(sifra);*/

alter table oglas add foreign key (korisnik) references korisnik(sifra);
alter table oglas add foreign key (kategorija) references kategorija(sifra);
alter table oglas add foreign key (javljamse_korisnik) references korisnik(sifra);

alter table ocjena add foreign key (oglas) references oglas(sifra);
alter table ocjena add foreign key (javljamse_korisnik) references korisnik(sifra);

alter table kategorija_oglas add foreign key (kategorija) references kategorija(sifra);
alter table kategorija_oglas add foreign key (oglas) references oglas(sifra);


insert into korisnik 
(sifra,korisnickoime,datumreg,ime,prezime,email,telefon/*,lozinka,oib,datumrodenja,omeni,profilnaslika*/) values

(null,'Pero_pitur','2018-10-02','Petar','Anić','pero.piturZG@gmail.com','+385952225555'
/*'$2y$10$HSbXqWns5.PRWg4U.mz.keuej1sMYGvb.WXhuLdMd7ju1cyUg8kE2','01234567891','1975-07-10','Pozdrav! Moje ime je Petar, bavim se umjetničkim slikanjem. Najčešća tehnika koju koristim je ulje na platnu.',null*/),

(null,'Foto_Ana','2018-10-03','Ana','Simić','foto.ana5@gmail.com','+385991116666'
/*'$2y$10$Vny1RG//8o1NJd/w4PxBMOln/Dra1YApsSSzZDre79toXGm7XE2EO',
'55555555555','1988-04-22','Bavim se fotografijom posljednjih 5 godina.',null*/),

(null,'Sara-design','2018-10-06','Sara','Sarić','sara.design@gmail.com','+385958884444'
/*'$2y$10$oSi4G6jx/w1.B7wY0Q3csORPoresOPXYSV363l8/qmkPTPt06LiWK',null,'1989-07-23','Pozdrav, ime mi je Sara i posljednjih 10 godina se bavim grafičkim dizajnom.',null*/);

insert into kategorija (sifra,naziv/*,nadredjena*/) values
(null,'Fotografija'/*,null*/),
(null,'Slikanje, crtanje'/*,null*/),
(null,'Grafički dizajn'/*,null*/),
(null,'Kreiranje glazbe'/*,null)*/),
(null,'Usluga profesionalnog fotografiranja'/*,1*/),
(null,'Obrada digitalnih fotografija'/*,1*/),
(null,'Slikanje umjetničkih slika tehnikom ulje na platnu'/*,2*/),
(null,'Crtanje umjetničkih slika grafitnom olovkom'/*,2*/),
(null,'Izrada vizitki, letaka, brošura - manjih grafičkih proizvoda'/*,3*/),
(null,'Izrada knjige grafičkih standarda'/*,3*/);

insert into oglas (sifra,pocetnidatum,datumisteka,korisnik,vrsta,naziv,tekstponude,kategorija,javljamse_korisnik) values
(null,'2018-11-20','2018-12-20',1,'ponuda','Slikam umjetničke slike tehnikom ulje na platnu po narudžbi','Naslikat ću Vam umjetničku sliku po narudžbi slikarskom tehnikom ulje na platnu. Možete mi poslati fotografiju Vaših najmilijih ili opisati detalje i motive slike kakvu biste voljeli imati. Dostupne dimenzije...',7,2),
(null,'2018-11-10','2018-12-10',2,'ponuda','Fotografiranje događaja - rođendani, djevojačke, momačke, krstitke, krizme...','Fotografiram bitne događaje u Vašem životu u Zagrebu i okolici. Javite se...',5,3);

insert into ocjena (sifra,datumocjene,ocjena,oglas,javljamse_korisnik) values
(null,'2018-11-15',5,1,2);

create table operater(
	sifra int not null primary key auto_increment,
	ime varchar(50) not null,
	prezime varchar(50) not null,
	email varchar(100) not null,
	lozinka char(60) not null
);

insert into operater (ime,prezime,email,lozinka) values
(
	'Kristina',
	'Terzić',
	'kristina.terzic01@gmail.com',
	'$2y$10$EoDbIjVh0nP4FrXewYTBjuvSIlFeXxPviXK2QVs51XOOmnwZpmHau'

);



select 'Gotov sam';


