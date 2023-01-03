import 'dart:convert';
import 'dart:math';

import 'package:big_data/models/members_models.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

List<Members> list = [];
List<Members> list1 = [];
List<Members> list2 = [];
List<Members> list3 = [];
Future fetchMembers() async {
  //List<Members> list = [];
  final response =
      await http.get(Uri.parse("https://bdcoe.onrender.com/api/v1/member"));
  //print(json.decode(response.body));
  Map<String, dynamic> dat = json.decode(response.body);
  final data = dat['data'];
  for (int i = 0; i < data.length; i++) {
    list.add(Members.fromJson(data[i]));
  }
  int maxi = 0;
  for (int i = 0; i < list.length; i++) {
    maxi = max(maxi, list[i].graduation);
  }
  if (list1.length == 0) {
    for (int i = 0; i < list.length; i++) {
      if (list[i].graduation == maxi) {
        list1.add(Members.fromJson(data[i]));
      }
    }
  }
  if (list2.length == 0) {
    for (int i = 0; i < list.length; i++) {
      if (list[i].graduation == maxi - 1) {
        list2.add(Members.fromJson(data[i]));
      }
    }
  }
  if (list3.length == 0) {
    for (int i = 0; i < list.length; i++) {
      if (list[i].graduation == maxi - 2) {
        list3.add(Members.fromJson(data[i]));
      }
    }
  }
  return list;
}
