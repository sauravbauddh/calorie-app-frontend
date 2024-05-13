import 'package:calorie_app/app/data/value/dimens.dart';
import 'package:calorie_app/app/theme/app_color.dart';
import 'package:calorie_app/app/theme/styles.dart';
import 'package:calorie_app/widgets/common_field_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ConfirmationDialog extends StatelessWidget {
  final Widget? icon;
  final String? title;
  final String message;
  final bool? isNoField;
  final bool? isYesField;
  final String? btnOneName;
  final String? btnTwoName;
  final Color? btnOneColor;
  final Color? btnTowColor;
  final Color? btnOneTextColor;
  final Color? btnTwoTextColor;
  final Function() btnOneOnTap;
  final Function() btnTwoOnTap;
  const ConfirmationDialog({
    super.key,
    this.icon,
    required this.title,
    required this.message,
    this.btnOneName,
    this.btnTwoName,
    required this.btnOneOnTap,
    required this.btnTwoOnTap,
    this.btnOneColor,
    this.btnTowColor,
    this.btnOneTextColor,
    this.btnTwoTextColor,
    this.isNoField,
    this.isYesField,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const Align(
              alignment: Alignment.bottomRight,
              child: Icon(
                Icons.cancel_rounded,
                color: AppColors.greyTextColor,
              ),
            ),
            Text(title ?? 'Attention', style: Styles.tsBlackBold20),
            SizedBox(height: Dimens.gapX2),
            Text(
              message,
              style: Styles.tsBlackRegular16,
            ),
            SizedBox(height: Dimens.gapX3),
            Row(
              children: <Widget>[
                Expanded(
                    child: CommonFiledButton(
                  isFilled: isNoField ?? true,
                  radius: Dimens.radiusX8,
                  onTap: btnOneOnTap,
                  buttonName: btnOneName ?? 'No',
                )),
                SizedBox(width: Dimens.gapX1),
                Expanded(
                    child: CommonFiledButton(
                  isFilled: isYesField ?? false,
                  radius: Dimens.radiusX8,
                  onTap: btnTwoOnTap,
                  buttonName: btnTwoName ?? 'Yes',
                )),
              ],
            ),
          ],
        ).paddingAll(Dimens.paddingX16),
      ),
    );
  }
}
