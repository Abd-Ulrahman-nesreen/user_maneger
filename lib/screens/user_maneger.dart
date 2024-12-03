import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_maneger/logic/user_provider.dart';
import '../widgets/add_user_form.dart';

class UserManeger extends StatelessWidget {
  const UserManeger({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("User Maneger"),
        actions: [
          IconButton(onPressed: () async{
            await FirebaseAuth.instance.signOut();
          }, icon: const Icon(Icons.exit_to_app))
        ],
      ),
      body: SizedBox(
        child: SingleChildScrollView(
          child: Consumer<UserProvider>(builder: (context , model , child){
            return Column(
              children: [
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.07,
                ),
                AddUserForm(model: model),
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
                    ], rows: model.usersData)
              ],
            );
          }),
        ),
      ),
    );
  }
}
