import 'package:calorie_app/app/data/value/dimens.dart';
import 'package:calorie_app/app/data/value/images.dart';
import 'package:calorie_app/app/modules/splash/controllers/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          AppImages.icAppLogo,
          width: Dimens.screenWidthX14,
        ),
      ),
    );
  }
}
