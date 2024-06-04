# EdRaak 

## Table of Contents

1. [Overview](#overview)
   - [Sensory-Friendly Design](#sensory-friendly-design)
2. [Features](#features)
3. [Initial Setup](#initial-setup)
4. [Games](#games)
5. [Languages](#languages)
6. [Technologies Used](#technologies-used)
7. [Acknowledgments](#acknowledgments)
   - [UI](#ui)
   - [Code](#code)
      - [Confetti Animation](#confetti-animation)
      - [Custom Fonts (Google-fonts)](#custom-fonts-tajawal)
      - [Background Music and Sounds](#background-music-and-sounds)
      - [Navigation](#navigation)
      - [Warnings and Dialogs](#warnings-and-dialogs)
8. [Database Integration](#database-integration)
9. [Settings Screen](#settings-screen)
10. [Choose Game Screen](#choose-game-screen)
11. [User Feedback](#user-feedback)
12. [Credits](#credits)

## Overview

Welcome to EdRaak! This project is an educational game library designed to be suitable for all children but specifically targets children with autism. Our goal is to provide a variety of interactive games and puzzles that help improve physical, social, cognitive, and emotional skills in a fun and engaging way.

### Sensory-Friendly Design

In designing EdRaak, we took into account the sensory needs of children with autism. Based on research and studies, we chose a horizontal format and selected colors such as green, blue, brown, and pink to support their preferences. All of these considerations are detailed in our documentation to ensure an optimal and supportive user experience.

## Features

- **Customized Games:** We’ve created a variety of games and puzzles tailored to the unique needs of children with autism. 
- **Multi-dimensional Learning:** Our activities aim to enhance physical, social, cognitive, and emotional abilities.
- **Fun and Encouraging:** We strive to create a joyful and supportive learning environment.
- **Seamless Navigation:** Enjoy easy and intuitive transitions between screens.
- **Engaging Audio:** Background music and sound effects make the experience more immersive.
- **Database Integration:** Secure login and sign-up screens with 2FA verification, Google account sign-in, and forgot password reset functionality to manage user access.
- **Settings Screen:** Customize colors and sounds to your liking and logging out of your account.
- **Game Catalog:** Browse and select different games easily from our choose game screen.

## Initial Setup

Getting started with EdRaak is simple. Just follow these steps: 

1. **Clone the repository:**

   ```bash
   git clone https://github.com/SillyRobot883/EdRaak.git
   ```

2. **Install dependencies:**

   ```bash
   cd EdRaak
   npm install
   ```

3. **Run the application:**

   ```bash
   npm start
   ```

## Games

1. **Counting Game:** Help children learn and practice counting in a fun way.
2. **Quiz Game:** An interactive quiz game to test and improve knowledge across various subjects.

## Languages

EdRaak currently supports Arabic only, ensuring a tailored experience for Arabic-speaking users.

## Technologies Used

We chose Flutter, which uses the Dart programming language, for developing EdRaak. Flutter’s cross-platform capabilities allow us to support various devices our audience uses, providing a consistent and high-quality experience.

## Acknowledgments

### UI

- Our UI assets are provided by [Din Mobile Game UI](https://www.figma.com/community/file/1180593133226454532/din-mobile-game-ui?searchSessionId=ls5c3toa-o3wh097cv2)

### Code

- **Confetti Animation:**
  - We use the [Confetti](https://pub.dev/packages/confetti) package for fun visual effects.
- **Custom Fonts (Google fonts):**
  - The Tajawal, lalezar, Amiri, and many more fonts. From the [Google Fonts](https://pub.dev/packages/google_fonts) package.
- **Background Music and Sounds:**
  - Audio is powered by the [just_audio](https://pub.dev/packages/just_audio) package.
- **Navigation:**
  - Seamless navigation is managed with the [get](https://pub.dev/packages/get) package.
- **Warnings and Dialogs:**
  - Animations for warnings and dialogs are provided by the [awesome_dialog](https://pub.dev/packages/awesome_dialog) package.

## Database Integration

We’ve integrated Firebase to provide secure and reliable user authentication. This includes login and sign-up screens with 2FA verification, Google account sign-in, and forgot password reset functionality to manage user access and data securely.

## Settings Screen

Our settings screen allows users to personalize their experience by changing the color scheme and adjusting sound settings. It also includes an option to log out of your account, creating a more comfortable and flexible user experience.

## Choose Game Screen

The choose game screen acts as a catalog for all available games. Users can easily browse and select the games they want to play, making navigation straightforward.

## User Feedback

We’d love to hear your feedback! If you have any suggestions, encounter any issues, or just want to share your thoughts, please open an issue on our [GitHub repository](https://github.com/SillyRobot883/EdRaak/issues) or contact us directly.

## Credits

This application was developed as part of the software engineering courses CS290 and CS392 at Imam Mohammed Ibn Saud Islamic University (ImamU).

Developed by:
- Abdulaziz Alsheikh
- Nawaf Alajlan
- Osamah Shubaytah
- Abdulaziz Alkathiri
- Zaid Alkhathlan
- Omar Alamoudi
