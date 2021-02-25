
[![codecov](https://codecov.io/gh/gaetschwartz/swift_travel/branch/master/graph/badge.svg?token=BS53B3CBIN)](https://codecov.io/gh/gaetschwartz/swift_travel)

<img src="docs/assets/pictures/header-bg-custom-128.0.png"> 

This is an open-source public transport app packed with cool features 😎

## Try it out

| Tables        | Are           |
| ------------- |:-------------:|
| 🍎 iOS           | [Get on Testflight](https://testflight.apple.com/join/iWSWTkMj) |
| 🤖 Android       | [Download the latest APK](https://github.com/gaetschwartz/swift_travel/releases/latest)      |
| 🌐 Web (BETA) | [Try the Web version](https://travel.gaetanschwartz.com)      |


## Features 

### 🛣 A beautiful route search and view.

### 📃 A simple but powerfull timetable.

### 🤖 AI-powered smart suggestions.

### ♾ Open-source, add your own country to the app!

### [ 📷 See screenshots here](#screenshots)

# Contributing 

## Guidelines

If you want to contribute, fork the repository and create a pull-request with your new feature, and make sure to:
 - Describe it well
 - Include **necessary tests**
 - Follow the coding style


## I want to contribute but I don't know how

Here is a non-exhaustive list of things that could be improved with their respective subject.

### 📱 UI
* Improve widgets, opr application design. To navigate through the app files, the folder structure is similar to the app navigation structure.
  - Example:
    * The widget that displays different routes in the route tab: `lib/tabs/routes/route_tile.dart`
    * The `pages` folder is for individual pages or pages not directly related to one of the 3 main tabs.


### 🏳 Foreign language knowledge
* Add a new locale:
  * Read [ADDING-NEW-LOCALE.md](docs/ADDING-NEW-LOCALE.md)
 
### 🌍 Familiar with REST APIs ?
* Add your contry's public transport API:
  * Read [ADDING-NEW-API.md](docs/ADDING-NEW-API.md)
### 👨🏼‍💻 General good programming knowledge
* Improve the live-routing, mainly in the [`live-route` sub-package](dependencies/live_route/lib/live_route.dart).
### 🤖 Android 
* Implement the skeleton of a homescreen widget on Android.

### 👨🏼‍🔬 Machine learning
* Proposed or implement a new prediction model to predict new routes bassed on the history. See [here](lib/utils/predict/predict.dart).

# Contact me

If you have any question, contact me on Twitter [@gaetschwartz](https://twitter.com/gaetschwartz) 😊


# Screenshots

 <img src="docs/assets/pictures/itinerary_search.png" width="200px" alt="Itinerary search"> <img src="docs/assets/pictures/itinerary.png" width="200px" alt="Itinerary">

<img src="docs/assets/pictures/timetable.png" width="200px" alt="Timetable"> <img src="docs/assets/pictures/timetable_view.png" width="200px" alt="Itinerary view"> 

<img src="docs/assets/pictures/sugg1.png" width="200px" alt="Suggestion"> <img src="docs/assets/pictures/sugg_search.png" width="200px" alt="Suggestion in search bar"> 

