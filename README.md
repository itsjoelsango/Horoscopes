# Horoscopes

Welcome to the Horoscopes Apps! This project is using SwiftUI for the frontend, an external API for fetching horoscope data, and local data persistence with FileManager. Below is a guide to help you set up and understand the project.

![Discover Horoscope (5120 x 2868 px)](https://github.com/user-attachments/assets/ca466cfb-3233-4413-8a76-cbe214544d85)

## Table of Contents

- [Project Overview](#project-overview)
- [Technologies Used](#technologies-used)
- [Getting Started](#getting-started)
- [Features](#features)
- [Testing](#testing)
- [License](#license)

## Project Overview

This project is a simple iOS application that fetches and displays horoscope data for users. The app utilizes SwiftUI for a modern user interface and integrates with an external API to retrieve horoscope information. User data is stored locally on the device using FileManager.

## Technologies Used

- **Frontend:**
  - **SwiftUI**: A modern UI framework for building native iOS apps.
  - **Xcode IDE**: The integrated development environment for building iOS apps.

- **Backend:**
  - **External API**: Fetches horoscope data from [Viewbits](https://viewbits.com/).

- **Data Persistence:**
  - **FileManager**: For storing and retrieving user data locally on the device.

- **Testing:**
  - **Swift Testing**: A powerful framework for testing packages and Xcode projects.

- **Other Tools:**
  - **Git**: For version control.

## Getting Started

To get started with the project, follow these steps:

1. **Clone the Repository:**
   ```bash
   git clone https://github.com/itsjoelsango/Horoscopes.git
   cd Horoscopes
2. **Open the Project in Xcode:**

To open the project in Xcode, follow these steps:

1. ***Locate the Project File:***
   - Navigate to the directory where you cloned the repository.

2. ***Open the Project:***
   - Find the file with the `.xcodeproj` extension. This file is typically named after your project.
   - Double-click the `.xcodeproj` file to open it in Xcode.

3. ***Select the Appropriate Scheme:***
   - Once Xcode is open, ensure that the correct scheme is selected in the toolbar. This is usually the name of your project.

4. ***Set the Target Device:***
   - Choose a simulator or a physical device from the device selection dropdown in the toolbar.

5. ***Build the Project:***
   - You can build the project by selecting "Product" > "Build" from the menu or by using the shortcut `Command + B`.

## Features

The application includes the following features:

- **Fetch Daily Horoscope Data:**
  - The app retrieves daily horoscope information from the external API, providing users with up-to-date content.

- **User-Friendly Interface:**
  - Built with SwiftUI, the app offers a modern and intuitive user interface that enhances the user experience.

- **Save Generated Horoscopes:**
  - Once accessed, Horoscopes are saved locally on user's device, allowing for easy access later.

- **Simple Navigation:**
  - The app provides a straightforward navigation experience, making it easy for users to explore different horoscope categories.

## Testing

To run tests for the project, follow these steps:

1. **Open the Project in Xcode:**
   - Ensure that the project is open in Xcode.

2. **Select the Test Target:**
   - In the project navigator, locate the test target, which is usually named after your project with "Tests" appended.

3. **Run the Tests:**
   - You can run the tests using the shortcut `Command + U` or by selecting "Product" > "Test" from the menu.

4. **View Test Results:**
   - After running the tests, Xcode will display the results in the Test Navigator. You can review which tests passed or failed and view detailed logs for any failures.

By following these steps, we can ensure that our application is functioning as expected and maintain code quality through testing.

