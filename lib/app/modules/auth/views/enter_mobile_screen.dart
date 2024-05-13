import 'package:calorie_app/app/data/value/dimens.dart';
import 'package:calorie_app/app/data/value/images.dart';
import 'package:calorie_app/app/data/value/strings.dart';
import 'package:calorie_app/app/modules/auth/controllers/auth_controller.dart';
import 'package:calorie_app/app/routes/app_routes.dart';
import 'package:calorie_app/app/theme/app_color.dart';
import 'package:calorie_app/widgets/common_field_button.dart';
import 'package:calorie_app/widgets/input_field/common_text_input_field.dart';
import 'package:calorie_app/widgets/text/common_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EnterMobileScreen extends GetView<AuthController> {
  const EnterMobileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Image.asset(
                    AppImages.icAppLogo,
                  ),
                ),
                heading(
                  textColor: AppColors.blueTextColor,
                  text: AppStrings.enterYourPhoneNumber,
                ),
                subTitle(
                  text: AppStrings.weWillSendOTPVerification,
                  style: const TextStyle(
                      fontSize: 14, color: AppColors.blueTextColor),
                ),
                Dimens.heightGap10,
                CommonTextField(
                  prefixIcon: Container(
                    width: 20,
                    alignment: Alignment.center,
                    child: label(text: '+91'),
                  ),
                  wrapper: controller.mobileWrapper,
                  hintText: AppStrings.enterMobileNumber,
                  inputType:
                      const TextInputType.numberWithOptions(signed: true),
                  maxLength: 10,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter a phone number';
                    } else {
                      return controller.validateMobileNumber(value);
                    }
                  },
                ),
                Dimens.heightGap10,
                const Text(
                  AppStrings.agreement,
                  style: TextStyle(fontSize: 12.0),
                ),
                Dimens.heightGap20,
                Image.asset(
                  AppImages.otpBackdrop,
                ),
                Obx(() => CommonFiledButton(
                  buttonColor: AppColors.orangeButtonColor,
                  onTap: ()  {
                    controller.sendOTP();
                    Get.toNamed(Routes.VERIFY_OTP, arguments: Get.arguments);
                  },
                  isLoading: controller.isLoading.value,
                  buttonName: AppStrings.sendOTP,
                ),)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
