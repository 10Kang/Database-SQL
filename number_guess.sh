#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

NUMBER=$(( RANDOM % 1000 + 1 ))

# Title of program

echo -e "\n~~~~~ Number Guessing Game ~~~~~\n"

# Asking for name
echo "Enter your username:"

read USERNAME

# Check if users exist in the database, make query to database
USERNAME_AVAILABLE=$($PSQL "SELECT name FROM users WHERE name='$USERNAME'")

# if not found 
if [[ -z $USERNAME_AVAILABLE ]]
then 
  # Insert into database 
  INSERT_USERNAME=$($PSQL "INSERT INTO users(name) VALUES('$USERNAME')")
  echo "Welcome, $USERNAME! It looks like this is your first time here."
else
  # if found, check the game played and best game guesses
  USER_ID=$($PSQL "SELECT user_id FROM users WHERE name='$USERNAME'")
  GAMES_PLAYED=$($PSQL "SELECT COUNT(game_id) FROM games WHERE user_id=$USER_ID")
  BEST_GAME=$($PSQL "SELECT MIN(number_of_guesses) FROM games WHERE user_id=$USER_ID")
  echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

echo $NUMBER
# Guess the secret words
echo -e "\nGuess the secret number between 1 and 1000:"


# if the guess not number

read GUESS
COUNT=1

until [[ $GUESS == $NUMBER ]] 
do  
  if [[ $GUESS =~ ^[0-9]+$ ]]
  then 
    # checking it is higher than the guess number
    if [[ $NUMBER -gt $GUESS ]]
    then
      echo "It's higher than that, guess again:"
      read GUESS 
      (( COUNT++ ))

    elif [[ $NUMBER -lt $GUESS ]]
    then 
      echo "It's lower than that, guess again:"
      read GUESS
      (( COUNT++ ))
    fi
  else
    echo "That is not an integer, guess again:"
    read GUESS 
    (( COUNT++ ))
  fi
done

echo "You guessed it in $COUNT tries. The secret number was $NUMBER. Nice job! "
    
# Insert the game data into table
USER_ID=$($PSQL "SELECT user_id FROM users WHERE name='$USERNAME'")
INSERT_GAME=$($PSQL "INSERT INTO games(user_id, number_of_guesses) VALUES($USER_ID,$COUNT)")


