import 'package:flutter/material.dart';
import './chat_model.dart';
import 'dart:async';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Message Chat'),
      ),
      body: ListView.builder(
        itemCount: ChatModel.dummyData.length,
        itemBuilder: (context, index) {
          ChatModel model = ChatModel.dummyData[index];
          return Column(
            children: <Widget>[
              const Divider(
                height: 12.0,
              ),
              ListTile(
                leading: CircleAvatar(
                  radius: 24.0,
                  backgroundImage: NetworkImage(model.avatarUrl),
                ),
                title: Row(
                  children: <Widget>[
                    Text(model.name),
                    const SizedBox(
                      width: 16.0,
                    ),
                    Text(
                      model.datetime,
                      style: const TextStyle(fontSize: 12.0),
                    ),
                  ],
                ),
                subtitle: Text(model.message),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  size: 14.0,
                ),
              ),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const SecondScreen()),
          );
        },
        child: const Icon(Icons.arrow_forward_ios),
      ),
    );
  }
}

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SecondScreen createState() => _SecondScreen();
}

class _SecondScreen extends State<SecondScreen> {
  DateTime currentDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: currentDate,
        firstDate: DateTime(2015),
        lastDate: DateTime(2050));
    if (pickedDate != null && pickedDate != currentDate) {
      setState(() {
        currentDate = pickedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pick a date"),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(currentDate.toString()),
            ElevatedButton(
              onPressed: () => _selectDate(context),
              child: const Text('Select date'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: const Icon(Icons.hearing_disabled_rounded),
      ),
    );
  }
}


