import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mimo_flutter_app/firebase_options.dart';
import 'package:mimo_flutter_app/view/screens/splash_screen/splash_screen.dart'; 

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

const logedInKey = 'Userlogedin';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize =MediaQuery.of(context).size;
    return GetMaterialApp(
      title: 'Mimo',   
      debugShowCheckedModeBanner: false,
      home: SplashScreen(screenSize: screenSize,),
    );
  }
}