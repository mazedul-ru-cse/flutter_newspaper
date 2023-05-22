import 'package:flutter/material.dart';
import 'package:flutter_newspaper/login_screen.dart';
import 'package:flutter_newspaper/registration_screen.dart';

void main() {
  runApp(
    MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: 'login',
        routes: {
          'login': (context) => const LoginScreen(),
          'register': (context) => const RegistrationScreen(),
        }),
  );
}