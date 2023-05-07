import 'dart:ffi';

import 'package:http/http.dart' as http;
import 'dart:convert';

class Services {
  Future<List<dynamic>> predict(List<double> arr) async {
    //https://healthpred-api.onrender.com/predict-diseases?arr=1&arr=2&arr=3&arr=4&arr=5
    //https://healthpred-api.onrender.com/predict-diabetes?arr=6&arr=148&arr=72&arr=35&arr=0&arr=33.6&arr=0.627&arr=50
    List<dynamic> data = [];
    const apiUrl =
        'https://healthpred-api.onrender.com/predict-diseases?arr=1&arr=2&arr=3&arr=4&arr=5';
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      data = jsonDecode(response.body);
      //print data
      print(data);

      return data;
    } else {
      print('Failed to load data with error code: ${response.statusCode}');
      return data;
    }
  }
}
