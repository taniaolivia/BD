-- ============================================================================
-- Fichier          : affiche_dict_colonnes_ruche-v1.sql 
-- Auteur           : Tania OLIVIA
-- Date             : 13 Decembre 2019
-- Role             : Extractions des descriptions des colonnes de chaque table
--					  de la base de données "ruche"
-- Fichier resultat : dict_colonnes_ruche-v1.html
-- ============================================================================

SET pagesize 80
SET MARKUP HTML ON SPOOL ON PREFORMAT OFF ENTMAP OFF - 
HEAD '<title>Description des colonnes des tables</title> - 
<style type="text/css">table.myTable { border-collapse:collapse; }- 
table.myTable td, table.myTable th { border:1px solid black;padding:5px; } </style>' - 
TABLE "class='myTable'"

TTITLE '<h3>Description des colonnes des tables de la base de données : ruche</h3>'

SPOOL affiche_dict_colonnes_ruche.html

COLUMN table_name HEADING 'Relation'
COLUMN column_name HEADING 'Attribut'
COLUMN comments HEADING 'Description' 

BREAK ON table_name SKIP 1

-- ============================================================================
-- Requette 
-- ============================================================================

select  ut.table_name, ut.column_name, ut.comments
from	user_col_comments ut
where	ut.table_name in (select table_name from user_tables)
order by 1,2;


-- ============================================================================

-- Debut de l'ecriture du fichier resultat du programme de test 
SPOOL affiche_dict_colonnes_ruche.out
PROMPT fichier resultat du test : affiche_dict_colonnes_ruche.out

-- Appel du fichier de presentation
@ ../utilitaires/saisi_comments_ruche.sql

-- Afficher le contenu des relations de la base de donnees
PROMPT Contenu de la base : 
@ ../utilitaires/affiche_dict_colonnes_ruche.sql

SPOOL off

SET MARKUP HTML OFF

