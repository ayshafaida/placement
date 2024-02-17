import 'package:final_project/announcement.dart';
import 'package:final_project/appliedjobs.dart';
import 'package:final_project/job.dart';
import 'package:final_project/login.dart';
import 'package:final_project/main.dart';
import 'package:final_project/myprofile.dart';
import 'package:final_project/placementcell.dart';
import 'package:final_project/sample.dart';
import 'package:final_project/viewjobs.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  get searchController => null;

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
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
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            //Drawer header for Heading part of drawer
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.purple,
              ),
              //Title of header
              child: Center(
                child: Text(
                  'Welcome to Drawer',
                  style: TextStyle(fontSize: 26, color: Colors.white),
                ),
              ),
            ),
            //Child tile of drawer with specified title
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
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => viewjobs()));
              },
            ),
            // divider,
            ListTile(
              leading: const Icon(Icons.assignment_outlined),
              title: const Text('Apply Job Details'),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => ApplyDetails()));
              },
            ),
            // divider,
            ListTile(
              leading: const Icon(Icons.contact_page),
              title: const Text('Placement Cell'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => Placement_cell()));
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
                Navigator.pop(context);
              },
            ),
            // divider,
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => Login()));
              },
            ),
          ],
        ),
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
              padding: const EdgeInsets.all(15),
              child: Container(
                  child: Column(
                children: List.generate(4, (index) {
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
                              "Job Post",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            subtitle: Text(
                              "Company Name",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            trailing: IconButton(
                              icon: const Icon(Icons.arrow_forward_ios_rounded),
                              color: Colors.purple[200],
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => Jobdetails()));
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
                                "Location",
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
                                "Experience",
                                textAlign: TextAlign.start,
                              ),
                            ),
                          ]),
                        ],
                      ),
                    ),
                  );
                }),
              )),
            )
          ],
        ),
      ),
    );
  }
}
