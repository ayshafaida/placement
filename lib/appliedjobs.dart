import 'package:final_project/accepted.dart';
import 'package:final_project/appliedpages/applyacceptedpage.dart';
import 'package:final_project/appliedpages/applypage.dart';
import 'package:final_project/appliedpages/applyrejectpage.dart';
import 'package:final_project/homepage.dart';
import 'package:flutter/material.dart';

class ApplyDetails extends StatefulWidget {
  const ApplyDetails({super.key});

  @override
  State<ApplyDetails> createState() => _ApplyDetailsState();
}

class _ApplyDetailsState extends State<ApplyDetails> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 80,
            backgroundColor: Colors.white,
            elevation: 0,
            centerTitle: true,
            title: Text(
              "Apply Job Details",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.purple[200]),
            ),
            leading: IconButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return Homepage();
                    },
                  ));
                },
                icon: Icon(Icons.arrow_back_ios_new_rounded)),
            bottom: TabBar(
                padding: EdgeInsets.all(8),
                dividerColor: Colors.transparent,
                unselectedLabelColor: Colors.purple[200],
                unselectedLabelStyle: TextStyle(
                    fontFamily: 'SF Pro Rounded',
                    fontWeight: FontWeight.normal),
                labelStyle: TextStyle(
                    color: Colors.white,
                    fontFamily: 'SF Pro Rounded',
                    fontWeight: FontWeight.w600),
                splashBorderRadius: BorderRadius.circular(50),
                indicatorSize: TabBarIndicatorSize.tab,
                indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.purple[200]),
                tabs: [
                  Tab(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text("Applied"),
                    ),
                  ),
                  Tab(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text("Accepted"),
                    ),
                  ),
                  Tab(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text("Rejected"),
                    ),
                  ),
                ]),
          ),
          body: TabBarView(children: [
            AppliedPage(),
            ApplyAcceptedPage(),
            ApplyRejectedPage(),
            // Icon(Icons.apps),
            // Icon(Icons.movie),
            // Icon(Icons.games),
          ]),
        ));
  }
}