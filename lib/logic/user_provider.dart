import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  List<DataRow> usersData = [];

  void startGitData() {
    FirebaseFirestore.instance.collection("users").snapshots().listen((data) {
      if (data.docs.isNotEmpty) {
        usersData.clear();
        for (int i = 0; i < data.docs.length; i++) {
          usersData.add(DataRow(cells: [
            DataCell(Text(data.docs[i]['name'])),
            DataCell(Text(data.docs[i]['age'].toString())),
          ]));
        }
      }
      notifyListeners();
    });
  }

  TextEditingController name = TextEditingController();
  TextEditingController age = TextEditingController();

  void addData () async{
    String userName = name.text;
    int? userAge = int.tryParse(age.text);

    if (userAge != null && userName.isNotEmpty){
      await FirebaseFirestore.instance.collection("users").add({
        "name" : userName,
        "age" : userAge
      });
      name.clear();
      age.clear();
    }
  }
}
