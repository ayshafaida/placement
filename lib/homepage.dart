import 'package:final_project/accepted.dart';
import 'package:final_project/applied.dart';
import 'package:final_project/main.dart';
import 'package:final_project/myprofile.dart';
import 'package:final_project/placementcell.dart';
import 'package:final_project/reject.dart';
import 'package:final_project/viewjobs.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Drawer Widget"),
        backgroundColor: Colors.green,
      ),
      //Empty body with a empty container
      body: Container(),
      // Take Drawer widget
      drawer: Drawer(
        //ListView to listdown children of drawer
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            //Drawer header for Heading part of drawer
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.green,
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
                Navigator.push(context, MaterialPageRoute(builder: (_) => myprofile()));
                
              },
            ),
            // divider,
            ListTile(
              leading: const Icon(Icons.work),
              title: const Text('View Jobs'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => viewjobs()));
              },
            ),
            // divider,
            ListTile(
              leading: const Icon(Icons.assignment_outlined),
              title: const Text('Applied Job'),
              onTap: () {
                //Navigator.push(context,MaterialPageRoute(builder: (_) => Applied()));
               // Navigator.push(context, MaterialPageRoute(builder: (_) => acceptedState()));
               Navigator.push(context, MaterialPageRoute(builder: (_) => rejecState() ));
              },
            ),
            // divider,
            ListTile(
              leading: const Icon(Icons.contact_page),
              title: const Text('Placement Cell'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => Placement_cell()));
              },
            ),
            // divider,
            ListTile(
              leading: const Icon(Icons.notifications),
              title: const Text('Announcements'),
              onTap: () {
                Navigator.pop(context);
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
                Navigator.push(context, MaterialPageRoute(builder: (_) => Login()));
              },
            ),
          ],
        ),
      ),
    );
  }
}