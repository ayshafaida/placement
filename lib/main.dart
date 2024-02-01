import 'package:final_project/homepage.dart';
import 'package:final_project/jobdetail.dart';
import 'package:final_project/signup.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
<<<<<<< Updated upstream
    //  home: Login(),
     home:Jobdetails(),
=======
      home: Login(),
      // home: (),
>>>>>>> Stashed changes
    );
  }
}
class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
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
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Username',
                      hintText: 'Enter your Register no'),
                      validator: (value) {
                        if(value==null || value.isEmpty) {
                          return 'Enter the user name';
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
          
                  obscureText: true,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                      hintText: 'Enter your secure password'),
                      validator: (value) {
                        if(value==null || value.isEmpty) {
                          return 'Enter your password';
                        }
                        return null;
                      },
                ),
              ),
              SizedBox(height: 30,),
              InkWell(
                onTap: (){
                  //TODO FORGOT PASSWORD SCREEN GOES HERE
                },
                child: Text(
                  'Forgot Password',
                  style: TextStyle(color: Colors.purple[200], fontSize: 15),
                ),
              ),
              SizedBox(height: 20,),
              Container(
                height: 50,
                width: 250,
                decoration: BoxDecoration(
                    color: Colors.purple[200], borderRadius: BorderRadius.circular(20)),
                child: InkWell(
                   onTap: () {
                    if(_formKey.currentState!.validate())
                    {
                     Navigator.push(
                         context, MaterialPageRoute(builder: (_) => Homepage()));
                    }
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
              InkWell(child: Text('New User? Create Account'),
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