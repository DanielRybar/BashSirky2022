#!/bin/bash
echo "Kolik máme sirek? (rozsah 5-20)"
while true # cyklus pro validaci vstupu pro pocatecni pocet sirek
  do
    read pocetsirek
    if [[ ("$pocetsirek" -lt "5") || ("$pocetsirek" -gt "20") ]] ; then # kontrola rozsahu 5-20 (string)
      echo "$pocetsirek je neplatny vstup!"
      echo "Zadej lepsi hodnotu: "
    else break;
    fi 
done;

function sirky(){ # vykresleni sirek ||||
for (( i=1 ; i <= pocetsirek ; i++ ))
  do
    echo -n "|"
  done
}
sirky $pocetsirek

while true
do
  echo -e "\nZadej kolik beres sirek (1,2,3): "
  validace_tahani='^[1-3]+$' # regularni vyraz pro zadani hodnot 1 az 3 (integer)
  while true # vnitrni cyklus pro kontrolu rozsahu
    do
    read ja
      if ! [[ $ja =~ $validace_tahani ]] ; then # kontrola rozsahu 1-3 (integer)
        echo "$ja je neplatny vstup!"
        echo "Zadej lepsi hodnotu: "
      else break;
      fi 
  done;
  pocetsirek=$(($pocetsirek-$ja))
  echo "Zbylo $pocetsirek sirek"
  sirky $pocetsirek

  echo "   "
    if [ "$pocetsirek" -le "0" ] ; then
      echo "Konec hry, prohral jsi..."
      break
    fi

  echo "Ted hraju ja"
  comp=$(( $RANDOM % 3 + 1))
  if [ $pocetsirek -ge $comp ] ; then
    echo "Vzal jsem $comp sirek"
    pocetsirek=$(($pocetsirek-$comp))
  elif [ $pocetsirek -eq 2 ] ; then # pocitac nemuze vzit vice sirek, nez skutecne mame - proto dalsi podminka elif
    comp2=$(( $RANDOM % 2 + 1))
    echo "Vzal jsem $comp2 sirek"
    pocetsirek=$(($pocetsirek-$comp2))
  else 
    echo "Vzal jsem 1 sirku"
    pocetsirek=$(($pocetsirek-1))
  fi
  
  sirky pocetsirek

  echo "   "
  if [ "$pocetsirek" -le "0" ] ; then
    echo "Konec hry, vyhral jsi!"
    break
  fi
  echo "Zbylo $pocetsirek sirek"
done