-- ============================================================================
-- Fichier : tolivia_execute_fct_install_affect_tech.sql
-- Auteur  : Tania OLIVIA					
-- Date    : Mai 2020
-- Role    : executer la fonction tolivia_fct_install_affect_tech.sql
-- sqlplus : @exercice_1/tolivia_execute_fct_install_affect_tech.sql
-- ============================================================================
@../utilitaires/videContenuBase.sql
@../utilitaires/presentation.sql
@../utilitaires/nuplets_fct_install_affect_tech.sql
@../utilitaires/afficheContenuBase.sql
spool ../exercice_1/tolivia_execute_fct_install_affect_tech.out
set echo on

-- ============================================================================
-- A completer
-- ============================================================================

SET VERIFY OFF;
VARIABLE V_login VARCHAR2(8)
VARIABLE V_dateaffect DATE
ACCEPT V_login_lu PROMPT 'Login : ';
ACCEPT V_dateaffect_lu PROMPT 'Date souhaitée : ';
BEGIN
 :V_login:= &V_login_lu;
 :V_dateaffect:= &V_dateaffect_lu;
 END;
/
PROMPT =========================================================
PROMPT Liste des installations affectées à un technicien connu :
PROMPT =========================================================

SELECT * FROM TABLE (listeEmplacementsLibres(:V_login, :V_dateaffect));
/

-- ============================================================================
-- Fin à completer
-- ============================================================================

set echo off 
spool off
