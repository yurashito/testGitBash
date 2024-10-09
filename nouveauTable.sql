ALTER table bds add column type_code varchar(10);

-- ALTER TABLE archive_bds
-- MODIFY COLUMN remarque varchar(255) DEFAULT '';

-- ALTER TABLE archive_bds
-- MODIFY COLUMN solution varchar(255) DEFAULT '';

CREATE TABLE IF NOT EXISTS `menuBS` (
  `id_menu` int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `id_menu_html` varchar(10) ,
  `nom_menu` varchar(100) DEFAULT NULL , 
  `href` varchar(50) ,
  `icon` varchar(50) , 
  `nom_template_associer` varchar(150) , 
  `manuel_de_guide` text 
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

insert into menuBS( id_menu,nom_menu , id_menu_html ,href  , icon , nom_template_associer ,manuel_de_guide) VALUES
( 1, 'Création'  , 'CRBS' , 'creationBS' , 'flaticon-link-line' , 'InsertionNouveauBS.html' , "Manuel-d'emploi(CS) - Creation.pdf" ),
( 2 , 'Emis', 'LEBS' , 'emis' , 'flaticon-send-fill'  , 'emis.html' , "Manuel-d'emploi(CS) - Emis.pdf"),
( 3, 'Transit' , 'LTRA' , 'transit' , 'flaticon-logistics' , 'transit.html' ,"Manuel-d'emploi(CS) - Transit.pdf"),
( 4 , 'A Recevoir', 'LRBS' , 'recevoir' , 'flaticon-checked'  , 'aRecevoir.html' , "Manuel-d'emploi(CS) - Recevoir.pdf"),
( 5, 'A Rendre', 'LABS' , 'rendre' , 'flaticon-download' , 'aRendre.html' , "Manuel-d'emploi(CS) - A rendre.pdf"),
( 6, 'Anomalies & Solutions', 'LAES' , 'anomalieEtSolution' , 'flaticon-danger-4' , 'anomaliesEtSolutions.html' , "Manuel-d'emploi(CS) - AS.pdf"),
( 7, 'Archive' , 'LAR' , 'archive' , 'flaticon-bar-chart' , 'archive.html' ,"Manuel-d'emploi(CS) - Archives.pdf"),
( 8, 'Suivi' , 'LSUI' , 'suivi' , 'flaticon-list2' , 'suivi.html' , "Manuel-d'emploi(P) - Suivi.pdf"),
( 9, 'Options' , 'FOBS' , 'fonctionBS' , 'flaticon-gear-22' , 'fonction.html' , "Manuel-d'emploi(P) - options.pdf");



CREATE TABLE IF NOT EXISTS `menuParFonction` (
  `id_menu_par_fonction` int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `id_menu` int not null ,
  `id_fonction` int , 
  `id_magasin` int, 
  `nummatr` varchar(10) , 
  foreign key (nummatr) references personnel_p(nummatr),
  foreign key (id_magasin) references magasin(id_magasin),
  foreign key (id_menu) references menuBS(id_menu),
  foreign key (id_fonction) references fonction_p(id_fonction)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;


        

create table autorisation_fonction (
    id_autorisation_fonction int not null AUTO_INCREMENT primary key ,
    id_fonction int , 
    liste_menu varchar(200)
);
ALTER TABLE autorisation_fonction ADD CONSTRAINT unique_id_fonction UNIQUE (id_fonction);
insert into autorisation_fonction( id_fonction, liste_menu) values
(5 , '1,2,3,9,7')
ON DUPLICATE KEY UPDATE liste_menu = VALUES(liste_menu);

create table autorisation_p(
    id_authorisation_p int not null AUTO_INCREMENT primary key , 
    nummatr varchar(10),
    liste_menu varchar(200)
);
ALTER TABLE autorisation_p ADD CONSTRAINT unique_nummatr UNIQUE (nummatr);

    -- insert into autorisation_p( nummatr, liste_menu) values
    -- ('1000' , '4 ,5   ,6, 7 ')
    -- ON DUPLICATE KEY UPDATE liste_menu = VALUES(liste_menu);

-- select resultat_union.id_menu ,menuBS.nom_menu , menuBS.id_menu as id_menu_original ,resultat_union.identifiant  from menuBS
--     Left join 
--         ( select  menuBS.id_menu, menuBS.nom_menu,  0 as identifiant from autorisation_fonction
--             join menuBS
--             on FIND_IN_SET(menuBS.id_menu , autorisation_fonction.liste_menu) >0 and (autorisation_fonction.id_fonction = 5 )
--         union 
--         select  menuBS.id_menu,menuBS.nom_menu ,  1 as identifiant from autorisation_p
--             join menuBS
--             on FIND_IN_SET(menuBS.id_menu , Replace(autorisation_p.liste_menu , ' ' ,'')) >0 and (autorisation_p.nummatr= '1000' )
--         order by  identifiant desc, id_menu asc 
--         ) as resultat_union
--     on resultat_union.id_menu = menuBS.id_menu
    
--     ;


create table emetteur (
    id_emetteur int not null AUTO_INCREMENT primary key , 
    id_sortie  int(11)  ,
    code varchar(250) ,
    lib varchar(255) , 
    destination int(11) ,  
    date varchar(250),
    etat int ,
    numBS  int(11) , 
    type  varchar(10) , 
    nummatr_emetteur varchar(10) ,
    id_magasin_emetteur int(11),
    nummatr_beneficiaire varchar(10) ,
    foreign key (id_sortie) references bds(id_sortie)
);

CREATE TABLE IF NOT EXISTS `log_bs` (
  `id_log_bs` int(11) NOT NULL AUTO_INCREMENT primary key,
  `comment` text NOT NULL,
  `date_log` varchar(30) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
alter table  `log_bs` add column   `numBS` int ;
alter table  `log_bs` add column   `matricule` varchar(10) ;
alter table  `log_bs` add column   `ip` varchar(255)  ;

insert into log_bs(comment , date_log , numBS , matricule , ip ) values
('bon sortie ' , '27-10-2021' , 97 , '1000' , '127.0.0.1');



-- INSERT INTO `log_bs` ( `comment`, `date_log`) 
-- select  `comment`, `date_log` from log_p;


-- ALTER table emetteur add column  nummatr_beneficiaire varchar(10) ;
-- insert into emetteur(id_sortie,code,lib,destination,date,etat,numBS,type , id_user , mag_id)
-- values ( 90 , '0099090999' , 'Cafe 100g',  1 , '2024-08-09' , 0 , 88 , 'INF' ) 


-- select resultat_union.id_menu , menuBS.id_menu as id_menu_original ,
-- menuBS.nom_menu , menuBS.id_menu_html ,menuBS.href  , menuBS.icon , menuBS.nom_template_associer , menuBS.manuel_de_guide
-- from menuBS
--     Left join 
--         ( select  menuBS.id_menu, menuBS.nom_menu,  0 as identifiant from autorisation_fonction
--             join menuBS
--             on FIND_IN_SET(menuBS.id_menu , autorisation_fonction.liste_menu) >0 and (autorisation_fonction.id_fonction = 5 )
--         union 
--         select  menuBS.id_menu,menuBS.nom_menu ,  1 as identifiant from autorisation_p
--             join menuBS
--             on FIND_IN_SET(menuBS.id_menu , Replace(autorisation_p.liste_menu , ' ' ,'')) >0 and (autorisation_p.nummatr= 1000 )
--         order by id_menu asc
--         ) as resultat_union
--     on resultat_union.id_menu = menuBS.id_menu
-- where resultat_union.id_menu is not null


-- select * from (
-- (select serial , otherserial from glpi_monitors )
--     union
-- (select serial , otherserial from glpi_computers )
--     union
-- (select serial , otherserial from glpi_networkequipments) 
--     union
-- (select serial , otherserial from glpi_peripherals )
--     union
-- (select serial , otherserial from glpi_phones)
--     union
-- (select serial , otherserial from glpi_printers)
-- ) as glpi
-- where serial = '5699004872'
-- ;
    
        