import 'dart:convert';
import 'dart:developer';
import 'package:final_project/commonurl.dart';
import 'package:final_project/login.dart';
import 'package:http/http.dart' as http;
import 'package:final_project/main.dart';
import 'package:final_project/model/departmentmodel.dart';
import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDiptmnt();
  }

  String radioButtonItem = 'ONE';
  String department = 'BA.English';
  int id = 1;
  //List<String> dept = ['BA.English', 'BA.Sociology', 'BSc.Computer Science','BSc.Chemistry','BSc.Psychology','B.Com(Finance)','B.com(CA)','BBA'];
  bool isLoading = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController registerNoController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  late dynamic deprtmnt_dropdownValue = null;
  late int deprtmentId;
  late dynamic dropdownValue = null;
  List<DepartmentModel> dipatmntlist = [];

  bool loading=false;

  @override
  void dispose() {
    nameController.dispose();
    mobileController.dispose();
    addressController.dispose();
    emailController.dispose();
    registerNoController.dispose();
    // ignore: avoid_print
    print('Dispose used');
    super.dispose();
  }

  signup(name, mobile, address, gender, department_id, email, register_no,
      password, type) async {
    log("insaid the signup");
    setState(() {
      isLoading = true;
    });
    Map data = {
      'name': name,
      'mobile': mobile,
      'address': address,
      "gender": gender,
      "department_id": department_id,
      'email': email,
      'register_no': register_no,
      'password': password,
      'type': type
    };
    print("data=============" + data.toString());
    final response = await http.post(
      Uri.parse('${CommonUrl().mainurl}register.jsp'),
      body: data,
    );
    print(response.statusCode);
    if (response.statusCode == 200) {

      setState(() {
        loading=false;
      });
      Map<String, dynamic> resposne = jsonDecode(response.body);
      log(response.body);
      if ("success" == resposne['msg']) {
        Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
          return Login();
        }));
        print("Registration Successfully Completed !");
      } else {
        print("Registration failed.........");
      }
    } else {
      print("Please try again!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
    }
  }

  getDiptmnt() async {
    log("=================");
    dipatmntlist = await fetchDepartments();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registration Page'),
        backgroundColor: Colors.purple[200],
        centerTitle: true,
      ),
      //for the form to be in center
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: ListView(
              shrinkWrap: true,
              children: [
                const Text('Name'),
                const SizedBox(
                  height: 5,
                ),
                TextFormField(
                    controller: nameController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter Name',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter your Name ';
                      }
                    }),
                //some space between name and email
                const SizedBox(
                  height: 10,
                ),
                const Text('Mobile'),
                const SizedBox(
                  height: 5,
                ),
                TextFormField(
                  controller: mobileController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter Mobile',
                  ),
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "please enter phone ";
                    } else if (value.length > 10 || value.length < 10) {
                      return "Please enter valid phone number ";
                    }
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text('Address'),
                const SizedBox(
                  height: 5,
                ),
                TextFormField(
                  controller: addressController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter Address',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter your address';
                    }
                  },
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
                SizedBox(
                  height: 10,
                ),
                const Text('Department'),
                const SizedBox(
                  height: 5,
                ),
                dipatmntlist.isEmpty
                    ? const Center(child: CircularProgressIndicator())
                    : Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                                color: Colors.grey.withOpacity(0.7))),
                        child: DropdownButton<DepartmentModel>(
                          hint: const Text('Select Dept'),
                          value: dropdownValue,
                          icon: const Icon(Icons.arrow_drop_down),
                          iconSize: 24,
                          elevation: 16,
                          underline: SizedBox(),
                          style: const TextStyle(
                              color: Colors.black, fontSize: 18),
                          onChanged: (DepartmentModel? data) {
                            setState(() {
                              dropdownValue = data!;
                              deprtmentId = int.parse(data.id);
                            });
                          },
                          items: dipatmntlist
                              .map<DropdownMenuItem<DepartmentModel>>(
                                  (DepartmentModel value) {
                            return DropdownMenuItem<DepartmentModel>(
                              value: value,
                              child: Text(value.department),
                            );
                          }).toList(),
                        ),
                      ),
                const SizedBox(
                  height: 20,
                ),
                const Text('Email'),
                const SizedBox(
                  height: 5,
                ),
                TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter Email',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter your email';
                    } else if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                      return "Please enter a valid email address";
                    }
                  },
                ),
                //some space between email and mobile
                const SizedBox(
                  height: 10,
                ),
                const Text('Register No.'),
                const SizedBox(
                  height: 5,
                ),
                TextFormField(
                  controller: registerNoController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter your register no.',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Must enter your register no.';
                    }
                  },
                ),
                //some space between name and email
                const SizedBox(
                  height: 10,
                ),
                const Text('Password'),
                const SizedBox(
                  height: 5,
                ),
                TextFormField(
                  controller: passwordController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Create your password',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Must enter your password.';
                    }
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                //create button for register
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple[200],
                      padding: const EdgeInsets.all(10)),
                  onPressed: () {
                    log("name==" + nameController.text);
                    log("mobile==" + mobileController.text);
                    log("address==" + addressController.text);
                    log("gender==" + radioButtonItem);
                    log("department==" + deprtmentId.toString());
                    log("email==" + emailController.text);
                    log("registerno==" + registerNoController.text);

                    if (_formKey.currentState!.validate()) {

                          setState(() {
        loading=true;
      });
                      signup(
                          nameController.text,
                          mobileController.text,
                          addressController.text,
                          radioButtonItem,
                          deprtmentId.toString(),
                          emailController.text,
                          registerNoController.text,
                          passwordController.text,
                          "2");
                    }
                  },
                  // child: InkWell(
                  //   onTap: () {
                  //     Navigator.push(
                  //         context, MaterialPageRoute(builder: (_) => Login()));
                  //   },
                  child:
                  loading==true?CircularProgressIndicator():
                  
                   Text(
                    'Register',
                    style: TextStyle(fontSize: 25, color: Colors.white),
                  ),
                  // ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  //================create department api function===============

  Future<List<DepartmentModel>> fetchDepartments() async {
    try {
      log("inside the department functionmessage");
      final response =
          await http.get(Uri.parse(CommonUrl().mainurl + 'getDepartment.jsp'));

      if (response.statusCode == 200) {
        log("Department==== : ${response.body}");
        List res = jsonDecode(response.body);
        return res.map((e) => DepartmentModel.fromJson(e)).toList();
      }
    } catch (e) {
      log(" District message  :$e");
    }
    return dipatmntlist;
  }
}
