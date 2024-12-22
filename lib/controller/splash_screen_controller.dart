import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mimo_flutter_app/main.dart';
import 'package:mimo_flutter_app/view/screens/home_screen/home_screen.dart';
import 'package:mimo_flutter_app/view/screens/login_screen/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreenController extends GetxController{


  Future<void> checkIfUserLogedin(context) async{
    // sharedpreference & connectivity instances
    final sharedPref = await SharedPreferences.getInstance();
    final isLogedin = sharedPref.getBool(logedInKey);
    var connectivityResult = await Connectivity().checkConnectivity();

    if (connectivityResult == ConnectivityResult.none) {
      await Future.delayed(const Duration(milliseconds: 1500));
      Get.snackbar(
        "No Network",
        "Make sure you have a connected network",
        margin: const EdgeInsets.all(6),
        colorText: Colors.white,
      );
    }
    else if (isLogedin == null) {
      await Future.delayed(const Duration(milliseconds: 1500));
      Get.offAll(() => LoginScreen(screenSize: MediaQuery.of(Get.context!).size));
    }
    else if(isLogedin == true){
      await Future.delayed(const Duration(milliseconds: 1500));
      Get.offAll(() => const HomeScreen());
    }
    else if(isLogedin == false){
      await Future.delayed(const Duration(milliseconds: 1500));
      Get.offAll(() => LoginScreen(screenSize: MediaQuery.of(Get.context!).size));
    }
  }

}