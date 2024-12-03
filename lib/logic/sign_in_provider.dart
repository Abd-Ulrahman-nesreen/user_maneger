import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:user_maneger/logic/extensions.dart';

import '../screens/user_maneger.dart';

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
      String password = passwordController.text;
      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
        if (FirebaseAuth.instance.currentUser != null && context.mounted){
          context.goAndRemoveAll(const UserManeger());
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

  Future<UserCredential> signInWithGoogle(BuildContext context) async {
    loadingSignIn = true;
    notifyListeners();

    OAuthCredential? credential;

    try{
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

      // Create a new credential
      credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
    } catch (e){
      null;
    }

    loadingSignIn = false;
    notifyListeners();

    if (FirebaseAuth.instance.currentUser != null && context.mounted){}
    return credential != null ? await FirebaseAuth.instance.signInWithCredential(credential) : Future.error("error");
  }
}