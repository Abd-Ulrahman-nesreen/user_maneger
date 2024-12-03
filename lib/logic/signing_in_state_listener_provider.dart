import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SigningInStateProvider extends ChangeNotifier {
  bool signedIn = false;

  void listen (){
    FirebaseAuth.instance.authStateChanges().listen((user){
      signedIn = user != null;
      notifyListeners();
    });
  }
}