-- ============================================================================
-- Fichier : ddl_sortie.sql
-- Auteur  : Jamal Malki
-- Date    : Janvier 2019
-- Role    : Creation de la table SORTIE
--			 "Port de plaisance" 
-- ============================================================================

-- ============================================================================
-- Creation de la Table SORTIE                               
-- ============================================================================
drop table sortie cascade constraints;
create table sortie (
  id_sortie     number          not null,
  codport       char(2)         not null, 
  nombat        varchar2(40)    not null, 
  datsortprev   date            not null, 
  datsortrelle  date            null, 
  datretprev    date            not null, 
  datretrelle   date            null, 
  eff_prv       char(3) default 'prv' not null,
  constraint pk_sortie primary key (id_sortie),
  constraint uq_sortie unique (codport, nombat, datsortprev),
  constraint ck_eff_prv check (upper(eff_prv) in ('EFF', 'PRV')),
  constraint ck_datsort check (datsortrelle >= datsortprev),
  constraint ck_datret check (datretrelle >= datretprev),
  constraint ck_datretrelle check (
    datretrelle is null or 
    datsortrelle is not null),
  constraint ck_datsortrelle check (
    datsortrelle is null or 
    (datretprev >= datsortrelle))
  );

-- ============================================================================
-- Dépendance de référence SORTIE                               
-- ============================================================================
alter table sortie add
constraint fk_sortie_bateau_resident foreign key (codport, nombat) 
references bateau_resident (codport, nombat);