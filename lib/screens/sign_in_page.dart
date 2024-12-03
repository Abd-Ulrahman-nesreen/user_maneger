import 'package:flutter/material.dart';
import 'package:sign_in_button/sign_in_button.dart';

import '../widgets/sign_in_widgets.dart';
import '../widgets/signing_button.dart';


class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  GlobalKey<FormFieldState> textFormsFieldKey = GlobalKey<FormFieldState>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Login" , style: theme.textTheme.labelLarge?.copyWith(
                color: theme.primaryColor,
                fontSize: 42,
              ),),
              BodySignInForm(width: width, textFormsFieldKey: textFormsFieldKey, emailController: email, passwordController: password),
              const SizedBox(
                height: 10,
              ),
              SigningButton(width: width, theme: theme, text: 'Log In', onPressed: (){},),
              TextButton(onPressed: (){}, child: const Text("Create Account")),
              const SizedBox(
                height: 30,
              ),
              SignInButton(Buttons.googleDark , onPressed: (){}),
            ],
          ),
        ),
      ),
    );
  }
}