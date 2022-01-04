import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/createAccount.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_application_1/pages/login.dart';
import 'package:flutter_application_1/services/auth_service.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthService()),
      ],
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: LoginPage());
  }
}
