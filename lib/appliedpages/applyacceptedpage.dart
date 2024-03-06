import 'dart:convert';
import 'dart:developer';
import 'package:final_project/apiService.dart';
import 'package:final_project/model/applymodel.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ApplyAcceptedPage extends StatefulWidget {
  const ApplyAcceptedPage({super.key});

  @override
  State<ApplyAcceptedPage> createState() => _ApplyAcceptedPageState();
}

class _ApplyAcceptedPageState extends State<ApplyAcceptedPage> {
  String? username;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    callApliedjob();
  }

  void callApliedjob() async {
    final prefs = await SharedPreferences.getInstance();
    username = prefs.getString('username');
    log("username======== $username");
    // applyjoblist = fetchapplyJobs(username!, "1");
    ApiService().applyjoblist = ApiService().fetchapplyJobs("1");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: FutureBuilder<List<ApplyModel>>(
          future: ApiService().fetchapplyJobs("1"),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return  snapshot.data!.length != 0?
              ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  final applyjobs = snapshot.data![index];
                  log("applyjobs======-----------" + applyjobs.companyname);
                  DateTime dateTimeWithTimeZone =
                      DateTime.parse(applyjobs.date.toString());
                  print(
                      "dateTimeWithTimeZone" + dateTimeWithTimeZone.toString());
                  return Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Card(
                      elevation: 9,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 5,
                          ),
                          ListTile(
                            dense: false,
                            title: Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 6.0),
                              child: Text(
                                applyjobs.jobName,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            subtitle: Text(
                              applyjobs.companyname,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Text(
                              applyjobs.location,
                              textAlign: TextAlign.start,
                            ),
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15, right: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Salary Package : " + applyjobs.salary,
                                  textAlign: TextAlign.start,
                                ),
                                Text(
                                  DateFormat.yMMMEd().format(applyjobs.date),
                                  //applyjobs.date.toString(),
                                  style: TextStyle(
                                      color: Colors.grey.withOpacity(0.6)),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Text(
                              "HR will be contact soon",
                              style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ):Center(child: Text("Not data"),);
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}