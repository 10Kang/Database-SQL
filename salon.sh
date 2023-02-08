#!/bin/bash

PSQL='psql --username=freecodecamp --dbname=salon --tuples-only -c'

echo -e "\n~~~~~ MY SALON ~~~~~\n"
echo -e "\nWelcome to My Salon, how can I help you?\n"

# Check the service list available

MAIN_MENU() {
  if [[ $1 ]]
  then
    echo -e "\n$1"
  fi

  # listing the services 
  SERVICE_LIST=$($PSQL "SELECT * FROM services")
  echo "$SERVICE_LIST" | while read ID bar SERVICE
    do 
      echo "$ID) $SERVICE"
    done

  # read the choice of service
  read SERVICE_ID_SELECTED

  # SQL Queries the service selected
  SERVICE_AVAILABLE=$($PSQL "SELECT service_id FROM services WHERE service_id=$SERVICE_ID_SELECTED")
  
  # if service not found 
  if [[ -z $SERVICE_AVAILABLE ]]
  then 
    # return to main function
    MAIN_MENU "I could not find that service. What would you like today?"
  else
    # if service found 
    echo -e "\nWhat's your phone number?"
    read CUSTOMER_PHONE

    # check if customer in our database
    CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'")
    
    # if not found 
    if [[ -z $CUSTOMER_NAME ]]
    then 
      # ask for their name 
      echo -e "\nI don't have a record for that phone number, what's your name?"
      read CUSTOMER_NAME 

      # insert into customers table 
      INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(phone, name) VALUES('$CUSTOMER_PHONE','$CUSTOMER_NAME')")

      # get the name of service
      SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id=$SERVICE_ID_SELECTED")
      echo -e "\nWhat time would you like your $(echo $SERVICE_NAME| sed -r 's/^ *| *$//g'), $CUSTOMER_NAME?"

      read SERVICE_TIME

      # insert time, customer_id and service_id into appointments table
      CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
      INSERT_APPOINTMENT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED,'$SERVICE_TIME')")

      echo -e "\nI have put you down for a $(echo $SERVICE_NAME| sed -r 's/^ *| *$//g') at $(echo $SERVICE_TIME| sed -r 's/^ *| *$//g'), $CUSTOMER_NAME."

    else
    # if phone customer_name is found 
    # get the name of service
      SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id=$SERVICE_ID_SELECTED")
      echo -e "\nWhat time would you like your $(echo $SERVICE_NAME| sed -r 's/^ *| *$//g'), $CUSTOMER_NAME?"

      read TIME

      # insert time, customer_id and service_id into appointments table
      CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
      INSERT_APPOINTMENT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED,'$SERVICE_TIME')")

      echo -e "\nI have put you down for a $(echo $SERVICE_NAME| sed -r 's/^ *| *$//g') at $(echo $SERVICE_TIME| sed -r 's/^ *| *$//g'), $CUSTOMER_NAME."
    
    fi



  fi
}


MAIN_MENU
