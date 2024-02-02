import 'dart:ui';

import 'package:flutter/material.dart';

class Jobdetails extends StatelessWidget {
  const Jobdetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         backgroundColor: Colors.purple[200],
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text("Company Name",
          // company!.companyName!,
        ),
      ),
      
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                     width: double.infinity,
                     height: 100,
                     child: Container(
                       alignment: Alignment(0.0, 2.5),
                       child: CircleAvatar(
                        backgroundImage: AssetImage("images/img.jpg"),
                        radius: 40.0,
                       ),
                       ) ),
                       SizedBox(height: 35,),
                       Text(
                        "Flutter Developer",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                        ),
                        ),
                        Column(
                          children: [
                            Divider(
                              height: 80,
                              color: Colors.grey[200],
                              thickness: 1,
                            )
                          ],
                        ),
                      SizedBox(height:5,),
                       Text(
                        "Zoople IT Company Software & Networking",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                          fontWeight: FontWeight.bold
                        ),
                        ),
                        SizedBox(height: 13,
                        ),
                         Text(
                        "Salary:20000",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold
                        ),
                        ),
                         SizedBox(height: 30,
                         ),
                        
                        Padding(
                          padding:  EdgeInsets.only(left: 20.0,right: 0.0,top: 0.0,bottom: 0.0),
                          child: Row( crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                              "Job Description",
                              style: TextStyle(
                                color: Colors.grey[900],
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline,
                                decorationColor: Colors.grey,
                                decorationThickness: 2, 
                                ),
                              ),
                          
                              
                              Padding(
                                padding:  EdgeInsets.all(20),
                                child: Text(
                                  "As a Flutter Developre,you will be in charge of reviewing the software specificat and UI mockups,developing a cross-browser mobile application",
                                  // maxLines: 10,
                                  // overflow: 
                                 // TextOverflow.ellipsis,
                                  style: TextStyle(fontSize: 10.0,fontWeight: FontWeight.w500),
                                  //specifications and UI mockups,developing a cross-browser mobile application'
                                 ),
                              )
                            ],
                          ),
                        )
                        
            ],
          ),
        ),
      ) );
  }
}