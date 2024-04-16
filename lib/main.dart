import 'package:flutter/material.dart';
import 'package:flutter_clean_stuff/clean_app.dart';
import 'package:flutter_clean_stuff/common/injection/depedencies.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  runApp(const CleanApp());
}
