import 'package:final_project/myprofile.dart';
import 'package:flutter/material.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
   bool showPassword = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[200],
        elevation: 1,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
          ),
          onPressed: () {
            Navigator.push(
                         context, MaterialPageRoute(builder: (_) => myprofile()));
          },
        ),
        title: Text("Edit Profile"),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 16, top: 25, right: 16),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
                SizedBox(height: 35,),
                TextField(decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter Name',
                ),
                ),
                SizedBox(height: 20,),
                TextField(decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Mobile No.',
                ),
                ),
                SizedBox(height: 20,),
                TextField(decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Address',
                ),
                ),
                SizedBox(height: 20,),
                TextField(decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Email',
                ),
                ),
                SizedBox(height: 20,),
                FloatingActionButton.extended(
                  onPressed: () {},
                  icon: Icon(Icons.save),
                  label: Text("Save"),),
                Row(
                  // children: [
                  //   InkWell(
                  //     onTap: () {
                  //       Navigator.push(
                  //        context, MaterialPageRoute(builder: (_) => myprofile()));
                  //     },
                  //     child: Text("Save",style: TextStyle(color: Colors.purple[800]),),
                  //   ),
                  // ],
                )
            ],
          ),
        ),
      ),
    );
  }
  }