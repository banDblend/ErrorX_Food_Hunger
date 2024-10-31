import 'package:flutter/material.dart';

class Details extends StatelessWidget {
  const Details({
    Key? key,
    required this.productName,
    required this.productDescription,
    required this.quantity,
  }) : super(key: key);

  final String productName;
  final String productDescription;
  final String quantity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Details"),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(4.0),
        child: ListView(
          children: [
            ListTile(
              shape: RoundedRectangleBorder(
                side: BorderSide(width: 1.0, color: Colors.grey.shade300),
              ),
              leading: IconButton(
                icon: const Icon(Icons.bookmark_added_rounded,
                    color: Colors.blueAccent),
                onPressed: () {},
              ),
              title: Text(
                "Product: $productName",
                style: const TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 18.0),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Description: $productDescription",
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                  Text("Quantity: $quantity",
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
              trailing: const Icon(Icons.delete, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
