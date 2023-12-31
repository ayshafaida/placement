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
      // body: SafeArea(child: Column(children: [
      //   Center(child: CircleAvatar(radius: 50,)),
      //   Text(
      //     'Name',
      //     style: TextStyle(fontSize: 40),
      //   )
      // ],)
      // )
      backgroundColor: Colors.blueGrey,
      body: SafeArea(
          child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/download.jpeg"), fit: BoxFit.cover)),
            child: Container(
              width: double.infinity,
              height: 200,
              child: Container(
                alignment: Alignment(0.0, 2.5),
                child: CircleAvatar(
                //   backgroundColor: Colors.white,
                // radius: 12.0,
                // child: Icon(
                //   Icons.camera_alt,
                //   size: 15.0,
                //   color: Color(0xFF404040),
                // ),
                  backgroundImage: AssetImage("images/images.png"),

                  radius: 60.0,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 60,
          ),
          Text(
            "Thahsin",
            style: TextStyle(
                fontSize: 25.0,
                color: Colors.white,
                letterSpacing: 2.0,
                fontWeight: FontWeight.w400),
          ),
         SizedBox(height: 20),
          Container(
            color:Colors.white,
            width: MediaQuery.of(context).size.width/2,
            child: Center(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 12,),
                child: 
                Text(
                  "bfavscs456",
                  style: TextStyle(
                      letterSpacing: 2.0, fontWeight: FontWeight.w300),
                ),
              ),
            ),
          ),
           SizedBox(height: 15),
          Container(
            color: Colors.white,
            width: MediaQuery.of(context).size.width/2,
            child: Center(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 12,),
                child: 
                Text(
                  "BSC CS",
                  style: TextStyle(
                      letterSpacing: 2.0, fontWeight: FontWeight.w300),
                ),
              ),
            ),
          ),
           SizedBox(height: 15),
          Container(
            color: Colors.white,
            width: MediaQuery.of(context).size.width/2,
            child: Center(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 12,),
                child: 
                Text(
                  "6th sem",
                  style: TextStyle(
                      letterSpacing: 2.0, fontWeight: FontWeight.w300),
                ),
              ),
            ),
          ), 
          SizedBox(height: 15), 
          Container(
            color: Colors.white,
            width: MediaQuery.of(context).size.width/2,
            child: Center(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 12,),
                child: 
                Text(
                  "Gender",
                  style: TextStyle(
                      letterSpacing: 2.0, fontWeight: FontWeight.w300),
                ),
              ),
            ),
          ),
          SizedBox(height: 15),
          Container(
            color: Colors.white,
            width: MediaQuery.of(context).size.width/2,
            child: Center(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 12,),
                child: 
                Text(
                  "Tirur",
                  style: TextStyle(
                      letterSpacing: 2.0, fontWeight: FontWeight.w300),
                ),
              ),
            ),
          ),
          SizedBox(height: 15),
          Container(
            color: Colors.white,
            width: MediaQuery.of(context).size.width/2,
            child: Center(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 12,),
                child: 
                Text(
                  "1234567845",
                  style: TextStyle(
                      letterSpacing: 2.0, fontWeight: FontWeight.w300),
                ),
              ),
            ),
          ),
  
          SizedBox(height: 30),
          InkWell(
            onTap: () {
              // Navigator.push(
              //     context, MaterialPageRoute(builder: (_) => Editprofile()));
              // Navigate to update page or show a dialog for updating information
              // For simplicity, let's print a message for now
              print('Update button pressed');
            },
            child: Text('Update Profile'),
         ),
        ],
      )
          //],
          ),
      //  )
    );
  }
}
