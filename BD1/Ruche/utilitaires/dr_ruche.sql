-- ==========================
-- fichier 	: dr_ruche.sql
-- base 	: ruche
-- auteur(s): Tania OLIVIA
-- date 	: 10/12/2019
-- role 	: créer toutes les dépendances de références
-- projet 	: ruche
-- resultat dans : 
-- ==========================

ALTER TABLE RUCHE
    ADD CONSTRAINT  FK_RUAPI
        FOREIGN KEY (IDAPI)
        REFERENCES  APICULTEUR (IDAPI);

ALTER TABLE RUCHE
    ADD CONSTRAINT  FK_RURUCHER
        FOREIGN KEY  (IDRUCHER)
        REFERENCES RUCHER (IDRUCHER);

ALTER TABLE RECOLTE
    ADD CONSTRAINT  FK_RECRU
        FOREIGN KEY  (IDRU)
        REFERENCES RUCHE (IDRU);


