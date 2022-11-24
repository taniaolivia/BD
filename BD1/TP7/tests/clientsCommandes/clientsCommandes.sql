-- ============================================================================
-- Fichier          : clientsCommandes.sql
-- Auteur           : Tania OLIVIA
-- Date             : 6 Decembre 2019
-- Base				: Surgeles
-- Role             : La rêquete avec une jointure externe
-- ============================================================================

SELECT C.IDCLI, C.NOMCLI, C.PRENOMCLI, D.IDCOM, D.DATECOM
FROM CLIENT C LEFT OUTER JOIN COMMANDE D
ON C.IDCLI = D.IDCLI;