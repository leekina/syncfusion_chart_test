//Data클래스
class DataJson {
  String date;
  double value;
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

//DataList클래스
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
    {"idx": "1", "date": "2023-07-01", "value": "0.50"},
    {"idx": "2", "date": "2023-07-02", "value": "1.70"},
    {"idx": "7", "date": "2023-07-03", "value": "2.20"},
    {"idx": "12", "date": "2023-07-04", "value": "3.75"},
    {"idx": "15", "date": "2023-07-05", "value": "4.50"},
    {"idx": "18", "date": "2023-07-06", "value": "5.73"},
    {"idx": "26", "date": "2023-07-07", "value": "6.40"},
    {"idx": "29", "date": "2023-07-08", "value": "7.27"},
    {"idx": "30", "date": "2023-07-09", "value": "8.23"},
    {"idx": "35", "date": "2023-07-10", "value": "9.02"},
    {"idx": "43", "date": "2023-07-11", "value": "10.71"},
    {"idx": "44", "date": "2023-07-12", "value": "11.16"},
    {"idx": "45", "date": "2023-07-13", "value": "12.68"},
    {"idx": "46", "date": "2023-07-14", "value": "13.95"},
    {"idx": "47", "date": "2023-07-15", "value": "14.84"},
    {"idx": "51", "date": "2023-07-16", "value": "15.97"},
    {"idx": "53", "date": "2023-07-17", "value": "16.64"},
    {"idx": "55", "date": "2023-07-18", "value": "17.53"},
    {"idx": "59", "date": "2023-07-19", "value": "18.57"},
    {"idx": "61", "date": "2023-07-20", "value": "19.53"},
    {"idx": "69", "date": "2023-07-21", "value": "20.76"},
    {"idx": "75", "date": "2023-07-22", "value": "21.08"},
    {"idx": "79", "date": "2023-07-23", "value": "22.59"},
    {"idx": "80", "date": "2023-07-24", "value": "23.98"},
    {"idx": "90", "date": "2023-07-25", "value": "25.00"},
    {"idx": "112", "date": "2023-07-26", "value": "25.36"},
    {"idx": "185", "date": "2023-07-27", "value": "26.53"},
    {"idx": "215", "date": "2023-07-29", "value": "28.89"},
    {"idx": "394", "date": "2023-07-30", "value": "29.05"}
  ]
};

//json으로 데이터 가져오는것 처럼
Future<List<DataJson>> getData() async {
  List<DataJson> temp = [];
  await Future.delayed(const Duration(milliseconds: 500));
  for (Map data in response['data']) {
    temp.add(DataJson(date: data["date"], value: double.parse(data["value"])));
  }
  print(temp);

  return temp;
}


//더미데이터 만들때 사용한 함수
// void createDummyData() {
//   // date, value
//   DateTime first = DateTime(2023, 7, 1);
//   DateTime end = DateTime(2023, 7, 31);

//   int diff = end.difference(first).inDays;
//   String temp1;
//   double n;
//   String tn;

//   for (int i = 0; i < diff; i++) {
//     temp1 = DateFormat('yyyy-MM-dd').format(first);
//     n = i + Random().nextDouble();
//     tn = n.toStringAsFixed(2);
//     print("${temp1} : $tn,\n");
//     first = first.add(Duration(days: 1));
//   }
// }