-- ============================================================================
-- fichier : tolivia_dr_installation.sql 
-- auteur : Tania OLIVIA
-- date : Mai 2020
-- role : dependences de references sur login_installation
-- sqlplus : @exercice_1/tolivia_dr_installation.sql
-- ============================================================================
spool ../exercice_1/tolivia_dr_installation.out 
set echo on

-- ============================================================================
-- A compléter
-- ============================================================================

ALTER TABLE tolivia_installation
    ADD CONSTRAINT  FK_INSTPOS
        FOREIGN KEY (poste)
        REFERENCES  poste (noposte);

ALTER TABLE tolivia_installation
    ADD CONSTRAINT  FK_INSTSOFT
        FOREIGN KEY (soft)
        REFERENCES  logiciel (nosoft);

ALTER TABLE tolivia_installation
    ADD CONSTRAINT  FK_INSTTECH
        FOREIGN KEY (responsable)
        REFERENCES  technicien (idtech);


-- ============================================================================
-- Fin à compléter
-- ============================================================================

set echo off 
spool off
