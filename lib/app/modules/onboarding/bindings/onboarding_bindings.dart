import 'package:calorie_app/app/modules/onboarding/controller/onboarding_controller.dart';
import 'package:get/get.dart';

class OnBoardingBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(OnBoardingController());
  }
}
