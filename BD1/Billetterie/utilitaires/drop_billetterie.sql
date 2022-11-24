-- ============================================================================
-- Fichier          : drop_billetterie.sql
-- Auteur           : Brouillé Théo
-- Date             : Janvier 2019
-- Base				: Billetterie
-- Role             : Suppression des tables
-- ============================================================================

DROP TABLE PARTENAIRE CASCADE CONSTRAINTS;
DROP TABLE SPONSORING CASCADE CONSTRAINTS;
DROP TABLE CLIENT CASCADE CONSTRAINTS;
DROP TABLE BILLET CASCADE CONSTRAINTS;
DROP TABLE EVENEMENT CASCADE CONSTRAINTS;
DROP TABLE SALLE CASCADE CONSTRAINTS;
DROP TABLE TARIF CASCADE CONSTRAINTS;
DROP TABLE SITERESA CASCADE CONSTRAINTS;
