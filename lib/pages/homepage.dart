import 'package:flutter/material.dart';
import 'package:food_bank/pages/signuppage.dart';

import 'loginpage.dart';

class homepage extends StatelessWidget {
  const homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon(),
            SignUpButon(context),
            LoginButton(context),
          ],
        ),
      ),
      backgroundColor: Colors.orangeAccent,
    );
  }

  Container icon() {
    return Container(
      width: 150,
      height: 150,
      child: CircleAvatar(
        backgroundImage: AssetImage('assets/foodbank.jpg'),
      ),
    );
  }

  Container LoginButton(BuildContext context) {
    return Container(
      child: ElevatedButton(
        child: Text('Login Page'),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const loginPage()),
          );
        },
      ),
    );
  }

  Container SignUpButon(BuildContext context) {
    return Container(
      child: ElevatedButton(
        child: Text('Signup Page'),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => signuppage()),
          );
        },
      ),
    );
  }
}
