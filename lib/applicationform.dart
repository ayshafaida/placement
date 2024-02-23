import 'dart:io';
import 'package:final_project/commonurl.dart';
import 'package:http/http.dart' as http;
import 'package:final_project/viewjobs.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:developer';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:placement/viewjobs.dart';

class JobApllyForm extends StatefulWidget {
  String? jobid;
  JobApllyForm({super.key, required this.jobid});

  @override
  State<JobApllyForm> createState() => _JobApllyFormState();
}

class _JobApllyFormState extends State<JobApllyForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  String radioButtonItem = 'Male';
  int id = 1;
  String uploadStatus = "";

  late SharedPreferences sharedPreferences;
  String? username, dateStr;

  int pageNumber = 1;
  bool pdfReady = false;
  PDFViewController? pdfViewController;
  File? pickedFile;

  void _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null) {
      setState(() {
        pickedFile = File(result.files.single.path!);
        log("pickedfile=====" + pickedFile.toString());
      });
    }
    // else {
    //   // User canceled the picker
    // }
  }
  // void initial() async {
  //   sharedPreferences = await SharedPreferences.getInstance();
  //   setState(() {
  //     username = sharedPreferences.getString('username')!;
  //     log('username:::::::$username');
  //   });
  // }

  Future<Map<String, dynamic>> updateProfile(String username, String name,
      String mobile, String email, String address, File? imagefile) async {
    log("calleed");
    // Map<String, dynamic> result;
    var res;
    var request = http.MultipartRequest(
        "POST", Uri.parse('${CommonUrl().mainurl}uploadpdf'));
    var pic = await http.MultipartFile.fromPath("profilePic", imagefile!.path);
    request.files.add(pic);
    request.fields['username'] = username;
    request.fields['name'] = name;
    request.fields['email'] = email;
    request.fields['mobile'] = mobile;
    request.fields['address'] = address;
    request.fields['jobid'] = widget.jobid!;
    request.fields['date'] = dateStr!;

    var response = await request.send();
    var responseData = await response.stream.toBytes();
    var responseString = String.fromCharCodes(responseData);
    print("aks" + responseString.toString());

    print(response.statusCode);
    if (response.statusCode == 200) {
                        Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => viewjobs()));
      setState(() {
        uploadStatus = "File Uploaded Succesfully";
      });
    } else {
      setState(() {
        uploadStatus = "Failed...........";
      });
    }
    return res;
  }

  @override
  Widget build(BuildContext context) {
    log("jobiD======" + widget.jobid!);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Apply"),
        backgroundColor: Colors.purple[200],
        centerTitle: true,
      ),
      body: Center(
        child: SafeArea(
            child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20),
              child: Column(
                children: [
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
                  const SizedBox(
                    height: 20,
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
                    height: 20,
                  ),
                  TextFormField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter Email',
                    ),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "please enter email ";
                      } else if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                        return "Please enter valid email id ";
                      }
                    },
                  ),
                  const SizedBox(
                    height: 20,
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
                  const SizedBox(
                    height: 20,
                  ),
                  pickedFile != null
                      ? Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.grey.withOpacity(0.5)),
                              borderRadius: BorderRadius.circular(8)),
                          height: MediaQuery.of(context).size.width / 2,
                          width: MediaQuery.of(context).size.width,
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: PDFView(
                              filePath: pickedFile!.path,
                              autoSpacing: true,
                              enableSwipe: true,
                              pageSnap: true,
                              onRender: (pages) {
                                setState(() {
                                  pdfReady = true;
                                });
                              },
                              onViewCreated: (PDFViewController vc) {
                                pdfViewController = vc;
                              },
                              onPageChanged: (page, total) {
                                setState(() {
                                  //  pickedFile;
                                  pageNumber = page!;
                                });
                              },
                            ),
                          ),
                        )
                      : const Text('PLease Select Your CV'),
                  const SizedBox(height: 20),
                  ElevatedButton.icon(
                      onPressed: () {
                        setState(() {
                          //pdfReady = false;
                          pickedFile = null;
                          _pickFile();
                        });
                      },
                      style: const ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(
                              Color.fromARGB(255, 159, 245, 156))),
                      icon: const Icon(Icons.insert_drive_file_sharp),
                      label: const Text(
                        'Upload CV',
                        style: TextStyle(fontSize: 25),
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
        )),
      ),
      bottomNavigationBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          // margin: EdgeInsets.only(bottom: 25.0),
          color: Colors.white,
          child: Expanded(
            child: SizedBox(
              height: 50.0,
              child: ElevatedButton(
                onPressed: () async {
                  DateTime today = DateTime.now();
                  dateStr =
                      //"${today.day}-${today.month}-${today.year}";
                      "${today.year}-${today.month}-${today.day}";

                  print(dateStr);

                  sharedPreferences = await SharedPreferences.getInstance();
                  String username = sharedPreferences.getString('username')!;

                  updateProfile(
                      username,
                      nameController.text,
                      mobileController.text,
                      emailController.text,
                      addressController.text,
                      pickedFile);

                  // Navigator.pushReplacement(context,
                  //     MaterialPageRoute(builder: (context) => viewjobs()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple[200],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
                child: const Text(
                  "Apply",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
