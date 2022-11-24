-- ============================================================================
-- Fichier          : dr_billetterie.sql
-- Auteur           : Brouillé Théo
-- Date             : Janvier 2019
-- Base				: Billetterie
-- Role             : Création des contraintes
-- ============================================================================
ALTER TABLE EVENEMENT
ADD CONSTRAINT FK_SALLEEVT FOREIGN KEY (IDSALLE) REFERENCES SALLE(IDSALLE);

ALTER TABLE BILLET
ADD CONSTRAINT FK_BILEVT FOREIGN KEY (IDEVT) REFERENCES EVENEMENT(IDEVT);
ALTER TABLE BILLET
ADD CONSTRAINT FK_BILCLI FOREIGN KEY (IDCLI) REFERENCES CLIENT(IDCLI);
ALTER TABLE BILLET
ADD CONSTRAINT FK_BILTARIF FOREIGN KEY (IDTARIF) REFERENCES TARIF(IDTARIF);
ALTER TABLE BILLET
ADD CONSTRAINT FK_BILST FOREIGN KEY (IDSITERESA) REFERENCES SITERESA(IDSITERESA);

alter table SPONSORING
add constraint fk_sponsoevt foreign key (idevt) references EVENEMENT(idevt);
alter table SPONSORING
add constraint fk_sponsopart foreign key (idpart) references PARTENAIRE(idpart);
