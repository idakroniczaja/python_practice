-- Keep a log of any SQL queries you execute as you solve the mystery.

--To get the decription of that crime from crime_scene_reports--
SELECT description FROM crime_scene_reports WHERE month = 7 AND day = 28 AND street = "Chamberlin Street";
description
Theft of the CS50 duck took place at 10:15am at the Chamberlin Street courthouse. Interviews were conducted today with three witnesses who were present at the time — each of their interview transcripts mentions the courthouse.

--interviews and courthouse log--
--interviews to get transcript of three withesses interview
SELECT transcript FROM interviews WHERE month = 7 AND day = 28 AND transcript LIKE "%courthouse%";
--1. Sometime within ten minutes of the theft, I saw the thief get into a car in the courthouse parking lot and drive away. If you have security footage from the courthouse parking lot, you might want to look for cars that left the parking lot in that time frame.--
--2. I don't know the thief's name, but it was someone I recognized. Earlier this morning, before I arrived at the courthouse, I was walking by the ATM on Fifer Street and saw the thief there withdrawing some money.--
--3. As the thief was leaving the courthouse, they called someone who talked to them for less than a minute. In the call, I heard the thief say that they were planning to take the earliest flight out of Fiftyville tomorrow. The thief then asked the person on the other end of the phone to purchase the flight ticket.--

--clues: licence plate, ATM at Fifer Street earlier this morning, phone call for flight

--to get data from courthouse logs 10 minutes of the theft 
SELECT activity FROM courthouse_security_logs WHERE hour = 10 AND minute = 25;
--activity exit 


--to get peoples license plate based on date and time and acitivty
SELECT name FROM people
JOIN courthouse_security_logs ON people.license_plate = courthouse_security_logs.license_plate
WHERE month = 7 AND day = 28 AND hour = 10 AND minute >= 15 AND minute <=25 AND activity="exit";
--suspects:
--Patrick
--Ernest
--Amber
--Danielle
--Roger
--Elizabeth
--Russell
--Evelyn

---getting atm information and bank account based on location an date
SELECT DISTINCT name FROM people 
JOIN bank_accounts ON people.id = bank_accounts.person_id
JOIN atm_transactions ON bank_accounts.account_number = atm_transactions.account_number
WHERE month = 7 AND day = 28 AND atm_location ="Fifer Street";
--suspect list:
--Danielle
--Bobby
--Madison
--Ernest
--Roy
--Robert
--Elizabeth
--Victoria
--Russell

--narrowin down list of suspect I have in both lists:
--Danielle
--Ernest
--Elisabeth
--Russel

--to get passangers who fly tomorrow early in the morning
SELECT name FROM people
JOIN passengers ON people.passport_number = passengers.passport_number
WHERE flight_id = ( SELECT id FROM flights WHERE day = 29 AND month = 7 ORDER BY hour, minute LIMIT 1);
--suspects
--Doris
--Roger
--Ernest
--Edward
--Evelyn
--Madison
--Bobby
--Danielle

--narrowing down
--Ernest
--Danielle

--getting people who had phonecall on that day which lasted less than a minute
SELECT DISTINCT name FROM people
JOIN phone_calls ON people.phone_number = phone_calls.caller
WHERE month = 7 AND day = 28 AND duration < 60;
--suspects
--Roger
--Evelyn
--Ernest
--Madison
--Russell
--Kimberly
--Bobby
--Victoria

--narrowing down
--Ernest


---where he flew
SELECT city FROM airports 
WHERE id = (SELECT destination_airport_id FROM flights WHERE month = 7 AND day = 29 ORDER BY hour, minute LIMIT 1);

--London

--who was ACCOMPLICE
SELECT DISTINCT name FROM people
JOIN phone_calls ON people.phone_number = phone_calls.receiver
WHERE month = 7 AND day = 28 AND duration < 60 AND caller = (SELECT phone_number FROM people WHERE name = "Ernest");

--Berthold