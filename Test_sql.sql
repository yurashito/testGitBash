-- insert into archive_bds(id_sortie , date , etatBS , id_transit) 
-- select id_Sortie , '2024-07-19' ,0 , 0 from bds where num=59;

-- select bds.id_sortie  , transit.id_transit , bds.Quantite  , transit.quantite
-- --  bds.origine , bds.mag_id , Daty , bds.Beneficiaire ,bds.Mois , bds.Prenom_Sec , bds.Annee , bds.Quantite 
-- -- , bds.Designation , bds.Code ,bds.A_rendre  ,bds.Rendu_le , bds.EtatBS , bds.Remarque, bds.id_user , bds.num , bds.heure , 
-- -- bds.Solution , bds.id_ma , bds.ttsys
--     from bds 
--     left join transit 
--     on bds.id_sortie= transit.id_sortie
--     group by  bds.id_sortie  , bds.origine , bds.mag_id , Daty , bds.Beneficiaire ,bds.Mois , bds.Prenom_Sec , bds.Annee , bds.Quantite 
-- , bds.Designation , bds.Code ,bds.A_rendre  ,bds.Rendu_le , bds.EtatBS , bds.Remarque, bds.id_user , bds.num , bds.heure , 
-- bds.Solution , bds.id_ma , bds.ttsys 
-- ;
    

    -- select coalesce(type , '-'), coalesce(nom , '-') , coalesce(tel , '-') , coalesce(entite , '-') , coalesce(numMat , '-') , coalesce(remarque , '-') from moyen_acheminement


    --  SELECT Beneficiaire  FROM archive_bds 
    --             INNER JOIN bds 
    --                 ON archive_bds.id_sortie=bds.id_sortie 
    --             -- join magasin 
    --                 -- on bds.Beneficiaire= magasin.id_magasin 
    --             limit 10;

    --  SELECT archive_bds.etatBS FROM archive_bds
    --             INNER JOIN bds
    --                 ON archive_bds.id_sortie=bds.id_sortie
    --         WHERE  archive_bds.date like '2024-08%'
    --         ORDER BY archive_bds.id_archive DESC

    -- SELECT id_magasin FROM magasin LIMIT 5 OFFSET ;
    -- select * from bds 
    -- where num = 
    -- select EtatBS from archive_bds  where id_sortie =296;
    -- select num  , Daty , origine , Prenom_Sec from bds
    --     join magasin
    --         on bds.Beneficiaire=magasin.id_magasin
    --     join personnel_p
    --         on bds.origine=personnel_p.nummatr
    -- where EtatBS!=2
    -- group by num desc 
    -- order by num desc ;

    -- select coalesce(numTR ,'-') as numTR , coalesce(moyen_acheminement.nom , '-') as nom,coalesce(moyen_acheminement.tel , '-') as tel,
    -- coalesce(moyen_acheminement.entite ,'-') as entite ,coalesce(moyen_acheminement.numMat) as numMat ,
    -- coalesce(moyen_acheminement.remarque ,'-') as remarque
    -- from transit
    --     join magasin
    --         on transit.lieu=magasin.id_magasin
    --     join moyen_acheminement
    --         on transit.id_ma=moyen_acheminement.id_ma   


--             SELECT archive_bds.id_archive , archive_bds.id_sortie,archive_bds.date ,archive_bds.etatBS , archive_bds.remarque , archive_bds.solution , archive_bds.id_transit,
--               bds.origine ,mag_id ,bds.Daty ,bds.Beneficiaire, bds.Mois , bds.Prenom_Sec  ,bds.Annee  , bds.Quantite 
-- , bds.Designation , bds.Code , bds.A_rendre , bds.Rendu_le  ,
--               bds.EtatBS,bds.id_user , bds.num   , bds.Remarque,bds.heure, bds.Solution, bds.id_ma ,bds.ttsys        
--             FROM archive_bds
--                 INNER JOIN bds
--                     ON archive_bds.id_sortie=bds.id_sortie
--             WHERE  archive_bds.date like '2024-08%'
--             ORDER BY archive_bds.id_archive DESC;
            -- limit 10 offset 30

--  select count(*) as nbrLigne from bds 
--             where  id_user = 1000 and EtatBS!=2 
--             group by num desc 
--             order by num desc ;


-- CREATE DATABASE test_baseutf8
--     CHARACTER SET utf8mb4
--     COLLATE utf8mb4_unicode_ci;


-- telecharger le script d'une table avec postgres
-- pg_dump -h 10.169.253.101 -U root -d postgres -p 5432 -t article --schema-only > E:/s2m_article.sql

-- telecharger le script d'une table avec mysql
-- mysqldump -u [utilisateur] -p [nom_base_de_donnees] [table1] [table2] > [nom_fichier].sql
-- mysqldump -h 10.169.7.125 -u infor -p apps2m categorie > E:/export_base_s2m.sql


-- select menuBS.id_menu,menuBS.id_menu_html , menuBS.nom_menu, href , menuBS.icon , menuBS.nom_template_associer
-- ,menuParFonction.id_menu_par_fonction from menuBS 
--   left join menuParFonction
--   on menuBS.id_menu= menuParFonction.id_menu;

SELECT menuBS.id_menu, menuBS.nom_menu , menuParFonction.id_menu_par_fonction
  FROM menuBS
  LEFT JOIN menuParFonction
  ON menuBS.id_menu = menuParFonction.id_menu AND menuParFonction.id_fonction = 5
where id_menu_par_fonction is NULL
;