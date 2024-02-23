import 'dart:convert';
import 'dart:developer';
import 'package:final_project/commonurl.dart';
import 'package:final_project/model/applymodel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:shared_preferences/shared_preferences.dart';

class ApiService {
  late Future<List<ApplyModel>> applyjoblist;

  Future<List<ApplyModel>> fetchapplyJobs(String type) async {
    try {
      log("inside the fetchapplyJobs functionmessage");
      final prefs = await SharedPreferences.getInstance();
      String? username = prefs.getString('username');
      log("username======== $username");
      Map data = {
        'username': username,
        'type': type,
      };
      final response = await http.post(
          Uri.parse('${CommonUrl().mainurl}getAppliedjobs.jsp'),
          body: data);

      if (response.statusCode == 200) {
        log("Jobs==== : ${response.body}");
        List res = jsonDecode(response.body);
        return res.map((e) => ApplyModel.fromJson(e)).toList();
      }
    } catch (e) {
      log(" fetchapplyJobs message  :$e");
    }
    return applyjoblist;
  }

  // late Future<List<JobModel>> joblist;

  // Future<List<JobModel>> fetchJobs() async {
  //   try {
  //     log("inside the fetchJobs functionmessage");
  //     final response =
  //         await http.get(Uri.parse('${CommonUrl().mainurl}getJobs.jsp'));

  //     if (response.statusCode == 200) {
  //       log("Jobs==== : ${response.body}");
  //       List res = jsonDecode(response.body);
  //       return res.map((e) => JobModel.fromJson(e)).toList();
  //     }
  //   } catch (e) {
  //     log(" District message  :$e");
  //   }
  //   return joblist;
  // }

  // late Future<List<AnnouncementModel>> announcementlist;
  // Future<List<AnnouncementModel>> fetchannouncements() async {
  //   try {
  //     log("inside the fetchannouncements functionmessage");
  //     final response = await http
  //         .get(Uri.parse('${CommonUrl().mainurl}getannouncement.jsp'));

  //     if (response.statusCode == 200) {
  //       log("Jobs==== : ${response.body}");
  //       List res = jsonDecode(response.body);
  //       return res.map((e) => AnnouncementModel.fromJson(e)).toList();
  //     }
  //   } catch (e) {
  //     log(" District message  :$e");
  //   }
  //   return announcementlist;
  // }
}