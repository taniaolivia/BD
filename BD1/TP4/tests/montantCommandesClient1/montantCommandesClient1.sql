-- ============================================================================
-- Fichier  : montantCommandesClient1.sql
-- Auteur   : OLIVIA TANIA
-- Date     : 15 Novembre 2019
-- Projet   : surgeles
-- Role     : Calculer le montant de chaque commande du client de code 1 
-- ============================================================================

SELECT D.DATECOM, C.IDCLI, C.NOMCLI, C.PRENOMCLI, D.IDCOM, SUM(PRIXUNIT*QTECOM) AS MONTANT
FROM CLIENT C, LIGNE_COMMANDE L, COMMANDE D
WHERE D.IDCOM = L.IDCOM 
AND C.IDCLI = D.IDCLI
AND C.IDCLI = 1
GROUP BY D.DATECOM, C.IDCLI, C.NOMCLI, C.PRENOMCLI, D.IDCOM;

