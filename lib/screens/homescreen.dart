import 'package:flutter/material.dart';

import '../methods/calc_meth.dart';
import 'history.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      theme: ThemeData(primarySwatch: Colors.yellow),
      home: SimpleCalculator(),
    );
  }
}

class SimpleCalculator extends StatefulWidget {
  @override
  _SimpleCalculatorState createState() => _SimpleCalculatorState();
}

class _SimpleCalculatorState extends State<SimpleCalculator> {
  double firstNum = 0;
  double secondNum = 0;

  String result = "0";
  String example = "";

  bool dataIsEntered = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Calculator'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.receipt),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HistoryScreen()),
                );
              },
            )
          ],
        ),
        body: Column(children: <Widget>[
          Container(
              margin: new EdgeInsets.fromLTRB(10, 30, 10, 30),
              child: TextField(
                decoration: InputDecoration(hintText: 'First number'),
                keyboardType: TextInputType.number,
                onChanged: (String firstNum) {
                  if (firstNum.isNotEmpty) {
                    this.firstNum = double.parse(firstNum.replaceAll(",", '.'));
                    if (this.firstNum != null && this.secondNum != null) {
                      setState(() {
                        dataIsEntered = true;
                      });
                    }
                  } else {
                    this.firstNum = 0;
                    setState(() {
                      dataIsEntered = false;
                    });
                  }
                },
              )),
          Container(
              margin: new EdgeInsets.fromLTRB(10, 30, 10, 30),
              child: TextField(
                decoration: InputDecoration(hintText: 'Second number'),
                keyboardType: TextInputType.number,
                onChanged: (String power) {
                  if (power.isNotEmpty) {
                    this.secondNum = double.parse(power.replaceAll(",", '.'));
                    if (this.firstNum != null && this.secondNum != null) {
                      setState(() {
                        dataIsEntered = true;
                      });
                    }
                  } else {
                    this.secondNum = 0;
                    setState(() {
                      dataIsEntered = false;
                    });
                  }
                },
              )),
          Container(
            margin: new EdgeInsets.fromLTRB(0, 30, 10, 30),
            child: Text(
              "Result: $result",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
          ),
          Expanded(
            child: Divider(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width * 1,
                child: Table(
                  children: [
                    TableRow(children: [
                      ElevatedButton(
                        child: Text(" + "),
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.all(16.0),
                          primary: Colors.grey,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0.0), side: BorderSide(color: Colors.black, width: 1, style: BorderStyle.solid)),
                        ),
                        onPressed: dataIsEntered
                            ? () {
                                setState(() {
                                  result = Plus(firstNum, secondNum).toString();
                                  example = "$firstNum + $secondNum = $result";
                                });
                                addToFirebase(example);
                              }
                            : null,
                      ),
                      ElevatedButton(
                        child: Text(" - "),
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.all(16.0),
                          primary: Colors.grey,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0.0), side: BorderSide(color: Colors.black, width: 1, style: BorderStyle.solid)),
                        ),
                        onPressed: dataIsEntered
                            ? () {
                                setState(() {
                                  result = Minus(firstNum, secondNum).toString();
                                  example = "$firstNum - $secondNum = $result";
                                });
                                addToFirebase(example);
                              }
                            : null,
                      ),
                      ElevatedButton(
                        child: Text(" * "),
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.all(16.0),
                          primary: Colors.grey,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0.0), side: BorderSide(color: Colors.black, width: 1, style: BorderStyle.solid)),
                        ),
                        onPressed: dataIsEntered
                            ? () {
                                setState(() {
                                  result = Multiply(firstNum, secondNum).toString();
                                  example = "$firstNum * $secondNum = $result";
                                });
                                addToFirebase(example);
                              }
                            : null,
                      ),
                      ElevatedButton(
                        child: Text(" / "),
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.all(16.0),
                          primary: Colors.grey,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0.0), side: BorderSide(color: Colors.black, width: 1, style: BorderStyle.solid)),
                        ),
                        onPressed: dataIsEntered
                            ? () {
                                setState(() {
                                  if (secondNum != 0) result = Div(firstNum, secondNum).toString();
                                  example = "$firstNum / $secondNum = $result";
                                });
                                addToFirebase(example);
                              }
                            : null,
                      ),
                    ]),
                  ],
                ),
              )
            ],
          ),
        ]));
  }
}
