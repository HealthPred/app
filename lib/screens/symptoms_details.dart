import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:healthpred/constants/constants.dart';
import 'package:healthpred/screens/general_risk_screen.dart';
import 'package:healthpred/widgets/symptoms_card.dart';

class SymptomsDetails extends StatefulWidget {
  const SymptomsDetails({super.key});

  @override
  State<SymptomsDetails> createState() => _SymptomsDetailsState();
}

class _SymptomsDetailsState extends State<SymptomsDetails> {
  var typeAheadController = TextEditingController();
  List<String> addedSymptoms = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kprimaryDark,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 60),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //BACK
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(14)),
                    color: ksecondaryDark,
                  ),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.arrow_back_ios_new,
                      size: 24,
                    ),
                  ),
                ),

                //NEXT
                GestureDetector(
                  onTap: () {
                    //check if symptoms are added
                    if (addedSymptoms.length < 4) {
                      //show alert
                      const snackBar = SnackBar(
                        content: Text('Insert Atleast 4 Symptoms.'),
                      );

                      ScaffoldMessenger.of(context).showSnackBar(snackBar);

                      return;
                    }

                    //make params
                    List<String> params = [];
                    for (String symp in addedSymptoms) {
                      int? index = map[symp];
                      String s = index.toString();
                      params.add(s);
                    }

                    //navigate
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => GeneralRiskScreen(
                          params: params,
                        ),
                      ),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(14)),
                      color: ksecondaryDark,
                    ),
                    child: const Icon(
                      Icons.check_circle,
                      size: 24,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 28,
            ),
            const Text(
              'Enter Symptoms',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20,
            ),

            //Typeahead Field
            TypeAheadField(
              suggestionsCallback: (pattern) {
                //get symptoms
                return symptoms.where((element) =>
                    element.toLowerCase().contains(pattern.toLowerCase()));
              },
              itemBuilder: (context, suggestion) {
                return ListTile(
                  trailing: const Icon(Icons.add),
                  dense: true,
                  title: Text(
                    suggestion.toString(),
                    style: const TextStyle(fontSize: 15),
                  ),
                );
              },
              onSuggestionSelected: (suggestion) {
                print(suggestion);

                //clear textfield
                typeAheadController.clear();

                //add suggestion to list
                setState(() {
                  addedSymptoms.add(suggestion);
                  //remove selected suggestion from original list
                  symptoms.remove(suggestion);
                  symptoms.sort();
                });
              },
              textFieldConfiguration: TextFieldConfiguration(
                autofocus: false,
                controller: typeAheadController,
                cursorColor: Colors.white,
                style: const TextStyle(fontSize: 16.0),
                decoration: InputDecoration(
                  hintText: 'High Fever',
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
                  filled: true,
                  fillColor: ksecondaryDark,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),
            //LIST
            const SizedBox(
              height: 40,
            ),
            const Text(
              'Added Symptoms',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: addedSymptoms.isNotEmpty
                  ? ListView.builder(
                      itemBuilder: ((context, index) {
                        return SymptomCard(
                          onTapCallback: () {
                            //remove added symptoms
                            setState(() {
                              String removedSymptom = addedSymptoms[index];
                              addedSymptoms.removeAt(index);

                              //again add
                              symptoms.add(removedSymptom);
                              symptoms.sort();
                            });
                          },
                          name: addedSymptoms[index],
                        );
                      }),
                      itemCount: addedSymptoms.length,
                    )
                  : Container(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: const Center(
                        child: Text(
                          'Added Symptoms will be displayed here',
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: Color.fromARGB(255, 100, 100, 100)),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
