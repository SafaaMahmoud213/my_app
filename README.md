# My Testing App For APIs

This App is a cross platform application built in [flutter](https://flutter.dev/) .

## Getting Started

Follow these instructions to build and run the project

### Setup Flutter

A detailed guide for multiple platforms setup could be find [here](https://flutter.dev/docs/get-started/install/)

### Setup Project

- Clone this repository using `git clone https://github.com/SafaaMahmoud213/my_app.git`.
- `cd` into `my_app`.
- `flutter pub get` to get all the dependencies.

### Running the app

Make sure you have a connected Android/iOS device/simulator and run the following command to build and run the app in debug mode.

`flutter run`

## Project Structure

```bash
my_app/lib/
├── bloc/                           # Main Statemangement files                          
|   └── bloc_observer.dart          # Observe bloc states i.e Loading, Success, Error
|   └── app_cubit/                  # App Machine Management
├── core/                           # App Core files
|   └── app/                        # App State Machine
|   |   └── app_body.dart 
|   |   └── app_data.dart
|   |   └── app_repository.dart 
|   |   └── app_storage.dart 
|   └── constant/                   # App Constants
|   |   └── colors
|   |   └── style
|       ...
|   └── error/                      # Exceptions Models
|   |   └── exceptions.dart
|   └── utils/                      # App Helpers
|   |   └── app_navigator.dart
|   └── widgets/                    # App Custom Widgets
├── features/                       # App Features
|   └── feature/
|   |   └── data/
|   |   |   └── datasource/
|   |   |   └── model/
|   |   |   └── repositories/              
|   |   └── presentation/
|   |   |   └── cubit/
|   |   |   └── pages/
|   |   |   └── widgets/                               
|   ...
├── injection_container.dart        # dependency injection using get_it
└── main.dart                       # <3 of the app
```
