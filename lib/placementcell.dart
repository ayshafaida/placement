import 'package:final_project/homepage.dart';
import 'package:flutter/material.dart';

class Placement_cell extends StatelessWidget {
  const Placement_cell({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.purple[200],
          leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
          ),
          onPressed: () {
            Navigator.push(
                         context, MaterialPageRoute(builder: (_) => Homepage()));
          },
        ),
          title: Text('Placement Cell'),
      ),
       body: Center(
        /** Card Widget **/
        child: Card(
          elevation: 50,
          shadowColor: Colors.green,
          color: Colors.greenAccent[100],
          child: SizedBox(
            width: 300,
            height: 250,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Contact',
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.green[900],
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ), 
                  Text('Name'),
                  const SizedBox(
                    height: 10,
                  ),
                  Text('9999999999'),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: 100,
                  ) 
                ],
              ),
            ), 
          ), 
        ), 
      ), 
    );
  }
}