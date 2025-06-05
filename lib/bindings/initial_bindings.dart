import 'package:carsnow/controller/login_controller.dart';
import 'package:get/get.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(LoginController());
  }
}
