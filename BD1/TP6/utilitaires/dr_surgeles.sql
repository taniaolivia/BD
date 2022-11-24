-- ==========================
-- fichier 	: dr_surgeles.sql
-- base 	: surgeles
-- auteur(s)	: Tania OLIVIA
-- date 	: 17/10/2019
-- role 	: créer toutes les dépendances de références
-- projet 	: surgeles
-- resultat dans : 
-- ==========================

ALTER TABLE COMMANDE
    ADD CONSTRAINT  FK_COMCLI 
        FOREIGN KEY (IDCLI)
        REFERENCES  CLIENT (IDCLI);

ALTER TABLE LIGNE_COMMANDE
    ADD CONSTRAINT  FK_LIGCOMCOM
        FOREIGN KEY  (IDCOM)
        REFERENCES COMMANDE (IDCOM);

ALTER TABLE LIGNE_COMMANDE
    ADD CONSTRAINT  FK_LIGCOMPRO
        FOREIGN KEY  (IDPRO)
        REFERENCES PRODUIT (IDPRO);

ALTER TABLE LIVRAISON
    ADD CONSTRAINT  FK_LIVRAISON_LIVREUR
        FOREIGN KEY  (IDLIV)
        REFERENCES LIVREUR (IDLIV);

ALTER TABLE LIVRAISON
    ADD CONSTRAINT  FK_LIVCOM
        FOREIGN KEY  (IDCOM)
        REFERENCES COMMANDE (IDCOM);
