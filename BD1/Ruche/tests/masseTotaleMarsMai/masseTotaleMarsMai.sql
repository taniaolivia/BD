-- ============================================================================
-- Fichier          : masseTotaleMarsMai.sql
-- Auteur           : Tania OLIVIA
-- Date             : 11 Decembre 2019
-- Base				: Ruche
-- Role             : Quelle est la masse totale de miel récolté entre mars 2018 et mai 2018 par type de miel ?
-- ============================================================================

SELECT RU.TYPEMIEL, SUM(RE.MASSE) AS MasseTotale
FROM RUCHER RU, RUCHE R, RECOLTE RE
WHERE R.IDRU = RE.IDRU
AND RU.IDRUCHER = R.IDRUCHER
AND RE.DATEREC BETWEEN TO_DATE('01/03/2018', 'DD/MM/YYYY')
AND TO_DATE('31/05/2018', 'DD/MM/YYYY')
GROUP BY RU.TYPEMIEL;