import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:healthpred/services/get_data.dart';

class RequestScreen extends StatefulWidget {
  const RequestScreen({super.key});

  @override
  State<RequestScreen> createState() => _RequestScreenState();
}

class _RequestScreenState extends State<RequestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HealthPred'),
      ),
      body: Center(
        child: MaterialButton(
          onPressed: () async {
            //make request
            List<double> arr = [6, 148, 72, 35, 0, 33.6, 0.627, 50];

            print('loading....');
            List<dynamic> data = await Services().predict(arr);
            print('request made successfully...');

            //print data
            if (data.isNotEmpty) {
              // Extract the prediction, description, medication_names, and medications_desc fields
              String prediction = data[0]['prediction'];
              String description = data[1]['description'];
              List<dynamic> medicationNamesJson = data[2]['medication_names'];
              List<String> medicationNames = medicationNamesJson
                  .map((medJson) => medJson.toString())
                  .toList();
              List<dynamic> medicationsDescJson = data[3]['medications_desc'];
              List<String> medicationsDesc = medicationsDescJson
                  .map((descJson) => descJson.toString())
                  .toList();

              print('prediction: $prediction');
              print('description: $description');
              print('medicationNames: $medicationNames');
              print('medication desc: $medicationsDesc');
            } else {
              //show alert stating error in getting data
            }
          },
          color: Colors.lightBlue,
          child: const Text(
            'GET',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
