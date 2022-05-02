import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HistoryScreen extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("History"),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('calculations').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          return ListView(
            padding: const EdgeInsets.fromLTRB(5, 20, 5, 0),
            children: snapshot.data.docs.map((document) {
              return Container(
                child: Center(child: Text(document['equation'])),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
