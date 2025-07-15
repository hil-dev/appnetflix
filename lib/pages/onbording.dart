import 'package:flutter/material.dart';

class Onbording extends StatelessWidget{
  final String title;
  final String subtitle;
  final String image;
  const Onbording({
    super.key,
    required this.title,
    required this.subtitle,
    required this.image
  });
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
            child: Image.asset(
             image,

             fit: BoxFit.cover,
            )
        ),
        Positioned.fill(
            child: Container(
              color: Colors.black.withOpacity(0.8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    textAlign: TextAlign.center,
                    title,
                    style: TextStyle(
                      fontSize: 37,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                    ),
                  ),
                  SizedBox(height: 10,),
                  Text(
                    textAlign: TextAlign.center,
                    subtitle,
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white
                    ),
                  )
                ],
              ),
            )
        ),

      ],
    );
  }
}