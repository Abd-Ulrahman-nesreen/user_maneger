import 'package:flutter/material.dart';
import 'package:user_maneger/logic/validators.dart';

class BodySignInForm extends StatelessWidget {
  final Key textFormsFieldKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  const BodySignInForm({
    super.key,
    required this.width, required this.textFormsFieldKey, required this.emailController, required this.passwordController,
  });

  final double width;

  @override
  Widget build(BuildContext context) {
    InputDecoration inputDecoration = InputDecoration(
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.zero,
        ),
      filled: true,
      fillColor: Theme.of(context).secondaryHeaderColor,
      hintText: "",
    );
    return Form(
        key: textFormsFieldKey,
        child: SizedBox(
      width: width * 0.7,
      child: Column(
        children: [
          SizedBox(
            height: 43,
            child:
            TextFormField(
              decoration: inputDecoration.copyWith(
                hintText: "Enter your e-mail here"
              ),
              controller: emailController,
              validator: (enteredText) => Validators.emailValidator(enteredText),
            ),),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 43,
            child:
            TextFormField(
              decoration: inputDecoration.copyWith(
                hintText: "Enter your password"
              ),
              controller: passwordController,
              validator: (enteredText){
                if (enteredText != null && enteredText.length >= 8){
                  return null;
                }else {
                  return "password should be a bigger than 8";
                }
              },
            ),),
        ],
      ),
    ));
  }
}