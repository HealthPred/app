class PredictionModel {
  String prediction;
  String description;
  List<String> medicationNames;
  List<String> medicationDesc;

  PredictionModel(
      {required this.prediction,
      required this.description,
      required this.medicationNames,
      required this.medicationDesc});
}
