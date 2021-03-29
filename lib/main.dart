import 'package:flutter/material.dart';
import 'package:find_my_work/injection.dart';
import 'package:find_my_work/presentation/core/app_widget.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:injectable/injectable.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureInjection(Environment.prod);
  await Firebase.initializeApp();
  runApp(AppWidget());
}
