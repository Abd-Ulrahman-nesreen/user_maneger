import 'package:flutter/material.dart';

import '../logic/validators.dart';

class BodySignUpForm extends StatelessWidget {
  final Key textFormsFieldKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  const BodySignUpForm({
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
              const SizedBox(
                height: 10,
              ),
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
                  validator: (enteredText) => Validators.passwordValidator(enteredText),
                ),),
              const SizedBox(
                height: 10,
              ),
                SizedBox(
                  height: 43,
                  child: TextFormField(
                    decoration: inputDecoration.copyWith(
                        hintText: "Confirm password"
                    ),
                    validator: (enteredText) => Validators.passwordConfirmValidator(enteredText , passwordController.text),
                  ),
                ),
            ],
          ),
        ));
  }
}