# healthify

## SetUp
Before you get started

Register and get apiKeys for the following:
Google Cloud For Maps (Place yours in secret.dart file)
Yummly API from Rapid API for Recipe List
spoonacular api for Meal Planner
EmailJS setup to send email to inbox.
Set up your Firbase Database
- In the firebase Storage, upload the Assets folder of tthe file

## Pubspec yaml Used
- Do read the flutter pub documentation if Android or IOS setup is required
font_awesome_flutter:
  google_sign_in:
  animated_splash_screen:
  provider:
  google_fonts:
  firebase_core:
  firebase_auth:
  cloud_firestore:
  firebase_storage:
  fluttertoast:
  shared_preferences:
  video_player:
  fl_chart: ^0.36.4
  charts_flutter:
  http:
  image_picker:
  google_maps_flutter:
  cached_network_image:
  google_maps_webservice:
  flutter_polyline_points: ^1.0.0
  geolocator: ^7.0.3
  geocoding: ^2.0.0
  firebase_messaging:
  flutter_local_notifications:
  rxdart:
  url_launcher:
  flutter_settings_screens: ^0.2.2+1
  cupertino_icons: ^1.0.2
  animated_theme_switcher: ^2.0.1
  webview_flutter: ^2.0.13

## Folder Stucture
assets
    icons
    images
    workouts
lib
    data --> data for the project
    models --> Class Models for the project
    services --> Firebase Auth, Location, Storage Service Classes
    views --> Pages of the project
    widgets -->  Widgets used in pages of the project
main.dart --> Brain of the project
constants.dart --> Classes of colours that's used throughout the project
secrets.dart --> Contains the Google API Key
postman --> Contains a Postman Script of all the APIs used in the project

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

