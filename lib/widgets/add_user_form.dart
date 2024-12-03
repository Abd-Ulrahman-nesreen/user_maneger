import 'package:flutter/material.dart';
import 'package:user_maneger/logic/user_provider.dart';

class AddUserForm extends StatelessWidget {
  final UserProvider model;
  const AddUserForm({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    InputDecoration inputDecoration = InputDecoration(
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.zero,
      ),
      filled: true,
      fillColor: Theme.of(context).secondaryHeaderColor,
    );
    return Form(
      child: Column(
        children: [
          SizedBox(
            width: 300,
            child: TextFormField(
              controller: model.name,
              decoration:
              inputDecoration.copyWith(hintText: "enter name"),
            ),
          ),
          SizedBox(
            width: 300,
            child: TextFormField(
              controller: model.age,
              decoration:
              inputDecoration.copyWith(hintText: "enter age"),
            ),
          ),
          MaterialButton(
            onPressed: () {
              model.addData();
            },
            child: const Text("Send New User"),
          )
        ],
      ),
    );
  }
}
