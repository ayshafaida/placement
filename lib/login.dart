import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'dart:developer';
import 'package:final_project/commonurl.dart';

import 'package:http/http.dart' as http;
import 'package:final_project/homepage.dart';
import 'package:final_project/signup.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  void initState() {
    super.initState();
    _checkSession();
  }

  void _checkSession() async {
    final prefs = await SharedPreferences.getInstance();
    bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
    log("isloggedin = $isLoggedIn");
    if (isLoggedIn == true) {
      Navigator.push(context, MaterialPageRoute(builder: (_) => Homepage()));
    }
  }

  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController registerNoController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  login(String username, String password) async {
    print('webservice');
    print(username);
    print(password);
    var result;
    final Map<String, dynamic> loginData = {
      'username': username,
      'password': password,
    };

    final response = await http.post(
      Uri.parse("http://192.168.29.89:8080/CollegePlacementCell/login.jsp"),
      body: loginData,
    );

    print(response.statusCode);
    if (response.statusCode == 200) {
      if (response.body.contains("success")) {
        log("login successfully completed");
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setBool("isLoggedIn", true);
        prefs.setString("username", username);
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return Homepage();
          },
        ));
      } else {
        log("login failed");
      }
    } else {
      result = {log(json.decode(response.body)['error'].toString())};
    }
    return result;
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Login Page"),
        backgroundColor: Colors.purple[200],
      ),
      body: Center(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              // Padding(
              //   padding: const EdgeInsets.only(top: 60.0),
              //   child: Center(
              //     child: Container(
              //         width: 200,
              //         height: 150,
              //         /*decoration: BoxDecoration(
              //             color: Colors.red,
              //             borderRadius: BorderRadius.circular(50.0)),*/
              //         child: Image.asset('asset/images/flutter-logo.png')),
              //   ),
              // ),
              Padding(
                //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: TextFormField(
                  controller: registerNoController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Username',
                      hintText: 'Enter your Register no'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter your Register No.';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 15.0, right: 15.0, top: 15, bottom: 0),
                //padding: EdgeInsets.symmetric(horizontal: 15),
                child: TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                      hintText: 'Enter your secure password'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter your password';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(
                height: 30,
              ),
              InkWell(
                onTap: () {
                  //TODO FORGOT PASSWORD SCREEN GOES HERE
                },
                child: Text(
                  'Forgot Password',
                  style: TextStyle(color: Colors.purple[200], fontSize: 15),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 50,
                width: 250,
                decoration: BoxDecoration(
                    color: Colors.purple[200],
                    borderRadius: BorderRadius.circular(20)),
                child: InkWell(
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      log("==========================");
                      login(registerNoController.text, passwordController.text);
                    }

                    // {
                    //  Navigator.push(
                    //      context, MaterialPageRoute(builder: (_) => Homepage()));
                    // }
                  },
                  child: Center(
                    child: Text(
                      'Login',
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 130,
              ),
              InkWell(
                child: Text('New User? Create Account'),
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => Signup()));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
