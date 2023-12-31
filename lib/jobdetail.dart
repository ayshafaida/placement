import 'package:flutter/material.dart';

class Jobdetails extends StatelessWidget {
  const Jobdetails({super.key});

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
        title: Text("Company Name"
          // company!.companyName!,
        ),
        centerTitle: true,
      ),
      body: DefaultTabController(
        length: 2,
        child: Container(
          width: double.infinity,
          // margin: EdgeInsets.only(top: 50.0),
          padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 15.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40.0),
              topRight: Radius.circular(40.0),
            ),
          ),
          child: Column(
            children: <Widget>[
              Container(
                constraints: BoxConstraints(maxHeight: 250.0),
                child: Column(
                  children: <Widget>[
                    Center(
                      child: Container(
                        width: 70.0,
                        height: 70.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          // image: DecorationImage(
                          //   image: AssetImage(company!.image!),
                          //   fit: BoxFit.cover,
                          // ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Text("hi"
                      // company!.job!,
                      // style: kTitleStyle.copyWith(
                      //   fontWeight: FontWeight.bold,
                      // ),
                    ),
                    SizedBox(height: 15.0),
                    Text('hello'
                      // company!.sallary!,
                      // style: kSubtitleStyle,
                    ),
                    SizedBox(height: 15.0),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: company!.tag!
                    //       .map(
                    //         (e) => Container(
                    //           margin: EdgeInsets.symmetric(horizontal: 5.0),
                    //           padding: EdgeInsets.symmetric(
                    //             horizontal: 8.0,
                    //             vertical: 5.0,
                    //           ),
                    //           decoration: BoxDecoration(
                    //             borderRadius: BorderRadius.circular(8.0),
                    //             border:
                    //                 Border.all(color: kBlack.withOpacity(.5)),
                    //           ),
                    //           child: Text(
                    //             e,
                    //             style: kSubtitleStyle,
                    //           ),
                    //         ),
                    //       )
                    //       .toList(),
                    // ),
                    SizedBox(height: 25.0),
                    Material(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        side: BorderSide(
                        ),
                      ),
                      // borderRadius: BorderRadius.circular(12.0),
                      // child: TabBar(
                      //   unselectedLabelColor: kBlack,
                      //   indicator: BoxDecoration(
                      //     color: kOrange,
                      //     borderRadius: BorderRadius.circular(12.0),
                      //   ),
                      //   tabs: [
                      //     Tab(text: "Description"),
                      //     Tab(text: "Company"),
                      //   ],
                      // ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 10.0),
              Expanded(
                child: TabBarView(
                  children: [
                    // DescriptionTab(company: company),
                    // CompanyTab(company: company),
                  ],
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
              Container(
                width: 50.0,
                height: 50.0,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.green.withOpacity(.5)),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Icon(
                  Icons.bookmark_border,
                  color: Colors.green,
                ),
              ),
              SizedBox(width: 15.0),
              Expanded(
                child: SizedBox(
                  height: 50.0,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                    child: Text(
                      "Apply for Job",
                      style: TextStyle(color: Colors.white),
                    ),
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