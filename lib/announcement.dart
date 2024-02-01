import 'package:flutter/material.dart';
class Announcements extends StatefulWidget {
  const Announcements({super.key});

  @override
  State<Announcements> createState() => _AnnouncementsState();
}

class _AnnouncementsState extends State<Announcements> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.purple[200],
      leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text("Announcements"),),
        body: SafeArea(child: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                   // color: nextColor,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.purple[50],
                        borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(80.0),
                        ),
                      ),
                      padding: const EdgeInsets.only(
                        left: 32,
                        top: 30.0,
                        bottom: 50,
                      ),
                      child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "title",
                  style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10,),
                Text(
                  "Date:",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
                 Text(
                  "Time:",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
                 Text(
                  "Venue:",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
                //Row(),
              ]),
                    ),
                  ),
            );
          
        },)),
    );
  }
}


// class Announcements extends StatelessWidget {
//   const Announcements({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }
// // void main() {
// //   runApp(Announcements());
// // }

// class announcment extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: MainScreen(),
//       title: 'Devotion',
//       theme: appTheme,
//     );
//   }
// }

// ThemeData appTheme = ThemeData(
//   fontFamily: 'Oxygen',
//   primaryColor: Colors.purpleAccent,
// );

// class MainScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // appBar: AppBar(
//       //   title: const Text('Devotion'),
//       // ),
//       body: ListView(
//         scrollDirection: Axis.vertical,
//         children: <Widget>[
//           CurvedListItem(
//             title: 'College Auditorium',
//             time: 'TODAY 1:00 PM to 4:00 PM',
//             color: Colors.red,
//             nextColor: Colors.green,
//           ),
//           CurvedListItem(
//             title: 'College Seminar Hall',
//             time: 'TUESDAY 10:30 AM to 12:30 AM',
//             color: Colors.green,
//             nextColor: Colors.yellow,
//           ),
//           CurvedListItem(
//             title: 'College Open Ground',
//             time: 'FRIDAY 9:30 AM to 12:00 AM',
//             color: Colors.yellow,
//           ),
//         ],
//       ),
//     );
//   }
// }

// // class CurvedListItem extends StatelessWidget {
// //   const CurvedListItem({
// //     required this.title,
// //     required this.time,
// //     required this.icon,
// //     required this.people,
// //     required this.color,
// //     required this.nextColor,
// //   });

// //   final String title;
// //   final String time;
// //   final String people;
// //   final IconData icon;
// //   final Color color;
// //   final Color nextColor;

// //   @override
// //   Widget build(BuildContext context) {
// //     return Container(
// //       color: nextColor,
// //       child: Container(
// //         decoration: BoxDecoration(
// //           color: color,
// //           borderRadius: const BorderRadius.only(
// //             bottomLeft: Radius.circular(80.0),
// //           ),
// //         ),
// //         padding: const EdgeInsets.only(
// //           left: 32,
// //           top: 80.0,
// //           bottom: 50,
// //         ),
// //         child: Column(
// //             crossAxisAlignment: CrossAxisAlignment.start,
// //             children: <Widget>[
// //               Text(
// //                 time,
// //                 style: TextStyle(color: Colors.white, fontSize: 12),
// //               ),
// //               const SizedBox(
// //                 height: 2,
// //               ),
// //               Text(
// //                 title,
// //                 style: TextStyle(
// //                     color: Colors.white,
// //                     fontSize: 22,
// //                     fontWeight: FontWeight.bold),
// //               ),
// //               Row(),
// //             ]),
// //       ),
// //     );
// //   }
// // }