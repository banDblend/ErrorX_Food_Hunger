import 'package:flutter/material.dart';
import 'package:food_bank/pages/mainpage.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FindPage extends StatelessWidget {
  const FindPage({super.key});

  void _launchWhatsApp(String phoneNumber) async {
    final url = Uri.parse("https://wa.me/$phoneNumber");
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
        backgroundColor: Colors.orangeAccent,
        actions: <Widget>[
          IconButton(
            icon: const CircleAvatar(
              backgroundImage: AssetImage('assets/foodbank.jpg'),
            ),
            padding: const EdgeInsets.fromLTRB(0, 0, 15, 8),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const MainPage()),
              );
            },
          )
        ],
      ),
      backgroundColor: Colors.white,
      body: StreamBuilder<QuerySnapshot>(
        // Change the collection to 'products'
        stream: FirebaseFirestore.instance.collection('products').snapshots(),
        builder: (context, snapshot) {
          // Show loading indicator while waiting for data
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          // Handle any errors that may occur
          if (snapshot.hasError) {
            return const Center(child: Text('Error fetching products'));
          }

          // Retrieve the list of products
          final products = snapshot.data!.docs;

          // Build a list view to display the products
          return ListView.builder(
            itemCount: products.length,
            itemBuilder: (ctx, index) {
              final product = products[index].data() as Map<String, dynamic>;
              return Card(
                margin: const EdgeInsets.all(8),
                color: Colors.amber,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Product Name: ${product['productName']}",
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 4),
                      Text("Description: ${product['productDescription']}"),
                      Text("Quantity: ${product['quantity']}"),
                      const SizedBox(height: 10),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                        ),
                        onPressed: () {
                          _showProductDetails(
                              context,
                              product[
                                  'name'], // Assuming 'name' is a field in the products collection
                              product[
                                  'phoneNumber']); // Assuming 'phoneNumber' is also a field
                        },
                        child: const Text(
                          "More Details",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  void _showProductDetails(
      BuildContext context, String productName, String phoneNumber) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text("Product Details"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Name: $productName"),
            const SizedBox(height: 10),
            Text("Contact: $phoneNumber"),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                _launchWhatsApp(phoneNumber);
              },
              child: const Text("Contact via WhatsApp"),
            ),
          ],
        ),
      ),
    );
  }
}
