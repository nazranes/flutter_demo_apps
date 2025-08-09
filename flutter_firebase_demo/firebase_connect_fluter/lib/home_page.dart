import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text('Firestore CRUD İşlemleri'),
      ),
      body: Center(
        child: Container(
          child: Text('Home Page',
          style: TextStyle(fontSize: 24),),
        ),
      ),
    );
  }
}