# Voyager AI - Rasa Travel Assistant

This repository contains the source code for "Voyager AI," a functional travel assistant chatbot developed for the Yoliday Rasa Bot Development Internship Assessment. The bot is designed to guide users through travel-related queries, from fetching weather forecasts to recommending what to pack.

## ✨ Core Features & Accomplishments

This project successfully fulfills all the core requirements of the assessment:

*   **🤖 Functional Chatbot:** A complete, end-to-end conversational agent built using the Rasa framework.

*   **🧠 Intent Handling & NLU:** The bot is trained to understand a variety of user intents, including:
    *   `greet`, `goodbye`, `bot_challenge`
    *   `check_forecast` (for weather)
    *   `get_packing_list` (for packing advice)
    *   `ask_info` (for FAQs)
    *   `fallback` for handling out-of-scope questions gracefully.

*   **📝 Forms & Slot Filling:** Implemented a Rasa Form (`trip_planner_form`) to intelligently collect necessary information from the user, such as `destination_city`, `start_date`, and `end_date`, ensuring a smooth conversational flow.

*   **⚙️ Custom Actions & API Integration:**
    *   Developed a custom action in Python to connect to the **OpenWeatherMap API**, fetching real-time weather data for any specified city.
    *   Created a second custom action to provide dynamic packing recommendations (e.g., "pack an umbrella," "bring sunscreen") based on the weather data returned by the API.

*   **🎨 Custom Frontend:** Designed and built a polished, animated, and user-friendly web interface using HTML and CSS. This frontend provides a much better user experience than a standard command-line chat.

*   **🐳 Docker Containerization:** The entire application (Rasa server, action server, and all dependencies) is containerized in a **single, unified Docker image**. This makes the project portable, scalable, and easy to run in any environment.

## 🚀 Deployment Status

The application is fully containerized and runs perfectly in a local Docker environment.

The primary challenge encountered was deploying the application to a free-tier cloud platform (like Render). The bot's architecture is sound, but we faced persistent **CORS (Cross-Origin Resource Sharing) issues** where the platform's network proxy appeared to block the necessary headers for communication between the frontend and the live backend. This is a common challenge with the network configurations of some free hosting services.

As a result, a permanent live link is not feasible under the free-tier constraints. However, the project is fully deployable and can be demonstrated live using a local server with a tool like `ngrok`.

## 🛠️ How to Run Locally

1.  **Prerequisites:**
    *   Docker Desktop installed and running.
    *   A valid `OPENWEATHER_API_KEY` from [OpenWeatherMap](https://openweathermap.org/appid).

2.  **Clone the repository:**
    ```bash
    git clone https://github.com/1ushar/VoyagerAI.git
    cd VoyagerAI
    ```

3.  **Create your `.env` file:**
    *   In the project's root directory, create a file named `.env`.
    *   Add your API key to it like this:
        ```
        OPENWEATHER_API_KEY=your_secret_api_key_here
        ```

4.  **Run with Docker:**
    *   Build the image:
        ```bash
        docker build -t voyager-ai .
        ```
    *   Run the container:
        ```bash
        docker run -it -p 8080:8080 --env-file .env voyager-ai
        ```

5.  **View the Frontend:**
    *   Once the container is running, open the `frontend/index.html` file in your browser. The chatbot will be ready to use.
