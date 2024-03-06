import 'dart:convert';
import 'dart:developer';
import 'package:final_project/videoplayerrrrr.dart';
import 'package:http/http.dart' as http;
import 'package:final_project/commonurl.dart';
import 'package:final_project/model/announcementmodel.dart';
import 'package:final_project/model/careervideosmodel.dart';
import 'package:flutter/material.dart';

class CareerVideos extends StatefulWidget {
  const CareerVideos({super.key});

  @override
  State<CareerVideos> createState() => _CareerVideosState();
}

class _CareerVideosState extends State<CareerVideos> {
   Future<List<CareervideosModel>> fetchcareervdo() async {
    log("inside");

    log("message");
    final response =
        // await http.get(Uri.parse('${Service.url}getacadamics.jsp'));
        await http.get(Uri.parse('${CommonUrl().mainurl}getCareervideos.jsp'));

    if (response.statusCode == 200) {
      log("statusCode====${response.statusCode}");

      final parsed = json.decode(response.body).cast<Map<String, dynamic>>();

      print(parsed);

      return parsed.map<CareervideosModel>((json) => CareervideosModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load course');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.purple[200],
      centerTitle: true,
      leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text("Career Videos"),),
        body: SafeArea(
          child: FutureBuilder<List<CareervideosModel>>(
            future: fetchcareervdo(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
              //  log("length====" + snapshot.data!.length.toString());
                return ListView.builder(
          itemCount: snapshot.data!.length,
          itemBuilder: (context, index) {
            final careervideos=snapshot.data![index];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal:15.0,vertical: 8),
              child:
              
              
               InkWell(
                onTap: () {

                  String link=  careervideos.videos;


                   Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
          return PlayVideoFromNetwork(video:link);
        }));
                  
                },
                 child: Container(
                     // color: nextColor,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.purple[50],
                          borderRadius:  BorderRadius.all(
                 Radius.circular(40.0),
                          ),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 20.0,
                          
                        ),
                        child: Column(
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children: <Widget>[
                  Text(
                    careervideos.title,
                    style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10,),
                  //  Text(
                  //   careervideos.videos,
                  //   style: TextStyle(
                  //       color: Colors.black,
                  //       fontSize: 15,
                  //       fontWeight: FontWeight.bold),
                  // ),
                  //Row(),
                               ]),
                      ),
                    ),
               ),
            );
          
        },);
               
              }
              return Center(child: CircularProgressIndicator());
            }),
          
        ),
    );
  }
}