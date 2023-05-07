import 'package:http/http.dart' as http;
import 'package:healthpred/models/prediction_model.dart';
import 'dart:convert';

class Predict {
  Future<PredictionModel> predictResults(
      List<String> params, String type) async {
    String query = formatParam(params);
    PredictionModel result;

    List<dynamic> data = [];
    String apiUrl = 'https://healthpred-api.onrender.com/predict-$type?$query';
    final response = await http.get(Uri.parse(apiUrl));
    print('URL: $apiUrl');

    if (response.statusCode == 200) {
      data = jsonDecode(response.body);
      //print data
      //print(data);

      //clean data
      String prediction = data[0]['prediction'];
      String description = data[1]['description'];
      List<dynamic> medicationNamesJson = data[2]['medication_names'];
      List<String> medicationNames =
          medicationNamesJson.map((medJson) => medJson.toString()).toList();
      List<dynamic> medicationsDescJson = data[3]['medications_desc'];
      List<String> medicationDesc =
          medicationsDescJson.map((descJson) => descJson.toString()).toList();

      //make data model
      result = PredictionModel(
          prediction: prediction,
          description: description,
          medicationNames: medicationNames,
          medicationDesc: medicationDesc);

      return result;
    } else {
      print('Failed to load data with error code: ${response.statusCode}');

      //make data model
      //error
      result = PredictionModel(
        prediction: '-1',
        description: '',
        medicationNames: [],
        medicationDesc: [],
      );
      return result;
    }
  }

  String formatParam(List<String> params) {
    String res = '';
    print('params: $params');
    for (String val in params) {
      res = '${res}arr=$val&';
    }
    List<String> temp = [];
    res = res.substring(0, res.length - 1);
    temp.add(res);
    print(temp);
    return res;
  }
}
