import 'package:flutter/material.dart';

import 'clean_app.dart';
import 'common/injection/depedencies.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  runApp(const CleanApp());
}
