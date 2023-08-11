// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void createDummyData() {
  // date, value
  DateTime first = DateTime(2023, 7, 1);
  DateTime end = DateTime(2023, 7, 31);

  int diff = end.difference(first).inDays;
  String temp1;
  double n;
  String tn;

  for (int i = 0; i < diff; i++) {
    temp1 = DateFormat('yyyy-MM-dd').format(first);
    n = i + Random().nextDouble();
    tn = n.toStringAsFixed(2);
    print("${temp1} : $tn,\n");
    first = first.add(Duration(days: 1));
  }
}

class DataJson {
  String date;
  String value;
  DataJson({
    required this.date,
    required this.value,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'date': date,
      'value': value,
    };
  }

  DataJson.fromJson_server(Map<String, dynamic> json)
      : date = json['date'],
        value = json['value'];
}

class DataList {
  List<DataJson> dummy;
  DataList({
    required this.dummy,
  });

  set setData(List<DataJson> data) {
    dummy = data;
  }
}

dynamic response = {
  "data": [
    {"date": "2023-07-01", "value": "0.50"},
    {"date": "2023-07-02", "value": "1.70"},
    {"date": "2023-07-03", "value": "2.20"},
    {"date": "2023-07-04", "value": "3.75"},
    {"date": "2023-07-05", "value": "4.50"},
    {"date": "2023-07-06", "value": "5.73"},
    {"date": "2023-07-07", "value": "6.40"},
    {"date": "2023-07-08", "value": "7.27"},
    {"date": "2023-07-09", "value": "8.23"},
    {"date": "2023-07-10", "value": "9.02"},
    {"date": "2023-07-11", "value": "10.71"},
    {"date": "2023-07-12", "value": "11.16"},
    {"date": "2023-07-13", "value": "12.68"},
    {"date": "2023-07-14", "value": "13.95"},
    {"date": "2023-07-15", "value": "14.84"},
    {"date": "2023-07-16", "value": "15.97"},
    {"date": "2023-07-17", "value": "16.64"},
    {"date": "2023-07-18", "value": "17.53"},
    {"date": "2023-07-19", "value": "18.57"},
    {"date": "2023-07-20", "value": "19.53"},
    {"date": "2023-07-21", "value": "20.76"},
    {"date": "2023-07-22", "value": "21.08"},
    {"date": "2023-07-23", "value": "22.59"},
    {"date": "2023-07-24", "value": "23.98"},
    {"date": "2023-07-25", "value": "25.00"},
    {"date": "2023-07-26", "value": "25.36"},
    {"date": "2023-07-27", "value": "26.53"},
    {"date": "2023-07-29", "value": "28.89"},
    {"date": "2023-07-30", "value": "29.05"}
  ]
};

Future<dynamic> getData() async {
  List<DataJson> temp = [];
  await Future.delayed(const Duration(seconds: 1));
  for (Map data in response['data']) {
    temp.add(DataJson(date: data["date"], value: data["value"]));
  }
  print(temp);

  return temp;
}
