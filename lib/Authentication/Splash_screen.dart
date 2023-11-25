import 'package:flutter/material.dart';
import 'package:quad_b/UI_Homey/Home_screen.dart';
class Splash_page extends StatelessWidget {
  const Splash_page({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Image.asset(
              "Assets/Spash_page.png",
              fit: BoxFit.fill,
            ),
          ),
        ),
        Container(
            height: 150,
            width: double.infinity,
            color: Colors.blue,
            child: Center(child:
                  TextButton(
                    onPressed: () {
                      Future.delayed(
                        Duration(seconds: 3),
                            () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => MainPage()), // Replace with your home screen
                          );
                        },
                      ); },
                    child: Text(
                      "Home ==>",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 25),
                    ),
                  ),
                    )
        )

      ],
    );
  }
}