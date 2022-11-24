-- ==========================
-- fichier 	: ddl_gestionDT_DR.sql
-- base 	: Gestion DT
-- auteur   : Tania OLIVIA
-- date 	: 08/04/2020
-- role 	: créer toutes les dépendances de références
-- projet 	: Gestion DT
-- resultat dans : //
-- ==========================

ALTER TABLE EMPLOYE
    ADD CONSTRAINT  FK_EMPAGENCE
        FOREIGN KEY  (ID_AGENCE)
        REFERENCES AGENCE (ID_AGENCE);

ALTER TABLE SERVICE
    ADD CONSTRAINT  FK_SERVEMP
        FOREIGN KEY  (ID_RESPONSABLE)
        REFERENCES EMPLOYE (ID_EMPLOYE);
        
ALTER TABLE DEMANDE_TRAVAUX
    ADD CONSTRAINT  FK_DTEMP 
        FOREIGN KEY (EMMETEUR)
        REFERENCES  EMPLOYE (ID_EMPLOYE);

ALTER TABLE DEMANDE_TRAVAUX
    ADD CONSTRAINT  FK_DTTYPE_DEMANDE
        FOREIGN KEY  (TYPEDELADEMANDE)
        REFERENCES TYPE_DEMANDE (ID_TYPEDEMANDE);

ALTER TABLE COMMENTAIRE
    ADD CONSTRAINT  FK_COMDT
        FOREIGN KEY  (NUMDT)
        REFERENCES DEMANDE_TRAVAUX (NUMDT);

ALTER TABLE COMMENTAIRE
    ADD CONSTRAINT  FK_COMTECH
        FOREIGN KEY  (EMMETEUR_COMMENTAIRE)
        REFERENCES TECHNICIEN (ID_TECHNICIEN);

ALTER TABLE AFFECTATION
    ADD CONSTRAINT  FK_AFFDT
        FOREIGN KEY  (NUMDT)
        REFERENCES DEMANDE_TRAVAUX (NUMDT);

ALTER TABLE AFFECTATION
    ADD CONSTRAINT  FK_AFFTECH
        FOREIGN KEY  (TECHNICIEN_AFFECTE)
        REFERENCES TECHNICIEN (ID_TECHNICIEN);

ALTER TABLE TECHNICIEN
    ADD CONSTRAINT  FK_TECHEMPL
        FOREIGN KEY  (ID_TECHNICIEN)
        REFERENCES EMPLOYE (ID_EMPLOYE);


