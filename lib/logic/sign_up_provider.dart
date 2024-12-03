import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:user_maneger/logic/extensions.dart';
import 'package:user_maneger/screens/user_maneger.dart';

class SignUpProvider extends ChangeNotifier {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool loadingSignUp = false;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<void> signUp (BuildContext context) async{
    loadingSignUp = true;
    notifyListeners();
    if (formKey.currentState != null && formKey.currentState!.validate()){
      String email = emailController.text;
      String password = passwordController.text;
      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
        if (FirebaseAuth.instance.currentUser != null){
          if (context.mounted){
            context.goAndRemoveAll(const UserManeger());
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Created your new account")));}
        }
      }on FirebaseAuthException catch(e){
        if (context.mounted){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.message ?? "There are an error")));
        }
      }catch (e){
        if (context.mounted){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
        }
      }
    }
    loadingSignUp = false;
    notifyListeners();
  }
}