import 'package:calorie_app/app/data/model/dto/response.dart';
import 'package:calorie_app/app/data/model/response/genric_response.dart';
import 'package:calorie_app/app/data/value/strings.dart';
import 'package:calorie_app/app/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class AppUtils {
  AppUtils._privateConstructor();

  static getBottomSheet({
    required List<Widget> children,
    bool? isDismissible,
    EdgeInsets? padding,
    bool? enableDrag,
  }) =>
      Get.bottomSheet(
        GestureDetector(
          onTap: isDismissible ?? true ? () => Get.back() : () {},
          child: ListView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: padding ??
                const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 20,
                ),
            children: children,
          ),
        ),
        enableDrag: enableDrag ?? true,
        isDismissible: isDismissible ?? true,
        backgroundColor: AppColors.white,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(16),
          ),
        ),
        isScrollControlled: true,
        ignoreSafeArea: false,
      );

  static Future<bool?> showErrorMsg(
      {required RepoResponse<GenericResponse> response}) {
    return Fluttertoast.showToast(
        msg: response.data?.error??
            response.error?.message ??
            ErrorMessages.networkGeneral,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: AppColors.white,
        textColor: AppColors.black,
        fontSize: 16.0);
  }

  static Future<bool?> showToast({required String msg}) {
    return Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: AppColors.white,
        textColor: AppColors.black,
        fontSize: 16.0);
  }
}
