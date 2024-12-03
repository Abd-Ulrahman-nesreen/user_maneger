import 'package:flutter/material.dart';
import '../widgets/sign_up_widgets.dart';
import '../widgets/signing_button.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
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
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Create Account" , style: theme.textTheme.labelLarge?.copyWith(
                  color: theme.primaryColor,
                  fontSize: 42,
                ),),
                BodySignUpForm(width: width, textFormsFieldKey: textFormsFieldKey, emailController: email, passwordController: password),
                const SizedBox(
                  height: 10,
                ),
                SigningButton(width: width, theme: theme, text: 'Create Account', onPressed: (){},),
                TextButton(onPressed: (){}, child: const Text("Log In"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}