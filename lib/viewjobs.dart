import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:final_project/commonurl.dart';
import 'package:final_project/homepage.dart';
import 'package:final_project/job_details.dart';
import 'package:final_project/model/jobmodel.dart';
import 'package:flutter/material.dart';

class viewjobs extends StatefulWidget {
  const viewjobs({super.key});

  @override
  State<viewjobs> createState() => _viewjobsState();
}

class _viewjobsState extends State<viewjobs> {
  Future<List<JobModel>> fetchJob() async {
    log("inside");

    log("message");
    final response =
        // await http.get(Uri.parse('${Service.url}getacadamics.jsp'));
        await http.get(Uri.parse('${CommonUrl().mainurl}job.jsp'));

    if (response.statusCode == 200) {
      log("statusCode====${response.statusCode}");

      final parsed = json.decode(response.body).cast<Map<String, dynamic>>();

      print(parsed);

      return parsed.map<JobModel>((json) => JobModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load course');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchJob();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
          ),
          onPressed: () => Navigator.push(
              context, MaterialPageRoute(builder: (_) => Homepage())),
        ),
        title: Text("View Jobs"),
        backgroundColor: Colors.purple[200],
        centerTitle: true,
      ),
      body:
       Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder<List<JobModel>>(
            future: fetchJob(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                log("length====" + snapshot.data!.length.toString());
                return
                 ListView.builder(
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    final jobs=snapshot.data![index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        elevation: 9,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ListTile(
                              dense: false,
                              title: Text(
                                jobs.jobName,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                              subtitle: Text(
                                snapshot.data![index].companyName,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                              trailing: IconButton(
                                icon:
                                    const Icon(Icons.arrow_forward_ios_rounded),
                                color: Colors.purple[200],
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => Jobdetails(
                                            jobdetails: jobs,
                                          )));
                                },
                              ),
                            ),
                            Row(children: [
                              IconButton(
                                  onPressed: () => {},
                                  icon: Icon(Icons.location_pin)),
                              Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: Text(
                                  snapshot.data![index].location,
                                  textAlign: TextAlign.start,
                                ),
                              ),
                            ]),
                            Row(children: [
                              IconButton(
                                  onPressed: () => {},
                                  icon: Icon(Icons.business_center_rounded)),
                              Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: Text(
                                  snapshot.data![index].salary,
                                  textAlign: TextAlign.start,
                                ),
                              ),
                            ]),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }
              return Center(child: CircularProgressIndicator());
            }),
      ),
    );
  }
}
