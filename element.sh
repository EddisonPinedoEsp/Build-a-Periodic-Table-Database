
#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=periodic_table --tuples-only -c"

if [[ -z $1 ]]
then
  echo "Please provide an element as an argument."

else
  if [[ $1 =~ ^[0-9]+$ ]]
  then
    NUMBER=$($PSQL "select atomic_number, name, symbol, type, atomic_mass, melting_point_celsius, boiling_point_celsius from elements inner join properties using(atomic_number) inner join types using(type_id) where atomic_number = $1;") 
    
    if [[ -z $NUMBER ]]
    then
      echo "I could not find that element in the database."
    else 
      echo "$NUMBER" | while IFS='|' read -r ATOMIC_NUMBER NAME SYMBOL TYPE ATOMIC_MASS MELTING_POINT_CELSIUS BOILING_POINT_CELSIUS
      do
          ATOMIC_NUMBER=$(echo $ATOMIC_NUMBER | xargs)
          NAME=$(echo $NAME | xargs)
          SYMBOL=$(echo $SYMBOL | xargs)
          TYPE=$(echo $TYPE | xargs)
          ATOMIC_MASS=$(echo $ATOMIC_MASS | xargs)
          MELTING_POINT_CELSIUS=$(echo $MELTING_POINT_CELSIUS | xargs)
          BOILING_POINT_CELSIUS=$(echo $BOILING_POINT_CELSIUS | xargs)
          
          echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT_CELSIUS celsius and a boiling point of $BOILING_POINT_CELSIUS celsius."
      done
    fi
  elif [[ $1 =~ ^[a-zA-Z]{1,2}$ ]]
  then
    ELEMENT_SYMBOL=$($PSQL "select atomic_number, name, symbol, type, atomic_mass, melting_point_celsius, boiling_point_celsius from elements inner join properties using(atomic_number) inner join types using(type_id) where symbol = '$1';") 

    if [[ -z $ELEMENT_SYMBOL ]]
    then
      echo "I could not find that element in the database."
    else 
      echo "$ELEMENT_SYMBOL" | while IFS='|' read -r ATOMIC_NUMBER NAME SYMBOL TYPE ATOMIC_MASS MELTING_POINT_CELSIUS BOILING_POINT_CELSIUS
      do
          ATOMIC_NUMBER=$(echo $ATOMIC_NUMBER | xargs)
          NAME=$(echo $NAME | xargs)
          SYMBOL=$(echo $SYMBOL | xargs)
          TYPE=$(echo $TYPE | xargs)
          ATOMIC_MASS=$(echo $ATOMIC_MASS | xargs)
          MELTING_POINT_CELSIUS=$(echo $MELTING_POINT_CELSIUS | xargs)
          BOILING_POINT_CELSIUS=$(echo $BOILING_POINT_CELSIUS | xargs)
          
          echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT_CELSIUS celsius and a boiling point of $BOILING_POINT_CELSIUS celsius."
      done
    fi
  elif [[ $1 =~ ^[a-zA-Z]+$ ]]
  then
    ELEMENT_NAME=$($PSQL "select atomic_number, name, symbol, type, atomic_mass, melting_point_celsius, boiling_point_celsius from elements inner join properties using(atomic_number) inner join types using(type_id) where name = '$1';") 

    if [[ -z $ELEMENT_NAME ]]
    then
      echo "I could not find that element in the database."
    else 
      echo "$ELEMENT_NAME" | while IFS='|' read -r ATOMIC_NUMBER NAME SYMBOL TYPE ATOMIC_MASS MELTING_POINT_CELSIUS BOILING_POINT_CELSIUS
      do
          ATOMIC_NUMBER=$(echo $ATOMIC_NUMBER | xargs)
          NAME=$(echo $NAME | xargs)
          SYMBOL=$(echo $SYMBOL | xargs)
          TYPE=$(echo $TYPE | xargs)
          ATOMIC_MASS=$(echo $ATOMIC_MASS | xargs)
          MELTING_POINT_CELSIUS=$(echo $MELTING_POINT_CELSIUS | xargs)
          BOILING_POINT_CELSIUS=$(echo $BOILING_POINT_CELSIUS | xargs)
          
          echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT_CELSIUS celsius and a boiling point of $BOILING_POINT_CELSIUS celsius."
      done
    fi
  else
    echo "Que sera"
  fi
fi

