-- =========================================================================
-- fichier 	            : affiche_dict_colonnes_portPlaisance.sql
-- base 	            : Port Plaisance
-- auteur(s)            : Tania OLIVIA
-- date 	            : 01/02/2020
-- role 	            : Extractions des descriptions des colonnes de chaque table
--					      de la base de données "portPlasaince"
-- projet 	            : Port Plaisance
-- resultat dans        : dict_colonnes_portPlaisance.html
-- ==========================================================================

SET pagesize 80
SET MARKUP HTML ON SPOOL ON PREFORMAT OFF ENTMAP OFF - 
HEAD '<title>Description des colonnes des tables</title> - 
<style type="text/css">table.myTable { border-collapse:collapse; }- 
table.myTable td, table.myTable th { border:1px solid black;padding:5px; } </style>' - 
TABLE "class='myTable'"

TTITLE '<h3> Description des colonnes des tables de la base de donnees : Port De Plaisance</h3>'

SPOOL dict_colonnes_portPlaisance.html

COLUMN table_name HEADING 'Relation'
COLUMN column_name HEADING 'Attribut'
COLUMN comments HEADING 'Description' 

BREAK ON table_name SKIP 1

-- ============================================================================
-- Requête 
-- ============================================================================
select distinct uc.table_name, uc.column_name, uc.comments
from user_col_comments uc
where	uc.table_name in (select table_name from user_tables)   
order by 1;
-- ============================================================================

SPOOL off

SET MARKUP HTML OFF