-- ============================================================================
-- Fichier          : emplacementLibre.sql
-- Auteur           : Tania OLIVIA
-- Date             : 04/02/2020
-- Base				: port plaisance
-- Role             : La requête pour connaître la liste des emplacements libres durant une période donnée
-- ============================================================================

SELECT E.ID_EMPL
FROM EMPLACEMENT_LIBRE E
WHERE NOT EXISTS (SELECT *
                  FROM BATEAU_RESIDENT BR
                  WHERE BR.EMPL_AFF = E.ID_EMPL)
AND NOT EXISTS (SELECT *
                FROM BATEAU_PASSAGE BP
                WHERE BP.EMPL_AFF = E.ID_EMPL
                AND BP.ARV <= TO_DATE ('15/01/2019', 'DD/MM/YYYY')
                AND BP.DEPART >= TO_DATE ('01/01/2019', 'DD/MM/YYYY'))
UNION
SELECT E.ID_EMPL
FROM EMPLACEMENT_LIBRE E
WHERE EXISTS (SELECT *
              FROM BATEAU_RESIDENT BR, SORTIE S
              WHERE BR.CODPORT = S.CODPORT
              AND BR.NOMBAT = S.NOMBAT
              AND BR.EMPL_AFF = E.ID_EMPL
              AND S.DATSORT <= TO_DATE ('01/01/2019', 'DD/MM/YY')
              AND S.DATRET >= TO_DATE ('15/01/2019', 'DD/MM/YYYY'))
AND NOT EXISTS (SELECT *
                FROM BATEAU_PASSAGE BP
                WHERE BP.EMPL_AFF = E.ID_EMPL
                AND BP.ARV <= TO_DATE ('15/01/2019', 'DD/MM/YYYY')
                AND BP.DEPART >= TO_DATE ('01/01/2019', 'DD/MM/YYYY')
);
