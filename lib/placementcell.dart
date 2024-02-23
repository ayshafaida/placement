import 'dart:convert';
import 'dart:developer';
import 'package:final_project/commonurl.dart';
import 'package:final_project/model/placementcellmodel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
// import 'package:url_launcher/url_launcher.dart';

class Placement_cell extends StatefulWidget {
  const Placement_cell({super.key});

  @override
  State<Placement_cell> createState() => _Placement_cellState();
}

class _Placement_cellState extends State<Placement_cell> {
  @override
  void initState() {
    super.initState();
    fetchplacementcell();
  }

  Future<PlacementCellModel> fetchplacementcell() async {
    final response = await http.get(
      Uri.parse('${CommonUrl().mainurl}getPlacementCell.jsp'),
    );

    if (response.statusCode == 200) {
      log("statusCode:===${response.statusCode}");
      log("statusbody:===${response.body}");

      return PlacementCellModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load album');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[200],
        title: const Text('Placement Cell'),
        centerTitle: true,
      ),
      body: Center(
        /** Card Widget **/
        child: Card(
          elevation: 10,
          shadowColor: Color.fromARGB(255, 178, 180, 178),
          child: SizedBox(
            width: MediaQuery.of(context).size.width / 1.3,
            height: MediaQuery.of(context).size.width / 1.3,
            child: FutureBuilder<PlacementCellModel>(
              future: fetchplacementcell(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            'Contact',
                            style: TextStyle(
                              fontSize: 30,
                              color: Colors.purple[200],
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Container(
                          alignment: const Alignment(0.0, 2.5),
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 60.0,
                            backgroundImage: NetworkImage(
                                CommonUrl().imageurl + snapshot.data!.image),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          snapshot.data!.name,
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              onPressed: () {


phonecall(snapshot.data!.mobile);



                              },
                              icon: Icon(
                                Icons.call,
                                color: Colors.purple[200],
                              ),
                            ),
                            Text(snapshot.data!.mobile),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const SizedBox(
                          width: 100,
                        )
                      ],
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }

                // By default, show a loading spinner.
                return const Center(child: CircularProgressIndicator());
              },
            ),
          ),
        ),
      ),
    );
  }
}
 void phonecall(mobileno) async {
    final Uri url = Uri(scheme: 'tel', path: mobileno);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      print('can not launch this url');
    }
  }
// class PhoneCall {
//   void phonecall(mobileno) async {
//     final Uri url = Uri(scheme: 'tel', path: mobileno);
//     if (await canLaunchUrl(url)) {
//       await launchUrl(url);
//     } else {
//       print('can not launch this url');
//     }
//   }
// }

// import 'package:final_project/homepage.dart';
// import 'package:flutter/material.dart';

// class Placement_cell extends StatelessWidget {
//   const Placement_cell({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//           backgroundColor: Colors.purple[200],
//           leading: IconButton(
//           icon: Icon(
//             Icons.arrow_back_ios,
//           ),
//           onPressed: () {
//             Navigator.push(
//                          context, MaterialPageRoute(builder: (_) => Homepage()));
//           },
//         ),
//           title: Text('Placement Cell'),
//       ),
//        body: Center(
//         /** Card Widget **/
//         child: Card(
//           elevation: 50,
//           shadowColor: Colors.green,
//           color: Colors.greenAccent[100],
//           child: SizedBox(
//             width: 300,
//             height: 250,
//             child: Padding(
//               padding: const EdgeInsets.all(20.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const SizedBox(
//                     height: 10,
//                   ),
//                   Align(
//                     alignment: Alignment.center,
//                     child: Text(
//                       'Contact',
//                       style: TextStyle(
//                         fontSize: 30,
//                         color: Colors.green[900],
//                         fontWeight: FontWeight.w500,
//                       ),
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 10,
//                   ), 
//                   Text('Name'),
//                   const SizedBox(
//                     height: 10,
//                   ),
//                   Text('9999999999'),
//                   const SizedBox(
//                     height: 10,
//                   ),
//                   SizedBox(
//                     width: 100,
//                   ) 
//                 ],
//               ),
//             ), 
//           ), 
//         ), 
//       ), 
//     );
//   }
// }