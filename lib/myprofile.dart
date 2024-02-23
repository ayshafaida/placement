import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:final_project/commonurl.dart';
import 'package:final_project/editprofile.dart';
import 'package:final_project/homepage.dart';
import 'package:final_project/model/profilemodel.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class myprofile extends StatefulWidget {
  const myprofile({super.key});

  @override
  State<myprofile> createState() => _myprofileState();
}

class _myprofileState extends State<myprofile> {
  Future<ProfileModel> fetchProfile(username) async {
    final response = await http.post(
        Uri.parse('${CommonUrl().mainurl}getprofile.jsp'),
        body: {"username": username});

    if (response.statusCode == 200) {
      log("statusCode:===${response.statusCode}");
      log("statusbody:===${response.body}");

      return ProfileModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load album');
    }
  }

  Future<ProfileModel>? futureProfile;
  late String username;

  late SharedPreferences sharedPreferences;

  @override
  void initState() {
    super.initState();
    initial();
  }

  void initial() async {
    sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      username = sharedPreferences.getString('username')!;
      log('username:::::::$username');
      futureProfile = fetchProfile(username);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple[200],
          centerTitle: true,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              // color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => Homepage()));
            },
          ),
          title: Text('My Profile'),
        ),
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            child: FutureBuilder<ProfileModel>(
                future: futureProfile,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("assets/images/img.jpg"),
                                  fit: BoxFit.cover)),
                          child: Container(
                            width: double.infinity,
                            height: 200,
                            child: Container(
                                alignment: Alignment(0.0, 2.5),
                                child: snapshot.data!.profileImage == "null"
                                    ? CircleAvatar(
                                        //   backgroundColor: Colors.white,
                                        // radius: 12.0,
                                        // child: Icon(
                                        //   Icons.camera_alt,
                                        //   size: 15.0,
                                        //   color: Color(0xFF404040),
                                        // ),

                                        backgroundImage:
                                            AssetImage("assets/images/img.jpg"),

                                        radius: 60.0,
                                      )
                                    : CircleAvatar(
                                        //   backgroundColor: Colors.white,
                                        // radius: 12.0,
                                        // child: Icon(
                                        //   Icons.camera_alt,
                                        //   size: 15.0,
                                        //   color: Color(0xFF404040),
                                        // ),

                                        backgroundImage: NetworkImage(
                                            CommonUrl().imageurl +
                                                snapshot.data!.profileImage),

                                        radius: 60.0,
                                      )),
                          ),
                        ),
                        SizedBox(
                          height: 60,
                        ),
                        Text(
                          snapshot.data!.name,
                          style: TextStyle(
                              fontSize: 25.0,
                              color: Colors.purple[200],
                              letterSpacing: 2.0,
                              fontWeight: FontWeight.w400),
                        ),
                        SizedBox(height: 20),
                        Container(
                          color: Colors.purple[100],
                          width: MediaQuery.of(context).size.width / 2,
                          child: Center(
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: 12,
                              ),
                              child: Text(
                                snapshot.data!.mobile,
                                style: TextStyle(
                                    letterSpacing: 2.0,
                                    fontWeight: FontWeight.w300),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 15),
                        Container(
                          color: Colors.purple[100],
                          width: MediaQuery.of(context).size.width / 2,
                          child: Center(
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: 12,
                              ),
                              child: Text(
                                snapshot.data!.address,
                                style: TextStyle(
                                    letterSpacing: 2.0,
                                    fontWeight: FontWeight.w300),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 15),
                        Container(
                          color: Colors.purple[100],
                          width: MediaQuery.of(context).size.width / 2,
                          child: Center(
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: 12,
                              ),
                              child: Text(
                                snapshot.data!.gender,
                                style: TextStyle(
                                    letterSpacing: 2.0,
                                    fontWeight: FontWeight.w300),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 15),
                        Container(
                          color: Colors.purple[100],
                          width: MediaQuery.of(context).size.width / 2,
                          child: Center(
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: 12,
                              ),
                              child: Text(
                                snapshot.data!.department,
                                style: TextStyle(
                                    letterSpacing: 2.0,
                                    fontWeight: FontWeight.w300),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 15),
                        Container(
                          color: Colors.purple[100],
                          width: MediaQuery.of(context).size.width / 2,
                          child: Center(
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: 12,
                              ),
                              child: Text(
                                snapshot.data!.email,
                                style: TextStyle(
                                    letterSpacing: 2.0,
                                    fontWeight: FontWeight.w300),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 15),
                        SizedBox(height: 30),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => EditProfile(
                                          name: snapshot.data!.name,
                                          mobile: snapshot.data!.mobile,
                                          address: snapshot.data!.address,
                                          gender: snapshot.data!.gender,
                                          department: snapshot.data!.department,
                                          email:snapshot.data!.email,
                                        )));
                            // Navigate to update page or show a dialog for updating information
                            // For simplicity, let's print a message for now
                            print('Update button pressed');
                          },
                          child: Text('Edit Profile'),
                        ),
                      ],
                    );
                  }
                  return Center(child: CircularProgressIndicator());
                }),
          ),
          //  )
        ));
  }
}
