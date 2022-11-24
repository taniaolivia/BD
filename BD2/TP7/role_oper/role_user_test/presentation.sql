-- ============================================================================
-- Fichier : presentation.sql 
-- Auteur  : Tania Olivia
-- Date    : 26 Mars 2020
-- Role    : Presentation des attributs de la base de donnees "Port Plaissance"
-- ============================================================================
clear columns

set markup html off
set linesize 150
set pagesize 100
SET RECSEP WRAPPED

column ADRESSE       format A18;
column CODMOD        format A15;
column CONSTRUCT     format A15;
column NOMPROP       format A15;
column VILLE         format A15;
column BASSIN        format A15;
column PONTON        format A15;
column CODPORT       format A15;
column NOMBAT        format A15;
column TEL_PORTABLE  format A12;
column DEB_LIBRE     format A16;
column FIN_LIBRE     format A16;
column DATSORTRELLE  format A18;
column DATRETRELLE   format A18;


