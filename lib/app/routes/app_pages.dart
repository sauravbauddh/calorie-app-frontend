import 'package:calorie_app/app/modules/auth/bindings/auth_binding.dart';
import 'package:calorie_app/app/modules/auth/views/enter_mobile_screen.dart';
import 'package:calorie_app/app/modules/auth/views/verify_otp_screen.dart';
import 'package:calorie_app/app/modules/onboarding/bindings/onboarding_bindings.dart';
import 'package:calorie_app/app/modules/onboarding/views/onboarding_screen.dart';
import 'package:calorie_app/app/modules/splash/bindings/splash_binding.dart';
import 'package:calorie_app/app/modules/splash/views/splash_view.dart';
import 'package:get/get.dart';
import 'app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
        name: Routes.SPLASH,
        page: () => const SplashView(),
        binding: SplashBinding(),
        transition: Transition.leftToRight),
    GetPage(
      name: Routes.AUTH_LOGIN,
      page: () => const EnterMobileScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.VERIFY_OTP,
      page: () => const VerifyOtpScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.ONBOARDING,
      page: () => const OnBoardingScreen(),
      binding: OnBoardingBindings(),
    ),
  ];
}
