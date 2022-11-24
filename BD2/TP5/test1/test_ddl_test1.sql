-- ============================================================================
-- Fichier : test_ddl_test1.sql
-- Auteur  : Tania OLIVIA
-- Date    : 11/03/2020
-- Role    : Tester le ddl de la table test1 en utilisant la séquence seq_test1 
-- ============================================================================

-- Debut de l'ecriture du fichier resultat du programme de test 
SPOOL test_ddl_test1.out
PROMPT fichier resultat du test : test_ddl_test1.out 

set echo on
-- ============================================================================
-- Suppression des nuplet de la table
-- ============================================================================

set echo off
delete from test1;

set echo on

-- ============================================================================
-- Mise en oeuvre de la séquence
-- ============================================================================

set echo off

-- CAS1
-- Insertion avec valeur par défaut
INSERT INTO test1(DESCRIPTION) VALUES ('description only');

-- CAS2
-- Insertion avec ID = NULL
INSERT INTO test1(ID, DESCRIPTION) VALUES (NULL,'ID = NULL and description');

-- CAS3
-- Insertion avec valeur imposée : ID = 999
INSERT INTO test1(ID, DESCRIPTION) VALUES (999,'ID = 999 and description');

set echo on

-- ============================================================================
-- Affiche le contenu de la table
-- ============================================================================

set echo off

col description format a40;
select*
from test1;

-- Fin de l'ecriture du fichier resultat du programme de test 
SPOOL OFF

-- ============================================================================
-- Fin du programme de test
-- ============================================================================
