import 'package:flutter/material.dart';
import 'details.dart'; // Corrected import
import 'package:cloud_firestore/cloud_firestore.dart';

class MyForm extends StatefulWidget {
  const MyForm({Key? key}) : super(key: key);

  @override
  State<MyForm> createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _productController = TextEditingController();
  final _productDesController = TextEditingController();
  final _quantityController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _productController.dispose();
    _productDesController.dispose();
    _quantityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        title: const Text("Product Form"),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.orangeAccent, Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            const SizedBox(height: 20.0),
            MyTextField(
              myController: _nameController,
              fieldName: "Name",
              myIcon: Icons.person,
              prefixIconColor: Colors.orange,
            ),
            const SizedBox(height: 10.0),
            MyTextField(
              myController: _phoneController,
              fieldName: "Phone Number (+60...)",
              myIcon: Icons.phone,
              prefixIconColor: Colors.orange,
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: 10.0),
            MyTextField(
              myController: _productController,
              fieldName: "Product Name",
              myIcon: Icons.account_balance,
              prefixIconColor: Colors.orange,
            ),
            const SizedBox(height: 10.0),
            MyTextField(
              myController: _productDesController,
              fieldName: "Product Description",
              prefixIconColor: Colors.orange,
            ),
            const SizedBox(height: 10.0),
            MyTextField(
              myController: _quantityController,
              fieldName: "Quantity",
              myIcon: Icons.format_list_numbered,
              prefixIconColor: Colors.orange,
            ),
            const SizedBox(height: 20.0),
            myBtn(context),
          ],
        ),
      ),
    );
  }

  OutlinedButton myBtn(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        minimumSize: const Size(200, 50),
        backgroundColor: Colors.orange, // Button background color
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0), // Rounded corners
        ),
      ),
      onPressed: () async {
        await FirebaseFirestore.instance.collection('products').add({
          'name': _nameController.text,
          'phoneNumber': _phoneController.text,
          'productName': _productController.text,
          'productDescription': _productDesController.text,
          'quantity': _quantityController.text,
        });

        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return Details(
              productName: _productController.text,
              productDescription: _productDesController.text,
              quantity: _quantityController.text,
            );
          }),
        );
      },
      child: Text(
        "Submit Form".toUpperCase(),
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white, // Change text color to white
        ),
      ),
    );
  }
}

class MyTextField extends StatelessWidget {
  const MyTextField({
    Key? key,
    required this.fieldName,
    required this.myController,
    this.myIcon = Icons.verified_user_outlined,
    this.prefixIconColor = Colors.blueAccent,
    this.keyboardType,
  }) : super(key: key);

  final TextEditingController myController;
  final String fieldName;
  final IconData myIcon;
  final Color prefixIconColor;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: myController,
      decoration: InputDecoration(
        labelText: fieldName,
        prefixIcon: Icon(myIcon, color: prefixIconColor),
        border: OutlineInputBorder(

          borderRadius: BorderRadius.circular(30.0), // Rounded corners
        ),
        filled: true,
        fillColor: Colors.white,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.orange),
          borderRadius: BorderRadius.circular(30.0), // Rounded corners
        ),
        labelStyle: const TextStyle(color: Colors.orange),
      ),
    );
  }
}
