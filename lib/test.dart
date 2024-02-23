// import 'dart:convert';
// import 'dart:developer';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:http/http.dart' as http;
// import 'package:carousel_slider/carousel_controller.dart';
// import 'package:final_project/commonurl.dart';
// import 'package:final_project/model/postermodel.dart';
// import 'package:flutter/material.dart';

// class Homepage extends StatefulWidget {
//   const Homepage({super.key});

//   @override
//   State<Homepage> createState() => _HomepageState();
// }

// class _HomepageState extends State<Homepage> {
//   @override
//   void initState() {
//     super.initState();
//     fetchPosters();
//   }

//   Future<List<PosterModel>> fetchPosters() async {
//     log("inside");

//     log("message");
//     final response =
//         // await http.get(Uri.parse('${Service.url}getacadamics.jsp'));
//         await http.get(Uri.parse('${CommonUrl().mainurl}getPosters.jsp'));

//     if (response.statusCode == 200) {
//       log("statusCode====${response.statusCode}");

//       final parsed = json.decode(response.body).cast<Map<String, dynamic>>();

//       print(parsed);

//       return parsed
//           .map<PosterModel>((json) => PosterModel.fromJson(json))
//           .toList();
//     } else {
//       throw Exception('Failed to load course');
//     }
//   }

//   late CarouselController controller;
//   late PosterModel postermodel;
//   int currentIndex = 0;
//   late SharedPreferences sharedPreferences;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 0,
//         centerTitle: true,
//         title: const Text("Home"),
//         backgroundColor: Colors.green,
//       ),

//       body: Column(
//         children: [
//           FutureBuilder<List<PosterModel>>(
//               future: fetchPosters(),
//               builder: (context, snapshot) {
//                 if (snapshot.hasData) {
//                   log("length====" + snapshot.data!.length.toString());
//                   return
//                    Padding(
//                     padding: const EdgeInsets.only(top: 30),
//                     child: Container(
//                         margin: EdgeInsets.all(15),
//                         child: CarouselSlider.builder(
//                           itemCount: snapshot.data!.length,
//                           options: CarouselOptions(
//                             enlargeCenterPage: true,
//                             height: 200,
//                             autoPlay: true,
//                             autoPlayInterval: Duration(seconds: 3),
//                             reverse: false,
//                             aspectRatio: 5.0,
//                           ),
//                           itemBuilder: ((context, index, realIndex) {
//                             postermodel = snapshot.data![index];
//                             return GestureDetector(
//                               child: Container(
//                                 decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(15),
//                                     border: Border.all(
//                                       color: Colors.white,
//                                     )),
//                                 //ClipRRect for image border radius
//                                 child: ClipRRect(
//                                   borderRadius: BorderRadius.circular(15),
//                                   child: Image.network(
//                                     CommonUrl().imageurl + postermodel.poster,
//                                     width: 500,
//                                     fit: BoxFit.cover,
//                                   ),
//                                 ),
//                               ),
//                               onTap: () {
//                                 var url = postermodel.poster[index];
//                                 print(url.toString());
//                               },
//                             );
//                           }),
//                         )),
//                   );
//                 }
//                 return Center(child: CircularProgressIndicator());
//               }),
//         ],
//       ),

//       // Take Drawer widget
//       // drawer: Drawer(
//       //   //ListView to listdown children of drawer
//       //   child: ListView(
//       //     padding: EdgeInsets.zero,
//       //     children: [
//       //       //Drawer header for Heading part of drawer
//       //       DrawerHeader(
//       //         decoration: BoxDecoration(
//       //           color: AppColors().maincolor,
//       //         ),
//       //         //Title of header
//       //         child: const Center(
//       //           child: Text(
//       //             'Welcome',
//       //             style: TextStyle(fontSize: 26, color: Colors.white),
//       //           ),
//       //         ),
//       //       ),

//       //       ListTile(
//       //         leading: const Icon(Icons.person),
//       //         title: const Text('My Profile'),
//       //         onTap: () {
//       //           Navigator.push(
//       //               context, MaterialPageRoute(builder: (_) => myprofile()));
//       //         },
//       //       ),

//       //       ListTile(
//       //         leading: const Icon(Icons.work),
//       //         title: const Text('View Jobs'),
//       //         onTap: () {
//       //           Navigator.push(
//       //               context, MaterialPageRoute(builder: (_) => Viewjobs()));
//       //         },
//       //       ),
//       //       // divider,
//       //       ListTile(
//       //         leading: const Icon(Icons.assignment_outlined),
//       //         title: const Text('Applied Jobs'),
//       //         onTap: () {
//       //           Navigator.push(context,
//       //               MaterialPageRoute(builder: (_) => ApplyDetailsPage()));
//       //         },
//       //       ),
//       //       // divider,
//       //       ListTile(
//       //         leading: const Icon(Icons.contact_page),
//       //         title: const Text('Placement Cell'),
//       //         onTap: () {
//       //           Navigator.push(context,
//       //               MaterialPageRoute(builder: (_) => Placement_cell()));
//       //         },
//       //       ),
//       //       // divider,
//       //       ListTile(
//       //         leading: const Icon(Icons.notifications),
//       //         title: const Text('Announcements'),
//       //         onTap: () {
//       //           Navigator.push(context,
//       //               MaterialPageRoute(builder: (_) => Announcements()));
//       //         },
//       //       ),
//       //       // divider,
//       //       ListTile(
//       //         leading: const Icon(Icons.video_label),
//       //         title: const Text('Career Videos'),
//       //         onTap: () {
//       //           Navigator.pop(context);
//       //         },
//       //       ),
//       //       // divider,
//       //       ListTile(
//       //         leading: const Icon(Icons.logout),
//       //         title: const Text('Logout'),
//       //         onTap: () async {
//       //           sharedPreferences = await SharedPreferences.getInstance();
//       //           sharedPreferences.setBool('isLoggedIn', false);
//       //           sharedPreferences.setString("username", "");
//       //           Navigator.pushReplacement(
//       //               context, MaterialPageRoute(builder: (context) => Login()));
//       //           log("new user======${sharedPreferences.getBool('login')}");

//       //           // Navigator.push(
//       //           //     context, MaterialPageRoute(builder: (_) => const Login()));
//       //         },
//       //       ),
//       //     ],
//       //   ),
//       // ),
//     );
//   }
// }

// class SharedPreferences {
// }



