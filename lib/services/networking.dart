import 'dart:convert';

import 'package:http/http.dart' as http;

class NetWorkHelper {
  final String url;
  static const api_key = '72c9d570ecd3828248fb8198e83651d3';
  NetWorkHelper(this.url);
//  'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$api_key&units=metric'
  Future getData() async {
    //print(url + '&appid=$api_key&units=metric');
    var DecodedData;
    http.Response response =
        await http.get(url + '&appid=$api_key&units=metric');
    if (response.statusCode == 200) {
      String data = response.body;
      DecodedData = jsonDecode(data);
    } else {
      print(response.statusCode);
    }
    return DecodedData;
  }
}
