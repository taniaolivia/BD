-- ============================================================================
-- Fichier          : clientMemeTourneeQueMartin.sql
-- Auteur           : Tania OLIVIA
-- Date             : 10 Decembre 2019
-- Base				: Surgeles
-- Role             : Quels sont les clients livrés lors de la même tournée qui a permis de livrer la commande passée le 01/10/2013 par Jean MARTIN ?
-- ============================================================================


SELECT C2.IDCLI, C2.NOMCLI, C2.PRENOMCLI
FROM CLIENT C1, CLIENT C2, COMMANDE D1,COMMANDE D2, LIVRAISON L1, LIVRAISON L2
WHERE C1.NOMCLI = 'MARTIN' 
AND C1.PRENOMCLI = 'Jean'
AND C2.NOMCLI != 'MARTIN'
AND D1.IDCLI = C1.IDCLI
AND D1.DATECOM = '01/10/2013'
AND D2.IDCOM = L2.IDCOM
AND L1.IDCOM = D1.IDCOM
AND L1.DATELIV = L2.DATELIV
AND L1.IDLIV = L2.IDLIV
AND D2.IDCLI = C2.IDCLI;