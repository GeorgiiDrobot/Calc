import 'package:cloud_firestore/cloud_firestore.dart';

double firstNum = 0;
double secondNum = 0;

String result = "0";
String example = "";

bool dataIsEntered = false;

void addToFirebase(data) async {
  CollectionReference calculations = FirebaseFirestore.instance.collection('calculations');
  await calculations.add({
    'equation': data
  });
}

double Plus(double firstNum, double secondNum) => (firstNum + secondNum);

double Minus(double firstNum, double secondNum) => (firstNum - secondNum);

double Multiply(double firstNum, double secondNum) => (firstNum * secondNum);

double Div(double firstNum, double secondNum) => (firstNum / secondNum);
