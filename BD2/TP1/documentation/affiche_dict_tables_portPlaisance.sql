-- =========================================================================
-- fichier 	            : affiche_dict_tables_portPlaisance.sql
-- base 	            : Port Plaisance
-- auteur(s)            : Tania OLIVIA
-- date 	            : 01/02/2020
-- role 	            : Extractions des descriptions des relations de la base
--					      de données "portPlaisance"
-- projet 	            : Port Plaisance
-- resultat dans        : dict_tables_portPlaisance.html
-- ==========================================================================
SET pagesize 80
SET MARKUP HTML ON SPOOL ON PREFORMAT OFF ENTMAP OFF - 
HEAD '<title>Description des colonnes des tables</title> - 
<style type="text/css">table.myTable { border-collapse:collapse; }- 
table.myTable td, table.myTable th { border:1px solid black;padding:5px; } </style>' - 
TABLE "class='myTable'"

TTITLE '<h3>Description des relations de la bases de donnees: Port de Plaisance</h3>'

SPOOL dict_tables_portPlaisance.html

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
SPOOL OFF      
SET MARKUP HTML OFF
