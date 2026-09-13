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

## Screenshots
<img width="1080" height="2340" alt="Screenshot_1789254375" src="https://github.com/user-attachments/assets/5b07bf5b-6d5b-4862-8e6a-633f30f68aea" />
<img width="1080" height="2340" alt="Screenshot_1789254366" src="https://github.com/user-attachments/assets/46af5d51-9a2f-4518-9e59-fe44a9587c07" />
<img width="1080" height="2340" alt="Screenshot_1789253981" src="https://github.com/user-attachments/assets/fda34dc6-5877-461f-b8a5-3f5e7e2955e4" />
<img width="1080" height="2340" alt="Screenshot_1789253977" src="https://github.com/user-attachments/assets/15425713-1eb9-445b-ac8c-917a08154cf3" />
<img width="1080" height="2340" alt="Screenshot_1789253921" src="https://github.com/user-attachments/assets/c3c9aab4-106e-4045-b41b-53640c41182c" />
<img width="1080" height="2340" alt="Screenshot_1786663430" src="https://github.com/user-attachments/assets/87571ac2-3665-4b2f-aceb-3c2ad1219506" />
<img width="1080" height="2340" alt="Screenshot_1786663108" src="https://github.com/user-attachments/assets/d14fbaf4-9f5c-48ad-a5c7-d5b1a3f32d4c" />
<img width="1080" height="2340" alt="Screenshot_1786663096" src="https://github.com/user-attachments/assets/e1efcee5-8560-48c7-bf4c-445d592c7582" />
<img width="1080" height="2340" alt="Screenshot_1786642285" src="https://github.com/user-attachments/assets/e7c3d491-effb-4395-9ea3-62cde035db0d" />
<img width="1080" height="2340" alt="Screenshot_1786642252" src="https://github.com/user-attachments/assets/ebacfd16-3934-4580-abb1-425d5fa85346" />
<img width="1080" height="2340" alt="Screenshot_1786642215" src="https://github.com/user-attachments/assets/d5f9160f-f6fb-4128-8736-c3a16c9fa1ae" />
<img width="1080" height="2340" alt="Screenshot_1789254388" src="https://github.com/user-attachments/assets/a14c432c-efc0-42f6-a550-68e4a12a0dc9" />
