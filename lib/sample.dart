import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';


class CarouselSliderWithDots extends StatefulWidget {
  final List<String> items = [
    'https://images.unsplash.com/photo-1688920556232-321bd176d0b4?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1470&q=80',
    'https://images.unsplash.com/photo-1689085781839-2e1ff15cb9fe?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1470&q=80',
    'https://images.unsplash.com/photo-1688980034676-7e8ee518e75a?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=735&q=80',
  ];
  @override
  State<CarouselSliderWithDots> createState() => _CarouselSliderWithDotsState();
}

class _CarouselSliderWithDotsState extends State<CarouselSliderWithDots> {
  late CarouselController controller;
  int currentIndex = 0;
  
  get searchController => null;

  @override
  void initState() {
  
    controller = CarouselController();

    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: [
            Container(
              height: 200,
              child: Stack(
                alignment: AlignmentDirectional.topCenter,
                children: [
                  Container(
                          child: CarouselSlider(
                            carouselController: controller,
                            items:widget. items.map(
                                  (item) => Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.network(
                                   item,
                                        fit: BoxFit.fill,
                                        width: double.maxFinite,
                                      ),
                                    ),
                                  ),
                                )
                                .toList(),
                            options: CarouselOptions(
                              height: 200,
                              enlargeCenterPage: true,
                              autoPlay: true,
                              onPageChanged: (index, reason) {
                                setState(() {
                                  currentIndex = index;
                                });
                              },
                            ),
                          ),
                  )    ,
                   Positioned(
                    bottom: 20,
                    child: DotsIndicator(
                      dotsCount: widget.items.length,
                      position: currentIndex,
                      onTap: (index) {
                        controller.animateToPage(index);
                      },
                      decorator: DotsDecorator(
                        color: Colors.white,
                        activeColor: Colors.blueGrey,
                        size: const Size.square(10.0),
                        activeSize: const Size(30.0, 10.0),
                        activeShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                    ),
                  ),
                 
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: TextField(
                  controller: searchController,
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




          ],
        ),
      ),
    );
  }
}