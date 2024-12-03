import 'package:flutter/material.dart';

class AddUserForm extends StatelessWidget {
  const AddUserForm({super.key});

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
              decoration:
              inputDecoration.copyWith(hintText: "enter name"),
            ),
          ),
          SizedBox(
            width: 300,
            child: TextFormField(
              decoration:
              inputDecoration.copyWith(hintText: "enter age"),
            ),
          ),
          MaterialButton(
            onPressed: () {},
            child: const Text("Send New User"),
          )
        ],
      ),
    );
  }
}
