import 'package:final_project/jobdetail.dart';
import 'package:flutter/material.dart';

class ApplyForm extends StatefulWidget {
  const ApplyForm({super.key});

  @override
  State<ApplyForm> createState() => _ApplyFormState();
}

class _ApplyFormState extends State<ApplyForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         elevation: 1,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
          ),
          onPressed: () {
            Navigator.push(
              context, MaterialPageRoute(builder: (_) => Jobdetails()));
          },
        ),
        title: Text("Application Form"),
      backgroundColor: Colors.purple[200],),
      body: 
      Center(
        child: 
        Container(
          padding: EdgeInsets.all(20),
          child: ListView(
            // shrinkWrap: true,
            children: [
              Text('Name'),
              SizedBox(height: 5,),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter Name',
                ),
              ),
              SizedBox(height: 10,),
              Text('Mobile No.'),
              SizedBox(height: 5,),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter your contact No.',
                ),
              ),
              SizedBox(height: 10,),
              Text('Email'),
              SizedBox(height: 5,),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter your email id',
                ),
              ),
              SizedBox(height: 30,),
              ElevatedButton(
                onPressed: () {},
                child: InkWell(
                  // onTap: () {
                  //   Navigator.push(
                  //       context, MaterialPageRoute(builder: (_) => Login()));
                  // },
                  child: Text(
                    'Apply',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
        ])
        ),
    )
    );
  }
}