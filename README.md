# Flutter Shopping App with Firebase

A simple Flutter shopping application built as a mini project to practice the main Flutter concepts covered during the training, now extended with Firebase Authentication and Cloud Firestore integration.

## Features

* Sign Up form with input validation
* Email/Password authentication with Firebase
* Arabic and English localization
* Page navigation with a fade animation
* Responsive UI using `MediaQuery`
* Product images displayed using `PageView`
* Products displayed using `GridView`
* Hot Offers displayed using `ListView.builder`
* Add to Cart action with a SnackBar
* **Firebase Cloud Firestore integration**
* **User data form (Name, Age, Favourite Hobby)**
* **Save and display user records from Firestore**

## Technologies

* Flutter
* Dart
* Flutter Localizations
* Google Fonts
* Firebase Authentication
* Cloud Firestore
* flutter_bloc (State Management)
* Git & GitHub

## Firebase Implementation

### Firebase Initialization

Firebase is initialized in `main.dart` using platform-specific configuration:

```dart
await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
```

### Firebase Authentication

The app uses Firebase Authentication for Email/Password sign-in and sign-up. Authentication is managed through the existing AuthCubit with states for loading, success, and failure.

### Cloud Firestore

The app uses Cloud Firestore to store user data with the following structure:

**Collection:** `users`

**Fields:**
- `name` (String) - User's name
- `age` (String) - User's age
- `favouriteHobby` (String) - User's favourite hobby

### Firestore Features

1. **Save User Data:** Users can save their information (name, age, favourite hobby) to Firestore via the FirestoreCubit
2. **View Records:** Users can view all saved records from Firestore in a polished list view
3. **State Management:** Uses flutter_bloc with FirestoreCubit to manage loading, success, and failure states
4. **Error Handling:** Proper error messages displayed via SnackBar for both save and fetch operations

## Project Structure

```text
lib/
├── core/
│   └── constants/
├── features/
│   ├── auth/
│   │   ├── manager/
│   │   │   └── cubit/
│   │   │       ├── auth/
│   │   │       └── firestore/
│   │   └── widgets/
│   ├── firestore/
│   │   ├── firestore_screen.dart
│   │   └── display_records_screen.dart
│   ├── home/
│   └── shopping/
└── l10n/
```

## Localization

The application supports:

* English
* Arabic

All user-facing text is handled through Flutter localization and ARB files.

## Getting Started

Clone the repository and run:

```bash
flutter pub get
flutter run
```

Make sure Flutter is installed and configured on your machine.

## Screenshots

Screenshots of the different project phases are included with the project submission.

## Project Requirements

This project was developed as part of a Flutter training assignment covering:

* Stateless and Stateful Widgets
* User Input and Form Validation
* Navigation and Animations
* Responsive UI
* Localization
* Basic Flutter project structure
* **Firebase Authentication**
* **Cloud Firestore Integration**
* **State Management with flutter_bloc**

## Firebase Setup

This project uses Firebase for authentication and data storage. To run this project:

1. Create a Firebase project at https://console.firebase.google.com/
2. Add an Android/iOS/Web app to your Firebase project
3. Download the configuration files and place them in the appropriate directories:
   - Android: `android/app/google-services.json`
   - iOS: `ios/Runner/GoogleService-Info.plist`
4. Enable Email/Password Authentication in Firebase Console
5. Create a Firestore database in Firebase Console
6. Run `flutter pub get` to install dependencies
7. Run `flutter run`

## Repository

https://github.com/fatima304/first_flutter_project