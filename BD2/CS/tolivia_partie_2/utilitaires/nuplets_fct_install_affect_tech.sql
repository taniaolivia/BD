ALTER SESSION SET nls_date_format='dd/mm/yyyy';

insert into technicien (idtech,login)
values (30, 'dtexier');

insert into salle (nosalle,nomsalle,nbpostes)
values (1, 'salle1', 14);

insert into typeos (idtypeos,labelos)
values (20, 'linux'); 

insert into poste (noposte,salle,typeos,ip)
values (10, 1, 20, '10.10.10.10');

insert into logiciel (nosoft,nomsoft,editeur,version,typeos,dateachat)
values (100, 'logiciel100', 'editeur100', 'v100', 20, '01/01/2020');

insert into tolivia_installation(soft,poste,dateaffect,dateinstallprev,
dateinstallreel,etatinstall,responsable)
values (100, 10, sysdate, sysdate, null, 'ouverte', 30); 

