
# Flutter Food and Drink Distribution App

## Overview
This project is a feature-rich Flutter app prototype built to manage a food and drink distribution workflow. The app includes user authentication, product listing, cart functionality, and a static
recommendations section.

## Features
- **Login and Signup**: User authentication using Firebase.
- **Home Page**: Displays products categorized as "Food" and "Drink".
- **Cart Page**: Allows users to place orders by adding selected items with specified quantities.
- **Recommendations**: A section that suggests products based on recent orders (currently displaying static data).

## Architecture
The project follows **Clean Architecture** to ensure modular, scalable, and maintainable code.

### Folder Structure
- **`core/`**: Contains shared resources such as constants, utilities, and common widgets.
- **`features/`**: Divided into subfolders for each main feature:
  - **`login/`**, **`signup/`**, **`home/`**
    - **`domain/`**: Contains repository interfaces.
    - **`data/`**: Includes models and repository implementations.
    - **`presentation/`**: Holds UI views and state management controllers.

## Technologies Used
- **Flutter**: For app development.
- **Firebase Authentication**: For user login and registration.
- *Bloc**: ( state management method used)
- **Clean Architecture**: Ensures a scalable and maintainable codebase.

   
## Future Integration Plan
For the "Recommended Products" section, I plan to integrate a machine learning model using Firebase ML or an external API to provide real-time personalized suggestions.

## Screenshots and Demo
Access the demo video and screenshots here: https://drive.google.com/drive/folders/1SwfNr3cpbtH4kR0rNi724szcsI_TUxuR?usp=sharing

## Deployment Steps
- Ensure all dependencies are installed.
- Connect the app to your Firebase project.
- Build the app using:
  flutter pub get 
  flutter build apk
  

