import 'package:flutter/material.dart';
import '../widgets/add_user_form.dart';

class UserManeger extends StatelessWidget {
  const UserManeger({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.07,
              ),
              const AddUserForm(),
              const Divider(),
              DataTable(
                  border: const TableBorder(
                      bottom: BorderSide(),
                      right: BorderSide(),
                      left: BorderSide(),
                      top: BorderSide(),
                      horizontalInside: BorderSide(),
                      verticalInside: BorderSide()
                  ),
                  columns: const [
                    DataColumn(label: Text("name")),
                    DataColumn(label: Text("age"))
                  ], rows: const [])
            ],
          ),
        ),
      ),
    );
  }
}