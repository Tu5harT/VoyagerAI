# actions/actions.py
import os
import requests
from typing import Any, Text, Dict, List
from rasa_sdk import Action, Tracker
from rasa_sdk.executor import CollectingDispatcher
from rasa_sdk.events import SlotSet
from dotenv import load_dotenv

load_dotenv()

# Renamed Action
class ActionFetchForecast(Action):

    def name(self) -> Text:
        return "action_fetch_forecast" # Renamed

    def run(self, dispatcher: CollectingDispatcher,
            tracker: Tracker,
            domain: Dict[Text, Any]) -> List[Dict[Text, Any]]:

        api_key = os.getenv("OPENWEATHER_API_KEY")
        city = tracker.get_slot("destination_city")

        if not api_key:
            dispatcher.utter_message(text="Warning: The OpenWeatherMap API key isn't configured. I can't look up the weather.")
            return []
        if not city:
            dispatcher.utter_message(text="I need to know your destination to check the forecast!")
            return []

        url = f"http://api.openweathermap.org/data/2.5/weather?q={city}&appid={api_key}&units=metric"

        try:
            response = requests.get(url).json()
            if response["cod"] != 200:
                dispatcher.utter_message(text=f"I couldn't find a forecast for {city}. Are you sure it's spelled correctly?")
                return [SlotSet("weather_condition", None)]

            condition = response["weather"][0]["description"]
            temp = response["main"]["temp"]
            
            # New persona response
            message = f"Alright, adventurer! The current forecast for {city} shows {condition} with a temperature around {temp}°C."
            dispatcher.utter_message(text=message)
            
            return [SlotSet("weather_condition", condition)]

        except Exception as e:
            print(e)
            dispatcher.utter_message(text=f"Uh oh, my connection to the weather satellite seems to be down. Can't fetch data for {city}.")
            return [SlotSet("weather_condition", None)]


# Renamed Action
class ActionSuggestPackingItems(Action):

    def name(self) -> Text:
        return "action_suggest_packing_items" # Renamed

    def run(self, dispatcher: CollectingDispatcher,
            tracker: Tracker,
            domain: Dict[Text, Any]) -> List[Dict[Text, Any]]:

        weather = tracker.get_slot("weather_condition")
        if not weather:
            return []

        packing_list = []
        
        if "rain" in weather or "drizzle" in weather:
            packing_list.append("a waterproof jacket")
            packing_list.append("an umbrella")
        if "clear" in weather or "sun" in weather:
            packing_list.append("sunglasses")
            packing_list.append("sunscreen")
        if "clouds" in weather:
            packing_list.append("a versatile sweater or hoodie")
        if "snow" in weather:
            packing_list.append("a warm coat, gloves, and a hat")
        if "thunderstorm" in weather:
            packing_list.append("a good book for staying indoors!")

        if not packing_list:
            message = "The weather looks pretty standard. Pack your essentials, and you'll be ready for anything!"
        else:
            # New persona response
            recommendation = " and ".join([", ".join(packing_list[:-1]), packing_list[-1]] if len(packing_list) > 2 else packing_list)
            message = f"Based on that forecast, I'd recommend packing {recommendation}. Adventure awaits!"
            
        dispatcher.utter_message(text=message)
        return []