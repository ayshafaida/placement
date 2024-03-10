import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:final_project/homepage.dart';
import 'package:http/http.dart' as http;
import 'package:final_project/commonurl.dart';
import 'package:final_project/model/departmentmodel.dart';
import 'package:final_project/myprofile.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart' as ccc;

class EditProfile extends StatefulWidget {
  EditProfile(
      {super.key,
      required this.name,
      required this.mobile,
      required this.address,
      required this.gender,
      required this.department,
      required this.email,
      required this.depatrid});

  String? name, mobile, address, gender, department, email, depatrid;

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  bool showPassword = false;
  TextEditingController nameController = new TextEditingController();
  TextEditingController mobileController = new TextEditingController();
  TextEditingController addressController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  late ccc.SharedPreferences sharedPreferences;
  bool isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDiptmnt();

    setState(() {
      nameController.text = widget.name!;
      mobileController.text = widget.mobile!;
      addressController.text = widget.address!;
      emailController.text = widget.email!;
      radioButtonItem = widget.gender!;
      deprtmentId = int.parse(widget.depatrid!);
      log("deprtmentId===" + deprtmentId.toString());
    });
  }

  late dynamic deprtmnt_dropdownValue = null;
  late int deprtmentId;
  late dynamic dropdownValue = null;
  List<DepartmentModel> dipatmntlist = [];

  String radioButtonItem = "";
  String department = 'BA.English';
  int id = 1;

  File? imageURI;
  PickedFile? _imageFile;
  final ImagePicker _picker = ImagePicker();

  String uploadStatus = "";

  Future getImageFromGallery(ImageSource source) async {
    var image = await ImagePicker().pickImage(source: source);

    final imageTemporary = File(image!.path);
    setState(() {
      imageURI = imageTemporary;
    });
    Navigator.pop(context);
  }

  Future<Map<String, dynamic>> updateProfile(
      String username,
      String name,
      String mobile,
      String address,
      String gender,
      String department_id,
      String email,
      File imagefile) async {
    var res;
    var request = http.MultipartRequest(
        "POST", Uri.parse("${CommonUrl().mainurl}/updateProfile"));
    var pic = await http.MultipartFile.fromPath("profilePic", imagefile.path);
    request.files.add(pic);
    request.fields['username'] = username;
    request.fields['name'] = name;
    request.fields['mobile'] = mobile;
    request.fields['address'] = address;
    request.fields['gender'] = gender;
    request.fields['department'] = department_id;
    request.fields['email'] = email;

    var response = await request.send();
    var responseData = await response.stream.toBytes();
    var responseString = String.fromCharCodes(responseData);
    print("aks" + responseString.toString());
    Map<String, dynamic> result;
    print(response.statusCode);
    if (response.statusCode == 200) {
      setState(() {
        isLoading = false;
      });

      Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
        return Homepage();
      }));
    } else {
      log("Something went wrong");
    }
    return res;
  }

  getDiptmnt() async {
    log("=================");
    dipatmntlist = await fetchDepartments();
    setState(() {});
  }

  signup(String username, String name, String mobile, String address,
      String gender, String department_id, String email) async {
    log("insaid the signup");
    setState(() {
      isLoading = true;
    });
    Map data = {
      'username': username,
      'name': name,
      'mobile': mobile,
      'address': address,
      "gender": gender,
      "department": department_id,
      'email': email,
    };
    print("data=============" + data.toString());
    final response = await http.post(
      Uri.parse('${CommonUrl().mainurl}updateprofile.jsp'),
      body: data,
    );
    print(response.statusCode);
    if (response.statusCode == 200) {
      setState(() {
        isLoading = false;
      });

      Map<String, dynamic> resposne = jsonDecode(response.body);
      log(response.body);
      if ("success" == resposne['msg']) {
        Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
          return Homepage();
        }));
        print("Registration Successfully Completed !");
      } else {
        print("Registration failed.........");
      }
    } else {
      print("Please try again!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[200],
        centerTitle: true,
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
                  Center(
                    child: Container(
                      child: Stack(children: <Widget>[
                        imageURI == null
                            ? InkWell(
                                onTap: () {
                                  showModalBottomSheet(
                                    context: context,
                                    builder: ((builder) => bottomSheet()),
                                  );
                                },
                                child: CircleAvatar(
                                  radius: 64,
                                  backgroundImage: const NetworkImage(
                                      'https://i.stack.imgur.com/l60Hf.png'),
                                  backgroundColor: Colors.purple[200],
                                ),
                              )
                            : CircleAvatar(
                                radius: 64,
                                backgroundImage: FileImage(imageURI!),
                                backgroundColor: Colors.purple[200],
                              ),
                      ]),
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    right: 150,
                    child: Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(100)),
                      child: const Icon(
                        Icons.camera_alt,
                        color: Colors.grey,
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 35,
              ),
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
              ),
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
                          border:
                              Border.all(color: Colors.grey.withOpacity(0.7))),
                      child: DropdownButton<DepartmentModel>(
                        hint: Text(widget.department.toString()),
                        value: dropdownValue,
                        icon: const Icon(Icons.arrow_drop_down),
                        iconSize: 24,
                        elevation: 16,
                        underline: SizedBox(),
                        style:
                            const TextStyle(color: Colors.black, fontSize: 18),
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
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 20,
              ),
              FloatingActionButton.extended(
                onPressed: () async {
                  log("ccccccccccccccccccccc");
                  log("dddddd----" + deprtmentId.toString());

                  if (deprtmentId == null) {
                    log("dddddddddddddddddddddddddddddddddddddddd");
                  }

                  sharedPreferences = await ccc.SharedPreferences.getInstance();
                  String username = sharedPreferences.getString('username')!;

                  setState(() {
                    isLoading = true;
                  });

                  if (imageURI == null) {
                    signup(
                        username,
                        nameController.text,
                        mobileController.text,
                        addressController.text,
                        radioButtonItem.toString(),
                        deprtmentId.toString(),
                        emailController.text);

                    log("withoput image");
                  } else {
                    updateProfile(
                        username,
                        nameController.text,
                        mobileController.text,
                        addressController.text,
                        radioButtonItem.toString(),
                        deprtmentId.toString(),
                        emailController.text,
                        imageURI!);

                    ("isnide image");
                  }
                },
                label: isLoading == true
                    ? CircularProgressIndicator()
                    : Text(
                        "Save",
                        style: TextStyle(fontSize: 20),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }

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

  Widget bottomSheet() {
    return Container(
      height: 100.0,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: <Widget>[
          Text(
            "Choose Profile photo",
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            TextButton.icon(
              icon: Icon(Icons.camera),
              onPressed: () {
                getImageFromGallery(ImageSource.camera);
              },
              label: Text("Camera"),
            ),
            TextButton.icon(
              icon: Icon(Icons.image),
              onPressed: () {
                getImageFromGallery(ImageSource.gallery);
              },
              label: Text("Gallery"),
            ),
          ])
        ],
      ),
    );
  }
}
