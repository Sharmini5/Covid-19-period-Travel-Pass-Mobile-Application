

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CourseApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("course")

      ),
      body: StreamBuilder(
        stream: Firestore.instance.collection("Travel_permission").snapshots(),
        
        builder: (context, snapshot){
          return ListView.builder(
            itemCount: snapshot.data.documents.length,
            itemBuilder: (context, index){
                DocumentSnapshot course  = snapshot.data.documents[index];

                  return ListTile(
                    leading: Image.network(course['PCR_report'].toString()),
                    title: Text(course['NIC']),
                  );

            },

            );
        },

       ),
    );
  }
}