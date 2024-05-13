import 'package:calorie_app/app/data/value/dimens.dart';
import 'package:calorie_app/app/modules/onboarding/controller/onboarding_controller.dart';
import 'package:calorie_app/app/theme/app_color.dart';
import 'package:calorie_app/widgets/text/common_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScreenInfoWidget extends GetView<OnBoardingController> {
  final String title;
  final String subtitle;
  final String instruction;

  const ScreenInfoWidget({
    super.key,
    required this.title,
    required this.subtitle,
    required this.instruction,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          heading(
            text: title,
            textColor: AppColors.blueTextColor,
          ),
          if (subtitle.isNotEmpty)
            heading(
              text: subtitle,
              textColor: AppColors.blueTextColor,
            ),
          Dimens.heightGap5,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 10,
                child: label(
                  textColor: AppColors.blueTextColor,
                  text: instruction,
                ),
              ),
              const Spacer(),
              Expanded(
                child: Obx(
                      () => Text(
                    '${controller.selectedWidgetIdx.value + 1}/${controller.displayWidget.length}',
                    style: const TextStyle(color: AppColors.orangeButtonColor),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
