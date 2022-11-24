#!/bin/bash
export NLS_LANG=FRENCH_FRANCE.UTF8
#--------------------------------------------------------------------
# A modifier
# Pas d'espace entre la variable, le signe = et la valeur
#--------------------------------------------------------------------
# Nom utilisateur (login ULR : même que la BD INFO1 à l'IUT)
USER=tolivia_oper1

# Mot de passe utilisateur (même que la BD INFO1 à l'IUT)
USER_PWD=tolivia_oper1

# Chemin absolu vers le dossier décomprimé
# exemple : 
# SQLPLUS_PATH=/Volumes/Data/jmalki/Oracle/instantclient_11_2
SQLPLUS_PATH=/Users/taniaolivia/Downloads/instantclient_11_2
#--------------------------------------------------------------------
# Ne pas modifier
#--------------------------------------------------------------------
HOST=193.48.38.244
PORT=1521
BD=INFO1
Host=`uname`
if [ "$Host" == "Darwin" ]; then
	export PATH=$SQLPLUS_PATH:$PATH
	export DYLD_LIBRARY_PATH=$SQLPLUS_PATH:$DYLD_LIBRARY_PATH
else
	echo "Système d'exploitation inconnu !!!"
	echo "Contacter : jmalki@univ-lr.fr"
	exit;
fi
sqlplus $USER/$USER_PWD@$HOST:$PORT/$BD

