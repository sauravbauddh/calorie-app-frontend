import 'package:calorie_app/app/data/value/dimens.dart';
import 'package:calorie_app/app/theme/app_color.dart';
import 'package:calorie_app/widgets/text/common_text.dart';
import 'package:flutter/material.dart';

Widget commonTabButton(
    {required String btnName, required bool isSelected, required onSelect}) {
  return InkWell(
    onTap: onSelect,
    child: Container(
      height: 42,
      decoration: BoxDecoration(
          color: isSelected ? AppColors.baseColor : AppColors.transparentColor,
          borderRadius: BorderRadius.circular(Dimens.radiusX12)),
      child: Center(
        child: label(
            text: btnName,
            textColor: isSelected ? AppColors.white : AppColors.greyTextColor),
      ),
    ),
  );
}
