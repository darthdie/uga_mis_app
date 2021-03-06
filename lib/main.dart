import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

import './ui/home.dart';

void main() async {
  List facultyData = await _getFacultyData();
  List courseData = await _getCourseData();

  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(new MaterialApp(
    home: Home(facultyData, courseData),
  ));
}

Future<List> _getFacultyData() async {
  String url = 'http://209.97.157.66/DATA/UGA/MIS/FACULTY';

  final response = await http.get(url);
  return json.decode(response.body);
}

Future<List> _getCourseData() async {
  String url = 'http://209.97.157.66/DATA/UGA/MIS/COURSES';

  final response = await http.get(url);
  return json.decode(response.body);
}
