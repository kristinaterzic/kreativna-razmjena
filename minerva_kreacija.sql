drop database if exists minerva_kreacija;
create database minerva_kreacija character set utf8 collate utf8_general_ci;
/* mysql -uminerva_alfa -pkreacija123 --default_character_set=utf8 < E:\vhost\polaznik42.edunova.hr\minerva_kreacija.sql 
alter database minerva_kreacija character set utf8 collate utf8_general_ci; */
use minerva_kreacija;

create table korisnik(
sifra 						int not null primary key auto_increment,
korisnickoime 				varchar(20) not null,
datumreg					TIMESTAMP DEFAULT CURRENT_TIMESTAMP not null,
ime 						varchar(50),
prezime 					varchar(50),
email 						varchar(100) not null,
telefon 					varchar(20),
lozinka						varchar(200) not null,
oib 						char(11),
datumrodenja 				date,
omeni 						varchar(255),
profilnaslika 				varchar(255)
);

create table kategorija(
sifra 						int not null primary key auto_increment,
naziv 						varchar(100) not null,
ikona						varchar(50),
nadredjena					int
);

create table oglas(
sifra 						int not null primary key auto_increment,
pocetnidatum 				date not null,
datumisteka 				date,
korisnik					int not null,
vrsta						varchar(50) not null,
naziv 						varchar(100) not null,
tekstponude					varchar(255),
kategorija 					int not null,
javljamse_korisnik			int
);

create table ocjena (
sifra 						int not null primary key auto_increment,
datumocjene					TIMESTAMP DEFAULT CURRENT_TIMESTAMP not null,
ocjena						int not null,
oglas						int not null,
javljamse_korisnik			int
);

create table kategorija_oglas(
kategorija					int,
oglas						int
);

alter table kategorija add foreign key (nadredjena) references kategorija(sifra);

alter table oglas add foreign key (korisnik) references korisnik(sifra);
alter table oglas add foreign key (kategorija) references kategorija(sifra);
alter table oglas add foreign key (javljamse_korisnik) references korisnik(sifra);

alter table ocjena add foreign key (oglas) references oglas(sifra);
alter table ocjena add foreign key (javljamse_korisnik) references korisnik(sifra);

alter table kategorija_oglas add foreign key (kategorija) references kategorija(sifra);
alter table kategorija_oglas add foreign key (oglas) references oglas(sifra);


insert into korisnik 
(sifra,korisnickoime,datumreg,ime,prezime,email,telefon,lozinka,oib,datumrodenja,omeni,profilnaslika) values

(
null,
'Terza',
'2018-09-05 08:07:00',
'Kristina',
'Terzić',
'kristina.terzic01@gmail.com',
'+385952225555',
'$2y$10$EoDbIjVh0nP4FrXewYTBjuvSIlFeXxPviXK2QVs51XOOmnwZpmHau',
'61611115365',
'1989-08-02',
'Pozdrav, zovem se Kristina i napravila sam ovu stranicu.',
null
),

(
null,
'Pero_pitur',
'2018-10-02 09:32:00',
'Petar',
'Anić',
'pero.piturZG@gmail.com',
'+385952225555',
'$2y$10$EoDbIjVh0nP4FrXewYTBjuvSIlFeXxPviXK2QVs51XOOmnwZpmHau',
'45766147816',
'1975-07-10',
'Pozdrav! Moje ime je Petar, bavim se umjetničkim slikanjem. Najčešća tehnika koju koristim je ulje na platnu.',
null
),

(
	null,
'Foto_Ana',
'2018-10-03 17:05:00',
'Ana',
'Simić',
'foto.ana5@gmail.com',
'+385991116666',
'$2y$10$EoDbIjVh0nP4FrXewYTBjuvSIlFeXxPviXK2QVs51XOOmnwZpmHau',
'55049590190',
'1988-04-22',
'Ja sam Ana i bavim se fotografijom posljednjih 5 godina.',
null
),

(
	null,
'Luka_lukic',
'2018-10-10 18:05:00',
'Luka',
'Lukić',
'luka.lukic@gmail.com',
'+385992555226',
'$2y$10$EoDbIjVh0nP4FrXewYTBjuvSIlFeXxPviXK2QVs51XOOmnwZpmHau',
'53202009382',
'1988-04-22',
'Grafički sam dizajner s dugogodišnjim iskustvom.',
null
),

(null,
'Sara-design',
'2018-10-06 10:55:02',
'Sara',
'Sarić',
'sara.design@gmail.com',
'+385958884444',
'$2y$10$EoDbIjVh0nP4FrXewYTBjuvSIlFeXxPviXK2QVs51XOOmnwZpmHau',
'28068051808',
'1989-07-23',
'Pozdrav, ime mi je Sara i posljednjih 10 godina se bavim web dizajnom.',
null
),

(null,
'Milla_music',
'2018-10-10 13:25:02',
'Mila',
'Milić',
'milla.music@gmail.com',
'+385950202002',
'$2y$10$EoDbIjVh0nP4FrXewYTBjuvSIlFeXxPviXK2QVs51XOOmnwZpmHau',
'58689973630',
'1985-05-10',
'Profesionalni sam klavirist, za Vas ću uglazbiti pjesme za koje ste napisli tekstove.',
null
),

(null,
'Big_brother',
'2018-01-01 15:30:06',
'Matej',
'Matić',
'big.brother@gmail.com',
'+385282548402',
'$2y$10$EoDbIjVh0nP4FrXewYTBjuvSIlFeXxPviXK2QVs51XOOmnwZpmHau',
'47340321213',
'1990-02-04',
'Trebate profesionalni video snimak? Došli ste na pravo mjesto!',
null
),

(null,
'Ankica_krojačica',
'2018-09-07 17:22:06',
'Ankica',
'Ančić',
'ankica.krojacica@gmail.com',
'+385998855112',
'$2y$10$EoDbIjVh0nP4FrXewYTBjuvSIlFeXxPviXK2QVs51XOOmnwZpmHau',
'07733571627',
'1960-03-15',
'Krojačica sam s dugogodišnjim iskustvom, šijem kvalitetnu odjeću po mjeri.',
null
),

(null,
'Zlatno_Pero',
'2018-06-07 09:10:06',
'Zlatko',
'Pero',
'zlatko.pero@gmail.com',
'+385991212553',
'$2y$10$EoDbIjVh0nP4FrXewYTBjuvSIlFeXxPviXK2QVs51XOOmnwZpmHau',
'26043557301',
'1975-11-22',
'Trebate usluge kreativnog pisanja? Javite se s povjerenjem.',
null
),
(null,
'Šljokica',
'2018-08-14 11:08:55',
'Maja',
'Perlica',
'maja.perlica@gmail.com',
'+385981448732',
'$2y$10$EoDbIjVh0nP4FrXewYTBjuvSIlFeXxPviXK2QVs51XOOmnwZpmHau',
'38125844450',
'1994-02-11',
'Izrađujem ručno rađeni nakit.',
null
),

(null,
'Umjetnost_i_dom',
'2018-04-08 22:06:22',
'Dinka',
'Danić',
'dinka.loveshome@gmail.com',
'+38598123545',
'$2y$10$EoDbIjVh0nP4FrXewYTBjuvSIlFeXxPviXK2QVs51XOOmnwZpmHau',
'83321369625',
'1982-09-06',
'Izrađujem ukrasne police, kaliće za cvijeće, stoliće za uređenje doma. Pogledajte moju galeriju.',
null
),
(null,
'Gift4you',
'2018-11-03 09:35:04',
'Ivana',
'Ivanić',
'gift4you@gmail.com',
'+38526525251',
'$2y$10$EoDbIjVh0nP4FrXewYTBjuvSIlFeXxPviXK2QVs51XOOmnwZpmHau',
'94282312285',
'1986-01-18',
'Izrađujem unikatne poklone za vaše najmilije! Pogledajte primjere u mojoj galeriji.',
null
),

(null,
'Ami',
'2018-09-05 08:07:00',
null,null,
'ami09@gmail.com',
null,
'$2y$10$EoDbIjVh0nP4FrXewYTBjuvSIlFeXxPviXK2QVs51XOOmnwZpmHau',
null,null,null,null),

(null,
'Bill',
'2018-09-05 08:07:00',
null,null,
'bill@gmail.com',
null,
'$2y$10$EoDbIjVh0nP4FrXewYTBjuvSIlFeXxPviXK2QVs51XOOmnwZpmHau',
null,null,null,null),

(null,
'Veronika',
'2018-09-05 08:07:00',
null,null,
'vero09@gmail.com',
null,
'$2y$10$EoDbIjVh0nP4FrXewYTBjuvSIlFeXxPviXK2QVs51XOOmnwZpmHau',
null,null,null,null),

(null,
'Ronnie',
'2018-09-05 08:07:00',
null,null,
'ronnie@gmail.com',
null,
'$2y$10$EoDbIjVh0nP4FrXewYTBjuvSIlFeXxPviXK2QVs51XOOmnwZpmHau',
null,null,null,null);

insert into kategorija (sifra,naziv,ikona,nadredjena) values
(null,'Fotografija','camera',null),
(null,'Slikanje, crtanje','palette',null),
(null,'Grafički dizajn','magic',null),
(null,'Web dizajn','code',null),
(null,'Kreiranje glazbe','music',null),
(null,'Kreiranje videa','video',null),
(null,'Izrada odjeće','tshirt',null),
(null,'Kreativno pisanje','pen-fancy',null),
(null,'Izrada nakita','gem',null),
(null,'Kućne dekoracije','couch',null),
(null,'Izrada poklona','gift',null),
(null,'Ostalo','ellipsis-h',null);


insert into oglas (sifra,pocetnidatum,datumisteka,korisnik,vrsta,naziv,tekstponude,kategorija,javljamse_korisnik) values
(null,
'2018-11-20',
'2018-12-20',
2,
'ponuda',
'Slikanje umjetničkih slika',
'Naslikat ću Vam umjetničku sliku po narudžbi slikarskom tehnikom ulje na platnu. Možete mi poslati fotografiju Vaših najmilijih ili opisati detalje i motive slike kakvu biste voljeli imati. Dostupne dimenzije...',
2,
null),

(null,
'2018-11-10',
'2018-12-10',
3,
'ponuda',
'Fotografiranje događaja - rođendani, djevojačke, momačke, krstitke, krizme...','Fotografiram bitne događaje u Vašem životu u Zagrebu i okolici. Javite se...',
1,
3),

(null,
'2018-11-20',
'2018-12-20',
4,
'ponuda',
'Dizajn grafičkih proizvoda',
'Dizajniram jedinstvene logotipe po narudžbi, izrađujem manje grafičke proizvode postere, letke, brošure, vizit kartice, pozivnice. Javite se s povjerenjem.',
3,
2),

(null,
'2018-11-20',
'2018-12-20',
5,
'ponuda',
'Jedinstveni dizajn mrežnih stranica',
'Web dizjaner s iskustvom kreira jedinstveni izgled Vaše mrežne stranice.',
4,
null),

(null,
'2018-11-20',
'2018-12-20',
6,
'ponuda',
'Skladam klavirske pratnje po narudžbi',
'Treba li Vam jedinstvena autoraska klavirska pratnja za Vaše video snimke? Želite li uglaubiti svoje tekstove? Javite se s povjerenjem.',
5,
4),

(null,
'2018-11-20',
'2018-12-20',
7,
'ponuda',
'Video snimanje',
'Usluga profesionalnog snimanja - vjenčanja, krštenja, rođendani... Javite se s povjerenjem.',
6,
6),

(null,
'2018-11-20',
'2018-12-20',
8,
'ponuda',
'Šivanje odjeće',
'Krojačica s dugogodišnjim iskustvom šije sve oblike odjevnih predmeta po mjeri.',
7,
null),

(null,
'2018-11-20',
'2018-12-20',
9,
'ponuda',
'Kreativno pisanje',
'Ako trebate usluge kreativnog pisanja, javite se.',
8,
7),


(null,
'2018-11-20',
'2018-12-20',
10,
'ponuda',
'Ručno rađeni nakit',
'Izrađujem ručno rađeni nakit. Pogledajte ponudu u galeriji.',
9,
null);


insert into ocjena (sifra,datumocjene,ocjena,oglas,javljamse_korisnik) values
(null,'2018-11-16 09:25:04',5,2,3),
(null,'2018-11-17 10:45:04',4,3,2),
(null,'2018-11-18 11:15:04',3,5,4),
(null,'2018-11-19 12:16:04',5,6,6),
(null,'2018-11-20 13:09:04',2,8,7);


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


