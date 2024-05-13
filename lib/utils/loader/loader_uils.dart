import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class LoadingUtils {
  static var isLoaderShowing = false;

  // static void showLoader() {
  //   if (!isLoaderShowing) {
  //     Get.dialog(
  //       const PopScope(
  //         canPop: true,
  //         child: SizedBox(
  //           height: 100,
  //           child: Center(
  //             child: SpinKitThreeBounce(
  //               size: 30,
  //               color: AppColors.white,
  //             ),
  //           ),
  //         ),
  //       ),
  //       barrierDismissible: true,
  //     );
  //     isLoaderShowing = true;
  //   }
  // }

  static void hideLoader() {
    if (isLoaderShowing) {
      Get.back();
      isLoaderShowing = false;
    }
  }
}
