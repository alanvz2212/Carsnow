import 'package:carsnow/screens/base_screen.dart';
import 'package:carsnow/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController();
  final isValidEmail = false.obs;
  final errorMessage = ''.obs;
  final isLoggedIn = false.obs;

  @override
  void onInit() {
    checkLoginStatus();
    super.onInit();
  }

  Future<void> checkLoginStatus() async {
    final prefs = await SharedPreferences.getInstance();
    isLoggedIn.value = prefs.getBool('isLoggedIn') ?? false;
  }

  void validateEmail(String value) {
    if (!GetUtils.isEmail(value)) {
      errorMessage.value = 'Please enter a valid email address';
      isValidEmail.value = false;
      return;
    }

    if (value.trim() != 'user@carsnow.com') {
      errorMessage.value = 'Invalid Credentials!';
      isValidEmail.value = false;
      return;
    }

    errorMessage.value = '';
    isValidEmail.value = true;
  }

  Future<void> handleContinue() async {
    validateEmail(emailController.text);
    if (isValidEmail.value) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isLoggedIn', true);
      isLoggedIn.value = true;
      Get.off(() => BaseScreen());
    }
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('isLoggedIn');
    isLoggedIn.value = false;
    Get.offAll(() => LoginScreen());
  }
}
