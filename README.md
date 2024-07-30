[![Hits](https://hits.seeyoufarm.com/api/count/incr/badge.svg?url=https%3A%2F%2Fgithub.com%2FSupriyaKuncha%2Fculturize&count_bg=%23FE5667&title_bg=%23FE5667&icon=github.svg&icon_color=%23FFFFFF&title=Repository+Visits&edge_flat=false)](https://hits.seeyoufarm.com)

  <h1 align="center"> Movie Listing App </h1>
<p align="center">A <b>Movie Listing App</b> made using Flutter and API</p>

<p align="center">A simple Movie Listing app with user authentication, and a screen to fetch movie data using API and show them.</p>

## 📝 Project Info
The contents in this project follow the following structure, where all views are containerised into screens.

```
weatherapp/
├── android/
├── ios/
├── lib/
│   ├── models/
│   │   └── movie.dart
│   │   └── user.dart
│   ├── providers/
│   │   └── movies_provider.dart
│   │   └── users_provider.dart
│   ├── screens/
│   │   ├── home_screen.dart
│   │   └── login_screen.dart
│   │   └── signup_screen.dart
│   ├── services/
│   │   └── auth_service.dart
│   ├── widgets/
│   │   └── custom_button.dart
│   │   └── custom_text_field.dart
│   ├── main.dart
│   └── movies.json
├── pubspec.yaml
├── README.md
└── screenshots/
    ├── home_screen.png
    ├── login_screen.png
    └── singup_screen.png
```

## ⚙️ Setup

  #### Tech Stack
  <ul>
  <li><img src="https://img.icons8.com/color/48/null/flutter.png" width="20" height="20">  Flutter</li>
  </ul>

  #### Pre requisites
  <ul>
  <li><img src="https://img.icons8.com/color/48/null/flutter.png" width="20" height="20">  Flutter SDK installed in your system</li>
  <li>Visual Studio Code, Android Studio and Xcode(if using mac) installed</li>
  <li>Android or IOS emulators installed and running</li>
  </ul>

  ##### Clone the repository
```bash
git clone https://github.com/HarshaVoleti/MovieListing.git
```
  ##### Move to the desired folder
```bash
cd \MovieListing
```

  ##### To run the app, simply write
```bash
flutter pub get
flutter run
```

## ℹ️ About

<p> A simple movielisting app built with Flutter and movie API that displays movie information. </p>

### Here is the quick tour on how to use our app
After installing our app.

#### <h3><ins>Authentication Screen.</ins></h3>
Here in this screen, you can create new account with unique username, emailId and password. and if you already have an account, you can login through the login screen.

<div display="flex" align="center" border-left="2px solid white">
<img src="https://github.com/HarshaVoleti/MovieListing/blob/main/screenshots/login_screen.png" width="200" height="400" >
<img src="https://github.com/HarshaVoleti/MovieListing/blob/main/screenshots/signup_screen.png" width="200" height="400" >
</div>

#### <h3><ins>Home Screen.</ins></h3>
 User have to enter user name, password and  hit Login button. if doesn't have account create on in the singup screen.

<div display="flex" align="center" border-left="2px solid white">
<img src="https://github.com/HarshaVoleti/MovieListing/blob/main/screenshots/home_screen.png" width="200" height="400" >
</div>



## 🛠️ Built With
Flutter - The UI toolkit used to build the app.
Provider - State management solution.
Movie API - movie data provider.
## 💬 Contact
Harsha Voleti - mailharshavoleti@gmail.com
