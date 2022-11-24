-- ============================================================================
-- fichier : drop_gestionSallesInformatiques.sql
-- auteur : Jamal Malki
-- date : Mai 2020
-- role : suppression des tables de la base de donnees "Gestion Salles Informatiques" 
-- ============================================================================

drop table tolivia_installation cascade constraint ;
drop table poste cascade constraint ;
drop table salle cascade constraint ;
drop table logiciel cascade constraint ;
drop table typeos cascade constraint ;
drop table technicien cascade constraint ;