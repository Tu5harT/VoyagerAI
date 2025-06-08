# Voyager AI - Your Adventure Planner

This is "Voyager AI," a travel assistant bot developed using the Rasa framework. It helps adventurers plan their journeys by providing weather forecasts and essential packing advice.

## Core Features

- **Dynamic Conversation**: Understands user goals like checking the forecast or getting a packing list.
- **Form-Based Slot Filling**: Actively asks for key details like destination and dates to fulfill a request.
- **Live API Integration**: Connects to the **OpenWeatherMap API** for real-time weather data.
- **Smart Recommendations**: Suggests packing items based on the live weather conditions.
- **Custom Persona**: Engages users with an enthusiastic and adventurous personality.

---

## Setup and Running the Bot

(The setup steps are identical to the original project: install requirements, add API key, train, and run the two servers.)

---

## Sample Conversation

**User**: `hey there`
**Voyager AI**: `Greetings, traveler! Voyager AI here, ready to help you map out your next adventure. What can I do for you?`

**User**: `what gear should I pack for a trip to the amazon?`
**Voyager AI**: `Awesome! What's the destination for this grand adventure?`
**User**: `Iquitos`
**Voyager AI**: `Got it. When does the journey begin?`
**User**: `next month`
**Voyager AI**: `And when will you be returning?`
**User**: `in two weeks`
**Voyager AI**: `Excellent! Plotting the course and checking the conditions now...`
**Voyager AI**: `Alright, adventurer! The current forecast for Iquitos shows light rain with a temperature around 26°C.`
**Voyager AI**: `Based on that forecast, I'd recommend packing a waterproof jacket and an umbrella. Adventure awaits!`

**User**: `who made you?`
**Voyager AI**: `I was brought to life by a forward-thinking developer for an assessment by Yoliday, designed to explore new frontiers in bot technology.`