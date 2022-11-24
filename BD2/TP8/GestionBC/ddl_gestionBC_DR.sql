-- ==========================
-- fichier 	: ddl_gestionBC_DR.sql
-- base 	: Gestion BC
-- auteur   : Tania OLIVIA
-- date 	: 08/04/2020
-- role 	: créer toutes les dépendances de références
-- projet 	: Gestion BC
-- resultat dans : //
-- ==========================

ALTER TABLE COMPTE_COURANT
    ADD CONSTRAINT  FK_COMPCOURANT_COMPTE
        FOREIGN KEY (NUMCOMPTE_COURANT)
        REFERENCES  COMPTE (NUMCOMPTE);

ALTER TABLE COMPTE_EPARGNE
    ADD CONSTRAINT  FK_COMPEPARGNE_COMPTE
        FOREIGN KEY  (NUMCOMPTE_EPARGNE)
        REFERENCES COMPTE (NUMCOMPTE);

ALTER TABLE MOUVEMENT
    ADD CONSTRAINT  FK_MOUVCOMP_COURANT
        FOREIGN KEY  (NUMCOMPTE_COURANT)
        REFERENCES COMPTE_COURANT (NUMCOMPTE_COURANT);

ALTER TABLE MOUVEMENT
    ADD CONSTRAINT  FK_MOUVCLI
        FOREIGN KEY  (NUMCLIENT)
        REFERENCES CLIENT (NUMCLIENT);

ALTER TABLE COMPTE
    ADD CONSTRAINT  FK_COMPCLI
        FOREIGN KEY  (PROPRIETAIRE)
        REFERENCES CLIENT (NUMCLIENT);

ALTER TABLE DROIT_SIGNATURE
    ADD CONSTRAINT  FK_DROIT_EMP
        FOREIGN KEY  (EMPLOYE)
        REFERENCES EMPLOYE (NUMEMP);

ALTER TABLE DROIT_SIGNATURE
    ADD CONSTRAINT  FK_DROIT_CLI
        FOREIGN KEY  (NUMCLIENT)
        REFERENCES CLIENT (NUMCLIENT);

ALTER TABLE DROIT_SIGNATURE
    ADD CONSTRAINT  FK_DROIT_COMP_COURANT
        FOREIGN KEY  (NUMCOMPTE_COURANT)
        REFERENCES COMPTE_COURANT (NUMCOMPTE_COURANT);
