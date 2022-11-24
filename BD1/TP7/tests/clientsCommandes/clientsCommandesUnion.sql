-- ============================================================================
-- Fichier          : clientsCommandesUnion.sql
-- Auteur           : Tania OLIVIA
-- Date             : 6 Decembre 2019
-- Base				: Surgeles
-- Role             : La rêquete avec UNION
-- ============================================================================

SELECT C.IDCLI, C.NOMCLI, C.PRENOMCLI, D.IDCOM, D.DATECOM
FROM CLIENT C, COMMANDE D
WHERE C.IDCLI = D.IDCLI
UNION 
SELECT C.IDCLI, C.NOMCLI, C.PRENOMCLI, NULL, NULL
FROM CLIENT C
WHERE NOT EXISTS (SELECT *
                  FROM COMMANDE D
                  WHERE C.IDCLI = D.IDCLI
);