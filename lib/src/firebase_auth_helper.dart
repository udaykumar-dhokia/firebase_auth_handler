import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Auth extends StatelessWidget {
  final Widget Function(BuildContext) loggedInBuilder;
  final Widget Function(BuildContext) notLoggedInBuilder;
  final Color backgroundColor; 
  final Color loadingColor;

  const Auth({
    required this.loggedInBuilder,
    required this.notLoggedInBuilder,
    this.backgroundColor = Colors.white,
    this.loadingColor = Colors.black,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return  Center(
              child: CircularProgressIndicator(
                color: loadingColor,
              ),
            );
          } else {
            if (snapshot.hasData) {
              return loggedInBuilder(context);
            } else {
              return notLoggedInBuilder(context);
            }
          }
        },
      ),
    );
  }
}
