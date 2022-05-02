import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import './screens/history.dart';
import './screens/homescreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Calculator',
        routes: {
          '/home': (context) => HomeScreen(),
          '/history': (context) => HistoryScreen()
        },
        theme: ThemeData(
          primarySwatch: Colors.yellow,
        ),
        home: HomeScreen());
  }
}
