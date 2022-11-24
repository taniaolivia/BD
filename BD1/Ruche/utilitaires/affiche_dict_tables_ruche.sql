-- ============================================================================
-- Fichier          : affiche_dict_tables_ruche.sql 
-- Auteur           : Tania OLIVIA
-- Date             : 13 Decembre 2019
-- Role             : Extractions des descriptions des relations de la base
--					  de données "ruche"
-- Fichier resultat : dict_tables_ruche.html
-- ============================================================================

SET pagesize 80
SET MARKUP HTML ON SPOOL ON PREFORMAT OFF ENTMAP OFF - 
HEAD '<title>Description des colonnes des tables</title> - 
<style type="text/css">table.myTable { border-collapse:collapse; }- 
table.myTable td, table.myTable th { border:1px solid black;padding:5px; } </style>' - 
TABLE "class='myTable'"

TTITLE '<h3>Description des relations de la bases de données ruche</h3>'

SPOOL affiche_dict_tables_ruche.html

COLUMN table_name HEADING "Relation" ENTMAP OFF
COLUMN comments HEADING "Description" ENTMAP OFF

-- ============================================================================
-- Requette 
-- ============================================================================

select  ut.table_name, ut.comments
from	user_tab_comments ut 
where	ut.table_name in (select table_name from user_tables)
order by 1;

-- ============================================================================


-- Appel du fichier de presentation
@ ../utilitaires/saisi_comments_ruche.sql

-- Afficher le contenu des relations de la base de donnees
PROMPT Contenu de la base : 
@ ../utilitaires/affiche_dict_tables_ruche.sql

SPOOL OFF      
SET MARKUP HTML OFF

