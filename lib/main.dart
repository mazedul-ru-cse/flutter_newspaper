import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_newspaper/screen/bookmarks.dart';
import 'package:flutter_newspaper/screen/dashboard.dart';
import 'package:flutter_newspaper/screen/login_screen.dart';
import 'package:flutter_newspaper/screen/registration_screen.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: 'login',
        routes: {
          'login': (context) => const LoginScreen(),
          'register': (context) => const RegistrationScreen(),
          'dashboard': (context) => const Dashboard(),
          'bookmarks': (context) => const Bookmarks(),

        }),
  );
}