import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignInProvide extends ChangeNotifier {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool loadingSignIn = false;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<void> signIn (BuildContext context) async{
    loadingSignIn = true;
    notifyListeners();
    if (formKey.currentState != null && formKey.currentState!.validate()){
      String email = emailController.text;
      String password = emailController.text;
      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
        if (FirebaseAuth.instance.currentUser != null && context.mounted){
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Signed in to your account")));}
      }on FirebaseAuthException catch (e){
        if (context.mounted){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.message ?? "There are an error")));
        }
      }catch (e){
        if (context.mounted){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
        }
      }
    }
    loadingSignIn = false;
    notifyListeners();
  }
}