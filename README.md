# endpoint_teams_ui

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

1. ## Project's Title - Endpoint Teams UI
2. ## Project Description
    This Project is the Prototype code for Teams like UI. It uses Flutter Material Widgets and Components with Cubit for the
state Maintenance. It user external Packages for the API, SVG Picture Asset, Shimmers,Bloc. The UI of Navigation bar controls
the navigation with its respective screens. The Contacts screen shows the details of contact list and Invite list.
It supports both iOS and Android, clone the appropriate branches mentioned below:

   * For Mobile: https://github.com/Kali1299/endpoint_teams_ui.git (stable channel)
3. ## How to Use

*Step 1:*

Download or clone this repo by using the link below:


https://github.com/Kali1299/endpoint_teams_ui.git


*Step 2:*

Go to project root and execute the following command in console to get the required dependencies:


flutter pub get


*Step 3:*

This project uses `inject` library that works with code generation, execute the following command to generate files:


flutter packages pub run build_runner build --delete-conflicting-outputs


or watch command in order to keep the source code synced automatically:


flutter packages pub run build_runner watch

4. ## Hide Generated Files

In-order to hide generated files, navigate to `Android Studio` -> `Preferences` -> `Editor` -> `File Types` and paste the below lines under `ignore files and folders` section:


*.inject.summary;*.inject.dart;*.g.dart;


In Visual Studio Code, navigate to `Preferences` -> `Settings` and search for `Files:Exclude`. Add the following patterns:

**/*.inject.summary
**/*.inject.dart

5. ## endpoint_teams_ui Features:

* Contact List - List of User details with name, role, status and other details.
* Invite List - List of New invited user Details
* Both dark and Light mode Support
* Invite Screen to get User details

6. ### Libraries & Tools Used

* flutter_bloc
* shimmer
* flutter_svg
* http

7. ### Folder Structure
Here is the core folder structure which flutter provides.


flutter-app/
|- android
|- build
|- ios
|- lib
|- linux
|- macos
|- web
|- windows
|- assets
|- test


Here is the folder structure we have been using in this project


lib/
|- bloc/
|- widgets/
|- helper/
|- model/
|- screens/
|- main.dart

## helper

This Manages all the supporting files 

|- app_color.dart
|- font_style.dart
|- nav_helper.dart
|- nav_observer.dart
api_helper/
|- api_constants.dart
|- api_helper.dart


### bloc_helper

This directory contains Cubit which maintains app State.

bloc/
|- invite_bloc/
|- invite_bloc/invite_cubit.dart
|- invite_bloc/charter_cubit.dart


### model

This is the Model class for handling all the Api Request and Response


model/
|- invite_list.dart
|- login_response.dart
|- send_invite.dart

### screens

This shows the Details and Handles all the Available screens in the app

screens/
|- chat.dart
|- contacts.dart
|- dash_board.dart
|- details_screen.dart
|- home_screen.dart
|- invite_screen.dart
|- loans.dart
|- teams.dart

### Widget

This folder is used for our own customized widgets

widgets/
|- text_field_widget.dart

## Conclusion

This is the Basic Information about this project. You can pull the code from the url and test how it will works.

    
