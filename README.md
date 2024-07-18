<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->

This package provides an `Auth` widget that seamlessly integrates with Firebase Authentication to manage user login state. It allows developers to specify custom UI for both logged in and not logged in states, making it easy to navigate users to appropriate pages or screens.

## Features

1) Seamless integration with Firebase Authentication.
2) Customizable UI based on authentication state.
3) Handles navigation to appropriate screens based on user login status.

## Getting started

flutter pub add flutter_auth_helper

## Usage

To use this package, include the `Auth` widget in your app and provide builders for logged in and not logged in states.

```dart
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_helper/firebase_auth_helper.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Auth(
        loggedInBuilder: (context) => HomePage(), // Widget for logged in state
        notLoggedInBuilder: (context) => LoginPage(), // Widget for not logged in state
      ),
    );
  }
}
```