-- ============================================================================
-- Fichier : restrict_vue_SORTIES_PREVUES.sql 
-- Auteur  : Tania OLIVIA				
-- Date    : 18/03/2020				
-- Role    : Afficher les restrictions dans l'utilisation de la vue 
--           vue_SORTIES_PREVUES
-- ============================================================================
COLUMN COLUMN_NAME format A15;

SELECT COLUMN_NAME, UPDATABLE, INSERTABLE, DELETABLE 
FROM   USER_UPDATABLE_COLUMNS
WHERE  UPPER(TABLE_NAME) = UPPER('vue_SORTIES_PREVUES');
