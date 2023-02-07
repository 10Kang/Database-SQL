#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

# Deleting table whenever is called in terminal
echo "$($PSQL "DROP TABLE teams, games")"

# Create table accordingly
echo "$($PSQL "CREATE TABLE teams(team_id SERIAL PRIMARY KEY, name VARCHAR(40) NOT NULL UNIQUE)")"

echo "$($PSQL "CREATE TABLE games(game_id SERIAL PRIMARY KEY, year INT NOT NULL, round VARCHAR(40) NOT NULL, winner_goals INT NOT NULL, opponent_goals INT NOT NULL, winner_id INT NOT NULL, opponent_id INT NOT NULL,FOREIGN KEY (winner_id) REFERENCES teams(team_id), FOREIGN KEY(opponent_id) REFERENCES teams(team_id))")"

# Insert data from csv.file to teams table 

cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do 
  # checking for winner team 
  if [[ $WINNER != "winner" ]]
  then 
    # get team_id for winner
    TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name= '$WINNER'")
    # if not found 
    if [[ -z $TEAM_ID ]]
    then 
      # insert name and team_id into team table
      INSERT_TEAM_ID=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")
      if [[ $INSERT_TEAM_ID == "INSERT 0 1" ]]
      then
        echo Inserted into teams, $WINNER
      fi
      WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name= '$WINNER'")
    fi 
    # get team_id for opponents
    TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name= '$OPPONENT'")
    # if not found 
    if [[ -z $TEAM_ID ]]
    then 
      # insert name and team_id into team table
      INSERT_TEAM_ID=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")
      if [[ $INSERT_TEAM_ID == "INSERT 0 1" ]]
      then
        echo Inserted into teams, $OPPONENT
      fi
      OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name= '$OPPONENT'")
    fi 

    # Insert the year, round winner_goals, opponents_goal, winner_id and opponent_id 

    INSERT_OTHER_VARIABLE=$($PSQL "INSERT INTO games(year, round, winner_goals, opponent_goals, winner_id, opponent_id) VALUES($YEAR,'$ROUND',$WINNER_GOALS, $OPPONENT_GOALS, $WINNER_ID, $OPPONENT_ID)")
    if [[ $INSERT_OTHER_VARIABLE == "INSERT 0 1" ]]
      then
        echo Inserted into games, $YEAR,$ROUND,$WINNER_GOALS, $OPPONENT_GOALS, $WINNER_ID, $OPPONENT_ID
      fi
  fi
done
