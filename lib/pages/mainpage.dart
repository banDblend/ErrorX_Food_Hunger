import 'package:flutter/material.dart';
import 'package:food_bank/pages/profilepage.dart';
import 'aboutuspage.dart';
import 'find_page.dart';
import 'form.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FOOD HUNGER'),
        backgroundColor: Colors.orangeAccent,
        actions: <Widget>[
          PopupMenuButton<String>(
            onSelected: (value) {
              if (value == 'aboutus') {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => aboutus()),
                );
              } else if (value == 'profile') {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => profilepage()),
                );
              } else if (value == 'logout') {
                _showLogoutDialog(context);
              }
            },
            itemBuilder: (BuildContext context) {
              return {'About Us', 'Profile', 'Log Out'}.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice.toLowerCase().replaceAll(' ', ''),
                  child: Text(choice),
                );
              }).toList();
            },
          ),
          IconButton(
            icon: CircleAvatar(
              backgroundImage: AssetImage('assets/foodbank.jpg'),
            ),
            padding: const EdgeInsets.fromLTRB(0, 0, 15, 8),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => profilepage()),
              );
            },
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                'assets/bck.png.avif'), // Add your background image here
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              width: 350, // Set a width for the box
              padding: const EdgeInsets.all(20), // Add padding inside the box
              decoration: BoxDecoration(
                color: Colors.amber.withOpacity(
                    0.8), // Background color with some transparency
                borderRadius: BorderRadius.circular(15), // Rounded corners
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26, // Shadow color
                    blurRadius: 10, // Shadow blur radius
                    offset: Offset(0, 4), // Shadow offset
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Welcome to the App!",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 20),
                  _buildCard(
                    context,
                    title: "Donation",
                    icon: Icons.favorite,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const MyForm()),
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                  _buildCard(
                    context,
                    title: "Finding",
                    icon: Icons.search,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const FindPage()),
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCard(BuildContext context,
      {required String title,
      required IconData icon,
      required VoidCallback onPressed}) {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(15),
        onTap: onPressed,
        child: Container(
          padding: const EdgeInsets.all(20),
          width: 300,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 30, color: Colors.orangeAccent),
              const SizedBox(width: 10),
              Text(
                title,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.orangeAccent,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Log Out"),
          content: const Text("Are you sure you want to log out?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close dialog

                Navigator.of(context).pop(); // Close dialog
              },
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close dialog
                // Navigate to the login page
                Navigator.pushReplacementNamed(context, '/loginpage');
              },
              child: const Text("Log Out"),
            ),
          ],
        );
      },
    );
  }
}
