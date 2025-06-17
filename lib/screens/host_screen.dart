import 'package:carsnow/controllers/login_controller.dart';
import 'package:carsnow/widgets/c_appbar.dart';
import 'package:carsnow/widgets/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class HostScreen extends StatefulWidget {
  const HostScreen({super.key});

  @override
  State<HostScreen> createState() => _HostScreenState();
}

class _HostScreenState extends State<HostScreen> {
  @override
  Widget build(BuildContext context) {
    final LoginController loginController = Get.find();
    return Scaffold(
      appBar: CAppbar(
        trailing: IconButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text(
                  'Logout',
                  style: AppTextStyles.headerMedium(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
                content: Text(
                  'Are you sure you want to log out?',
                  style: AppTextStyles.headerMedium(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text(
                      'Cancel',
                      style: AppTextStyles.bodySmall(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                      loginController.logout();
                    },
                    child: const Text('Logout'),
                  ),
                ],
              ),
            );
          },
          icon: Icon(Icons.logout, color: Colors.white),
        ),
      ),
      body: _buildEmptyState(
        'Under Production',
        'assets/animations/Animation - 1737715242572.json',
      ),
    );
  }

  Widget _buildEmptyState(String message, String imagePath) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 200, child: Lottie.asset(imagePath)),
                    const SizedBox(height: 16),
                    Text(
                      message,
                      textAlign: TextAlign.center,
                      style: AppTextStyles.headerBold(
                        color: const Color(0xFF3b0578),
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
