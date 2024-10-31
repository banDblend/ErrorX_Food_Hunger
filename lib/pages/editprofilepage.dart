import 'package:flutter/material.dart';

class editprofile extends StatelessWidget {
  const editprofile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
        backgroundColor: Colors.orangeAccent,
        actions: <Widget>[
          IconButton(
            icon: CircleAvatar(
              backgroundImage: AssetImage('assets/foodbank.jpg'),
            ),
            padding: const EdgeInsets.fromLTRB(0, 0, 15, 8),
            onPressed: () {
              //Add action here
            },
          )
        ],
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
        child: Container(
          padding: const EdgeInsets.fromLTRB(50, 5, 50, 5),
          child: Column(

            children: [
              Stack(
                children: [
                  SizedBox(
                      width: 120,
                      height: 120,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.asset(
                          'assets/self.JPG',
                          fit: BoxFit.cover,
                        ),
                      )
                  ),

                  Positioned(  //position icon camera
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(100),color: Colors.orangeAccent ),
                      child: const Icon(
                        Icons.add_a_photo,
                        color: Colors.black,
                        size: 20,
                      ) ,
                    ),
                  )
                ],
              ),
              const SizedBox(height: 50,),

              Form(
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(label: Text('Full Name'), prefixIcon: Icon(Icons.account_circle_rounded),
                            border: OutlineInputBorder()),
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        decoration: const InputDecoration(label: Text('Age'), prefixIcon: Icon(Icons.accessibility),
                            border: OutlineInputBorder()),
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        decoration: const InputDecoration(label: Text('Phone No'), prefixIcon: Icon(Icons.phone),
                            border: OutlineInputBorder()),
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        decoration: const InputDecoration(label: Text('Address'), prefixIcon: Icon(Icons.place_outlined),
                            border: OutlineInputBorder()),
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        decoration: const InputDecoration(label: Text('E-Mail'), prefixIcon: Icon(Icons.email),
                            border: OutlineInputBorder()),
                      )
                    ],
                  )
              )
            ],
          ),
        ),
      ),
    );
  }
}
