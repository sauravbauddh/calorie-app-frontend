import 'package:calorie_app/app/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

Widget loadingWidget({Color? color, double? size}) {
  return Center(
      child: SpinKitThreeBounce(
    size: size ?? 30,
    color: color ?? AppColors.baseColor,
  ));
}
