import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_navigation/main.dart';


class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  // To delay the screen, you have to use the initState() method.
  // Add delay in the Timer and use pushReplacement to switch to the home page.
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5),() =>Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>(const MyHomePage(title: 'Flutter Navigation')))));
    
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Image(image: AssetImage('assets/images/ALU_Logo.png')),),
    );
  }
}
