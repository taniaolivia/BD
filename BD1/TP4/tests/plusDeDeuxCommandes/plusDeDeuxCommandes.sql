-- ============================================================================
-- Fichier  : plusDeDeuxCommandes.sql
-- Auteur   : OLIVIA TANIA
-- Date     : 15 Novembre 2019
-- Projet   : surgeles
-- Role     : Quel est le nombre de commandes passées par client lorsque ce nombre est superieur ou egale à 2 entre le 1er juin 2013 et le 31 octobre 2013 ?
-- ============================================================================

SELECT C.IDCLI, C.NOMCLI, C.PRENOMCLI, COUNT(*) AS NbCOM
FROM CLIENT C, COMMANDE D
WHERE C.IDCLI = D.IDCLI
AND D.DATECOM BETWEEN TO_DATE('01/06/2013', 'DD/MM/YYYY')
AND TO_DATE('31/10/2013', 'DD/MM/YYYY')
GROUP BY C.IDCLI, C.NOMCLI, C.PRENOMCLI
HAVING COUNT(*) >= 2;