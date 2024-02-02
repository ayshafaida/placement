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
                      // SizedBox(height:5,),
                      //  Text(
                      //   "Zoople IT Company Software & Networking",
                      //   style: TextStyle(
                      //     color: Colors.black,
                      //     fontSize: 17,
                      //     fontWeight: FontWeight.bold
                      //   ),
                      //   ),
                      //   SizedBox(height: 13,
                      //   ),
                      //    Text(
                      //   "Salary:20000",
                      //   style: TextStyle(
                      //     color: Colors.black,
                      //     fontSize: 15,
                      //     fontWeight: FontWeight.bold
                      //   ),
                      //   ),
                      //   SizedBox(height: 20,
                      //   ),
                      //   Align(
                      //     alignment:Alignment.centerRight ,
                      //      ),
                      //    Text(
                      //   "Job Description",
                      //   style: TextStyle(
                      //     color: Colors.grey[800],
                      //     fontSize: 15,
                      //     fontWeight: FontWeight.bold
                      //   ),
                      //   ),


            ],
          ),
        ),
      ) );
  }
}