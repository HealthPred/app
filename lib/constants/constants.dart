import 'package:flutter/material.dart';
import 'package:healthpred/models/models.dart';

Color kpink = const Color(0xFFEC7BC6);
Color kgreen = const Color(0xFF28EAB0);
Color kblue = const Color(0xFF26E9E5);
Color kviolet = const Color(0xFF8A86E2);
Color korange = const Color(0xFFF88342);
Color kfloro = const Color(0xFFE7FE55);
Color kprimaryDark = const Color(0xFF000000);
Color ksecondaryDark = const Color.fromARGB(255, 26, 26, 34);

List<String> symptoms = [
  'Abdominal Pain',
  'Acidity',
  'Acute Liver Failure',
  'Alcohol consumption',
  'Altered Sensorium',
  'Anxiety',
  'Back Pain',
  'Belly pain',
  'Blackheads',
  'Bladder discomfort',
  'Blister',
  'Blood in sputum',
  'Bloody Stool',
  'Blurred and Distorted Vision',
  'Breathlessness',
  'Bruising',
  'Burning Micturition',
  'Chest Pain',
  'Chills',
  'Cold Hands And Feets',
  'Constipation',
  'Continuous Sneezing',
  'Continuous feel of urine',
  'Cough',
  'Cramps',
  'Dark Urine',
  'Dehydration',
  'Depression',
  'Diarrhoea',
  'Dischromic patches',
  'Distention of abdomen',
  'Dizziness',
  'Drying And Tingling Lips',
  'Excessive Hunger',
  'Extra Marital Contacts',
  'Family history',
  'Fast Heart Rate',
  'Fatigue',
  'Fluid Overload',
  'Fluid overload',
  'Foul smell of urine',
  'Headache',
  'High Fever',
  'Hip Joint Pain',
  'Indigestion',
  'Inflammatory nails',
  'Internal itching',
  'Irregular Sugar Level',
  'Irritability',
  'Irritation In Anus',
  'Itching',
  'Joint Pain',
  'Knee Pain',
  'Lack of concentration',
  'Lethargy',
  'Loss Of Appetite',
  'Loss of Balance',
  'Malaise',
  'Mild Fever',
  'Mood Swings',
  'Movement Stiffness',
  'Mucoid sputum',
  'Muscle Pain',
  'Muscle Wasting',
  'Muscle Weakness',
  'Nausea',
  'Neck Pain',
  'Nodal Skin Eruptions',
  'Obesity',
  'Pain Behind The Eyes',
  'Pain During Bowel Movements',
  'Pain In Anal Region',
  'Painful walking',
  'Passage of gases',
  'Patches In Throat',
  'Phlegm',
  'Prominent veins on calf',
  'Puffy Face And Eyes',
  'Pus filled pimples',
  'Red sore around nose',
  'Red spots over body',
  'Restlessness',
  'Rusty sputum',
  'Scurring',
  'Shivering',
  'Silver like dusting',
  'Skin Rash',
  'Skin peeling',
  'Small dents in nails',
  'Spinning Movements',
  'Spotting Urination',
  'Stiff Neck',
  'Stomach Pain',
  'Sunken Eyes',
  'Sweating',
  'Swelled Lymph Nodes',
  'Swelling Joints',
  'Swelling Of Stomach',
  'Swollen Blood Vessels',
  'Swollen Legs',
  'Throat Irritation',
  'Toxic look (typhos)',
  'Ulcers On Tongue',
  'Unsteadiness',
  'Visual disturbances',
  'Vomiting',
  'Watering from eyes',
  'Weakness In Limbs',
  'Weakness of one body side',
  'Weight Gain',
  'Weight Loss',
  'Yellow Urine',
  'Yellow crust ooze',
  'Yellowing Of Eyes',
  'Yellowish Skin',
];

Map<String, int> map = {
  'Itching': 0,
  'Skin Rash': 1,
  'Nodal Skin Eruptions': 2,
  'Continuous Sneezing': 3,
  'Shivering': 4,
  'Chills': 5,
  'Joint Pain': 6,
  'Stomach Pain': 7,
  'Acidity': 8,
  'Ulcers On Tongue': 9,
  'Muscle Wasting': 10,
  'Vomiting': 11,
  'Burning Micturition': 12,
  'Spotting Urination': 13,
  'Fatigue': 14,
  'Weight Gain': 15,
  'Anxiety': 16,
  'Cold Hands And Feets': 17,
  'Mood Swings': 18,
  'Weight Loss': 19,
  'Restlessness': 20,
  'Lethargy': 21,
  'Patches In Throat': 22,
  'Irregular Sugar Level': 23,
  'Cough': 24,
  'High Fever': 25,
  'Sunken Eyes': 26,
  'Breathlessness': 27,
  'Sweating': 28,
  'Dehydration': 29,
  'Indigestion': 30,
  'Headache': 31,
  'Yellowish Skin': 32,
  'Dark Urine': 33,
  'Nausea': 34,
  'Loss Of Appetite': 35,
  'Pain Behind The Eyes': 36,
  'Back Pain': 37,
  'Constipation': 38,
  'Abdominal Pain': 39,
  'Diarrhoea': 40,
  'Mild Fever': 41,
  'Yellow Urine': 42,
  'Yellowing Of Eyes': 43,
  'Acute Liver Failure': 44,
  'Fluid Overload': 45,
  'Swelling Of Stomach': 46,
  'Swelled Lymph Nodes': 47,
  'Malaise': 48,
  'Blurred and Distorted Vision': 49,
  'Phlegm': 50,
  'Throat Irritation': 51,
  'Chest Pain': 52,
  'Weakness In Limbs': 53,
  'Fast Heart Rate': 54,
  'Pain During Bowel Movements': 55,
  'Pain In Anal Region': 56,
  'Bloody Stool': 57,
  'Irritation In Anus': 58,
  'Neck Pain': 59,
  'Dizziness': 60,
  'Cramps': 61,
  'Bruising': 62,
  'Obesity': 63,
  'Swollen Legs': 64,
  'Swollen Blood Vessels': 65,
  'Puffy Face And Eyes': 66,
  'Excessive Hunger': 67,
  'Extra Marital Contacts': 68,
  'Drying And Tingling Lips': 69,
  'Knee Pain': 70,
  'Hip Joint Pain': 71,
  'Muscle Weakness': 72,
  'Stiff Neck': 73,
  'Swelling Joints': 74,
  'Movement Stiffness': 75,
  'Spinning Movements': 76,
  'Loss of Balance': 77,
  'Unsteadiness': 78,
  'Weakness of one body side': 79,
  'Bladder discomfort': 80,
  'Foul smell of urine': 81,
  'Continuous feel of urine': 82,
  'Passage of gases': 83,
  'Internal itching': 84,
  'Toxic look (typhos)': 85,
  'Depression': 86,
  'Irritability': 87,
  'Muscle Pain': 88,
  'Altered Sensorium': 89,
  'Red spots over body': 90,
  'Belly pain': 91,
  'Dischromic patches': 92,
  'Watering from eyes': 93,
  'Family history': 94,
  'Mucoid sputum': 95,
  'Rusty sputum': 96,
  'Lack of concentration': 97,
  'Visual disturbances': 98,
  'Distention of abdomen': 99,
  'Alcohol consumption': 100,
  'Fluid overload': 101,
  'Blood in sputum': 102,
  'Prominent veins on calf': 103,
  'Painful walking': 104,
  'Pus filled pimples': 105,
  'Blackheads': 106,
  'Scurring': 107,
  'Skin peeling': 108,
  'Silver like dusting': 109,
  'Small dents in nails': 110,
  'Inflammatory nails': 111,
  'Blister': 112,
  'Red sore around nose': 113,
  'Yellow crust ooze': 114,
};

//values for charts
//Diabetes
List<List<Pair>> diabetesData = [
  //Glucose
  [
    Pair(text: 'Min', value: 20),
    Pair(text: 'Max', value: 140),
  ],
  // BP (Diastolic) (mm Hg)
  [
    Pair(text: 'Min', value: 40),
    Pair(text: 'Max', value: 80),
  ],
  //Insulin (mu U/ml)
  [
    Pair(text: 'Min', value: 20),
    Pair(text: 'Max', value: 140),
  ],
  //Diabetes Pedegree Function
  [
    Pair(text: 'Min', value: 0.1),
    Pair(text: 'Max', value: 0.15),
  ],
];

//Heart
List<List<Pair>> heartData = [
  //RestingBP (mmHg)
  [
    Pair(text: 'Min', value: 60),
    Pair(text: 'Max', value: 120),
  ],
  // Cholestrol (mg/dL)
  [
    Pair(text: 'Min', value: 10),
    Pair(text: 'Max', value: 200),
  ],
  //Max HR (beats per min)
  [
    Pair(text: 'Min', value: 10),
    Pair(text: 'Max', value: 200),
  ],
  //OldPeak (mm)
  [
    Pair(text: 'Min', value: 0.1),
    Pair(text: 'Max', value: 1),
  ],
];

//Liver
List<List<Pair>> liverData = [
  //Total Billirubin (mg/dL)
  [
    Pair(text: 'Min', value: 0.3),
    Pair(text: 'Max', value: 1.2),
  ],
  // Direct Billirubin (mg/dL)
  [
    Pair(text: 'Min', value: 0.0),
    Pair(text: 'Max', value: 0.3),
  ],
  //Alkaline_Phosphotase in IU/L
  [
    Pair(text: 'Min', value: 30),
    Pair(text: 'Max', value: 120),
  ],
  //Alamine_Aminotransferase in IU/L
  [
    Pair(text: 'Min', value: 7),
    Pair(text: 'Max', value: 55),
  ],
  //Aspartate_Aminotransferase in IU/L
  [
    Pair(text: 'Min', value: 10),
    Pair(text: 'Max', value: 40),
  ],
  //Total Proteins
  [
    Pair(text: 'Min', value: 6.0),
    Pair(text: 'Max', value: 8.3),
  ],
  //Albumin in g/dL
  [
    Pair(text: 'Min', value: 3.4),
    Pair(text: 'Max', value: 5.4),
  ],
  //Albumin_and_Globulin_Ratio
  [
    Pair(text: 'Min', value: 1.0),
    Pair(text: 'Max', value: 2.5),
  ],
];

List<List<Pair>> cancerData = [
  //Smoking
  [
    Pair(text: 'Min', value: 0),
    Pair(text: 'Max', value: 0),
  ],

  //Yellow Fingers
  [
    Pair(text: 'Min', value: 0),
    Pair(text: 'Max', value: 0),
  ],

  //Anxiety
  [
    Pair(text: 'Min', value: 0),
    Pair(text: 'Max', value: 1),
  ],

  //Peer Pressure
  [
    Pair(text: 'Min', value: 0),
    Pair(text: 'Max', value: 1),
  ],

  //Chronic disease
  [
    Pair(text: 'Min', value: 0),
    Pair(text: 'Max', value: 0),
  ],

  //Fatigue
  [
    Pair(text: 'Min', value: 0),
    Pair(text: 'Max', value: 1),
  ],

  //Allergy
  [
    Pair(text: 'Min', value: 0),
    Pair(text: 'Max', value: 1),
  ],

  //Wheezing
  [
    Pair(text: 'Min', value: 0),
    Pair(text: 'Max', value: 1),
  ],

  //Alcohol consumption
  [
    Pair(text: 'Min', value: 0),
    Pair(text: 'Max', value: 0),
  ],

  //Coughing
  [
    Pair(text: 'Min', value: 0),
    Pair(text: 'Max', value: 1),
  ],

  //Shortness of Breadth
  [
    Pair(text: 'Min', value: 0),
    Pair(text: 'Max', value: 0),
  ],

  //Swallowing Problem
  [
    Pair(text: 'Min', value: 0),
    Pair(text: 'Max', value: 0),
  ],

  //Chest Pain
  [
    Pair(text: 'Min', value: 0),
    Pair(text: 'Max', value: 0),
  ],
];
