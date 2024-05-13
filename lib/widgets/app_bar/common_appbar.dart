import 'package:calorie_app/app/data/value/dimens.dart';
import 'package:calorie_app/app/routes/app_routes.dart';
import 'package:calorie_app/app/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

PreferredSizeWidget commonAppBar({required String title}) {
  return AppBar(
    backgroundColor: AppColors.white,
    surfaceTintColor: AppColors.white,
    shadowColor: AppColors.inputFieldBorderColor,
    title: Text(title),
    actions: [
      InkWell(
        onTap: () => Get.toNamed(Routes.NOTIFICATION_SCREEN),
        child: const Icon(Icons.notifications_none)
            .paddingOnly(right: Dimens.paddingX16),
      )
    ],
  );
}
