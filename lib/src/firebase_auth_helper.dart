import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Auth extends StatelessWidget {
  final Widget Function(BuildContext) loggedInBuilder;
  final Widget Function(BuildContext) notLoggedInBuilder;

  const Auth({
    required this.loggedInBuilder,
    required this.notLoggedInBuilder,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.black,
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
