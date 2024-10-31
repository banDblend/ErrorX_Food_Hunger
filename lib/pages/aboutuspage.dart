import 'package:flutter/material.dart';
import '../widgets/ImageCarousel/image_carousel.dart';


class aboutus extends StatelessWidget {
  const aboutus({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Us'),
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
        child: Column(
            children:[
              ClipPath(
                clipper: CustomCurvedEdges() ,
                child: Container(
                  color: Colors.orange,
                  padding: const EdgeInsets.all(0),
                  child: SizedBox(
                    height: 400,
                    child: Stack(
                      children: [
                        Positioned(top: -150,right: -250 ,child: CircularContainer(backgroundColor: Colors.white..withOpacity(0.1))),
                        Positioned(top: 100,right: -300 ,child: CircularContainer(backgroundColor: Colors.white..withOpacity(0.1))),

                        Positioned(
                          top: 20,
                          left: 20,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Food Hunger',
                                style: TextStyle(
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  shadows: [
                                    Shadow(
                                      color: Colors.black.withOpacity(0.5),
                                      offset: Offset(3, 3),
                                      blurRadius: 10,
                                    ),
                                  ],
                                  letterSpacing: 2.0,
                                ),
                              ),
                              Text(
                                'Lend a hand, give a can',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black.withOpacity(0.9),
                                  fontStyle: FontStyle.italic,
                                  shadows: [
                                    Shadow(
                                      color: Colors.black.withOpacity(0.3),
                                      offset: Offset(2, 2),
                                      blurRadius: 8,
                                    ),
                                  ],
                                ),
                              ),

                              SizedBox(height: 10), // Spacer between texts
                              Container(
                                width: MediaQuery.of(context).size.width - 80, // Limits width within the screen
                                child: Text(
                                  'A food Hunger plays a crucial role in fighting hunger by providing nutritious food to people in need, '
                                      'ensuring that no one in the community goes hungry. By gathering and redistributing food, '
                                      'often from surplus or donations, food banks help reduce waste and create a sustainable solution to food insecurity.',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                      fontFamily: 'Roboto',
                                      fontWeight: FontWeight.w500
                                  ),
                                  maxLines: 8, // Limits lines if the text is very long
                                  overflow: TextOverflow.ellipsis, // Adds "..." if text is too long
                                ),
                              ),
                            ],
                          ),
                        ),

                      ],
                    ),
                  ),
                ),

              ),

              SizedBox(height: 20),
              ImageCarousel(),

            ]
        ),
      ),
    );
  }
}

class CircularContainer extends StatelessWidget {
  final Color backgroundColor;
  CircularContainer({required this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(
        color: backgroundColor,
        shape: BoxShape.circle,
      ),
    );
  }
}

class CustomCurvedEdges extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 100);
    path.quadraticBezierTo(size.width / 2, size.height, size.width, size.height - 100);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}


