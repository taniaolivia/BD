--==========================
--fichier           : vue_SEJOUR_BATPASS.sql
--auteur(s)         : Tania OLIVIA
--date              : 11/03/2020
--role              : la vue vue_SEJOUR_BATPASS
--resultat dans     : //
--==========================

DROP VIEW vue_SEJOUR_BATPASS;
CREATE VIEW vue_SEJOUR_BATPASS (
    CODPORT,
    NOMBAT,
    NOMPROP,
    ADRESSE,
    NB_SEJOURS)
AS 
SELECT CODPORT, NOMBAT, NOMPROP, ADRESSE, COUNT(*) AS NB_SEJOURS
FROM BATEAU_PASSAGE
GROUP BY CODPORT, NOMBAT, NOMPROP, ADRESSE;