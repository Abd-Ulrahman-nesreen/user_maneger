import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_maneger/logic/extensions.dart';
import 'package:user_maneger/logic/sign_up_provider.dart';
import 'package:user_maneger/screens/sign_in_page.dart';
import '../widgets/sign_up_widgets.dart';
import '../widgets/signing_button.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Consumer<SignUpProvider>(builder: (context , model , child){
            if (model.loadingSignUp){
              return const Center(
                child: CircularProgressIndicator(),
              );
            }else {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Create Account" , style: theme.textTheme.labelLarge?.copyWith(
                    color: theme.primaryColor,
                    fontSize: 42,
                  ),),
                  BodySignUpForm(width: width, textFormsFieldKey: model.formKey, emailController: model.emailController, passwordController: model.passwordController),
                  const SizedBox(
                    height: 10,
                  ),
                  SigningButton(width: width, theme: theme, text: 'Create Account', onPressed: () async{
                    await model.signUp(context);
                  },),
                  TextButton(onPressed: (){
                    context.replace(const SignInPage());
                  }, child: const Text("Log In"))
                ],
              );
            }
          }),
        ),
      ),
    );
  }
}