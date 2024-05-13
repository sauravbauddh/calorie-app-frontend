import 'package:calorie_app/app/data/value/dimens.dart';
import 'package:calorie_app/app/theme/app_color.dart';
import 'package:calorie_app/widgets/text/common_text.dart';
import 'package:flutter/material.dart';

Widget viewAll({
  required String title,
  required Function() onViewAll,
  int? maxLine,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Expanded(child: subTitle(text: title, maxLine: maxLine)),
      Dimens.widthGap20,
      InkWell(
          onTap: onViewAll,
          child: body(text: 'View All', textColor: AppColors.baseColor)),
    ],
  );
}
