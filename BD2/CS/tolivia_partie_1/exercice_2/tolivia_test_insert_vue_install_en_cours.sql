-- ============================================================================
-- Fichier : tolivia_test_insert_vue_install_en_cours.sql
-- Auteur  : Tania OLIVIA			
-- Date    : Mai 2020
-- Role    : tester l'utilisation de la vue login_vue_install_en_cours en insertion
-- sqlplus : @exercice_2/tolivia_test_insert_vue_install_en_cours.sql
-- ============================================================================
ALTER SESSION SET nls_date_format='dd/mm/yyyy';
@../utilitaires/videContenuBase.sql ;
@../utilitaires/presentation.sql
set echo on
SPOOL  ../exercice_2/tolivia_test_insert_vue_install_en_cours.out

-- ============================================================================
-- A compléter
-- ============================================================================

-- Insertion dans les relations referencees 

insert into  salle(nosalle, nomsalle, nbpostes)
VALUES ('19', 'Juicy', '22');

insert into  typeos(idtypeos, labelos)
VALUES ('1', 'JJJ');

insert into  poste(noposte, salle, typeos, ip)
VALUES ('1', '19', '1', NULL);

insert into  logiciel(nosoft, nomsoft, editeur, version, typeos, dateachat)
VALUES ('1', 'Samsung', 'Tania', 'XX', '1', TO_DATE('20/01/2019', 'DD/MM/YYYY'));

insert into  technicien(idtech, login)
VALUES ('1', 'tolivia');

insert into  tolivia_installation (idinstall, soft, poste, dateaffect, dateinstallprev, dateinstallreel, etatinstall, responsable)
VALUES (seq_tolivia_installation.currval, '1', '1', '20', TO_DATE('20/01/2019', 'DD/MM/YYYY'), TO_DATE('22/01/2019', 'DD/MM/YYYY')), TO_DATE('24/01/2019', 'DD/MM/YYYY', 'ouverte', '1');

-- Etat de la base avant insertion 
set echo off

@../utilitaires/presentation.sql
@../utilitaires/videContenuBase.sql

set echo on

--  Tester l'insertion d'un nuplet à travers la vue

-- Contenu de la vue avant insertion 
select soft, poste, salle, affectation
from   tolivia_vue_install_en_cours;

-- Insertion d'un nuplet dans la vue
insert into  tolivia_vue_install_en_cours(soft, poste, salle, affectation)
VALUES ('Apple', '18', '20', TO_DATE('20/01/2019', 'DD/MM/YYYY'));

-- Contenu de la vue apres insertion
select soft, poste, salle, affectation
from   tolivia_vue_install_en_cours;

-- Etat de la base apres insertion 
set echo off
@../utilitaires/afficheContenuBase.sql

-- ============================================================================
-- Fin à compléter
-- ============================================================================
set echo off
spool off 


-- Contenu de la vue avant insertion 
select CODPORT, NOMBAT, NOMPROP, ADRESSE, NB_SEJOURS
from   vue_SEJOUR_BATPASS;

-- Insertion d'un nuplet dans la vue vue_SEJOUR_BATPASS
insert into  vue_SEJOUR_BATPASS(CODPORT, NOMBAT, NOMPROP, ADRESSE)
VALUES ('BB', 'POLIANE', 'Mandy', '67 RUE DU GORGIN');

-- Contenu de la vue apres insertion
select CODPORT, NOMBAT, NOMPROP, ADRESSE, NB_SEJOURS
from   vue_SEJOUR_BATPASS;

set echo off

set echo on