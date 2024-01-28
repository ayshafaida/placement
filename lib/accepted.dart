import 'package:flutter/material.dart';

class acceptedState extends StatefulWidget {
  acceptedState({super.key});

  @override
  State<acceptedState> createState() => __acceptedStateState();
}

class __acceptedStateState extends State<acceptedState> {
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
        title: Text("Accepted Jobs"),
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
                  "Job Name",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                subtitle: Text(
                  "Company Name",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                 trailing:IconButton(
                icon:  Icon(Icons.arrow_forward_ios_rounded),
                color: Colors.green,
                onPressed: () {
                 // Navigator.push(
                        // context, MaterialPageRoute(builder: (_) => Jobdetails()));
                },
              ), 
              ),
              Row(
                children:[ IconButton(onPressed: ()=>{}, icon: Icon(Icons.location_pin)),
                  
                  Padding(
                  padding:  EdgeInsets.only(left: 20),
                  child: Text("Location",textAlign:TextAlign.start,),
                ),]

              ),
              SizedBox(height: 6,),
              Row(
                children: [IconButton(onPressed: ()=>{}, icon: Icon(Icons.calendar_today)),
              Padding(
                padding:  EdgeInsets.only(left: 20),
                child: Text("Apply Date",textAlign:TextAlign.start,),
              ),]

              ),
              SizedBox(height: 6,),
               Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Accepted',
                      style: TextStyle(
                        fontSize: 20,
                        color: Color.fromARGB(206, 6, 7, 6),
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                  ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 30,
                  width: 500,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                      width: 1,
                    ),
                   borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(child: Text('HR will be contact soon..'),)
                ),
              )
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
    
  