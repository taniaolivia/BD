--==========================
--fichier           : vue_SORTIES_PREVUES.sql
--auteur(s)         : Tania OLIVIA
--date              : 11/03/2020
--role              : la vue vue_SORTIES_PREVUES
--resultat dans     : //
--==========================
DROP VIEW vue_SORTIES_PREVUES;
CREATE VIEW vue_SORTIES_PREVUES (
    CODPORT,
    NOMBAT, 
    DATSORTPREV, 
    DATRETPREV)
AS 
SELECT CODPORT, NOMBAT, DATSORTPREV, DATRETPREV
FROM SORTIE
WHERE UPPER(EFF_PRV) = UPPER('PRV');