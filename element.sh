#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

if [[ $1 ]]
then 

  # extract info from the periodic table database

  if [[ $1 =~ ^[0-9]+$ ]]
  then 
    ELEMENT_USING_ATOMIC=$($PSQL "SELECT * FROM properties INNER JOIN elements USING(atomic_number) INNER JOIN types USING(type_id) WHERE atomic_number=$1")
    # check if element inside our database using atomic number   
    if [[ -z $ELEMENT_USING_ATOMIC ]]
    then 
      # if not found 
      echo "I could not find that element in the database."
    else
      echo "$ELEMENT_USING_ATOMIC" | while IFS="|" read ID ATOMIC_NUMBER ATOMIC_MASS MELTP BOILP SYMBOL NAME TYPE
      do
        echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTP celsius and a boiling point of $BOILP celsius."
      done  
    fi
  else

    ELEMENT_USING_SYMBOL=$($PSQL "SELECT * FROM properties INNER JOIN elements USING(atomic_number) INNER JOIN types USING(type_id) WHERE symbol='$1'") 
    ELEMENT_USING_NAME=$($PSQL "SELECT * FROM properties INNER JOIN elements USING(atomic_number) INNER JOIN types USING(type_id) WHERE name='$1'")

    if [[ -z $ELEMENT_USING_SYMBOL ]]
    then
      # if not found using symbol, checking either catch by name
      if [[ -z $ELEMENT_USING_NAME ]]
      then
        echo "I could not find that element in the database."
      else
        echo "$ELEMENT_USING_NAME" | while IFS="|" read ID ATOMIC_NUMBER ATOMIC_MASS MELTP BOILP SYMBOL NAME TYPE
        do
          echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTP celsius and a boiling point of $BOILP celsius."
        done  
      fi
    else
      echo "$ELEMENT_USING_SYMBOL" | while IFS="|" read ID ATOMIC_NUMBER ATOMIC_MASS MELTP BOILP SYMBOL NAME TYPE
      do
        echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTP celsius and a boiling point of $BOILP celsius."
      done  
    fi

  fi

else
  echo "Please provide an element as an argument."
fi
