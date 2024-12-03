import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sign_in_button/sign_in_button.dart';
import 'package:user_maneger/logic/extensions.dart';
import 'package:user_maneger/logic/sign_in_provider.dart';
import 'package:user_maneger/screens/sign_up_page.dart';

import '../widgets/sign_in_widgets.dart';
import '../widgets/signing_button.dart';


class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Consumer<SignInProvide>(builder: (context , model , child){
            if (model.loadingSignIn){
              return const Center(
                child: CircularProgressIndicator(),
              );
            }else {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Login" , style: theme.textTheme.labelLarge?.copyWith(
                    color: theme.primaryColor,
                    fontSize: 42,
                  ),),
                  BodySignInForm(width: width, textFormsFieldKey: model.formKey, emailController: model.emailController, passwordController: model.passwordController),
                  const SizedBox(
                    height: 10,
                  ),
                  SigningButton(width: width, theme: theme, text: 'Log In', onPressed: () async{
                    await model.signIn(context);
                  },),
                  TextButton(onPressed: (){
                    context.replace(const SignUpPage());
                  }, child: const Text("Create Account")),
                  const SizedBox(
                    height: 30,
                  ),
                  SignInButton(Buttons.googleDark , onPressed: () async{
                    await model.signInWithGoogle(context);
                  }),
                ],
              );
            }
          }),
        ),
      ),
    );
  }
}