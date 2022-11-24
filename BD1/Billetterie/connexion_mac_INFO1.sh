#!/bin/bash
export NLS_LANG=FRENCH_FRANCE.UTF8
#--------------------------------------------------------------------
# A modifier
# Pas d'espace entre la variable, le signe = et la valeur
#--------------------------------------------------------------------
USER=tolivia
USER_PWD=901ybfo7lv 

#--------------------------------------------------------------------
# Ne pas modifier
#--------------------------------------------------------------------
Host=`uname`
if [ "$Host" == "Linux" ]; then
	export PATH=/opt/Oracle/insrantclent_12_2:$PATH
	export LD_LIBRARY_PATH=/opt/Oracle/insrantclent_12_2:$LD_LIBRARY_PATH
fi
if [ "$Host" == "Darwin" ]; then
	export PATH=/Applications/SqlPlus:$PATH
	export DYLD_LIBRARY_PATH=/Applications/SqlPlus:$DYLD_LIBRARY_PATH
fi
sqlplus $USER/$USER_PWD@10.2.50.71:1521/INFO1

