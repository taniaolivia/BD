-- ============================================================================
-- fichier : tolivia_infos_vue_install_en_cours.sql
-- auteur : Tania OLIVIA
-- date : Mai 2020
-- role : infos vue install en cours 
-- sqlplus : @exercice_2/tolivia_infos_vue_install_en_cours.sql
-- ============================================================================
@../utilitaires/presentation.sql
spool ../exercice_2/tolivia_infos_vue_install_en_cours.out 
set echo on

-- ============================================================================
-- A compléter
-- ============================================================================

COLUMN COLUMN_NAME format A15;

SELECT COLUMN_NAME, UPDATABLE, INSERTABLE, DELETABLE 
FROM   USER_UPDATABLE_COLUMNS
WHERE  UPPER(TABLE_NAME) = UPPER('tolivia_vue_install_en_cours');







-- ============================================================================
-- Fin à compléter
-- ============================================================================

set echo off 
spool off
