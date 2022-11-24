# Correction TP1 : 
## Exercice 1 :  

1. Afficher et compter les commandes qui commencent par une voyelle ou par un chiffre.
```sh
# pour afficher les commandes :
egrep  '^[aieouyAIEOUY0-9]' listeCommandes.txt
egrep -i '^[aieouyAIEOUY0-9]' listeCommandes.txt

# pour les compter (réponse : 50 commandes) :
egrep -ci '^[aieouy0-9]' listeCommandes.txt

```

2. Afficher et compter les commandes qui finissent par au moins deux chiffres. 
```sh
# pour afficher les commandes :
egrep '[0-9]{2}$' listeCommandes.txt
egrep '[0-9]{2, }$' listeCommandes.txt
egrep '\d\d$' listeCommandes.txt
egrep '\d{2}$' listeCommandes.txt

# pour les compter (réponse : 39 commandes) :
egrep -c '[0-9]{2}$' listeCommandes.txt
```

3. Afficher et compter les commandes constituées uniquement de caractères alphabétiques. 
```sh
# pour afficher les commandes :
egrep -i '^[a-zA-Z]+$' listeCommandes.txt

# pour les compter (réponse : 195 commandes) :
egrep -c '^[a-zA-Z]+$' listeCommandes.txt
```

4. Afficher et compter les commandes dont le nombre de caractères est inférieur ou égal à 9.
```sh
# pour afficher les commandes :
egrep '^.{1,9}$' listeCommandes.txt
egrep -v '.{10,}' listeCommandes.txt

# pour les compter (réponse : 226 commandes) :
egrep -c '^.{1,9}$' listeCommandes.txt
egrep -v -c '.{10,}' listeCommandes.txt
```

5. Afficher et compter les commandes dont le neuvième caractère en partant de la fin est un chiffre. 
```sh
# pour afficher les commandes :
egrep '\d.{8}$' listeCommandes.txt
egrep '[0-9].{8}$' listeCommandes.txt

# pour les compter (réponse : 3 commandes) :
egrep -c '\d.{8}$' listeCommandes.txt
egrep -c '[0-9].{8}$' listeCommandes.txt
```

6. Afficher et compter les commandes commençant ou finissant par un caractère non alphanumérique.
```sh
# pour afficher les commandes :
egrep -i '^[^a-z0-9]|[^a-z0-9]$' listeCommandes.txt

# pour les compter (réponse : 5 commandes) :
egrep -c '^[^a-z0-9]|[^a-z0-9]$' listeCommandes.txt
```


7. Afficher et compter les commandes contenant au moins deux fois le caractère point (non nécessairement consécutifs) 
```sh
# pour afficher les commandes :
egrep '\..*\.' listeCommandes.txt 
egrep '^.*\..*\..*$' listeCommandes.txt 
egrep '(\..*){2,}' listeCommandes.txt

# pour les compter (réponse : 7 commandes) :
egrep -c '\..*\.' listeCommandes.txt 
egrep -c '^.*\..*\..*$' listeCommandes.txt 
egrep -c '(\..*){2,}' listeCommandes.txt
```


8. Afficher et compter les commandes contenant une voyelle (et une seule)
```sh
# pour afficher les commandes :
egrep -i '^[^aeiouy]*[aeiouy][^aeiouy]*$' listeCommandes.txt

# pour les compter (réponse : 96 commandes) :
egrep -ci '^[^aeiouy]*[aeiouy][^aeiouy]*$' listeCommandes.txt
```

9. Afficher et compter les commandes contenant trois lettres consécutives identiques. 
```sh
# pour afficher les commandes :
egrep -i '([a-z])\1\1' listeCommandes.txt

# pour les compter (réponse : 1 commande) :
egrep -c '([a-z])\1\1' listeCommandes.txt
```

## Exercice 2 : 

1. Afficher les numéros des lignes vides 
```sh
# Sans l’option -v : 



# Avec l’option -v : 
```

2. Afficher les numéros des lignes non vides mais contenant que des caractères invisibles 
```sh

```

3. Afficher les lignes (et leur numéro) contenant l'un des caractères suivants : 
accent circonflexe, point, virgule, tiret, point-virgule, deux-points, point d'interrogation. 

```sh


```


4. Afficher les lignes (et leur numéro) qui contiennent le mot *les* (l'article indéfini ou le pronom) 

```sh

```

5. Afficher les lignes contenant un mot commençant par les lettres l ou L puis afficher ces mots
```sh
# pour afficher les lignes


# pour afficher les mots

```

6. Afficher les mots de 6 caractères exactement.
```sh

```

7. Afficher les lignes contenant un mot avec une lettre doublée (consécutivement). Afficher ensuite ces mots. 
```sh
# pour afficher les lignes 


# pour afficher les mots

```



8. Afficher les lignes dont le premier et le dernier caractères sont identiques. 
```sh

```