#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

echo $($PSQL "TRUNCATE TABLE games, teams")

cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS

do
  # insert data into teams table - winner
  if [[ $WINNER != 'winner' ]]
    then
      WINNER_TEAM="$($PSQL "SELECT * FROM teams WHERE name='$WINNER'")"
      # if winner doesm't exist, insert winner into database
      if [[ -z $WINNER_TEAM ]]
        then
          INSERT_WINNER="$($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")"
          # if insert successfully, print successful
          if [[ $INSERT_WINNER == 'INSERT 0 1' ]]
            then
              echo Inserted $WINNER succesfully
          else
          # if insert unsuccessfully, print failed
            echo Failed to insert $WINNER
          fi
      fi   
  fi 

  # insert data into teams table - opponent 
  if [[ $OPPONENT != 'opponent' ]]
    then
      OPPONENT_TEAM="$($PSQL "SELECT * FROM teams WHERE name='$OPPONENT'")"    
      # if oppoent doesn't exist, insert opponent into database
      if [[ -z $OPPONENT_TEAM ]]
        then
          INSERT_OPPONENT="$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")"
          if [[ $INSERT_OPPONENT == 'INSERT 0 1' ]] 
            then
              # if insert successfully, print successful
              echo Inserted $OPPONENT successfully
            else 
              # if insert unsuccessfully, print failed
              echo Inserted $OPPONENT failed
          fi
      fi
  fi

  # insert games into table
  if [[ $YEAR != 'year' ]]
    then
      WINNER_ID="$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")"
      OPPONENT_ID="$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")"

      # insert games into table
      INSERT_GAME="$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES('$YEAR', '$ROUND', '$WINNER_ID', '$OPPONENT_ID', '$WINNER_GOALS', '$OPPONENT_GOALS')")"
      if [[ $INSERT_GAME == 'INSERT 0 1' ]]
        then
          # if insert successfully, print successful
          echo New games added: $YEAR, $ROUND, $WINNER_ID VS $OPPONENT_ID, $WINNER_GOALS : $OPPONENT_GOALS
          # if insert unsuccessful, print failed
        else 
          echo Game insertion failed
      fi
  fi
done