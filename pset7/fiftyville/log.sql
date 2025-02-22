-- Keep a log of any SQL queries you execute as you solve the mystery.

-- Retrieve all crime scene reports from July 28, 2024, on Humphrey Street.
SELECT *
FROM crime_scene_reports
WHERE
  year = 2024
  AND month = 7
  AND day = 28
  AND street = 'Humphrey Street';

-- Crime ID 295 corresponds to the theft of the CS50 duck at 10:15 AM at Humphrey Street bakery.

-- Retrieve all Interviews from July 28, 2024, on Humphrey Street.
SELECT *
FROM interviews
WHERE
  year = 2024
  AND month = 7
  AND day = 28
  AND transcript LIKE '%bakery%';

-- Three witnesses provided key details:
-- 1. Thief drove away from the bakery parking lot within 10 minutes of the theft.
-- 2. Thief was seen at an ATM on Leggett Street earlier that morning.
-- 3. Thief made a brief call after leaving, mentioning plans to take the earliest flight out of Fiftyville.
-- 4. Thief asked an accomplice to purchase the flight ticket.


-- Query suspects who match vehicle records, ATM withdrawals, flight passengers, and phone call records
SELECT people.id
FROM people
INNER JOIN bakery_security_logs
ON bakery_security_logs.license_plate = people.license_plate
WHERE
  year = 2024
  AND month = 7
  AND day = 28
  AND hour = 10
  AND minute > 15
  AND minute < 25;

-- Retrieve the flight ID and the destination airport ID for the earliest flight departing from Fiftyville
SELECT flights.id, flights.destination_airport_id
FROM flights
INNER JOIN airports
ON airports.id = flights.origin_airport_id
WHERE
  airports.city = 'Fiftyville'
  AND year = 2024
  AND month = 7
  AND day = 29
ORDER BY flights.hour, flights.minute
LIMIT 1;

-- Retrieve the city name of the airport with ID 4 from the airports table.
SELECT city
FROM airports
WHERE id = 4;

-- Query suspects who match vehicle records, ATM withdrawals, flight passengers, and phone call records
SELECT DISTINCT people.id
FROM people
WHERE
  people.id IN (
    -- Query suspects who withdrew money from the ATM
    SELECT bank_accounts.person_id
    FROM bank_accounts
    INNER JOIN atm_transactions
    ON atm_transactions.account_number = bank_accounts.account_number
    WHERE year = 2024
      AND month = 7
      AND day = 28
      AND atm_location = 'Leggett Street'
      AND transaction_type = 'withdraw'
  )
  AND people.id IN (
    -- Query suspects who were passengers on the earliest flight
    SELECT people.id
    FROM people
    INNER JOIN passengers
    ON passengers.passport_number = people.passport_number
    WHERE flight_id = 36
  )
  AND people.id IN (
    -- Query suspects who made brief phone calls
    SELECT people.id
    FROM people
    INNER JOIN phone_calls
    ON phone_calls.caller = people.phone_number
    WHERE phone_calls.year = 2024
      AND phone_calls.month = 7
      AND phone_calls.day = 28
      AND phone_calls.duration < 60
  )
  AND people.id in (
    -- Query suspects whose vehicles exited the bakery between 10:15 and 10:25 after the incident.
    SELECT people.id
    FROM people
    INNER JOIN bakery_security_logs
    ON bakery_security_logs.license_plate = people.license_plate
    WHERE
      year = 2024
      AND month = 7
      AND day = 28
      AND hour = 10
      AND minute > 15
      AND minute < 25
  );

-- Query the name and phone number of the thief.
SELECT name, phone_number
FROM people
WHERE people.id = 686048;

-- Query the name of the accomplice.
SELECT people.name
FROM people
INNER JOIN phone_calls
ON people.phone_number = phone_calls.receiver
WHERE phone_calls.caller = '(367) 555-5533'
  AND phone_calls.year = 2024
  AND phone_calls.month = 7
  AND phone_calls.day = 28
  AND phone_calls.duration < 60;


