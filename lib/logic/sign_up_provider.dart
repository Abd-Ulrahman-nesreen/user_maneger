import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignInProvider extends ChangeNotifier {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool loadingSignUp = false;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<void> signUp (BuildContext context) async{
    if (formKey.currentState != null && formKey.currentState!.validate()){
      String email = emailController.text;
      String password = passwordController.text;
      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
        if (FirebaseAuth.instance.currentUser != null){
          if (context.mounted){
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
  }
}