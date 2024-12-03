import 'package:flutter/Material.dart';

extension Nav on BuildContext {
  Future<Object?> putOn(Widget page) => Navigator.of(this).push(MaterialPageRoute(builder: (_) => page));
  Future<Object?> goAndRemoveAll(Widget page) => Navigator.of(this).pushAndRemoveUntil(MaterialPageRoute(builder: (_) => page) , (_) => false);
}