-- ============================================================================
-- Fichier : tolivia_fct_inst_aff_tech.sql
-- Auteur  : Tania OLIVIA					
-- Date    : Mai 2020
-- Role    : fonction login_fct_inst_aff_tech.sql
-- sqlplus : @exercice_1/tolivia_fct_inst_aff_tech.sql
-- ============================================================================
spool ../exercice_1/tolivia_fct_inst_aff_tech.out 
set echo on

-- ============================================================================
-- A completer
-- ============================================================================

DROP TYPE typeINST FORCE;
CREATE TYPE typeINST AS OBJECT(
    nomsoft     VARCHAR(20),
    noposte     NUMBER,
    nomsalle    VARCHAR(50),
    dateaffect  DATE,
    etatinstall VARCHAR(20));
/
/
DROP TYPE typeListeINST FORCE;
CREATE TYPE typeListeINST IS TABLE OF typeINST;
/
CREATE OR REPLACE FUNCTION listeInstallationAffecte(
    V_login IN technicien.login%TYPE,
    V_dateaffect IN tolivia_installation.dateaffect%TYPE
)
RETURN typeListeINST PIPELINED AS
CURSOR cur_listeINST IS
        SELECT DISTINCT l.nomsoft, p.noposte, s.nomsalle, i.dateaffect, i.etatinstall
        FROM logiciel l, tolivia_installation i, salle s, poste p
        WHERE p.noposte = i.poste
        AND s.nosalle = p.salle
        AND l.nosoft = i.soft;
BEGIN
    FOR cur_ligne IN cur_ListeINST LOOP
        PIPE ROW (typeINST (cur_ligne.nomsoft, cur_ligne.noposte, cur_ligne.nomsalle, cur_ligne.dateaffect, cur_ligne.etatinstall));
    END LOOP;
    RETURN;
END;
/


-- ============================================================================
-- Fin à completer
-- ============================================================================

set echo off 
spool off
