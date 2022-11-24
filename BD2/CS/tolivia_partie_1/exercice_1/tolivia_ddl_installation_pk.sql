-- ============================================================================
-- fichier : tolivia_ddl_installation_pk.sql 
-- auteur : Tania OLIVIA
-- date : Mai 2020
-- role : modification tolivia_installation 
-- sqlplus : @exercice_1/tolivia_ddl_installation_pk.sql
-- ============================================================================
spool ../exercice_1/tolivia_ddl_installation_pk.out 
set echo on

-- ============================================================================
-- A compléter
-- ============================================================================

DROP SEQUENCE seq_tolivia_installation;
CREATE SEQUENCE seq_tolivia_installation
INCREMENT BY 1
START WITH 1
MINVALUE 0
NOCYCLE
CACHE 25;

ALTER TABLE tolivia_installation
    MODIFY idinstall DEFAULT seq_tolivia_installation.nextval;




-- ============================================================================
-- Fin à compléter
-- ============================================================================

set echo off 
spool off