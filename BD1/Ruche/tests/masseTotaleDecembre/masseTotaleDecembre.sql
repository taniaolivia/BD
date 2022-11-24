-- ============================================================================
-- Fichier          : masseTotaleDecembre.sql
-- Auteur           : Tania OLIVIA
-- Date             : 13 Janvier 2020
-- Base				: Ruche
-- Role             : Quelle est la masse de miel récolté par apiculteur le 1er décembre 2018 ? Et le résultat l'ensemble des apiculteurs même ceux qui n’ont pas fait de récolte ce jour-là (MasseTotale=0).
-- ============================================================================

SELECT A.IDAPI, SUM(RE.MASSE) AS MasseTotale
FROM APICULTEUR A, RUCHE R, RECOLTE RE
WHERE R.IDRU = RE.IDRU 
AND A.IDAPI = R.IDAPI
AND RE.DATEREC = TO_DATE('01/12/2018', 'DD/MM/YYYY')
GROUP BY A.IDAPI
UNION
SELECT A1.IDAPI, 0
FROM APICULTEUR A1
WHERE NOT EXISTS (SELECT A2.IDAPI
                  FROM APICULTEUR A2, RUCHE R, RECOLTE RE
                  WHERE A2.IDAPI = R.IDAPI
                  AND R.IDRU = RE.IDRU
                  AND RE.DATEREC = TO_DATE('01/12/2018', 'DD/MM/YYYY')
                  AND A1.IDAPI = A2.IDAPI); 