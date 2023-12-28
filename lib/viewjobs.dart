import 'package:final_project/jobdetail.dart';
import 'package:flutter/material.dart';

class viewjobs extends StatefulWidget {
  const viewjobs({super.key});

  @override
  State<viewjobs> createState() => _viewjobsState();
}

class _viewjobsState extends State<viewjobs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text("View Jobs"),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      body: Padding(
  padding: const EdgeInsets.all(8.0),
  child: ListView.builder(
    itemCount: 4,
    itemBuilder: (context,index) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          elevation: 9,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(30)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                dense: false,
                title: Text(
                  "Job Post",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                subtitle: Text(
                  "Company Name",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                 trailing:IconButton(
                icon: const Icon(Icons.arrow_forward_ios_rounded),
                color: Colors.green,
                onPressed: () {
                  Navigator.push(
                         context, MaterialPageRoute(builder: (_) => Jobdetails()));
                },
              ), 
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text("Location",textAlign:TextAlign.start,),
              ),
              SizedBox(height: 6,),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text("Experience",textAlign:TextAlign.start,),
              ),
              SizedBox(height: 6,),
            ],
          ),
        ),
      );
    },
  ),
),
    );
  }
}