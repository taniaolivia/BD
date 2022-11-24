-- ============================================================================
-- Fichier : showErrors.sql 
-- Auteur  : Jamal Malki
-- Date    : Février 2020
-- Role    : Affiche les erreurs de compilation avec mise en forme des colonnes
-- ============================================================================
column LINE/COL format a20;
column ERROR format a80;
set linesize 120;
show errors;

