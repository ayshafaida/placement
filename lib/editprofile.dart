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
            Icons.arrow_back_ios,
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
              Stack(
                children: [
                  SizedBox(
                    width: 500,
                    height: 170,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(100), 
                        child: const Image(image: AssetImage("images/profile.jpg"))
                         ),
                  ),
                  Positioned(
                    bottom: 15,
                    right: 180,
                    child: Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(100)),
                      child: const Icon(Icons.camera_alt,
                        color: Colors.grey,
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),
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
            ],
          ),
        ),
      ),
    );
  }
  }