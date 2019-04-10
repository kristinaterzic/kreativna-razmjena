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

(null, 'zvonrueden', '2018-03-16 00:36:12', 'Freeman', 'Hettinger', 'pamela.boehm@example.com', '(895)980-6465x08179', '$2y$10$EoDbIjVh0nP4FrXewYTBjuvSIlFeXxPviXK2QVs51XOOmnwZpmHau', '62399593245', '2013-08-12', 'Qui minima corrupti enim. Iste qui ut sed fugit aut. Qui iusto nisi ipsum ut ex quidem. Sunt iste et atque odit.', 'http://lorempixel.com/640/480/'),
(null, 'jacklyn92', '2018-09-15 19:59:41', 'Stan', 'Kutch', 'crona.francisca@example.com', '545-058-2447', '$2y$10$EoDbIjVh0nP4FrXewYTBjuvSIlFeXxPviXK2QVs51XOOmnwZpmHau', '29025565052', '2018-10-07', 'Molestias deserunt ut mollitia sint quo. Eum ad accusamus veniam alias voluptatem magni. Natus dolor quis minus quam tempora officia qui.', 'http://lorempixel.com/640/480/'),
(null, 'waters.zita', '2018-09-14 14:33:22', 'Wilhelm', 'Deckow', 'paul17@example.org', '1-661-783-5170', '$2y$10$EoDbIjVh0nP4FrXewYTBjuvSIlFeXxPviXK2QVs51XOOmnwZpmHau', '11572739008', '2012-09-15', 'Saepe eos nulla doloremque voluptate amet id vel. Quisquam nihil ut atque et voluptatem magni doloribus. Incidunt qui possimus consequatur consectetur modi itaque.', 'http://lorempixel.com/640/480/'),
(null, 'volkman.walter', '2018-12-28 02:22:48', 'Eulalia', 'Greenfelder', 'edach@example.net', '(051)853-3474x53747', '$2y$10$EoDbIjVh0nP4FrXewYTBjuvSIlFeXxPviXK2QVs51XOOmnwZpmHau', '78835664962', '1988-08-07', 'Officiis est in libero ad maxime ipsum sint. Dolorem voluptatum sunt soluta officia quia. Earum nihil consequuntur ut esse.', 'http://lorempixel.com/640/480/'),
(null, 'ualtenwerth', '2018-07-18 14:55:14', 'Sabrina', 'Gusikowski', 'spencer96@example.com', '(206)881-4993', '$2y$10$EoDbIjVh0nP4FrXewYTBjuvSIlFeXxPviXK2QVs51XOOmnwZpmHau', '29243461480', '1992-06-29', 'Et molestias corporis exercitationem aut aspernatur. Deleniti voluptatem consequatur recusandae vel non. Ullam enim quibusdam itaque corporis magnam. Rerum hic nam nesciunt qui et.', 'http://lorempixel.com/640/480/'),
(null, 'jward', '2018-08-29 21:25:26', 'Brielle', 'Feeney', 'lkuhlman@example.org', '071-479-3233', '$2y$10$EoDbIjVh0nP4FrXewYTBjuvSIlFeXxPviXK2QVs51XOOmnwZpmHau', '64764757855', '2000-01-27', 'Necessitatibus enim qui expedita et non quis beatae. Neque molestiae ut qui neque commodi aliquam. Et voluptatum voluptas enim expedita.', 'http://lorempixel.com/640/480/'),
(null, 'meggie.walter', '2018-03-12 07:46:38', 'Santino', 'Hoeger', 'koss.buster@example.com', '1-877-132-4158', '$2y$10$EoDbIjVh0nP4FrXewYTBjuvSIlFeXxPviXK2QVs51XOOmnwZpmHau', '73469923349', '1985-06-04', 'Pariatur laudantium sint voluptatem assumenda. Enim aut commodi delectus ullam. Et excepturi id ut quisquam illum dolor.', 'http://lorempixel.com/640/480/'),
(null, 'znader', '2018-05-05 17:07:25', 'Mose', 'Treutel', 'grant.lori@example.org', '1-157-198-7196x947', '$2y$10$EoDbIjVh0nP4FrXewYTBjuvSIlFeXxPviXK2QVs51XOOmnwZpmHau', '15933825643', '1984-05-01', 'Debitis fuga asperiores dolor laborum harum voluptatum. Neque omnis autem debitis dignissimos fugit. Minima voluptatem est iusto et aut et sed. Aut voluptas dolore quisquam omnis ut dolor.', 'http://lorempixel.com/640/480/'),
(null, 'nicola.jaskolski', '2018-06-27 02:54:42', 'Tobin', 'Zboncak', 'icremin@example.org', '(988)743-8365x4790', '$2y$10$EoDbIjVh0nP4FrXewYTBjuvSIlFeXxPviXK2QVs51XOOmnwZpmHau', '19387116323', '1971-02-24', 'Qui totam voluptatum et porro cum laboriosam et. Dicta blanditiis dolores aut eum. Quis expedita ut nulla vel non labore iste.', 'http://lorempixel.com/640/480/'),
(null, 'paolo14', '2018-08-29 23:37:29', 'Vena', 'Schroeder', 'casimer72@example.net', '(814)964-9362', '$2y$10$EoDbIjVh0nP4FrXewYTBjuvSIlFeXxPviXK2QVs51XOOmnwZpmHau', '43006115182', '1990-03-14', 'Consectetur expedita consectetur id quia voluptate sint voluptas. Voluptas repellat quia ducimus at. A consequuntur suscipit non quis occaecati illum deleniti.', 'http://lorempixel.com/640/480/'),
(null, 'vjakubowski', '2018-04-28 21:37:19', 'Granville', 'Walsh', 'ebahringer@example.org', '1-860-521-5003', '$2y$10$EoDbIjVh0nP4FrXewYTBjuvSIlFeXxPviXK2QVs51XOOmnwZpmHau', '95438825547', '2015-08-06', 'Similique quos repudiandae at ea odit accusantium quia. Earum qui modi iste deserunt laboriosam. Sunt quo occaecati accusamus dolorem nemo atque.', 'http://lorempixel.com/640/480/'),
(null, 'imogene95', '2018-02-13 17:55:26', 'Halle', 'Hermiston', 'rcremin@example.net', '1-643-193-1149x08089', '$2y$10$EoDbIjVh0nP4FrXewYTBjuvSIlFeXxPviXK2QVs51XOOmnwZpmHau', '52663611358', '1978-08-02', 'Facere quo eum accusantium omnis iusto quis vel et. Exercitationem perspiciatis delectus voluptatem ab. Eum ipsum ratione qui.', 'http://lorempixel.com/640/480/'),
(null, 'helga.hane', '2018-02-05 14:00:28', 'Rosa', 'Gleichner', 'hessel.ubaldo@example.net', '01793194258', '$2y$10$EoDbIjVh0nP4FrXewYTBjuvSIlFeXxPviXK2QVs51XOOmnwZpmHau', '68959308434', '1982-07-09', 'Odio quo et nihil et magnam illum sint rerum. Cumque voluptas omnis harum quis quam praesentium. Sunt sapiente dolorum quae sint. Qui et autem omnis consequatur ipsam repudiandae.', 'http://lorempixel.com/640/480/'),
(null, 'orempel', '2018-02-07 16:14:55', 'Dayton', 'Conn', 'ray.donnelly@example.org', '541-494-4778x9796', '$2y$10$EoDbIjVh0nP4FrXewYTBjuvSIlFeXxPviXK2QVs51XOOmnwZpmHau', '23034333919', '1985-06-03', 'Autem atque et sed eveniet molestiae in. Sunt dolore laboriosam soluta id sunt est. Ullam aut consequatur voluptas. Quam consequatur inventore tempore eius distinctio eos qui.', 'http://lorempixel.com/640/480/'),
(null, 'otha.stanton', '2018-08-12 20:06:48', 'Dorris', 'Kemmer', 'shyatt@example.net', '910-676-4958x30852', '$2y$10$EoDbIjVh0nP4FrXewYTBjuvSIlFeXxPviXK2QVs51XOOmnwZpmHau', '25298433765', '2013-08-21', 'Natus et sed aspernatur in voluptas deserunt aut id. Iste blanditiis sint dignissimos eum corporis. Nam voluptas corporis non ullam quae.', 'http://lorempixel.com/640/480/'),
(null, 'linda63', '2018-08-14 16:47:26', 'Jerald', 'Reynolds', 'gwaters@example.com', '(661)923-8074x30417', '$2y$10$EoDbIjVh0nP4FrXewYTBjuvSIlFeXxPviXK2QVs51XOOmnwZpmHau', '92559578761', '2003-08-01', 'Autem et ut illum. Rerum non autem et ratione voluptatem qui. Quasi illo qui quis qui. Doloremque itaque repellendus culpa maiores quaerat et animi.', 'http://lorempixel.com/640/480/'),
(null, 'esmith', '2018-03-30 18:20:02', 'Destiney', 'Upton', 'ilene67@example.org', '1-369-623-5703', '$2y$10$EoDbIjVh0nP4FrXewYTBjuvSIlFeXxPviXK2QVs51XOOmnwZpmHau', '99924884326', '2003-07-18', 'Quo minima deserunt accusantium velit voluptas ratione magnam ipsa. Animi dolorum voluptatum sint enim consequatur. Esse praesentium atque reprehenderit dolores. Vel qui et qui vitae nihil.', 'http://lorempixel.com/640/480/'),
(null, 'littel.lucienne', '2018-01-11 18:23:03', 'Samson', 'Roberts', 'hturner@example.com', '233-035-6112x69412', 'EoDbIjVh0nP4FrXewYTBjuvSIlFeXxPviXK2QVs51XOOmnwZpmHau', '07712623894', '2007-02-15', 'Facilis doloremque reprehenderit quos et sit. Incidunt consectetur perferendis reprehenderit id suscipit consectetur non. Cupiditate facilis tempore et rerum sint.', 'http://lorempixel.com/640/480/');




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
'2019-04-10',
'2019-05-10',
2,
'ponuda',
'Slikanje umjetničkih slika',
'Naslikat ću Vam umjetničku sliku po narudžbi slikarskom tehnikom ulje na platnu. Možete mi poslati fotografiju Vaših najmilijih ili opisati detalje i motive slike kakvu biste voljeli imati. Dostupne dimenzije...',
2,
null),

(null,
'2019-02-03',
'2019-03-03',
12,
'ponuda',
'Umjetničke slike',
'Slikam umjetničke slike različitim tehnikama: tempere, ulje na platnu, vodene bojice... Pogledajte više u mojoj galeriji.',
2,
null),

(null,
'2019-02-15',
'2019-03-15',
13,
'ponuda',
'Umjetnička djela',
'Slikam po narudžbi. Javite se s povjerenjem.',
2,
null),

(null,
'2019-04-01',
'2019-05-01',
14,
'ponuda',
'Slike akademskog slikara',
'Naslikat ću Vam umjetničke slike po narudžbi. Primjere pogledajte u mojoj galeriji.',
2,
null),

(null,
'2019-02-25',
'2019-03-25',
15,
'ponuda',
'Umjetničke slike',
'Prodajem umjetničke slike različitih slikara. Pogledajte galeriju. Cijena po dogovoru.',
2,
null),

(null,
'2019-04-01',
'2019-05-01',
16,
'ponuda',
'Portreti prema fotografijama',
'Crtam profesionalne potrete grafitnom olovkom po narudžbi.',
2,
null),

(null,
'2019-01-13',
'2019-02-13',
17,
'potražnja',
'Kupujem umjetničke slike',
'Zainteresiran sam za kupnju više umjetničkih slika za uređenje interijera. Preferiram modernije radove živućih autora.',
2,
null),

(null,
'2019-04-04',
'2019-05-04',
18,
'potražnja',
'Trebam ilustratora',
'Tražim iskusnog ilustratora za ilustraciju zanimljive priče za djecu.',
2,
null),

(null,
'2019-03-24',
'2019-04-24',
19,
'potražnja',
'Ilustracija stripa',
'Tražim nekog tko bi mi ilustrirao strip koji sam napisao.',
2,
null),

(null,
'2019-02-16',
'2019-03-16',
20,
'potražnja',
'Tražim umjetnika za grafite',
'Trebam nekoga tko bi grafitima oslikao zidove u automehaničarskoj radnji.',
2,
null),

(null,
'2019-04-20',
'2019-05-20',
3,
'ponuda',
'Fotografiranje događaja - rođendani, djevojačke, momačke, krstitke, krizme...',
'Fotografiram bitne događaje u Vašem životu u Zagrebu i okolici. Javite se...',
1,
3),

(null,
'2019-03-11',
'2019-04-11',
3,
'potražnja',
'Tražim fotografa',
'Angažirala bih fotografa za fotografiranje krštenja u Osijeku.',
1,
3),
(null,
'2019-03-24',
'2019-04-24',
4,
'ponuda',
'Dizajn grafičkih proizvoda',
'Dizajniram jedinstvene logotipe po narudžbi, izrađujem manje grafičke proizvode postere, letke, brošure, vizit kartice, pozivnice. Javite se s povjerenjem.',
3,
2),

(null,
'2019-04-01',
'2019-04-01',
4,
'potražnja',
'Tražim grafičkog dizajnera',
'Dizajnera za jedinstvene logotipe, postere, letke, brošure, vizit kartice. Javite se na broj telefona.',
3,
2),

(null,
'2019-04-20',
'2019-05-20',
5,
'ponuda',
'Jedinstveni dizajn mrežnih stranica',
'Web dizjaner s iskustvom kreira jedinstveni izgled Vaše mrežne stranice.',
4,
null),

(null,
'2019-04-20',
'2019-05-20',
6,
'ponuda',
'Skladam klavirske pratnje po narudžbi',
'Treba li Vam jedinstvena autoraska klavirska pratnja za Vaše video snimke? Želite li uglaubiti svoje tekstove? Javite se s povjerenjem.',
5,
4),

(null,
'2019-04-20',
'2019-05-20',
7,
'ponuda',
'Video snimanje',
'Usluga profesionalnog snimanja - vjenčanja, krštenja, rođendani... Javite se s povjerenjem.',
6,
6),

(null,
'2019-04-20',
'2019-05-20',
8,
'ponuda',
'Šivanje odjeće',
'Krojačica s dugogodišnjim iskustvom šije sve oblike odjevnih predmeta po mjeri.',
7,
null),

(null,
'2019-04-20',
'2019-05-20',
9,
'ponuda',
'Kreativno pisanje',
'Ako trebate usluge kreativnog pisanja, javite se.',
8,
7),


(null,
'2019-04-20',
'2019-05-20',
10,
'ponuda',
'Ručno rađeni nakit',
'Izrađujem ručno rađeni nakit. Pogledajte ponudu u galeriji.',
9,
null),

(null,
'2019-04-20',
'2019-05-20',
2,
'ponuda',
'Slikanje umjetničkih slika',
'Naslikat ću Vam umjetničku sliku po narudžbi slikarskom tehnikom ulje na platnu. Možete mi poslati fotografiju Vaših najmilijih ili opisati detalje i motive slike kakvu biste voljeli imati. Dostupne dimenzije...',
2,
null)
;




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


