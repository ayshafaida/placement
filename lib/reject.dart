import 'package:flutter/material.dart';

class rejecState extends StatefulWidget {
  const rejecState({super.key});

  @override
  State<rejecState> createState() => rejecStateState();
}

class rejecStateState extends State<rejecState> {
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
        title: Text("Rejected Jobs"),
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
        child: Stack(
          children: [
            Card(
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
                    icon: const Icon(Icons.arrow_forward_ios_rounded),
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
                      padding: const EdgeInsets.only(left: 20),
                      child: Text("Location",textAlign:TextAlign.start,),
                    ),]
            
                  ),
                  SizedBox(height: 6,),
                  Row(
                    children: [IconButton(onPressed: ()=>{}, icon: Icon(Icons.calendar_today)),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text("Apply Date",textAlign:TextAlign.start,),
                  ),]
                  ),
                  SizedBox(height: 6,),
                ],
              ),
            ),
            Positioned(
              right: 0,
              top: 10,
              child: Image.asset("images/rejected123.png",height: 100,))
        // Image.network("https://image.similarpng.com/very-thumbnail/2021/05/Rejected-rubber-stamp-on-transparent-background-PNG.png",height: 50,)
          ],
        ),
      );
    },
  ),
),
    );
  }
}   
  
