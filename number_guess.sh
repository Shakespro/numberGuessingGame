#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

echo "Enter your username:"
read USERNAME

# Check if the user exists in the database
USER_EXISTS=$($PSQL "SELECT username FROM users WHERE username = '$USERNAME'")

if [[ -n $USER_EXISTS ]]
then
  GAMES_PLAYED=$($PSQL "SELECT games_played FROM users WHERE username = '$USERNAME'")
  BEST_GAME=$($PSQL "SELECT best_game FROM users WHERE username = '$USERNAME'")
  echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
else
  echo "Welcome, $USERNAME! It looks like this is your first time here."
fi

# Generate a random number between 1 and 1000
SECRET_NUMBER=$((1 + $RANDOM % 1000))
GUESSES_COUNT=0

echo "Guess the secret number between 1 and 1000:"
while true
do
  read GUESS
  if ! [[ $GUESS =~ ^[0-9]+$ ]]
  then
    echo "That is not an integer, guess again:"
  elif [[ $GUESS -lt $SECRET_NUMBER ]]
  then
    echo "It's higher than that, guess again:"
    ((GUESSES_COUNT++))
  elif [[ $GUESS -gt $SECRET_NUMBER ]]
  then
    echo "It's lower than that, guess again:"
    ((GUESSES_COUNT++))
  else
    ((GUESSES_COUNT++))
    if [[ -n $USER_EXISTS ]]
    then
      CURRENT_BEST_GAME=$($PSQL "SELECT best_game FROM users WHERE username = '$USERNAME'")
      if [[ $GUESSES_COUNT -lt $CURRENT_BEST_GAME || -z $CURRENT_BEST_GAME ]]
      then
        $PSQL "UPDATE users SET best_game = $GUESSES_COUNT, games_played = games_played + 1 WHERE username = '$USERNAME'"
      else
        $PSQL "UPDATE users SET games_played = games_played + 1 WHERE username = '$USERNAME'"
      fi
    else
      $PSQL "INSERT INTO users(username, best_game, games_played) VALUES('$USERNAME', $GUESSES_COUNT, 1)"
    fi
    echo "You guessed it in $GUESSES_COUNT tries. The secret number was $SECRET_NUMBER. Nice job!"
    break
  fi
done
