import 'package:calorie_app/app/routes/app_routes.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  // final ProfileRepository _profileRepository = ProfileRepository();
  @override
  void onInit() {
    _startOnBoarding();
    super.onInit();
  }

  _startOnBoarding() async {
    await Future.delayed(const Duration(seconds: 1));
    Get.offAllNamed(Routes.AUTH_LOGIN);
  }
}
