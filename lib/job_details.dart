import 'dart:developer';
import 'dart:ui';

import 'package:final_project/applicationform.dart';
import 'package:final_project/commonurl.dart';
import 'package:final_project/model/jobmodel.dart';
import 'package:final_project/viewjobs.dart';
import 'package:flutter/material.dart';

class Jobdetails extends StatefulWidget {
   Jobdetails({super.key,required this.compid,required this.comname,required this.comimg,required this.jobid,required this.salary,required this.dsrption,required this.jobname});
   //JobModel jobdetails;
   String compid,comname,comimg,jobid,salary,dsrption,jobname;


  @override
  State<Jobdetails> createState() => _JobdetailsState();
}

class _JobdetailsState extends State<Jobdetails> {
     String ?jobid;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
         backgroundColor: Colors.purple[200],
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
          ),
          onPressed: () => Navigator.push(
              context, MaterialPageRoute(builder: (_) => viewjobs())),
        ),
        title: Text(widget.comname,
          // company!.companyName!,
        ),
      ),
      
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                     width: double.infinity,
                     height: 100,
                     child: Container(
                       alignment: Alignment(0.0, 2.5),
                       child: CircleAvatar(
                        backgroundImage: NetworkImage( CommonUrl().companyimageurl +widget.comimg),
                        radius: 40.0,
                       ),
                       ) ),
                       SizedBox(height: 35,),
                       Text(
                        widget.jobname,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                        ),
                        ),
                        Column(
                          children: [
                            Divider(
                              height: 80,
                              color: Colors.grey[200],
                              thickness: 1,
                            )
                          ],
                        ),
                      SizedBox(height:5,),
                       Text(
                        widget.comname,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                          fontWeight: FontWeight.bold
                        ),
                        ),
                        SizedBox(height: 13,
                        ),
                         Text(
                        widget.salary,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold
                        ),
                        ),
                         SizedBox(height: 30,
                         ),
                        
                        Padding(
                          padding:  EdgeInsets.only(left: 20.0,right: 0.0,top: 0.0,bottom: 0.0),
                          child: Row( crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                              "Job Description",
                              style: TextStyle(
                                color: Colors.grey[900],
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline,
                                decorationColor: Colors.grey,
                                decorationThickness: 2, 
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                                padding:  EdgeInsets.all(20),
                                child: Text(
                                  widget.dsrption,
                                  // maxLines: 10,
                                  // overflow: 
                                 // TextOverflow.ellipsis,
                                  style: TextStyle(fontSize: 12.0,fontWeight: FontWeight.w500),
                                  //specifications and UI mockups,developing a cross-browser mobile application'
                                 ),
                              )
            ],
          ),
        ),
      ),
       bottomNavigationBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: Container(
          padding: EdgeInsets.only(left: 18.0, bottom: 25.0, right: 18.0),
          // margin: EdgeInsets.only(bottom: 25.0),
          color: Colors.white,
          child: Row(
            children: <Widget>[
              // Container(
              //   width: 50.0,
              //   height: 50.0,
              //   decoration: BoxDecoration(
              //     border: Border.all(color: Colors.purple),
              //     borderRadius: BorderRadius.circular(12.0),
              //   ),
              //   child: Icon(
              //     Icons.bookmark_border,
              //     color: Colors.purple[200],
              //   ),
              // ),
              SizedBox(width: 15.0),
              Expanded(
                child: SizedBox(
                  height: 50.0,
                  child: ElevatedButton(
                    onPressed: () {
                          jobid=widget.jobid;
                           String  comapnyid=widget.compid;
                          log("jjjobid---------------------------===="+jobid.toString());
                          Navigator.pushReplacement(
                         context, MaterialPageRoute(builder: (_) => JobApllyForm(jobid:jobid,companyid:comapnyid)));
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.purple[200],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                    child: Text(
                      "Apply for Job",
                      style: TextStyle(color: Colors.white)),
                  ),
                ),
              )
            ],
          ),
        ),
      ), 
      );
  }
}