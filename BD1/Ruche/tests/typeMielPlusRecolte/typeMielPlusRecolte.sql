-- ============================================================================
-- Fichier          : typeMielPlusRecolte.sql
-- Auteur           : Tania OLIVIA
-- Date             : 13 Janvier 2020
-- Base				: Ruche
-- Role             : Quel est le type de miel le plus récolté (dont la production est la plus importante) ?
-- ============================================================================

SELECT RU.TYPEMIEL, SUM(RE.MASSE) AS MasseTotale
FROM RUCHER RU, RECOLTE RE, RUCHE R
WHERE R.IDRUCHER = RU.IDRUCHER
AND R.IDRU = RE.IDRU
GROUP BY RU.TYPEMIEL
ORDER BY SUM(RE.MASSE) DESC
OFFSET 0 ROWS
FETCH FIRST 1 ROWS ONLY;