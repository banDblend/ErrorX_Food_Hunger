import 'package:flutter/material.dart';
import 'package:food_bank/pages/splash_screen.dart';
import 'package:food_bank/pages/mainpage.dart'; // Import the MainPage
import 'package:food_bank/pages/loginpage.dart'; // Import the LoginPage
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
      routes: {
        '/mainpage': (context) => MainPage(), // Route for MainPage
        '/loginpage': (context) => loginPage(), // Route for LoginPage
        '/profilepage': (context) => MainPage(), // Route for ProfilePage
      },
    );
  }
}
