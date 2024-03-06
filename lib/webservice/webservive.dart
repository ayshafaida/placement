import 'dart:convert';
import 'dart:developer';


import 'package:final_project/commonurl.dart';
import 'package:final_project/model/jobmodel.dart';
import 'package:http/http.dart' as http;

class Webservice{
    var mainprogramdata = [];
  List<JobModel> mainprogramresults = [];

  Future<List<JobModel>> fetchJob({String? query}) async {
    var url = Uri.parse('${CommonUrl().mainurl}job.jsp');
    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {
        mainprogramdata = json.decode(response.body);
        mainprogramresults =
            mainprogramdata.map((e) => JobModel.fromJson(e)).toList();
            log("query ==== "+query.toString());
        if (query != null) {
          mainprogramresults = mainprogramresults
              .where((element) => element.jobName
                  .toLowerCase()
                  .contains((query.toLowerCase())))
              .toList();
        }
      } else {
        print("fetch error");
      }
    } on Exception catch (e) {
      print('error: $e');
    }
    return mainprogramresults;
  }
}