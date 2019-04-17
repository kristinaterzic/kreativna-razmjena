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
ikona						varchar(50)
);

create table oglas(
sifra 						int not null primary key auto_increment,
pocetnidatum 				datetime not null,
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

alter table oglas add foreign key (korisnik) references korisnik(sifra);
alter table oglas add foreign key (kategorija) references kategorija(sifra);
alter table oglas add foreign key (javljamse_korisnik) references korisnik(sifra);

alter table ocjena add foreign key (oglas) references oglas(sifra);
alter table ocjena add foreign key (javljamse_korisnik) references korisnik(sifra);

alter table kategorija_oglas add foreign key (kategorija) references kategorija(sifra);
alter table kategorija_oglas add foreign key (oglas) references oglas(sifra);


insert into korisnik 
(sifra,korisnickoime,datumreg,ime,prezime,email,telefon,lozinka,oib,datumrodenja,omeni,profilnaslika) values
(null,'Terza','2018-09-05 08:07:00','Kristina','Terzić','kristina.terzic01@gmail.com','+385952225555','$2y$10$EoDbIjVh0nP4FrXewYTBjuvSIlFeXxPviXK2QVs51XOOmnwZpmHau','61611115365','1986-04-24','Pozdrav, zovem se Kristina i napravila sam ovu stranicu.',NULL),
(null,'Pero_pitur','2018-10-02 09:32:00','Petar','Anić','pero.piturZG@gmail.com','+385952225555','$2y$10$EoDbIjVh0nP4FrXewYTBjuvSIlFeXxPviXK2QVs51XOOmnwZpmHau','45766147816','1991-02-11','Pozdrav! Moje ime je Petar, bavim se umjetničkim slikanjem. Najčešća tehnika koju koristim je ulje na platnu.',NULL),
(null,'Foto_Ana','2018-10-03 17:05:00','Ana','Simić','foto.ana5@gmail.com','+385991116666','$2y$10$EoDbIjVh0nP4FrXewYTBjuvSIlFeXxPviXK2QVs51XOOmnwZpmHau','55049590190','1983-04-19','Ja sam Ana i bavim se fotografijom posljednjih 5 godina.',NULL),
(null,'Luka_lukic','2018-10-10 18:05:00','Luka','Lukić','luka.lukic@gmail.com','+385992555226','$2y$10$EoDbIjVh0nP4FrXewYTBjuvSIlFeXxPviXK2QVs51XOOmnwZpmHau','53202009382','1991-01-01','Grafički sam dizajner s dugogodišnjim iskustvom.',NULL),
(null,'Sara-design','2018-10-06 10:55:02','Sara','Sarić','sara.design@gmail.com','+385958884444','$2y$10$EoDbIjVh0nP4FrXewYTBjuvSIlFeXxPviXK2QVs51XOOmnwZpmHau','28068051808','1985-06-15','Pozdrav, ime mi je Sara i posljednjih 10 godina se bavim web dizajnom.',NULL),
(null,'Milla_music','2018-10-10 13:25:02','Mila','Milić','milla.music@gmail.com','+385950202002','$2y$10$EoDbIjVh0nP4FrXewYTBjuvSIlFeXxPviXK2QVs51XOOmnwZpmHau','58689973630','1981-09-06','Profesionalni sam klavirist, za Vas ću uglazbiti pjesme za koje ste napisli tekstove.',NULL),
(null,'Big_brother','2018-01-01 15:30:06','Matej','Matić','big.brother@gmail.com','+385282548402','$2y$10$EoDbIjVh0nP4FrXewYTBjuvSIlFeXxPviXK2QVs51XOOmnwZpmHau','47340321213','1988-05-17','Trebate profesionalni video snimak? Došli ste na pravo mjesto!',NULL),
(null,'Ankica_krojačica','2018-09-07 17:22:06','Ankica','Ančić','ankica.krojacica@gmail.com','+385998855112','$2y$10$EoDbIjVh0nP4FrXewYTBjuvSIlFeXxPviXK2QVs51XOOmnwZpmHau','07733571627','1981-05-18','Krojačica sam s dugogodišnjim iskustvom, šijem kvalitetnu odjeću po mjeri.',NULL),
(null,'Zlatno_Pero','2018-06-07 09:10:06','Zlatko','Pero','zlatko.pero@gmail.com','+385991212553','$2y$10$EoDbIjVh0nP4FrXewYTBjuvSIlFeXxPviXK2QVs51XOOmnwZpmHau','26043557301','1980-10-24','Trebate usluge kreativnog pisanja? Javite se s povjerenjem.',NULL),
(null,'Šljokica','2018-08-14 11:08:55','Maja','Perlica','maja.perlica@gmail.com','+385981448732','$2y$10$EoDbIjVh0nP4FrXewYTBjuvSIlFeXxPviXK2QVs51XOOmnwZpmHau','38125844450','1985-09-14','Izrađujem ručno rađeni nakit.',NULL),
(null,'Umjetnost_i_dom','2018-04-08 22:06:22','Dinka','Danić','dinka.loveshome@gmail.com','+385981235457','$2y$10$EoDbIjVh0nP4FrXewYTBjuvSIlFeXxPviXK2QVs51XOOmnwZpmHau','83321369625','1990-05-18','Izrađujem ukrasne police, kaliće za cvijeće, stoliće za uređenje doma. Pogledajte moju galeriju.',NULL),
(null,'Gift4you','2018-11-03 09:35:04','Ivana','Ivanić','gift4you@gmail.com','+385265252517','$2y$10$EoDbIjVh0nP4FrXewYTBjuvSIlFeXxPviXK2QVs51XOOmnwZpmHau','94282312285','1998-08-29','Izrađujem unikatne poklone za vaše najmilije! Pogledajte primjere u mojoj galeriji.',NULL),
(null,'zvonrueden','2018-03-16 00:36:12','Freeman','Hettinger','pamela.boehm@example.com','+385569659248','$2y$10$EoDbIjVh0nP4FrXewYTBjuvSIlFeXxPviXK2QVs51XOOmnwZpmHau','62399593245','2000-05-30','Qui minima corrupti enim. Iste qui ut sed fugit aut. Qui iusto nisi ipsum ut ex quidem. Sunt iste et atque odit.',NULL),
(null,'jacklyn92','2018-09-15 19:59:41','Stan','Kutch','crona.francisca@example.com','+385143819661','$2y$10$EoDbIjVh0nP4FrXewYTBjuvSIlFeXxPviXK2QVs51XOOmnwZpmHau','29025565052','1995-10-23','Molestias deserunt ut mollitia sint quo. Eum ad accusamus veniam alias voluptatem magni. Natus dolor quis minus quam tempora officia qui.',NULL),
(null,'waters.zita','2018-09-14 14:33:22','Wilhelm','Deckow','paul17@example.org','+385304034075','$2y$10$EoDbIjVh0nP4FrXewYTBjuvSIlFeXxPviXK2QVs51XOOmnwZpmHau','11572739008','1995-05-14','Saepe eos nulla doloremque voluptate amet id vel. Quisquam nihil ut atque et voluptatem magni doloribus. Incidunt qui possimus consequatur consectetur modi itaque.',NULL),
(null,'volkman.walter','2018-12-28 02:22:48','Eulalia','Greenfelder','edach@example.net','+385301767989','$2y$10$EoDbIjVh0nP4FrXewYTBjuvSIlFeXxPviXK2QVs51XOOmnwZpmHau','78835664962','1991-12-24','Officiis est in libero ad maxime ipsum sint. Dolorem voluptatum sunt soluta officia quia. Earum nihil consequuntur ut esse.',NULL),
(null,'ualtenwerth','2018-07-18 14:55:14','Sabrina','Gusikowski','spencer96@example.com','+385629398599','$2y$10$EoDbIjVh0nP4FrXewYTBjuvSIlFeXxPviXK2QVs51XOOmnwZpmHau','29243461480','1992-03-08','Et molestias corporis exercitationem aut aspernatur. Deleniti voluptatem consequatur recusandae vel non. Ullam enim quibusdam itaque corporis magnam. Rerum hic nam nesciunt qui et.',NULL),
(null,'jward','2018-08-29 21:25:26','Brielle','Feeney','lkuhlman@example.org','+385958319535','$2y$10$EoDbIjVh0nP4FrXewYTBjuvSIlFeXxPviXK2QVs51XOOmnwZpmHau','64764757855','1980-03-24','Necessitatibus enim qui expedita et non quis beatae. Neque molestiae ut qui neque commodi aliquam. Et voluptatum voluptas enim expedita.',NULL),
(null,'meggie.walter','2018-03-12 07:46:38','Santino','Hoeger','koss.buster@example.com','+385369449949','$2y$10$EoDbIjVh0nP4FrXewYTBjuvSIlFeXxPviXK2QVs51XOOmnwZpmHau','73469923349','1996-06-08','Pariatur laudantium sint voluptatem assumenda. Enim aut commodi delectus ullam. Et excepturi id ut quisquam illum dolor.',NULL),
(null,'znader','2018-05-05 17:07:25','Mose','Treutel','grant.lori@example.org','+385521646189','$2y$10$EoDbIjVh0nP4FrXewYTBjuvSIlFeXxPviXK2QVs51XOOmnwZpmHau','15933825643','1983-09-05','Debitis fuga asperiores dolor laborum harum voluptatum. Neque omnis autem debitis dignissimos fugit. Minima voluptatem est iusto et aut et sed. Aut voluptas dolore quisquam omnis ut dolor.',NULL),
(null,'nicola.jaskolski','2018-06-27 02:54:42','Tobin','Zboncak','icremin@example.org','+385404586049','$2y$10$EoDbIjVh0nP4FrXewYTBjuvSIlFeXxPviXK2QVs51XOOmnwZpmHau','19387116323','1995-09-01','Qui totam voluptatum et porro cum laboriosam et. Dicta blanditiis dolores aut eum. Quis expedita ut nulla vel non labore iste.',NULL),
(null,'paolo14','2018-08-29 23:37:29','Vena','Schroeder','casimer72@example.net','+385424869227','$2y$10$EoDbIjVh0nP4FrXewYTBjuvSIlFeXxPviXK2QVs51XOOmnwZpmHau','43006115182','1992-01-26','Consectetur expedita consectetur id quia voluptate sint voluptas. Voluptas repellat quia ducimus at. A consequuntur suscipit non quis occaecati illum deleniti.',NULL),
(null,'vjakubowski','2018-04-28 21:37:19','Granville','Walsh','ebahringer@example.org','+385761643361','$2y$10$EoDbIjVh0nP4FrXewYTBjuvSIlFeXxPviXK2QVs51XOOmnwZpmHau','95438825547','1981-09-17','Similique quos repudiandae at ea odit accusantium quia. Earum qui modi iste deserunt laboriosam. Sunt quo occaecati accusamus dolorem nemo atque.',NULL),
(null,'imogene95','2018-02-13 17:55:26','Halle','Hermiston','rcremin@example.net','+385633602050','$2y$10$EoDbIjVh0nP4FrXewYTBjuvSIlFeXxPviXK2QVs51XOOmnwZpmHau','52663611358','1983-06-09','Facere quo eum accusantium omnis iusto quis vel et. Exercitationem perspiciatis delectus voluptatem ab. Eum ipsum ratione qui.',NULL),
(null,'helga.hane','2018-02-05 14:00:28','Rosa','Gleichner','hessel.ubaldo@example.net','+385745920385','$2y$10$EoDbIjVh0nP4FrXewYTBjuvSIlFeXxPviXK2QVs51XOOmnwZpmHau','68959308434','1995-05-01','Odio quo et nihil et magnam illum sint rerum. Cumque voluptas omnis harum quis quam praesentium. Sunt sapiente dolorum quae sint. Qui et autem omnis consequatur ipsam repudiandae.',NULL),
(null,'orempel','2018-02-07 16:14:55','Dayton','Conn','ray.donnelly@example.org','+385166951062','$2y$10$EoDbIjVh0nP4FrXewYTBjuvSIlFeXxPviXK2QVs51XOOmnwZpmHau','23034333919','1982-06-18','Autem atque et sed eveniet molestiae in. Sunt dolore laboriosam soluta id sunt est. Ullam aut consequatur voluptas. Quam consequatur inventore tempore eius distinctio eos qui.',NULL),
(null,'otha.stanton','2018-08-12 20:06:48','Dorris','Kemmer','shyatt@example.net','+385816851175','$2y$10$EoDbIjVh0nP4FrXewYTBjuvSIlFeXxPviXK2QVs51XOOmnwZpmHau','25298433765','1992-11-29','Natus et sed aspernatur in voluptas deserunt aut id. Iste blanditiis sint dignissimos eum corporis. Nam voluptas corporis non ullam quae.',NULL),
(null,'linda63','2018-08-14 16:47:26','Jerald','Reynolds','gwaters@example.com','+385543260241','$2y$10$EoDbIjVh0nP4FrXewYTBjuvSIlFeXxPviXK2QVs51XOOmnwZpmHau','92559578761','1986-01-25','Autem et ut illum. Rerum non autem et ratione voluptatem qui. Quasi illo qui quis qui. Doloremque itaque repellendus culpa maiores quaerat et animi.',NULL),
(null,'esmith','2018-03-30 18:20:02','Destiney','Upton','ilene67@example.org','+385843723261','$2y$10$EoDbIjVh0nP4FrXewYTBjuvSIlFeXxPviXK2QVs51XOOmnwZpmHau','99924884326','1992-07-02','Quo minima deserunt accusantium velit voluptas ratione magnam ipsa. Animi dolorum voluptatum sint enim consequatur. Esse praesentium atque reprehenderit dolores. Vel qui et qui vitae nihil.',NULL),
(null,'littel.lucienne','2018-01-11 18:23:03','Samson','Roberts','hturner@example.com','+385964647639','$2y$10$EoDbIjVh0nP4FrXewYTBjuvSIlFeXxPviXK2QVs51XOOmnwZpmHau','07712623894','1995-08-15','Facilis doloremque reprehenderit quos et sit. Incidunt consectetur perferendis reprehenderit id suscipit consectetur non. Cupiditate facilis tempore et rerum sint.',NULL),
(null,'darlene.eichmann','1996-11-07 20:11:40','Muriel','Kerluke','earnest37@example.org','+385796353498','$2y$10$EoDbIjVh0nP4FrXewYTBjuvSIlFeXxPviXK2QVs51XOOmnwZpmHau','67481228021','1997-12-03','Harum perferendis rerum libero repellendus corporis odit totam. Modi debitis saepe in nesciunt voluptatibus rerum aliquam. Sed iste similique voluptatem ad exercitationem.',NULL),
(null,'ofelia.ankunding','1993-12-28 21:38:28','Lue','McGlynn','ritchie.stevie@example.net','+385983827745','$2y$10$EoDbIjVh0nP4FrXewYTBjuvSIlFeXxPviXK2QVs51XOOmnwZpmHau','47789459107','2000-06-27','Quidem ipsa quaerat aspernatur. Corporis culpa maxime a laborum laudantium. Illum nostrum et perspiciatis totam explicabo voluptatem sit.',NULL),
(null,'wkulas','2007-04-02 18:48:57','Lea','Balistreri','kautzer.johnnie@example.net','+385032650009','$2y$10$EoDbIjVh0nP4FrXewYTBjuvSIlFeXxPviXK2QVs51XOOmnwZpmHau','73690206475','1989-05-27','Id id sed laborum quidem in in. Et deserunt consequatur quo. Officia non et ea eveniet eum sed. Vel et laudantium dolor sapiente. Aut ut aperiam sed ut aliquid iusto.',NULL),
(null,'tabitha.schinner','1986-04-28 04:42:55','Reed','Gerlach','koelpin.cullen@example.net','+385693898424','$2y$10$EoDbIjVh0nP4FrXewYTBjuvSIlFeXxPviXK2QVs51XOOmnwZpmHau','58980570410','1981-11-02','Voluptatem temporibus sit vel. Quidem sint et iste modi. Quo at et non rem dolorem fuga consectetur.',NULL),
(null,'pollich.jewel','1983-04-24 06:43:25','Della','Hilpert','bella45@example.org','+385172380828','$2y$10$EoDbIjVh0nP4FrXewYTBjuvSIlFeXxPviXK2QVs51XOOmnwZpmHau','16172568947','2001-07-09','Rerum atque ut quas tenetur. Cum sed labore voluptas ea nam dolor et fugit.',NULL),
(null,'magdalen01','2001-05-12 21:14:51','Tom','Boyer','blanda.javier@example.org','+385399038103','$2y$10$EoDbIjVh0nP4FrXewYTBjuvSIlFeXxPviXK2QVs51XOOmnwZpmHau','32259401963','1992-12-12','Fuga nam ab animi voluptas possimus. Voluptatem cupiditate est est eaque optio eaque. Est dolores autem illum debitis nihil placeat. Sapiente ut quisquam ut eum laborum.',NULL),
(null,'carole.parisian','1987-11-20 00:34:52','Abraham','Greenfelder','weber.julius@example.net','+385785590753','$2y$10$EoDbIjVh0nP4FrXewYTBjuvSIlFeXxPviXK2QVs51XOOmnwZpmHau','70321578974','1999-12-16','Quia voluptates iste iusto suscipit assumenda voluptas eaque. Quas quia quidem ex ratione atque ut. Voluptatem vero perspiciatis qui. Tenetur ut velit ratione ipsam similique quia debitis ipsam.',NULL),
(null,'philip.maggio','2001-07-03 19:45:22','Earlene','Gusikowski','ndaugherty@example.net','+385605223060','$2y$10$EoDbIjVh0nP4FrXewYTBjuvSIlFeXxPviXK2QVs51XOOmnwZpmHau','92809592844','1994-10-06','Quisquam consequatur dolorem voluptates fugiat. Eaque dolorem non nesciunt fugiat. Eaque culpa nostrum autem soluta. Tempore in non dolorem sed.',NULL),
(null,'tyra26','1982-05-15 23:53:51','Weldon','Gleichner','gusikowski.caden@example.net','+385052971969','$2y$10$EoDbIjVh0nP4FrXewYTBjuvSIlFeXxPviXK2QVs51XOOmnwZpmHau','88902996359','1990-05-30','Illum enim dolores aut. Ipsa sapiente facere quia alias necessitatibus nulla possimus similique. Fugit vitae recusandae aut cum quisquam.',NULL),
(null,'mckenzie.albert','1974-02-06 20:25:20','Gaylord','Konopelski','nyasia.leannon@example.net','+385955550347','$2y$10$EoDbIjVh0nP4FrXewYTBjuvSIlFeXxPviXK2QVs51XOOmnwZpmHau','23472817408','1994-11-23','Mollitia facere a aliquid laborum. Qui dolor est odit exercitationem doloremque. Rerum deserunt odio qui quo.\nQuia delectus consequatur reprehenderit. Modi sint ipsa natus. Dolores hic aut culpa.',NULL),
(null,'zkuhic','1992-04-08 17:51:16','Lenore','Stanton','demario.lesch@example.net','+385721682571','$2y$10$EoDbIjVh0nP4FrXewYTBjuvSIlFeXxPviXK2QVs51XOOmnwZpmHau','25356465687','1990-08-19','Voluptatem excepturi architecto qui cumque. Exercitationem veritatis quis dicta recusandae accusamus est ipsam. Sequi blanditiis veniam et distinctio.',NULL),
(null,'simeon.homenick','1981-10-25 07:46:03','Autumn','Dooley','dortha.crooks@example.com','+385355405531','$2y$10$EoDbIjVh0nP4FrXewYTBjuvSIlFeXxPviXK2QVs51XOOmnwZpmHau','46638129138','1988-01-30','Voluptatem ad quibusdam ex et. Libero officiis sequi blanditiis amet. Qui error et illum vitae consequatur.',NULL),
(null,'huel.dante','2014-07-23 00:27:08','Noemi','Barton','kuhlman.ezequiel@example.net','+385356135119','$2y$10$EoDbIjVh0nP4FrXewYTBjuvSIlFeXxPviXK2QVs51XOOmnwZpmHau','77724380316','1986-02-09','Praesentium aut illum in labore. Quo corrupti illum laudantium consectetur. Id earum doloribus delectus temporibus esse sint.',NULL),
(null,'reagan.herzog','2005-04-04 13:36:46','Sonya','Greenfelder','ethel.welch@example.com','+385931246032','$2y$10$EoDbIjVh0nP4FrXewYTBjuvSIlFeXxPviXK2QVs51XOOmnwZpmHau','22080827192','1989-08-23','Mollitia similique alias esse tempora doloremque dolorem. Repudiandae molestias commodi dolorum eum. Qui voluptate sapiente ut numquam quia id asperiores. Inventore eius est corrupti.',NULL),
(null,'austyn.russel','2000-10-19 02:26:29','Bianka','Hyatt','urolfson@example.net','+385933441127','$2y$10$EoDbIjVh0nP4FrXewYTBjuvSIlFeXxPviXK2QVs51XOOmnwZpmHau','85760303850','1999-04-23','Molestiae aperiam nemo et quidem nulla natus nihil quod. Facilis sequi voluptate mollitia. Ut fugiat voluptas ipsam quia magni. Ullam voluptate eum numquam corporis perferendis quisquam.',NULL),
(null,'chermiston','1980-11-08 03:15:13','Enrique','Padberg','ciara86@example.com','+385819519118','$2y$10$EoDbIjVh0nP4FrXewYTBjuvSIlFeXxPviXK2QVs51XOOmnwZpmHau','45603893046','1980-02-10','In omnis saepe ut maiores sint. Amet nemo velit temporibus laboriosam laborum recusandae. Aliquid sit occaecati sunt.\nDucimus veritatis dolorem aut. Quis sed consectetur ut et.',NULL),
(null,'beverly09','1995-05-30 12:01:52','Kiarra','Morar','glindgren@example.com','+385556567116','$2y$10$EoDbIjVh0nP4FrXewYTBjuvSIlFeXxPviXK2QVs51XOOmnwZpmHau','98255707235','1987-01-18','Minima et neque expedita animi quae eaque. Rerum nostrum totam adipisci. Laborum impedit odit maxime culpa aut culpa et minima.',NULL),
(null,'ucrist','1998-01-19 11:32:03','Eric','Friesen','jamar.johnson@example.net','+385502459145','$2y$10$EoDbIjVh0nP4FrXewYTBjuvSIlFeXxPviXK2QVs51XOOmnwZpmHau','25021270806','1982-08-26','Enim dolorum ut quam eum minima consequatur ad. Voluptatem magnam enim ea quidem laboriosam veniam totam. Dignissimos cumque rem magnam repudiandae. Quo laudantium totam qui molestias.',NULL),
(null,'adeline87','2003-12-11 14:45:51','Irwin','Goyette','patrick.mante@example.net','+385571879256','$2y$10$EoDbIjVh0nP4FrXewYTBjuvSIlFeXxPviXK2QVs51XOOmnwZpmHau','23382277859','1988-03-07','Molestiae adipisci suscipit atque rerum iste similique. Voluptas quis dolore facere repudiandae quos. Distinctio ducimus et reiciendis.',NULL),
(null,'wehner.vance','2003-07-13 15:38:40','Graham','Jenkins','frederique.reinger@example.com','+385917544599','$2y$10$EoDbIjVh0nP4FrXewYTBjuvSIlFeXxPviXK2QVs51XOOmnwZpmHau','37702021583','1987-12-23','Consequuntur ipsa consequuntur et vel. Placeat et culpa et qui quis rerum atque. Atque id officia voluptatibus commodi illum. Libero sed labore tempora sit nam vero.',NULL),
(null,'domingo42','1985-10-03 12:41:47','Melyna','Littel','gibson.eunice@example.org','+385498385590','$2y$10$EoDbIjVh0nP4FrXewYTBjuvSIlFeXxPviXK2QVs51XOOmnwZpmHau','14014853774','1996-02-21','Ipsa sed aut aut quo facilis molestiae aut. Aut id velit perferendis porro et quaerat omnis natus. Rerum id amet velit quia commodi aliquam.',NULL),
(null,'al85','1985-09-07 11:52:15','Harold','Buckridge','ytoy@example.net','+385200923767','$2y$10$EoDbIjVh0nP4FrXewYTBjuvSIlFeXxPviXK2QVs51XOOmnwZpmHau','74194438399','1989-09-07','Et ut tempore reiciendis magni. Odit earum a accusantium dolorum. Rerum ut officiis qui qui repellendus. Et et molestias iste vero.',NULL),
(null,'bernier.greyson','1972-07-02 05:45:10','Arianna','Morar','gmclaughlin@example.org','+385821857655','$2y$10$EoDbIjVh0nP4FrXewYTBjuvSIlFeXxPviXK2QVs51XOOmnwZpmHau','10947085756','1994-04-18','Iure molestiae sed explicabo ut. Et at earum dolor vero et accusantium qui occaecati.',NULL),
(null,'moses76','1984-02-19 09:18:03','Libbie','Schowalter','langworth.billie@example.net','+385542337225','$2y$10$EoDbIjVh0nP4FrXewYTBjuvSIlFeXxPviXK2QVs51XOOmnwZpmHau','69682512328','1980-10-06','Inventore totam et laudantium velit voluptatem et eos. Libero nesciunt eius id nam. Deserunt tempore eos sed. Omnis nobis qui cum quasi.',NULL),
(null,'gonzalo22','1980-10-10 10:14:47','Cornelius','Considine','maribel03@example.com','+385951016848','$2y$10$EoDbIjVh0nP4FrXewYTBjuvSIlFeXxPviXK2QVs51XOOmnwZpmHau','58037775536','2000-08-23','Soluta id maiores nam ea autem atque. Debitis voluptatem vel nihil eos et est. Id tenetur doloribus voluptas tempora vel tenetur quia.\nOfficia dolorem beatae aut qui. Distinctio qui illo at culpa.',NULL),
(null,'bianka.schimmel','1977-10-07 00:55:50','Veronica','Bergstrom','cummings.montana@example.net','+385983411623','$2y$10$EoDbIjVh0nP4FrXewYTBjuvSIlFeXxPviXK2QVs51XOOmnwZpmHau','46474406912','1999-06-05','Eum libero maiores asperiores sunt. Debitis aut et voluptas officia suscipit. Deserunt doloribus excepturi voluptates cum cum et.',NULL),
(null,'mhackett','1985-02-05 09:17:58','Sierra','Murazik','maegan50@example.net','+385842092874','$2y$10$EoDbIjVh0nP4FrXewYTBjuvSIlFeXxPviXK2QVs51XOOmnwZpmHau','31279846860','1996-04-03','Voluptatibus expedita ab rerum commodi incidunt quia tenetur. Pariatur et libero consequatur aliquid et temporibus aut. Sunt deleniti eveniet expedita et. Sed illo delectus nihil excepturi.',NULL),
(null,'pacocha.jasmin','1986-12-05 14:32:26','Marcellus','Mante','shanahan.loma@example.net','+385725952652','$2y$10$EoDbIjVh0nP4FrXewYTBjuvSIlFeXxPviXK2QVs51XOOmnwZpmHau','94638687928','1995-01-17','Fugit fuga quae cum aut. Voluptatem distinctio aut illum est et dolore. Totam nisi qui sit. Explicabo quo accusamus rem quaerat quo consequatur.',NULL),
(null,'bailey.davion','2009-04-30 17:38:27','Jordyn','Weber','hammes.lucinda@example.org','+385763900079','$2y$10$EoDbIjVh0nP4FrXewYTBjuvSIlFeXxPviXK2QVs51XOOmnwZpmHau','90383094914','1994-06-27','Sit rem placeat non similique magnam nisi magni. Iure quo facere similique facilis non ex tempora. Quam quo deleniti qui vel quae aut.',NULL),
(null,'tom27','1980-07-13 07:33:56','Maya','Raynor','carroll.jewel@example.com','+385856121373','$2y$10$EoDbIjVh0nP4FrXewYTBjuvSIlFeXxPviXK2QVs51XOOmnwZpmHau','52847713176','1988-02-08','Modi sed soluta consequatur eaque. Sint quia aut ab et iste.',NULL),
(null,'skye.crona','2017-03-05 23:58:08','Jaqueline','Gleichner','keaton01@example.com','+385080158740','$2y$10$EoDbIjVh0nP4FrXewYTBjuvSIlFeXxPviXK2QVs51XOOmnwZpmHau','69535099068','1983-04-05','Quis pariatur cupiditate quia quis qui blanditiis. Tempore nihil est consequatur cum qui provident quis. Error dolor dolores omnis veritatis mollitia et.',NULL),
(null,'susana50','1975-05-23 00:58:54','Otilia','Pagac','xschmitt@example.com','+385594641640','$2y$10$EoDbIjVh0nP4FrXewYTBjuvSIlFeXxPviXK2QVs51XOOmnwZpmHau','30925574995','1982-01-10','Quas rem dolorem sunt et odit placeat. Placeat sunt enim aliquid reprehenderit animi magnam. Rem doloribus sit cum in. Non ut alias debitis.',NULL),
(null,'aida30','2013-05-12 19:57:41','Ryder','Lowe','theresia.schuster@example.com','+385899930440','$2y$10$EoDbIjVh0nP4FrXewYTBjuvSIlFeXxPviXK2QVs51XOOmnwZpmHau','96934522700','1996-09-16','Sunt sed qui laborum aut sint. Laudantium nostrum possimus quia maxime nostrum. Facilis eum est rerum labore sapiente eum dolorem ipsam. Fuga reiciendis doloribus quibusdam soluta est consectetur.',NULL),
(null,'ericka.hamill','1996-07-19 22:45:22','Nash','Tillman','orn.madison@example.net','+385729660611','$2y$10$EoDbIjVh0nP4FrXewYTBjuvSIlFeXxPviXK2QVs51XOOmnwZpmHau','38724561799','1996-04-03','Voluptatem veniam accusamus sunt. Eligendi reprehenderit ratione voluptatibus et distinctio nesciunt qui. Dolor dolorem consequuntur voluptatibus est aspernatur. Dolor expedita eos id.',NULL),
(null,'krobel','1980-11-14 05:02:07','Bailee','Conroy','brigitte13@example.org','+385275660837','$2y$10$EoDbIjVh0nP4FrXewYTBjuvSIlFeXxPviXK2QVs51XOOmnwZpmHau','63853960628','1992-12-29','Sed ut similique qui porro dignissimos quo. Quae suscipit eveniet tempora qui velit. Optio rerum quod enim et consectetur fuga laboriosam.',NULL),
(null,'ari.murphy','1977-09-10 14:19:01','Elsa','Ziemann','mcclure.delmer@example.net','+385968910512','$2y$10$EoDbIjVh0nP4FrXewYTBjuvSIlFeXxPviXK2QVs51XOOmnwZpmHau','13097637364','1991-11-29','Ipsam et vitae et sit. Dolorem eos incidunt sapiente voluptatibus veniam. Sint minima sint adipisci. Praesentium suscipit illo a est quo.',NULL),
(null,'ohirthe','2017-05-22 13:16:28','Lora','Welch','nschuppe@example.com','+385781640679','$2y$10$EoDbIjVh0nP4FrXewYTBjuvSIlFeXxPviXK2QVs51XOOmnwZpmHau','87101757222','1995-10-12','Labore aperiam omnis deserunt eos optio. Ut nihil quas sed laboriosam sint. Quasi iste eveniet necessitatibus officia odit. Ab dignissimos inventore neque repudiandae ea et ducimus.',NULL),
(null,'rath.akeem','1986-02-09 01:33:32','Allison','Jenkins','nhahn@example.com','+385554095674','$2y$10$EoDbIjVh0nP4FrXewYTBjuvSIlFeXxPviXK2QVs51XOOmnwZpmHau','86571664318','1980-06-02','A dolorem sint itaque eum mollitia. Ab placeat aut quas omnis ipsa et possimus maiores. Explicabo animi beatae unde reprehenderit voluptas fugiat laudantium.',NULL),
(null,'amalia03','1984-05-26 13:37:12','Clinton','Kling','stephanie.murray@example.org','+385750556136','$2y$10$EoDbIjVh0nP4FrXewYTBjuvSIlFeXxPviXK2QVs51XOOmnwZpmHau','26111840260','1996-04-09','Doloremque explicabo rerum nostrum. Tempora dolores reprehenderit nam quo. Consequatur nam repudiandae cumque occaecati.',NULL),
(null,'west.margarett','2010-06-01 12:47:53','Helga','Mitchell','tparisian@example.com','+385089616794','$2y$10$EoDbIjVh0nP4FrXewYTBjuvSIlFeXxPviXK2QVs51XOOmnwZpmHau','24593570550','1997-04-04','Sit sunt ipsum eaque assumenda. Cupiditate voluptas quae maxime praesentium repellat non ullam. Est illum adipisci architecto occaecati omnis.',NULL),
(null,'wiegand.jaeden','1975-03-11 19:02:27','Leonor','Effertz','marquardt.lela@example.net','+385194970615','$2y$10$EoDbIjVh0nP4FrXewYTBjuvSIlFeXxPviXK2QVs51XOOmnwZpmHau','41270411158','1991-10-26','Dignissimos quo omnis aut ullam. Quidem aspernatur maiores quibusdam sunt eum illo. Veritatis aspernatur ad quos.',NULL),
(null,'ueffertz','2009-09-08 06:53:13','Lorine','Parisian','wilford.mcglynn@example.com','+385202651942','$2y$10$EoDbIjVh0nP4FrXewYTBjuvSIlFeXxPviXK2QVs51XOOmnwZpmHau','47029621907','1999-08-03','Rem ea repudiandae rerum non iste impedit saepe recusandae. Libero deleniti eos deleniti placeat maxime.',NULL),
(null,'zcrooks','1995-02-14 23:32:33','Alfonzo','Thompson','liza38@example.org','+385032788174','$2y$10$EoDbIjVh0nP4FrXewYTBjuvSIlFeXxPviXK2QVs51XOOmnwZpmHau','44233157466','1990-05-16','Laudantium dignissimos illum ullam nihil sunt corrupti. Odio molestiae corrupti dolore qui. Ut aliquid iure aut reiciendis quae tempora mollitia.',NULL),
(null,'monahan.ramiro','1996-11-08 13:12:03','Maude','Weimann','bayer.turner@example.net','+385815789562','$2y$10$EoDbIjVh0nP4FrXewYTBjuvSIlFeXxPviXK2QVs51XOOmnwZpmHau','70037037944','1983-11-08','Ipsa et qui minus alias corrupti tenetur. Harum consequatur similique debitis non. Illum reprehenderit officiis rem dolor aspernatur.',NULL),
(null,'kuhn.jess','1989-06-10 08:42:10','Terrence','Cummings','pemmerich@example.net','+385114347241','$2y$10$EoDbIjVh0nP4FrXewYTBjuvSIlFeXxPviXK2QVs51XOOmnwZpmHau','16305970618','1981-04-14','Sed sequi cupiditate est quia. Ipsa aut quia aut excepturi. Est voluptatem tenetur aut quaerat qui consequatur. Doloremque eligendi excepturi iure ex iste omnis.',NULL),
(null,'omclaughlin','1976-03-03 18:23:28','Alexandrea','Mitchell','hildegard.kuvalis@example.net','+385184932439','$2y$10$EoDbIjVh0nP4FrXewYTBjuvSIlFeXxPviXK2QVs51XOOmnwZpmHau','48756864466','1995-04-26','Impedit et cum omnis voluptatibus. Voluptatibus quia qui aut quasi magni. Nam nisi ipsum necessitatibus numquam nulla sunt.',NULL),
(null,'chanel86','1993-01-05 02:24:33','Coy','Russel','xavier.windler@example.com','+385121784905','$2y$10$EoDbIjVh0nP4FrXewYTBjuvSIlFeXxPviXK2QVs51XOOmnwZpmHau','69545301978','1984-03-08','Molestiae voluptas consequatur maiores maxime nemo hic. Libero sit ab optio sunt quis magni quia. Quasi beatae adipisci est vero quaerat reiciendis nihil.',NULL),
(null,'stamm.murl','1970-04-17 17:51:17','Hayley','VonRueden','chet72@example.com','+385943603477','$2y$10$EoDbIjVh0nP4FrXewYTBjuvSIlFeXxPviXK2QVs51XOOmnwZpmHau','81161747158','1989-08-12','Quidem ut occaecati maiores. Aut enim sint quod et vel occaecati vero. Maiores eos animi odit. Architecto debitis rerum quae ut debitis.',NULL),
(null,'xhagenes','2012-01-22 12:01:31','Nickolas','Koss','helene62@example.com','+385560408891','$2y$10$EoDbIjVh0nP4FrXewYTBjuvSIlFeXxPviXK2QVs51XOOmnwZpmHau','59403442838','1983-01-18','Officiis impedit tempore in vero enim reprehenderit. Dolores enim aspernatur facere perferendis. Rerum sed incidunt quis non est ipsum dolores.',NULL),
(null,'taltenwerth','2001-01-20 22:29:40','Kaylin','Flatley','keven.blick@example.org','+385118821264','$2y$10$EoDbIjVh0nP4FrXewYTBjuvSIlFeXxPviXK2QVs51XOOmnwZpmHau','62676851835','1983-04-24','Et ex debitis voluptas eveniet. Dolorum reiciendis id sapiente quod. Ullam ullam omnis aut deserunt inventore non et et. Ullam eveniet cumque ipsa odio suscipit.',NULL),
(null,'xstehr','2014-07-21 05:54:00','Elmo','Rogahn','schmeler.russ@example.net','+385734338022','$2y$10$EoDbIjVh0nP4FrXewYTBjuvSIlFeXxPviXK2QVs51XOOmnwZpmHau','36398096232','1991-10-06','Suscipit maiores non natus qui sed libero in adipisci. Accusantium et laudantium omnis vero dolorum. Ut maiores ut eos.',NULL),
(null,'nkunde','2014-04-02 08:31:28','Sylvia','Greenholt','vaughn.gerlach@example.org','+385552428141','$2y$10$EoDbIjVh0nP4FrXewYTBjuvSIlFeXxPviXK2QVs51XOOmnwZpmHau','19984871867','1995-03-22','Laboriosam eius vel eum. Perspiciatis esse est autem id voluptate dolorem. Non aut magnam ut ut at quos omnis. Labore sint maxime nisi odio in rerum.',NULL),
(null,'malcolm07','2005-12-15 23:20:19','Cecile','Hudson','mohr.gust@example.net','+385738307518','$2y$10$EoDbIjVh0nP4FrXewYTBjuvSIlFeXxPviXK2QVs51XOOmnwZpmHau','16014727099','1992-06-20','Sit corrupti magnam est provident voluptatum. Totam at ipsa sed explicabo quia ratione sed debitis. Reprehenderit qui nihil esse velit quidem officiis. Sint amet harum et qui.',NULL),
(null,'qratke','1990-06-24 22:43:07','Gillian','Huel','joanny.erdman@example.com','+385129858640','$2y$10$EoDbIjVh0nP4FrXewYTBjuvSIlFeXxPviXK2QVs51XOOmnwZpmHau','20231774907','1998-07-04','Eligendi voluptatem vitae sunt reiciendis. In aliquid officia hic. Eligendi et quos quo tempore eaque. Et quisquam cumque quo voluptas porro.',NULL),
(null,'rpaucek','2000-05-28 03:10:58','Loyce','Conroy','lkeeling@example.net','+385577276777','$2y$10$EoDbIjVh0nP4FrXewYTBjuvSIlFeXxPviXK2QVs51XOOmnwZpmHau','83307289776','1994-06-16','Dolor ea magni qui aliquid. Doloribus dolorem exercitationem quia atque. Temporibus ducimus vitae necessitatibus porro sit earum unde.',NULL),
(null,'greta.kohler','2007-08-05 22:26:51','Alfred','Wilkinson','qlubowitz@example.com','+385548257257','$2y$10$EoDbIjVh0nP4FrXewYTBjuvSIlFeXxPviXK2QVs51XOOmnwZpmHau','70431645874','1995-06-17','Commodi vel dicta rerum tenetur. Quia temporibus dolores at dolorum unde corrupti doloremque. Ad optio deserunt quibusdam dolor explicabo ut. Magnam omnis non labore esse.',NULL),
(null,'grayson94','2002-03-21 02:22:09','Georgiana','Okuneva','ekoepp@example.com','+385967293251','$2y$10$EoDbIjVh0nP4FrXewYTBjuvSIlFeXxPviXK2QVs51XOOmnwZpmHau','34563879166','1998-11-02','Suscipit voluptatem est nam error id at. Libero laboriosam voluptatem sit aut cum. Reiciendis voluptatem consequatur ducimus odit.',NULL),
(null,'bartell.bernice','1982-04-25 23:32:18','Jude','Jaskolski','ksmith@example.com','+385108562416','$2y$10$EoDbIjVh0nP4FrXewYTBjuvSIlFeXxPviXK2QVs51XOOmnwZpmHau','53272479014','1986-02-19','Perferendis molestiae adipisci sit saepe. Quae et reiciendis aut. Veniam exercitationem esse perspiciatis perspiciatis sunt aut voluptatem. Suscipit maiores maxime suscipit ad veritatis.',NULL),
(null,'hegmann.brant','1994-02-07 10:26:31','Kamren','Cummerata','vernon.robel@example.net','+385250456205','$2y$10$EoDbIjVh0nP4FrXewYTBjuvSIlFeXxPviXK2QVs51XOOmnwZpmHau','50007832179','1997-04-13','Nulla quis exercitationem expedita et ad ad delectus. Omnis est voluptas quam. Rerum nihil explicabo voluptatum quos eos omnis dolores.',NULL),
(null,'hermann.taya','1980-07-09 09:39:49','Arjun','Welch','lia85@example.org','+385067916864','$2y$10$EoDbIjVh0nP4FrXewYTBjuvSIlFeXxPviXK2QVs51XOOmnwZpmHau','71403088853','1990-05-24','Quis nihil ea et. Mollitia porro ut enim similique enim dolorem. Consequatur ut repudiandae beatae perferendis rerum quia.',NULL),
(null,'kris.stefanie','1987-04-17 19:55:47','Alia','Brakus','evert88@example.net','+385251953902','$2y$10$EoDbIjVh0nP4FrXewYTBjuvSIlFeXxPviXK2QVs51XOOmnwZpmHau','72840296693','1980-01-17','Vel eaque id in magnam itaque et magnam dicta. Cupiditate et placeat architecto quia dolores et omnis. Facilis quibusdam explicabo beatae. Et aut autem qui eaque.',NULL),
(null,'sarina.reynolds','1994-03-08 21:16:51','Ilene','Herman','hhegmann@example.com','+385604757743','$2y$10$EoDbIjVh0nP4FrXewYTBjuvSIlFeXxPviXK2QVs51XOOmnwZpmHau','18826416715','1985-07-20','Quasi commodi sed minus aliquid facilis debitis rerum. Incidunt eos et provident ea ipsam voluptatem corrupti dolor.',NULL),
(null,'lsmith','2005-06-12 14:48:40','Kaela','Koelpin','sienna.medhurst@example.com','+385323874287','$2y$10$EoDbIjVh0nP4FrXewYTBjuvSIlFeXxPviXK2QVs51XOOmnwZpmHau','76426029138','1997-08-01','Qui sequi cumque nisi consequuntur quisquam ipsam et. Voluptatum ipsa pariatur voluptas. Id sequi voluptatem rerum consequatur fugit quod. In sunt molestias consectetur distinctio.',NULL),
(null,'electa.mcclure','1985-07-20 07:01:28','Vidal','Lang','jorge.schumm@example.org','+385681055251','$2y$10$EoDbIjVh0nP4FrXewYTBjuvSIlFeXxPviXK2QVs51XOOmnwZpmHau','85584892337','2000-03-18','Aut impedit non optio explicabo omnis eos in. Magnam labore corrupti exercitationem quae ea. Autem exercitationem est magnam alias aut autem.',NULL),
(null,'dare.grover','1978-06-16 07:53:51','Maria','Leffler','filomena.bruen@example.org','+385135135232','$2y$10$EoDbIjVh0nP4FrXewYTBjuvSIlFeXxPviXK2QVs51XOOmnwZpmHau','18049508089','1999-05-17','Dolorum et ipsum aut sint cum minus nulla minus. Ea adipisci aperiam occaecati minima et est sint. Saepe aut earum cupiditate animi est voluptas. In perferendis occaecati et quia odit dolor vero.',NULL),
(null,'bartell.boris','1990-07-12 17:22:32','Angeline','Bartoletti','emard.franz@example.com','+385474849747','$2y$10$EoDbIjVh0nP4FrXewYTBjuvSIlFeXxPviXK2QVs51XOOmnwZpmHau','39308382016','1992-12-18','Sit dolor totam adipisci at. Perferendis totam ut aspernatur voluptatem nisi natus repellat aut. Temporibus accusamus itaque id cupiditate dolorem sapiente.',NULL),
(null,'kshlerin.jodie','1992-02-21 02:56:39','Sean','Schultz','rodriguez.adeline@example.com','+385583424616','$2y$10$EoDbIjVh0nP4FrXewYTBjuvSIlFeXxPviXK2QVs51XOOmnwZpmHau','36715429095','1981-10-27','Soluta magni ut est quo. Porro accusamus et delectus delectus quaerat distinctio qui voluptatum. Enim distinctio ut possimus expedita. Ut fugiat veniam a nemo quis quas.',NULL),
(null,'schamberger.faustino','2015-03-28 20:30:50','Horace','Bayer','maynard19@example.org','+385156774518','$2y$10$EoDbIjVh0nP4FrXewYTBjuvSIlFeXxPviXK2QVs51XOOmnwZpmHau','99770345421','1988-02-09','Blanditiis eos animi temporibus ut non. Amet expedita blanditiis sint nesciunt aliquid enim. Facere amet animi nisi reiciendis molestiae esse quia qui. Libero omnis autem est fuga.',NULL),
(null,'jace.nikolaus','2006-06-19 08:44:13','Lydia','Emard','adrien.kozey@example.org','+385790671037','$2y$10$EoDbIjVh0nP4FrXewYTBjuvSIlFeXxPviXK2QVs51XOOmnwZpmHau','47087779038','1981-12-14','Id ea vel perspiciatis rerum sunt est repellendus. Qui qui dolores dicta in. Et et ab dicta nobis et fugiat.',NULL),
(null,'prutherford','1973-10-11 16:25:33','Aletha','Feil','zsatterfield@example.com','+385452993672','$2y$10$EoDbIjVh0nP4FrXewYTBjuvSIlFeXxPviXK2QVs51XOOmnwZpmHau','87280028976','1983-03-29','Deleniti cupiditate cumque a in dolorem fuga. Dolore amet voluptates ut quos aut ipsam. Dicta tenetur sed iure corporis aut. Minima hic recusandae recusandae asperiores.',NULL);



insert into kategorija (sifra,naziv,ikona) values
(null,'Fotografija','camera'),
(null,'Slikanje, crtanje','palette'),
(null,'Grafički dizajn','magic'),
(null,'Web dizajn','code'),
(null,'Kreiranje glazbe','music'),
(null,'Kreiranje videa','video'),
(null,'Izrada odjeće','tshirt'),
(null,'Kreativno pisanje','pen-fancy'),
(null,'Izrada nakita','gem'),
(null,'Kućne dekoracije','couch'),
(null,'Izrada poklona','gift'),
(null,'Ostalo','ellipsis-h');


insert into oglas (sifra,pocetnidatum,datumisteka,korisnik,vrsta,naziv,tekstponude,kategorija,javljamse_korisnik) values

(null,'2019-04-14 09:50:30',NULL,1,'ponuda','Web dizajn','Želite osvježiti svoju stranicu novim i jedinstvenim dizajnom? Došli ste na pravo mjesto! Pogledajte primjere mojih radova u galeriji.',4,NULL),
(null,'2019-04-10 00:00:00','2019-05-10',2,'ponuda','Slikanje umjetničkih slika','Naslikat ću Vam umjetničku sliku po narudžbi slikarskom tehnikom ulje na platnu. Možete mi poslati fotografiju Vaših najmilijih ili opisati detalje i motive slike kakvu biste voljeli imati. Dostupne dimenzije...',2,NULL),
(null,'2019-02-03 00:00:00','2019-03-03',12,'ponuda','Umjetničke slike','Slikam umjetničke slike različitim tehnikama: tempere, ulje na platnu, vodene bojice... Pogledajte više u mojoj galeriji.',2,NULL),
(null,'2019-02-15 00:00:00','2019-03-15',11,'ponuda','Umjetnička djela','Slikam po narudžbi. Javite se s povjerenjem.',2,NULL),
(null,'2019-04-01 00:00:00','2019-05-01',14,'ponuda','Slike akademskog slikara','Naslikat ću Vam umjetničke slike po narudžbi. Primjere pogledajte u mojoj galeriji.',2,NULL),
(null,'2019-02-25 00:00:00','2019-03-25',15,'ponuda','Umjetničke slike','Prodajem umjetničke slike različitih slikara. Pogledajte galeriju. Cijena po dogovoru.',2,NULL),
(null,'2019-04-01 00:00:00','2019-05-01',16,'ponuda','Portreti prema fotografijama','Crtam profesionalne potrete grafitnom olovkom po narudžbi.',2,NULL),
(null,'2019-01-13 00:00:00','2019-02-13',17,'potražnja','Kupujem umjetničke slike','Zainteresiran sam za kupnju više umjetničkih slika za uređenje interijera. Preferiram modernije radove živućih autora.',2,NULL),
(null,'2019-04-04 00:00:00','2019-05-04',18,'potražnja','Trebam ilustratora','Tražim iskusnog ilustratora za ilustraciju zanimljive priče za djecu.',2,NULL),
(null,'2019-03-24 00:00:00','2019-04-24',19,'potražnja','Ilustracija stripa','Tražim nekog tko bi mi ilustrirao strip koji sam napisao.',2,NULL),
(null,'2019-02-16 00:00:00','2019-03-16',20,'potražnja','Tražim umjetnika za grafite','Trebam nekoga tko bi grafitima oslikao zidove u automehaničarskoj radnji.',2,NULL),
(null,'2019-04-20 00:00:00','2019-05-20',3,'ponuda','Fotografiranje događaja - rođendani, djevojačke, momačke, krstitke, krizme...','Fotografiram bitne događaje u Vašem životu u Zagrebu i okolici. Javite se s povjerenjem!',1,15),
(null,'2019-03-11 00:00:00','2019-04-11',13,'potražnja','Tražim fotografa','Angažirala bih fotografa za fotografiranje krštenja u Osijeku.',1,16),
(null,'2019-03-24 00:00:00','2019-04-24',4,'ponuda','Dizajn grafičkih proizvoda','Dizajniram jedinstvene logotipe po narudžbi, izrađujem manje grafičke proizvode postere, letke, brošure, vizit kartice, pozivnice. Javite se s povjerenjem.',3,NULL),
(null,'2019-04-20 00:00:00','2019-05-20',5,'ponuda','Jedinstveni dizajn mrežnih stranica','Web dizjaner s iskustvom kreira jedinstveni izgled Vaše mrežne stranice.',4,NULL),
(null,'2019-04-20 00:00:00','2019-05-20',6,'ponuda','Skladam klavirske pratnje po narudžbi','Treba li Vam jedinstvena autorska klavirska pratnja za Vaše video snimke? Želite li uglazbiti svoje tekstove? Javite se s povjerenjem.',5,4),
(null,'2019-04-20 00:00:00','2019-05-20',7,'ponuda','Video snimanje - Pula','Usluga profesionalnog snimanja na području Pule i okolice - vjenčanja, krštenja, rođendani... Javite se s povjerenjem.',6,6),
(null,'2019-04-20 00:00:00','2019-05-20',8,'ponuda','Šivanje odjeće','Krojačica s dugogodišnjim iskustvom šije sve oblike odjevnih predmeta po mjeri u Bjelovaru.',7,NULL),
(null,'2019-04-20 00:00:00','2019-05-20',9,'ponuda','Kreativno pisanje','Informacijski stručnjak piše članke na zadanu temu, uz ozbiljan pristup i korištenje relevantne literature. Cijena po kartici teksta.',8,7),
(null,'2019-04-20 00:00:00','2019-05-20',10,'ponuda','Ručno rađeni nakit','Izrađujem ručno rađeni nakit. Pogledajte ponudu u galeriji. Šaljem po cijeloj Hrvatskoj.',9,NULL),
(null,'2019-04-11 00:00:00','2019-05-11',41,'ponuda','Profesionalna fotografija','Izrađujem profesionalne studijske fotografije samo za Vas! Istaknite se kao model, prepustite fotografiranje stručnjaku! Studio se nalazi u Rijeci.',1,17),
(null,'2019-04-09 00:00:00','2019-05-09',42,'potražnja','Tražimo fotografe','Tvrtka Koncert iz Pule traži fotografe za fotografiranje koncerata u ljetnoj sezoni 2019. godine (lipanj, srpanj, kolovoz). Javite se na email.',1,NULL),
(null,'2019-03-22 00:00:00','2019-04-22',43,'ponuda','Fotografiram događaje u Splitu','Profesionalno fotografiram Vaše događaje - rođendani, krštenja, prve pričesti, krizme... pogledajte moje radove u galeriji.',1,NULL),
(null,'2019-03-27 00:00:00','2019-04-27',44,'potražnja','Tražimo profesionalnog fotografa','Park prirode Kopački rit traži profesionalnog fotografa za fotografiranje motiva Kopačkog rita za izradu promotivnih materijala.',1,NULL),
(null,'2019-04-10 00:00:00','2019-05-10',21,'ponuda','Fotografiram foto modele','Trebate profesionalni foto shooting? Javite se! Fotografiram u Zagrebu.',1,NULL),
(null,'2019-04-02 00:00:00','2019-05-02',22,'potražnja','Rođendaonica traži fotografa','Rođendaonica u Zadru traži fotografa za fotografiranje djece. Javite se.',1,NULL),
(null,'2019-04-05 00:00:00','2019-05-05',23,'potražnja','Foto studio traži fotografa','Foto studio u Osijeku traži fotografa. Javite se sa svojim portfoliom.',1,NULL),
(null,'2019-04-07 00:00:00','2019-05-07',24,'ponuda','Fotografiram događaje u Zagrebu','Fotografiram bitne događaje u Vašem životu u Zagrebu i okolici. Javite se s povjerenjem!',1,NULL),
(null,'2019-04-01 00:00:00','2019-05-01',25,'ponuda','Fotografiram događaje u Rijeci','Fotografiram bitne događaje u Vašem životu u Rijeci i okolici. Javite se s povjerenjem!',1,NULL),
(null,'2019-04-02 00:00:00','2019-05-02',26,'ponuda','Fotografiram događaje u Zadru','Fotografiram bitne događaje u Vašem životu u Zadru i okolici. Javite se s povjerenjem!',1,NULL),
(null,'2019-04-03 00:00:00','2019-05-03',27,'ponuda','Fotografiram događaje u Puli','Fotografiram bitne događaje u Vašem životu u Puli i okolici. Javite se s povjerenjem!',1,NULL),
(null,'2019-04-04 00:00:00','2019-05-04',28,'ponuda','Fotografiram događaje u Osijeku','Fotografiram bitne događaje u Vašem životu u Osijeku i okolici. Javite se s povjerenjem!',1,NULL),
(null,'2019-04-05 00:00:00','2019-05-05',29,'ponuda','Fotografiram događaje u Karlovcu','Fotografiram bitne događaje u Vašem životu u Karlovcu i okolici. Javite se s povjerenjem!',1,NULL),
(null,'2019-04-06 00:00:00','2019-05-06',30,'ponuda','Fotografiram događaje u Sisku','Fotografiram bitne događaje u Vašem životu u Sisku i okolici. Javite se s povjerenjem!',1,NULL),
(null,'2019-03-27 00:00:00','2019-04-27',31,'potražnja','Tražim fotografa','Angažirala bih fotografa za fotografiranje krštenja u Osijeku.',1,NULL),
(null,'2019-04-01 00:00:00','2019-05-01',32,'potražnja','Tražim fotografa','Angažirala bih fotografa za fotografiranje krštenja u Virovitici.',1,NULL),
(null,'2019-04-02 00:00:00','2019-05-03',33,'potražnja','Tražim fotografa','Angažirala bih fotografa za fotografiranje krštenja u Puli.',1,NULL),
(null,'2019-04-03 00:00:00','2019-05-03',34,'potražnja','Tražim fotografa','Angažirala bih fotografa za fotografiranje krštenja u Križevcima.',1,NULL),
(null,'2019-04-01 00:00:00','2019-05-01',40,'potražnja','Tražim grafičkog dizajnera','Dizajnera za jedinstvene logotipe, postere, letke, brošure, vizit kartice. Javite se na broj telefona.',3,NULL),
(null,'2019-04-02 00:00:00','2019-05-02',35,'ponuda','Dizajniram logotipe','Dizajniram jedinstvene logotipe po narudžbi. Javite se s povjerenjem.',3,NULL),
(null,'2019-04-03 00:00:00','2019-05-03',36,'ponuda','Grafički dizajner s iskustvom dizajnira sve po narudžbi','Dizajniram manje grafičke proizvode postere, letke, brošure, vizit kartice, pozivnice. Javite se s povjerenjem.',3,NULL),
(null,'2019-04-04 00:00:00','2019-05-04',37,'ponuda','Grafički dizajn','Izrađujem sve grafičke proizvode po narudžbi! Pogledajte moj portfolio!',3,NULL),
(null,'2019-04-05 00:00:00','2019-05-05',38,'potražnja','Tražimo grafičkog dizajnera','Studentska udruga Studos traži grafičkog dizajnera za dizajn studentskog časopisa.',3,NULL),
(null,'2019-04-06 00:00:00','2019-05-06',39,'potražnja','Potreban grafički dizajner','Tvrtka koja se bavi web dizajnom ima potrebu honorarno angažirati grafičkog dizajnera za dizajn promotivnih grafičkih proizvoda.',3,NULL),
(null,'2019-04-07 00:00:00','2019-05-07',45,'potražnja','Angažiramo grafičke dizajnere','Turistička zajednica grada Makarske treba više grafičkih dizajnera za izradu različitih grafičkih proizvoda lokalnim turističkim atrakcijama, apartmanima i hostelima. Javite se s portfoliom!',3,NULL),
(null,'2019-04-08 00:00:00','2019-05-08',46,'potražnja','Tražimo grafičkog dizajnera','Tiskara lokalnih dnevnih novina grada Trogira traži grafičkog dizajnera za povremene honorarne angažmane pri većem obujmu posla.',3,NULL),
(null,'2019-04-09 00:00:00','2019-05-09',47,'ponuda','Iskusan grafički dizajner traži honorarni angažman preko interneta','Izrađujem sve grafičke proizvode po narudžbi! Preferiram rad od kuće. Pogledajte moj portfolio!',3,NULL),
(null,'2019-04-21 00:00:00','2019-05-21',48,'ponuda','Web dizajer','Želite jedinstveni izgled Vaše mrežne stranice? Angažirajte web dizjanera s iskustvom. ',4,NULL),
(null,'2019-04-22 00:00:00','2019-05-22',49,'ponuda','Profesionalni web dizajn','Angažirajte profesionalnog web dizajnera da Vam kreira unikatan dizajn Vaše mrežne stranice! Pogledajte moj portfolio.',4,NULL),
(null,'2019-04-23 00:00:00','2019-05-23',50,'ponuda','Web dizajn','Web dizjaner s iskustvom kreira jedinstveni izgled Vaše mrežne stranice.',4,NULL),
(null,'2019-04-24 00:00:00','2019-05-24',51,'potražnja','Tvrtka IT4you traži web dizajnera','Tvrtka IT4you traži web dizajnera za honorarni angažman zbog povećanja obujma posla. Potrebno znanje HTML5, CSS3 i JavaScripta!',4,NULL),
(null,'2019-04-25 00:00:00','2019-05-25',52,'potražnja','Tražimo web dizajnera','Tražimo iskusnog web dizajnera za honorarni angažman zbog povećanja obujma posla. Potrebno znanje HTML5, CSS3 i JavaScripta!',4,NULL),
(null,'2019-04-26 00:00:00','2019-05-26',53,'potražnja','Potreban profesionalni web dizajner','Tražimo profesionalnog web dizajnera za honorarne angažmane. Potreban portfolio.',4,NULL),
(null,'2019-04-27 00:00:00','2019-05-27',54,'potražnja','Tražim web dizajnera','Trebam web dizajnera za dizajn jedinstvene mrežne stranice za moj krojački obrt. ',4,NULL),
(null,'2019-04-02 00:00:00','2019-05-02',55,'potražnja','Lokalni novinarski portal treba usluge web dizajna','Novinarski portal grada Siska treba web dizajnera novi dizajn stranice. Portfolio poželjan.',4,NULL),
(null,'2019-04-21 00:00:00','2019-05-21',56,'ponuda','Uglazbit ću Vaš tekst','Pošaljite mi Vaš tekst za pjesmu koju želite uglazbiti, dobit ćete uglazbljeni snimak u .mp3 formatu s otpjevanom muškom vokalnom dionicom. Poslušajte moje uratke.',5,NULL),
(null,'2019-04-22 00:00:00','2019-05-22',57,'ponuda','Snimam profesionalne muške vokalne dionice','Treba li Vam snimiti muške vokalne dionice? Poslušajte dosad snimljene projekte na mom Youtube kanalu.',5,NULL),
(null,'2019-04-23 00:00:00','2019-05-23',58,'ponuda','Glazbeno obrazovana pjevačica snima profesionalne vokalne dionice','Snimam profesionalne ženske vokalne dionice po narudžbi. Možete poslušati moje snimke na Soundcloudu.',5,NULL),
(null,'2019-04-24 00:00:00','2019-05-24',59,'ponuda','Snimam glazbenu pratnju po narudžbi','Trebate nekog da Vam uglazbi tekst i melodiju koju ste osmislili? Trebate li profesionalnu matricu za Vašu pjesmu? Poslušajte moje pjesme na Soundcloudu.',5,NULL),
(null,'2019-04-25 00:00:00','2019-05-25',60,'potražnja','Tražim gitarista','Treba mi gitarist, koji će mi snimiti gitarske dionice za rock album od 9 pjesama.',5,NULL),
(null,'2019-04-26 00:00:00','2019-05-26',61,'potražnja','Rock bend iz Zagreba traži bubnjara','Tražimo bubnjara, repertoar koji sviramo možete čuti na našem Youtube kanalu, javite se za detalje.',5,NULL),
(null,'2019-04-27 00:00:00','2019-05-27',62,'potražnja','Gudački kvartet traži violončelista','Uhodan gudački kvartet traži violončelista za sviranje sezone (lipanj,srpanj,kolovoz i rujan) u Dubrovniku, u restoranu. Repertoar raspisan, dionice pripremljene. Javiti se za detalje.',5,NULL),
(null,'2019-04-28 00:00:00','2019-05-28',63,'potražnja','Pjevačica traži pratnju na akustičnoj gitari','Pjevačica iz Zagreba traži nekog tko bi ju pratio na akustičnoj gitari za gaže po Zagrebu cca 2x mjesečno vikendom. Repertoar - blues i rock obrade. Prostor za probe osiguran.',5,NULL),
(null,'2019-04-29 00:00:00','2019-05-29',64,'potražnja','Pop pjevačica traži skladatelja','Tražim nekog tko bi mi skladao autorske pop pjesme.',5,NULL),
(null,'2019-04-21 00:00:00','2019-05-21',65,'ponuda','Video spotovi','Snimamo profesionalne video spotove po cijeloj Hrvatskoj. Naše radove možete pogledati na našem Youtube kanalu.',6,NULL),
(null,'2019-04-22 00:00:00','2019-05-22',66,'ponuda','Sisak - video snimanje','Snimam vjenčanja, krštenja, rođendane... u Sisku i okolici. Javite se s povjerenjem.',6,NULL),
(null,'2019-04-23 00:00:00','2019-05-23',67,'ponuda','Video spotovi','Snimam profesionalne video spotove u Splitu i okolici. Pogledajte moje radove na mom Youtube kanalu.',6,NULL),
(null,'2019-04-24 00:00:00','2019-05-24',68,'ponuda','Krk - video snimanje','Snimam vjenčanja, krštenja, rođendane... na otoku Krku. Javite se s povjerenjem.',6,NULL),
(null,'2019-04-25 00:00:00','2019-05-25',69,'ponuda','Osijek - video snimanje','Snimam vjenčanja, krštenja, rođendane... u Osijeku i okolici. Javite se s povjerenjem.',6,NULL),
(null,'2019-04-26 00:00:00','2019-05-26',70,'ponuda','Vukovar - video snimanje','Snimam vjenčanja, krštenja, rođendane... u Vukovaru i okolici. Javite se s povjerenjem.',6,NULL),
(null,'2019-04-27 00:00:00','2019-05-27',71,'ponuda','Čakovec- video snimanje','Snimam vjenčanja, krštenja, rođendane... u Čakovcu i okolici. Javite se s povjerenjem.',6,NULL),
(null,'2019-04-28 00:00:00','2019-05-28',72,'ponuda','Buzet - video snimanje','Snimam vjenčanja, krštenja, rođendane... u Buzetu i okolici. Javite se s povjerenjem.',6,NULL),
(null,'2019-04-29 00:00:00','2019-05-29',73,'ponuda','Gospić - video snimanje','Snimam vjenčanja, krštenja, rođendane... u Gospiću i okolici. Javite se s povjerenjem.',6,NULL),
(null,'2019-04-21 00:00:00','2019-05-21',74,'ponuda','Korekcija odjeće','Vršim krojačke popravke, mijenjam zatvarače... šijem po mjeri. Javite se - Sisak!',7,NULL),
(null,'2019-04-22 00:00:00','2019-05-22',75,'ponuda','Krojačke usluge','Vršim sve profesionalne krojačke usluge u Kutini. Javite se.',7,NULL),
(null,'2019-04-23 00:00:00','2019-05-23',76,'potražnja','Krojački salon traži krojačicu','Krojački salon u Crikvenici traži krojača/icu za honorarni angažman pri većem obujmu posla.',7,NULL),
(null,'2019-04-24 00:00:00','2019-05-24',77,'potražnja','Tražim krojačicu u Šibeniku','Tražim krojačicu u Šibeniku koja će mi sašiti haljinu za maturalnu večeru.',7,NULL),
(null,'2019-04-20 00:00:00','2019-05-20',78,'ponuda','Unikatne lampe','Izrađujem unikatne lampe za uređenje doma. Pogledajte ponudu u galeriji.',10,NULL),
(null,'2019-04-23 00:00:00','2019-05-23',79,'ponuda','Unikatni pokloni za nju i njega','Prodajem unikatne personalizirane poklone za nju i njega - okviri za slike, privjesci za ključeve... pogledajte galeriju.',11,NULL),
(null,'2019-04-22 00:00:00','2019-05-22',80,'ponuda','Nakit od prirodnih materijala','Izrađujem nakit od prirodnih materijala. Pogodan za kožu, moderan dizajn. Pogledajte galeriju.',9,NULL),
(null,'2019-04-08 00:00:00','2019-05-08',81,'ponuda','Nakit od fimo mase','Pravim nakit od fimo mase, velika ponuda u galeriji, ali primam i posebne narudžbe!',9,NULL),
(null,'2019-04-10 00:00:00','2019-04-10',82,'ponuda','Srebrni nakit','Prodajem srebrni nakit. Pogledajte galeriju, cijena na upit.',9,NULL),
(null,'2019-04-22 00:00:00','2019-05-22',83,'ponuda','Unikatna keramika','Pogledajte našu veliku ponudu unikatne keramike za dekoraciju doma. Šaljemo po cijeloj Hrvatskoj.',10,NULL);






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


