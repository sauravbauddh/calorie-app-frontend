import 'package:calorie_app/app/data/value/strings.dart';
import 'package:calorie_app/app/modules/auth/controllers/auth_controller.dart';
import 'package:calorie_app/app/routes/app_routes.dart';
import 'package:calorie_app/app/theme/app_color.dart';
import 'package:calorie_app/app/theme/styles.dart';
import 'package:calorie_app/widgets/common_field_button.dart';
import 'package:calorie_app/widgets/text/common_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

import '../../../data/value/dimens.dart';

class VerifyOtpScreen extends GetView<AuthController> {
  const VerifyOtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: controller.otpFormKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 80),
              heading(
                textColor: AppColors.blueTextColor,
                text: AppStrings.enterOneTimePassword,
              ),
              const Text(
                AppStrings.enterCode,
                style: TextStyle(
                  color: AppColors.blueTextColor,
                  fontSize: 14,
                ),
              ),
              Dimens.heightGap40,
              SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Pinput(
                      length: 6,
                      controller: controller.otpController,
                      onChanged: (String value) {
                        controller.otpEnteredByUser.value = value;
                      },
                      onCompleted: (val) {
                        // controller.verifyOtp();
                      },
                    ),
                    const SizedBox(height: Dimens.imageScaleX2),
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            if (controller.resendTimer.value == 0) {
                              // controller.sendOtp();
                            }
                          },
                          child: Obx(() {
                            return (controller.resendTimer.value > 0)
                                ? body(
                                    text:
                                        'Resend Code in ${controller.resendTimer.value}s')
                                : label(
                                    text: 'Resend OTP',
                                    textColor: AppColors.orangeButtonColor);
                          }),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: Dimens.imageScaleX3),
              GetX(
                builder: (AuthController authController) => CommonFiledButton(
                  onTap: () {
                    controller.verifyOtp();
                    Get.offAllNamed(Routes.ONBOARDING);
                  },
                  buttonName: AppStrings.submit,
                  buttonColor: AppColors.orangeButtonColor,
                  isLoading: authController.isLoading.value,
                ),
              ),
              const SizedBox(height: Dimens.imageScaleX2),
              Center(
                child: Text(
                  AppStrings.enterOTPManually,
                  style: Styles.tsGreyRegular14,
                ),
              ),
            ],
          ).paddingSymmetric(horizontal: 24),
        ),
      ),
    );
  }
}
