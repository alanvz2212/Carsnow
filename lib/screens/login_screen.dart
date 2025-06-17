import 'package:carsnow/controllers/login_controller.dart';
import 'package:carsnow/widgets/button.dart';
import 'package:carsnow/widgets/icon_button.dart';
import 'package:carsnow/widgets/text_form.dart';
import 'package:carsnow/widgets/text_style.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final LoginController controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF3B0578),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              children: [
                const SizedBox(height: 100),
                const SizedBox(height: 20),
                Image.asset(
                  'assets/Images/cars.png',
                  height: 80,
                  fit: BoxFit.contain,
                ),
                const SizedBox(height: 40),

                // Email Input
                CustomTextFormField(
                  labelText: 'Enter your email',
                  controller: controller.emailController,
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (value) {
                    if (value.isNotEmpty) {
                      controller.validateEmail(value);
                    }
                  },
                ),

                // Error message
                Obx(() {
                  return controller.errorMessage.value.isNotEmpty
                      ? Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(
                            controller.errorMessage.value,
                            style: AppTextStyles.bodySmall().copyWith(
                              color: const Color.fromARGB(179, 196, 107, 107),
                              fontSize: 14,
                            ),
                          ),
                        )
                      : const SizedBox(); // Empty box if no error
                }),
                const SizedBox(height: 8),
                // Continue Button
                CustomButton(
                  text: 'Continue',
                  onPressed: controller.handleContinue,
                  color: const Color.fromARGB(255, 45, 190, 69), // Always green
                  textStyle: AppTextStyles.bodyRegular(color: Colors.white),
                  height: 50,
                ),
                const SizedBox(height: 26),
                // Google Sign In
                ButtonWithIcon(
                  text: 'Continue with Google',
                  onPressed: () {},
                  icon: FontAwesomeIcons.google,
                  color: Colors.white,
                  textStyle: AppTextStyles.bodyRegular(color: Colors.grey),
                  iconcolor: Colors.red,
                ),
                const SizedBox(height: 8),
                // Facebook Sign In
                ButtonWithIcon(
                  text: 'Continue with Facebook',
                  onPressed: () {},
                  icon: FontAwesomeIcons.facebook,
                  color: Colors.white,
                  textStyle: AppTextStyles.bodyRegular().copyWith(
                    color: Colors.grey[350],
                  ),
                  iconcolor: Colors.blue,
                ),

                // Help Text
                TextButton(
                  onPressed: () {
                    // Handle need help
                  },
                  child: Text(
                    'need help for signing in ?',
                    style: AppTextStyles.bodySmall().copyWith(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ),

                // Terms Text
                Text(
                  'By signing up you are creating an account and agree\nto our Term\'s and Privacy policy',
                  textAlign: TextAlign.center,
                  style: AppTextStyles.bodySmall().copyWith(
                    color: Colors.white60,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
