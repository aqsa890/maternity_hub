import 'package:flutter/material.dart';
import 'package:meternity_hub/notification/notification_service.dart';
import 'package:meternity_hub/screens/AuthScreen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize Firebase
  await Firebase.initializeApp();

  // Initialize local notifications
  await LocalNotifications.init();
  runApp(const Maternity_Hub());
}

class Maternity_Hub extends StatelessWidget {
  const Maternity_Hub({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Authscreen(),
    );
  }
}
