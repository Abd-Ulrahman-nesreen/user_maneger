import 'package:flutter/material.dart';
import 'package:user_maneger/screens/user_maneger.dart';

void main (){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: UserManeger(),
    );
  }
}
