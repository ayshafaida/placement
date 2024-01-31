import 'package:final_project/homepage.dart';
import 'package:final_project/myprofile.dart';
import 'package:flutter/material.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {

  // bool showPassword = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[200],
        elevation: 1,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            // color: Colors.white,
          ),
          onPressed: () {
            Navigator.push(
                         context, MaterialPageRoute(builder: (_) => myprofile()));
          },
        ),
        title: Text("Edit Profile"),
        actions: [],
      ),
      body: Container(
        padding: EdgeInsets.only(left: 16, top: 25, right: 16),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
                // TextField('Full Name','Eg:-Aysha Faida',false),
                // TextField('Mobile No','Your Contact No',false),
                // TextField('Address','Your Address',false),
                // TextField('Email','Eg:-abc@gmail.com',false),
                // TextField('Password','Your Password',true),
                // SizedBox(height: 35,),
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                         context, MaterialPageRoute(builder: (_) => Homepage()));
                      },
                      child: Text("Cancel",style: TextStyle(color: Colors.black),),

                    ),
                  ],
                )
            ],
          ),
        ),
      ),
    );
  }

  // Widget BuildTextField(String labelText,String placeholder, bool isPasswordTextField  ) {
  //   return Padding(
  //     padding: const EdgeInsets.only(bottom :35.0),
  //     child: TextField(
  //       obscureText: isPasswordTextField ? showPassword : false,
  //                 decoration: InputDecoration(
  //                   suffixIcon: isPasswordTextField 
  //                   ? IconButton(
  //                     onPressed: () {
  //                       setState(() {
  //                         showPassword = !showPassword;
  //                       });
  //                     },
  //                     icon: Icon(
  //                       Icons.remove_red_eye,
  //                       color: Colors.grey,),
  //                       ) : null,
  //                   contentPadding: EdgeInsets.only(bottom: 3),
  //                 labelText: labelText,
  //                 floatingLabelBehavior: FloatingLabelBehavior.always,
  //                 hintText: placeholder,
  //                 hintStyle: TextStyle(
  //                   fontSize: 16, fontWeight: FontWeight.bold,
  //                   color: Colors.blueGrey,
  //                 )),
  //               ),
  //   );
  // }
}
