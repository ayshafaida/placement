import 'dart:convert';
import 'dart:developer';

import 'package:final_project/commonurl.dart';
import 'package:final_project/login.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    passwordVisible = true;
    confirmpwdVisible =true;
  }
  bool passwordVisible = false;
  bool confirmpwdVisible = false;
  bool loading = false;

  final _formKey = GlobalKey<FormState>();

  TextEditingController registerNoController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmpwdController = TextEditingController();

  forgetpassword(String regNo, String password) async {
    print('webservice');
    print(regNo);
    print(password);
    var result;
    final Map<String, dynamic> loginData = {
      'register_no': regNo,
      'password': password,
    };

    final response = await http.post(
      Uri.parse("${CommonUrl().mainurl}forgotpassword.jsp"),
      body: loginData,
    );

    print(response.statusCode);
    if (response.statusCode == 200) {
      // setState(() {
      //   loading = true;
      // });
      if (response.body.contains("success")) {
        log("Password successfully changed");

        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return Login();
          },
        ));
      } else {
        log("Password changing failed");
      }
    } else {
      result = {log(json.decode(response.body)['error'].toString())};
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Password"),
          backgroundColor: Colors.purple[200],
          centerTitle: true,
        ),
        body: Center(
            child: Form(
          key: _formKey,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: TextFormField(
                    controller: registerNoController,
                    decoration: const InputDecoration(
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
                  //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                  // padding: EdgeInsets.symmetric(horizontal: 15),
                  child: TextFormField(
                    controller: passwordController,
                    obscureText: passwordVisible,
                    decoration:  InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'New Password',
                        hintText: 'Create new password',
                         suffixIcon: IconButton(
                      icon: Icon(passwordVisible
                          ? Icons.visibility
                          : Icons.visibility_off),
                      onPressed: () {
                        setState(
                          () {
                            passwordVisible = !passwordVisible;
                          },
                        );
                      },
                    ),
                    alignLabelWithHint: false,
                        ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter password';
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
                    controller: confirmpwdController,
                    obscureText: confirmpwdVisible,
                    decoration:  InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Confirm Password',
                        hintText: 'Enter your password again',
                         suffixIcon: IconButton(
                      icon: Icon(confirmpwdVisible
                          ? Icons.visibility
                          : Icons.visibility_off),
                      onPressed: () {
                        setState(
                          () {
                            confirmpwdVisible = !confirmpwdVisible;
                          },
                        );
                      },
                    ),
                    alignLabelWithHint: false,
                        ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter your password again';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      if (passwordController.text ==
                          confirmpwdController.text) {
                        forgetpassword(
                            registerNoController.text, passwordController.text);
                      } else
                        setState(() {
                          loading = true;
                        });
                      log("==========================");
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple[200],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                  child: const Text("Save",
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                ),
              ]),
        )));
  }
}
