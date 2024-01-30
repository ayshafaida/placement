import 'package:final_project/main.dart';
import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  String radioButtonItem = 'ONE';
  String department = 'BA.English';
  int id = 1;
  List<String> dept = ['BA.English', 'BA.Sociology', 'BSc.Computer Science','BSc.Chemistry','BSc.Psychology','B.Com(Finance)','B.com(CA)','BBA'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Registration Page')),
        backgroundColor: Colors.purple[200],
      ),
      //for the form to be in center
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: ListView(
            shrinkWrap: true,
            children: [
              const Text('Name'),
              const SizedBox(
                height: 5,
              ),
              TextField(
                // controller: nameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter Name',
                ),
              ),
              //some space between name and email
              const SizedBox(
                height: 10,
              ),
              const Text('Mobile'),
              const SizedBox(
                height: 5,
              ),
              TextField(
                // controller: mobileController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter Mobile',
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text('Address'),
              const SizedBox(
                height: 5,
              ),
              TextField(
                // controller: addressController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter Address',
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text('Gender'),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Radio(
                    value: 1,
                    groupValue: id,
                    onChanged: (val) {
                      setState(() {
                        radioButtonItem = 'Male';
                        id = 1;
                      });
                    },
                  ),
                  Text(
                    'Male',
                    style: new TextStyle(fontSize: 17.0),
                  ),
                  Radio(
                    value: 2,
                    groupValue: id,
                    onChanged: (val) {
                      setState(() {
                        radioButtonItem = 'Female';
                        id = 2;
                      });
                    },
                  ),
                  Text(
                    'Female',
                    style: new TextStyle(
                      fontSize: 17.0,
                    ),
                  ),
                  Radio(
                    value: 3,
                    groupValue: id,
                    onChanged: (val) {
                      setState(() {
                        radioButtonItem = 'Others';
                        id = 3;
                      });
                    },
                  ),
                  Text(
                    'Others',
                    style: new TextStyle(fontSize: 17.0),
                  ),
                ],
              ),
              const Text('Department'),
              const SizedBox(
                height: 5,
              ),
              DropdownButton(
                  items: dept.map((String value) {
                    return DropdownMenuItem<String>(
                      child: new Text(value),
                      value: value,
                    );
                  }).toList(),
                  hint: const Text('Select Dept'),
                  onChanged: (newValue) {
                    setState(() {
                      department = newValue!;
                    });
                  }),
              const Text('Email'),
              const SizedBox(
                height: 5,
              ),
              TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter Email',
                ),
              ),
              //some space between email and mobile
              const SizedBox(
                height: 10,
              ),
              const Text('Register No.'),
              const SizedBox(
                height: 5,
              ),
              TextField(
                // controller: nameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter your register no.',
                ),
              ),
              //some space between name and email
              const SizedBox(
                height: 10,
              ),
              const Text('Password'),
              const SizedBox(
                height: 5,
              ),
              TextField(
                // controller: addressController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Create your password',
                ),
              ),
              SizedBox(
                height: 10,
              ),
              //create button for register
              ElevatedButton(
                onPressed: () {},
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (_) => Login()));
                  },
                  child: Text(
                    'Register',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
