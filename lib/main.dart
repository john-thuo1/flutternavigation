import 'package:flutter/material.dart';
import 'package:flutter_navigation/second_screen.dart';
import 'package:flutter_navigation/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Navigation',
      theme: ThemeData(
        primaryColor: Colors.red,
        primarySwatch: Colors.blue,
      ),
      home: const Splash(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}



class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
 
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
  
        child: ElevatedButton( 
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const SecondScreen()));
          },
          child: const Text("Go to Next Page"),
        
        ),
      ),
    );
  }
}
