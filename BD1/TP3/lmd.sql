
--==========================
--fichier : lmd.sql
--base:
--auteur(s): Tania OLIVIA
--date : 06/11/2019
--role: Manipuler des nuplets à la fois en insertion, consultation, modification et en suppression
--projet: surgelés
--resultat dans:  // à renseigner si nécessaire
--==========================

-- QUESTION 1 : 
INSERT  INTO CLIENT (IDCLI, NOMCLI, PRENOMCLI, ADRCLI, TELCLI, MAILCLI)
VALUES ('1', 'MARTIN', 'Jean', 'La Rochelle', '0505050505', 'martin@example.org');


-- QUESTION 2
INSERT  INTO CLIENT (IDCLI, NOMCLI, PRENOMCLI, ADRCLI, TELCLI, MAILCLI)
VALUES ('1', 'MARTIN', 'Jean', 'La Rochelle', '0505050505', 'martin@example.org');
-- Impossible d'insérer le même nuplet parce que IDCLI est un PRIMAY KEY. IL est unique


-- QUESTION 3
SELECT * FROM CLIENT;
-- Il supprime le premier '0' de '0506060606' de TELCLI


-- QUESTION 4
DELETE FROM CLIENT;
ALTER TABLE CLIENT MODIFY (TELCLI VARCHAR2(12));
DESC CLIENT


-- QUESTION 5
INSERT  INTO CLIENT (IDCLI, NOMCLI, PRENOMCLI, ADRCLI, TELCLI, MAILCLI)
VALUES ('2', 'DUPONT', 'Jean', 'La Rochelle', '0506060606', NULL);


-- QUESTION 6
INSERT INTO COMMANDE (IDCOM, IDCLI, DATECOM, DATERECEPPREVI)
VALUES (1, 1, TO_DATE('10/10/2013', 'DD/MM/YYYY'), TO_DATE('2013-12-01', 'YYYY-MM-DD'));


-- QUESTION 7
INSERT INTO COMMANDE (IDCOM, IDCLI, DATECOM, DATERECEPPREVI)
VALUES (2, 3, TO_DATE('20/10/2013', 'DD/MM/YYYY'), TO_DATE('01-12-2013', 'DD-MM-YYYY'));
-- Impossible d'insérer un client qui a pour identifiant le nombre 3 parce que le client 3 n'existe pas.s


-- QUESTION 8
INSERT INTO COMMANDE (IDCOM, IDCLI, DATECOM, DATERECEPPREVI)
VALUES (2, 1, TO_DATE('15/10/2013', 'DD/MM/YYYY'), TO_DATE('01-12-2013', 'DD-MM-YYYY'));


-- QUESTION 9
INSERT INTO COMMANDE (IDCOM, IDCLI, DATECOM, DATERECEPPREVI)
VALUES (2, 1, TO_DATE('10/10/2013', 'DD/MM/YYYY'), TO_DATE('01-12-2013', 'DD-MM-YYYY'));
-- Impossible de l'insérer parce que IDCOM est un PRIMAY KEY c'est pourquoi il n'accepte pas le même valeur.


-- QUESTION 10

UPDATE CLIENT
SET MAILCLI = 'dupont@example.org'
WHERE PRENOMCLI = 'Jean'
AND NOMCLI = 'DUPONT';


-- QUESTION 11
UPDATE COMMANDE
SET DATERECEPPREVI = DATERECEPPREVI + INTERVAL '5' DAY
WHERE DATECOM = TO_DATE('15/10/2013', 'DD/MM/YYYY')
AND IDCLI =(SELECT IDCLI
     FROM CLIENT
     WHERE NOMCLI = 'MARTIN'
     AND PRENOMCLI = 'Jean');


-- QUESTION 12
DELETE FROM COMMANDE
WHERE DATECOM = TO_DATE ('15/10/2013', 'DD/MM/YYYY')
AND IDCLI = (SELECT IDCLI
     FROM CLIENT
     WHERE NOMCLI = 'MARTIN'
     AND PRENOMCLI = 'Jean');
