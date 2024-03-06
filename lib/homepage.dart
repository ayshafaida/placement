import 'dart:convert';
import 'dart:developer';
import 'package:final_project/apiService.dart';
import 'package:final_project/job_details.dart';
import 'package:final_project/webservice/webservive.dart';
import 'package:http/http.dart' as http;

import 'package:final_project/announcement.dart';
import 'package:final_project/appliedjobs.dart';
import 'package:final_project/careervideos.dart';
import 'package:final_project/commonurl.dart';
import 'package:final_project/login.dart';
import 'package:final_project/model/jobmodel.dart';
import 'package:final_project/myprofile.dart';
import 'package:final_project/placementcell.dart';
import 'package:final_project/carousal.dart';
import 'package:final_project/viewjobs.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  get searchController => null;
  

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
//  @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     fetchJob();
//   }
  

//  Future<List<JobModel>> fetchJob() async {
//     log("inside");

//     log("message");
//     final response =
//         // await http.get(Uri.parse('${Service.url}getacadamics.jsp'));
//         await http.get(Uri.parse('${CommonUrl().mainurl}job.jsp'));

//     if (response.statusCode == 200) {
//       log("statusCode====${response.statusCode}");

//       final parsed = json.decode(response.body).cast<Map<String, dynamic>>();

//       print(parsed);

//       return parsed.map<JobModel>((json) => JobModel.fromJson(json)).toList();
//     } else {
//       throw Exception('Failed to load course');
//     }
//   }

  late SharedPreferences sharedPreferences;
    String? searchKey;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("College Placement"),
        backgroundColor: Colors.purple[200],
      ),
      //Empty body with a empty container

      // Take Drawer widget
      drawer: Drawer(
        //ListView to listdown children of drawer
        child:FutureBuilder(
        future: ApiService().fetchProfile(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
           // getdata(snapshot.data!.departmentid, snapshot.data!.semesterid);
            return 
             ListView(
          padding: EdgeInsets.zero,
          children: [
            //Drawer header for Heading part of drawer

             DrawerHeader(
                    decoration: BoxDecoration(
                      color: Colors.purple[200],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 40,
                          backgroundColor: Colors.white,
                          backgroundImage: snapshot.data!.profileImage == "null"
                              ? AssetImage("assets/images/img.jpg")
                              : NetworkImage(CommonUrl().imageurl +
                                  snapshot.data!.profileImage) as ImageProvider,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          snapshot.data!.name,
                          // 'Sameena',
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        // Text(
                        //   snapshot.data!.registerid,
                        //   // 'RGSCA001',
                        //   style: TextStyle(fontSize: 12, color: Colors.white),
                        // ),
                      ],
                    ),
                  ),
         
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('My Profile'),
              //To perform action on tapping at tile
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => myprofile()));
              },
            ),
            // divider,
            ListTile(
              leading: const Icon(Icons.work),
              title: const Text('View Jobs'),
              onTap: () {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (_) => viewjobs()));
              },
            ),
            // divider,
            ListTile(
              leading: const Icon(Icons.assignment_outlined),
              title: const Text('Applied Jobs'),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => ApplyDetails()));
              },
            ),
            // divider,
            ListTile(
              leading: const Icon(Icons.notifications),
              title: const Text('Announcements'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => Announcements()));
              },
            ),
            // divider,
            ListTile(
              leading: const Icon(Icons.video_label),
              title: const Text('Career Videos'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => CareerVideos()));
              },
            ),
             ListTile(
              leading: const Icon(Icons.contact_page),
              title: const Text('Contact us'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => Placement_cell()));
              },
            ),
            // divider,
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: ()async {
                

                log("qqqqq====");
                sharedPreferences = await SharedPreferences.getInstance();
                sharedPreferences.setBool('isLoggedIn', false);
                sharedPreferences.setString('username', "");
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (_) => Login()));
              },
            ),
          ],
        );
           
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        })
  
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 200,
                //  color: Colors.red,
              child: CarouselSliderWithDots(),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                // color: Colors.amber,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: TextField(
                     onChanged: (value) {
                            setState(() {
                              searchKey = value;
                            });
                          },
                    // controller: searchController,
                    decoration: InputDecoration(
                      hintText: 'Search...',
                      // Add a clear button to the search bar
                      //  suffixIcon: IconButton(
                      // icon: Icon(Icons.clear),
                      //  onPressed: () => searchController.clear(),
                      // ),
                      // Add a search icon or button to the search bar
                      prefixIcon: IconButton(
                        icon: Icon(Icons.search),
                        onPressed: () {
                          // Perform the search here
                        },
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                  ),
                ),
              ),
            ),

            Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 6),
          height: MediaQuery.of(context).size.height/1.6,
          child: FutureBuilder<List<JobModel>>(
              future: Webservice().fetchJob(query: searchKey),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  log("length hh====" + snapshot.data!.length.toString());


                   if (snapshot.data!.length == 0) {
                    return Column(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [Text("No Results Found")],
                    );
                  } else {
                  return
                   ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      final jobs=snapshot.data![index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          elevation: 9,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ListTile(
                                dense: false,
                                title: Text(
                                  jobs.jobName,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold, fontSize: 20),
                                ),
                                subtitle: Text(
                                  snapshot.data![index].companyName,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold, fontSize: 16),
                                ),
                                trailing: IconButton(
                                  icon:
                                      const Icon(Icons.arrow_forward_ios_rounded),
                                  color: Colors.purple[200],
                                  onPressed: () {
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) => Jobdetails(compid:jobs.CompanyID, comname:jobs.companyName,comimg:jobs.image,jobid:jobs.id,salary:jobs.salary,dsrption:jobs.jobDetails,jobname:jobs.jobName
                                             // jobdetails: jobs,
                                            )));
                                  },
                                ),
                              ),
                              Row(children: [
                                IconButton(
                                    onPressed: () => {},
                                    icon: Icon(Icons.location_pin)),
                                Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: Text(
                                    snapshot.data![index].location,
                                    textAlign: TextAlign.start,
                                  ),
                                ),
                              ]),
                              Row(children: [
                                IconButton(
                                    onPressed: () => {},
                                    icon: Icon(Icons.business_center_rounded)),
                                Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: Text(
                                    snapshot.data![index].salary,
                                    textAlign: TextAlign.start,
                                  ),
                                ),
                              ]),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }
                }
                return Center(child: CircularProgressIndicator());
              }),
        ),
      ),


            
          ],
        ),
      ),
    );
  }
}
