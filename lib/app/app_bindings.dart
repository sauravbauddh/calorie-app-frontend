import 'package:calorie_app/app/data/network/network_request.dart';
import 'package:calorie_app/app/data/repository/auth_repository.dart';
import 'package:get/get.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    // Repositories
    Get.put(NetworkRequester(), permanent: true);
    Get.put(AuthRepository(), permanent: true);
    // Get.put(OnBoardingRepository(), permanent: true);Controllers

    //Controllers
    // Get.put(ProfileController(), permanent: true);
    // Get.put(AppointmentController(), permanent: true);
    // Get.put(EarningController(), permanent: true);
    // Get.put(SchedulerController(), permanent: true);
    // Get.put(LandingController(), permanent: true);
    // Get.put(HomeController(), permanent: true);
  }
}
