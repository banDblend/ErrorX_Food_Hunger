import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:food_bank/models/profile_model.dart';
import 'package:food_bank/repository/profile_repository.dart';
import 'package:food_bank/pages/mainpage.dart'; // Ensure MainPage is imported

class profilepage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<profilepage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController fullnameController = TextEditingController();
  final TextEditingController phoneNoController = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  ProfileMode1? _profile;

  @override
  void initState() {
    super.initState();
    _fetchProfile();
  }

  Future<void> _fetchProfile() async {
    User? user = _auth.currentUser ;

    if (user != null) {
      // Fetch the profile from the repository
      DocumentSnapshot profileSnapshot =
      await ProfileRepository.instance.getProfile(user.uid);
      setState(() {
        _profile = ProfileMode1(
          id: profileSnapshot.id,
          username: profileSnapshot['username'],
          fullname: profileSnapshot['fullname'],
          phoneNo: profileSnapshot['phoneNo'],
        );

        // Set the text controllers with the fetched data
        usernameController.text = _profile!.username;
        fullnameController.text = _profile!.fullname;
        phoneNoController.text = _profile!.phoneNo;
      });
    }
  }

  Future<void> _updateProfile() async {
    if (_profile != null) {
      ProfileMode1 updatedProfile = ProfileMode1(
        id: _profile!.id,
        username: usernameController.text.trim(),
        fullname: fullnameController.text.trim(),
        phoneNo: phoneNoController.text.trim(),
      );

      print('Attempting to update profile...');
      try {
        // Call the repository method to update the profile
        await ProfileRepository.instance.createProfile(updatedProfile);
        print('Profile update attempt complete.');

        // Navigate to MainPage
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => MainPage()),
              (Route<dynamic> route) => false, // Remove all previous routes
        );
      } catch (e) {
        print('Error updating profile: $e');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to update profile: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Page'),
        backgroundColor: Colors.orangeAccent,
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/bck3.jpg'), // Ensure this path is correct
                fit: BoxFit.cover,
              ),
            ),
          ),
          _profile == null
              ? Center(child: CircularProgressIndicator())
              : Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  TextField(
                    controller: usernameController,
                    decoration: InputDecoration(
                      hintText: "Username",
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    controller: fullnameController,
                    decoration: InputDecoration(
                      hintText: "Full Name",
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    controller: phoneNoController,
                    decoration: InputDecoration(
                      hintText: "Phone Number (+60)",
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    keyboardType: TextInputType.phone,
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.orangeAccent,
                    ),
                    child: Text('Update Profile'),
                    onPressed: () {
                      _updateProfile(); // Call the update method
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}