import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(

    appBar: AppBar(
      title: Text("Settings",),
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 20,
      ),
      centerTitle: false,
      backgroundColor: Colors.pink,
      
    ),

  );
  
}