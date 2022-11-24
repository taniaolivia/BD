-- ============================================================================
-- Fichier          : affiche_dict_colonnes_ruche-v1.sql 
-- Auteur           : Tania OLIVIA
-- Date             : 13 Decembre 2019
-- Role             : Extractions des descriptions des colonnes de chaque table
--					  de la base de données "ruche"
-- Fichier resultat : dict_colonnes_ruche-v1.html
-- ============================================================================

--===========================
----Reformatage des colonnes
--===========================

set linesize 100
COLUMN CTYPE FORMAT A6
COLUMN CNAME FORMAT A18
COLUMN CCOLUMN FORMAT A15
COLUMN RTABLE FORMAT A15
COLUMN COND FORMAT A50
COLUMN RCOLUMN FORMAT A15


SPOOL descriptions_base_ruche.out

--================================================================================================

SELECT CONSTRAINT_TYPE AS CTYPE, CONSTRAINT_NAME AS CNAME, TABLE_NAME AS CTABLE
FROM USER_CONSTRAINTS
WHERE upper(OWNER) ='TOLIVIA';

--================================================================================================


    prompt Schema :
    prompt ====================================================================================================


DESC APICULTEUR


    prompt Clé primaire et clé étrangère :
    prompt ====================================================================================================

SELECT T.CONSTRAINT_TYPE AS CTYPE, T.CONSTRAINT_NAME AS CNAME, C.COLUMN_NAME AS CCOLUMN
FROM USER_CONSTRAINTS T, USER_CONS_COLUMNS C
WHERE T.OWNER = 'TOLIVIA'
AND T.CONSTRAINT_NAME = C.CONSTRAINT_NAME
AND T.TABLE_NAME = 'APICULTEUR'
AND T.TABLE_NAME = C.TABLE_NAME
AND T.CONSTRAINT_TYPE IN ('P', 'U');


    prompt Cle étrangère :
    prompt ====================================================================================================


SELECT T.CONSTRAINT_TYPE AS CTYPE, T.CONSTRAINT_NAME AS CNAME, T.SEARCH_CONDITION AS COND, C.COLUMN_NAME AS CCOLUMN
FROM USER_CONSTRAINTS T, USER_CONS_COLUMNS C
WHERE T.OWNER = 'TOLIVIA'
AND T.TABLE_NAME = C.TABLE_NAME
AND T.CONSTRAINT_NAME = C.CONSTRAINT_NAME
AND T.TABLE_NAME = 'APICULTEUR'
AND T.CONSTRAINT_TYPE = 'C';


    prompt Contraintes de CHECK :
    prompt ====================================================================================================


SELECT T.CONSTRAINT_TYPE AS CTYPE, T.CONSTRAINT_NAME AS CNAME, C.COLUMN_NAME AS CCOLUMN, D.TABLE_NAME AS RTABLE, D.COLUMN_NAME AS RCOLUMN
FROM USER_CONSTRAINTS T, USER_CONS_COLUMNS C, USER_CONS_COLUMNS D
WHERE T.OWNER ='TOLIVIA'
AND T.TABLE_NAME = C.TABLE_NAME
AND T.CONSTRAINT_NAME = C.CONSTRAINT_NAME
AND T.TABLE_NAME = 'APICULTEUR'
AND T.CONSTRAINT_TYPE = 'R'
AND T.R_CONSTRAINT_NAME = D.CONSTRAINT_NAME;


--=====================================================================================================

    prompt Schema :
    prompt ====================================================================================================


DESC RUCHER


    prompt Clé primaire et unique :
    prompt ====================================================================================================


SELECT T.CONSTRAINT_TYPE AS CTYPE, T.CONSTRAINT_NAME AS CNAME, C.COLUMN_NAME AS CCOLUMN
FROM USER_CONSTRAINTS T, USER_CONS_COLUMNS C
WHERE T.OWNER = 'TOLIVIA'
AND T.CONSTRAINT_NAME = C.CONSTRAINT_NAME
AND T.TABLE_NAME = 'RUCHER'
AND T.TABLE_NAME = C.TABLE_NAME
AND T.CONSTRAINT_TYPE IN ('P', 'u');


    prompt Cle étrangère :
    prompt ====================================================================================================


SELECT T.CONSTRAINT_TYPE AS CTYPE, T.CONSTRAINT_NAME AS CNAME, T.SEARCH_CONDITION AS COND, C.COLUMN_NAME AS CCOLUMN
FROM USER_CONSTRAINTS T, USER_CONS_COLUMNS C
WHERE T.OWNER = 'TOLIVIA'
AND T.TABLE_NAME = C.TABLE_NAME
AND T.CONSTRAINT_NAME = C.CONSTRAINT_NAME
AND T.TABLE_NAME = 'RUCHER'
AND T.CONSTRAINT_TYPE = 'C';


    prompt Contraintes de CHECK :
    prompt ====================================================================================================


SELECT T.CONSTRAINT_TYPE AS CTYPE, T.CONSTRAINT_NAME AS CNAME, C.COLUMN_NAME AS CCOLUMN, D.TABLE_NAME AS RTABLE, D.COLUMN_NAME AS RCOLUMN
FROM USER_CONSTRAINTS T, USER_CONS_COLUMNS C, USER_CONS_COLUMNS D
WHERE T.OWNER ='TOLIVIA'
AND T.TABLE_NAME = C.TABLE_NAME
AND T.CONSTRAINT_NAME = C.CONSTRAINT_NAME
AND T.TABLE_NAME = 'RUCHER'
AND T.CONSTRAINT_TYPE = 'R'
AND T.R_CONSTRAINT_NAME = D.CONSTRAINT_NAME;


--===============================================================================================================================================

    prompt Schema :
    prompt ====================================================================================================



DESC RUCHE


    prompt Clé primaire et unique :
    prompt ====================================================================================================


SELECT T.CONSTRAINT_TYPE AS CTYPE, T.CONSTRAINT_NAME AS CNAME, C.COLUMN_NAME AS CCOLUMN
FROM USER_CONSTRAINTS T, USER_CONS_COLUMNS C
WHERE T.OWNER = 'TOLIVIA'
AND T.CONSTRAINT_NAME = C.CONSTRAINT_NAME
AND T.TABLE_NAME = 'RUCHE'
AND T.TABLE_NAME = C.TABLE_NAME
AND T.CONSTRAINT_TYPE IN ('P', 'u');


    prompt Cle étrangère :
    prompt ====================================================================================================


SELECT T.CONSTRAINT_TYPE AS CTYPE, T.CONSTRAINT_NAME AS CNAME, T.SEARCH_CONDITION AS COND, C.COLUMN_NAME AS CCOLUMN
FROM USER_CONSTRAINTS T, USER_CONS_COLUMNS C
WHERE T.OWNER = 'TOLIVIA'
AND T.TABLE_NAME = C.TABLE_NAME
AND T.CONSTRAINT_NAME = C.CONSTRAINT_NAME
AND T.TABLE_NAME = 'RUCHE'
AND T.CONSTRAINT_TYPE = 'C';


    prompt Contraintes de CHECK :
    prompt ====================================================================================================


SELECT T.CONSTRAINT_TYPE AS CTYPE, T.CONSTRAINT_NAME AS CNAME, C.COLUMN_NAME AS CCOLUMN, D.TABLE_NAME AS RTABLE, D.COLUMN_NAME AS RCOLUMN
FROM USER_CONSTRAINTS T, USER_CONS_COLUMNS C, USER_CONS_COLUMNS D
WHERE T.OWNER ='TOLIVIA'
AND T.TABLE_NAME = C.TABLE_NAME
AND T.CONSTRAINT_NAME = C.CONSTRAINT_NAME
AND T.TABLE_NAME = 'RUCHE'
AND T.CONSTRAINT_TYPE = 'R'
AND T.R_CONSTRAINT_NAME = D.CONSTRAINT_NAME;


--===================================================================================================================================================

    prompt Schema :
    prompt ====================================================================================================


DESC RECOLTE


    prompt Clé primaire et unique :
    prompt ====================================================================================================


SELECT T.CONSTRAINT_TYPE AS CTYPE, T.CONSTRAINT_NAME AS CNAME, C.COLUMN_NAME AS CCOLUMN
FROM USER_CONSTRAINTS T, USER_CONS_COLUMNS C
WHERE T.OWNER = 'TOLIVIA'
AND T.CONSTRAINT_NAME = C.CONSTRAINT_NAME
AND T.TABLE_NAME = 'RECOLTE'
AND T.TABLE_NAME = C.TABLE_NAME
AND T.CONSTRAINT_TYPE IN ('P', 'u');


    prompt Cle étrangère :
    prompt ====================================================================================================


SELECT T.CONSTRAINT_TYPE AS CTYPE, T.CONSTRAINT_NAME AS CNAME, T.SEARCH_CONDITION AS COND, C.COLUMN_NAME AS CCOLUMN
FROM USER_CONSTRAINTS T, USER_CONS_COLUMNS C
WHERE T.OWNER = 'TOLIVIA'
AND T.TABLE_NAME = C.TABLE_NAME
AND T.CONSTRAINT_NAME = C.CONSTRAINT_NAME
AND T.TABLE_NAME = 'RECOLTE'
AND T.CONSTRAINT_TYPE = 'C';


    prompt Contraintes de CHECK :
    prompt ====================================================================================================


SELECT T.CONSTRAINT_TYPE AS CTYPE, T.CONSTRAINT_NAME AS CNAME, C.COLUMN_NAME AS CCOLUMN, D.TABLE_NAME AS RTABLE, D.COLUMN_NAME AS RCOLUMN
FROM USER_CONSTRAINTS T, USER_CONS_COLUMNS C, USER_CONS_COLUMNS D
WHERE T.OWNER ='TOLIVIA'
AND T.TABLE_NAME = C.TABLE_NAME
AND T.CONSTRAINT_NAME = C.CONSTRAINT_NAME
AND T.TABLE_NAME = 'RECOLTE'
AND T.CONSTRAINT_TYPE = 'R'
AND T.R_CONSTRAINT_NAME = D.CONSTRAINT_NAME;



SPOOL off