import 'dart:convert';
import 'dart:developer';
import 'package:final_project/commonurl.dart';
import 'package:final_project/job_details.dart';
import 'package:final_project/model/postermodel.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:http/http.dart' as http;



class CarouselSliderWithDots extends StatefulWidget {

  @override
  State<CarouselSliderWithDots> createState() => _CarouselSliderWithDotsState();
}

class _CarouselSliderWithDotsState extends State<CarouselSliderWithDots> {
  late CarouselController controller;
  
  get searchController => null;

   @override
  void initState() {
    super.initState();
    fetchPosters();
  }
  Future<List<PosterModel>> fetchPosters() async {
    log("inside");

    log("message");
    final response =
        // await http.get(Uri.parse('${Service.url}getacadamics.jsp'));
        await http.get(Uri.parse('${CommonUrl().mainurl}getPoster.jsp'));

    if (response.statusCode == 200) {
      log("statusCode====${response.statusCode}");

      final parsed = json.decode(response.body).cast<Map<String, dynamic>>();

      print(parsed);

      return parsed
          .map<PosterModel>((json) => PosterModel.fromJson(json))
          .toList();
    } else {
      throw Exception('Failed to load course');
    }
  }

  late CarouselController con;
  late PosterModel postermodel;
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: [
              Container(
                height: 200,
                child: FutureBuilder<List<PosterModel>>(
                future: fetchPosters(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    log("length====" + snapshot.data!.length.toString());
                    return
                     Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: Container(
                          margin: EdgeInsets.all(15),
                          child: CarouselSlider.builder(
                            itemCount: snapshot.data!.length,
                            options: CarouselOptions(
                              enlargeCenterPage: true,
                              height: 200,
                              autoPlay: true,
                              autoPlayInterval: Duration(seconds: 3),
                              reverse: false,
                              aspectRatio: 5.0,
                            ),
                            itemBuilder: ((context, index, realIndex) {
                              postermodel = snapshot.data![index];
                              return GestureDetector(
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      border: Border.all(
                                        color: Colors.white,
                                      )),
                                  //ClipRRect for image border radius
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: Image.network(
                                      CommonUrl().companyimageurl + postermodel.poster,
                                      width: 500,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                onTap: () {
                                  var url = postermodel.poster[index];
                                  print(url.toString());
                                },
                              );
                            }),
                          )),
                    );
                  }
                  return Center(child: CircularProgressIndicator());
                }),
              ),
            //Container(
            //   height: 200,
            //   child: Stack(
            //     alignment: AlignmentDirectional.topCenter,
            //     children: [
            //       Container(
            //               child: CarouselSlider(
            //                 carouselController: controller,
            //                 items:widget. items.map(
            //                       (item) => Padding(
            //                         padding: const EdgeInsets.all(5),
            //                         child: ClipRRect(
            //                           borderRadius: BorderRadius.circular(10),
            //                           child: Image.network(
            //                        item,
            //                             fit: BoxFit.fill,
            //                             width: double.maxFinite,
            //                           ),
            //                         ),
            //                       ),
            //                     )
            //                     .toList(),
            //                 options: CarouselOptions(
            //                   height: 200,
            //                   enlargeCenterPage: true,
            //                   autoPlay: true,
            //                   onPageChanged: (index, reason) {
            //                     setState(() {
            //                       currentIndex = index;
            //                     });
            //                   },
            //                 ),
            //               ),
            //       )    ,
            //        Positioned(
            //         bottom: 20,
            //         child: DotsIndicator(
            //           dotsCount: widget.items.length,
            //           position: currentIndex,
            //           onTap: (index) {
            //             controller.animateToPage(index);
            //           },
            //           decorator: DotsDecorator(
            //             color: Colors.white,
            //             activeColor: Colors.blueGrey,
            //             size: const Size.square(10.0),
            //             activeSize: const Size(30.0, 10.0),
            //             activeShape: RoundedRectangleBorder(
            //               borderRadius: BorderRadius.circular(12.0),
            //             ),
            //           ),
            //         ),
            //       ),
                 
            //     ],
            //   ),
            // ),

         

          ],
        ),
      ),
    );
  }
}