import 'package:calorie_app/app/data/value/dimens.dart';
import 'package:calorie_app/app/data/value/strings.dart';
import 'package:calorie_app/app/modules/onboarding/controller/onboarding_controller.dart';
import 'package:calorie_app/app/modules/onboarding/widget/screen_info_widget.dart';
import 'package:calorie_app/app/theme/app_color.dart';
import 'package:calorie_app/widgets/common_field_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardingScreen extends GetView<OnBoardingController> {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Dimens.heightGap60,
              Obx(
                () => ScreenInfoWidget(
                    title: controller.selectedWidgetIdx.value == 0
                        ? AppStrings.welcome
                        : AppStrings.addICENumber,
                    subtitle: controller.selectedWidgetIdx.value == 0
                        ? AppStrings.getStarted
                        : "",
                    instruction: controller.selectedWidgetIdx.value == 0
                        ? AppStrings.welcomeText
                        : AppStrings.addICEDescription),
              ),
              Column(
                children: [
                  Dimens.heightGap20,
                  Obx(() => controller.displayWidget.values
                      .elementAt(controller.selectedWidgetIdx.value)),
                ],
              ).paddingSymmetric(horizontal: Dimens.paddingX12),
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.only(
            left: Dimens.paddingX12,
            right: Dimens.paddingX12,
            bottom: Dimens.paddingX40,
          ),
          child: Obx(
            () => CommonFiledButton(
              buttonColor: AppColors.orangeButtonColor,
              onTap: () => controller.handelNextBtn(),
              buttonName: controller.selectedWidgetIdx.value + 1 ==
                      controller.displayWidget.length
                  ? 'Submit'
                  : 'Next',
            ),
          ).paddingSymmetric(
              horizontal: Dimens.paddingX12, vertical: Dimens.paddingX8),
        ),
      ),
    );
  }
}
