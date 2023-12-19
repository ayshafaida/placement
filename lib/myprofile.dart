import 'package:flutter/material.dart';

class myprofile extends StatelessWidget {
  const myprofile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.green,
          title: Center(
            child: const Text('My Profile'),
          ),
      ),
      body: SafeArea(child: Column(children: [
        Center(child: CircleAvatar(radius: 50,)),
        Text(
          'Name',
          style: TextStyle(fontSize: 40),
        )
      ],)
      )
      );
  }
}