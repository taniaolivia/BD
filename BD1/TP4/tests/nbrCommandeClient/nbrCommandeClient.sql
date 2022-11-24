-- ============================================================================
-- Fichier  : nbrCommandeClient.sql
-- Auteur   : OLIVIA TANIA
-- Date     : 15 Novembre 2019
-- Projet   : surgeles
-- Role     : Quel est le nombre de commandes passées pour chaque client ?
-- ============================================================================

SELECT C.IDCLI, C.NOMCLI, C.PRENOMCLI, COUNT(*) AS NbCOM
FROM CLIENT C, COMMANDE D
WHERE C.IDCLI = D.IDCLI
GROUP BY C.IDCLI, C.NOMCLI, C.PRENOMCLI;