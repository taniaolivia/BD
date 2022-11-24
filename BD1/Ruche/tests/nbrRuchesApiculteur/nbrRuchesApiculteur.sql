-- ============================================================================
-- Fichier          : nbrRuchesApiculteur.sql
-- Auteur           : Tania OLIVIA
-- Date             : 13 Janvier 2020
-- Base				: Ruche
-- Role             : Quel est le nombre de ruches par apiculteur ?
-- ============================================================================

SELECT A.IDAPI, A.NOMAPI, A.PRENOMAPI, COUNT(R.IDRU) AS NbrRuches
FROM APICULTEUR A, RUCHE R
WHERE A.IDAPI = R.IDAPI
GROUP BY A.IDAPI, A.NOMAPI, A.PRENOMAPI
ORDER BY 1;