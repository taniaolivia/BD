-- ============================================================================
-- fichier : tolivia_vue_install_en_cours.sql
-- auteur : Tania OLIVIA
-- date : Mai 2020
-- role : vue install en cours 
-- sqlplus : @exercice_2/tolivia_vue_install_en_cours.sql
-- ============================================================================
spool ../exercice_2/tolivia_vue_install_en_cours.out 
set echo on

-- ============================================================================
-- A compléter
-- ============================================================================

DROP VIEW tolivia_vue_install_en_cours;
CREATE VIEW tolivia_vue_install_en_cours(
    soft,
    poste,
    salle,
    affectation)
AS 
SELECT i.soft, i.poste, p.salle, i.dateaffect
FROM tolivia_installation i, poste p
GROUP BY soft, poste, salle, dateaffect;




-- ============================================================================
-- Fin à compléter
-- ============================================================================

set echo off 
spool off
