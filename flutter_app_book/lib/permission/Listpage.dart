import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';

import 'package:flutter_app_book/permission/DetailPage.dart';


class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  Future getPosts() async {
    var firestore = Firestore.instance;
    QuerySnapshot qn =
        await firestore.collection("Travel_permission").getDocuments();
    return qn.documents;
  }
    displayFile(imageFile) async {

    String fileName = 'PCR_report';
    var data = await FirebaseStorage.instance.ref().child(fileName).getData(10000000);
    var text = new String.fromCharCodes(data);
    return new NetworkImage(text);

  }


  navigateToDetail(DocumentSnapshot post) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => DetailPage(post: post)));
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Permission requests"),
      ),
      body: Container(
          color: Colors.blue,
          child: FutureBuilder(
              future: getPosts(),
              builder: (_, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: Text("Loading..."),
                  );
                } else {
                  return ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (BuildContext context, index) {
                        return Material(
                            child: ListTile(
                         title: Text(snapshot.data[index].data['NIC'].toString()),
                         subtitle: Text(snapshot.data[index].data['Name'].toString()),
                          onTap: () => navigateToDetail(snapshot.data[index]),
                        ));
                      });
                }
              })),
    );
  }
}
