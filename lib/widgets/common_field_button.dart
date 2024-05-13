import 'package:calorie_app/app/data/value/dimens.dart';
import 'package:calorie_app/app/theme/app_color.dart';
import 'package:calorie_app/app/theme/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CommonFiledButton extends StatelessWidget {
  final double? height;
  final double? radius;
  final bool? isFilled;
  final bool? isEnable;
  final onTap;
  final String? buttonName;
  final Color? buttonColor;
  final Widget? btnWidget;
  final bool? isLoading;
  final TextStyle? style;

  const CommonFiledButton(
      {super.key,
      this.height,
      this.isFilled,
      required this.onTap,
      this.buttonName,
      this.buttonColor,
      this.btnWidget,
      this.isLoading,
      this.style,
      this.radius,
      this.isEnable});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: InkWell(
            onTap:
                isEnable ?? true ? (isLoading ?? false ? () {} : onTap) : () {},
            child: Container(
              height: height ?? Dimens.scaleX6,
              decoration: BoxDecoration(
                border: Border.all(
                  color: isEnable ?? true
                      ? isFilled ?? true
                          ? AppColors.transparent
                          : AppColors.secondaryColor
                      : AppColors.disable,
                ),
                borderRadius: BorderRadius.circular(radius ?? Dimens.radiusX32),
                color: isFilled ?? true
                    ? buttonColor ??
                        (isEnable ?? true
                            ? AppColors.secondaryColor
                            : AppColors.disable)
                    : AppColors.transparent,
              ),
              child: isLoading ?? false
                  ? const Center(
                      child: SpinKitThreeBounce(
                        size: 20,
                        color: AppColors.white,
                      ),
                    )
                  : btnWidget ??
                      Center(
                        child: Text(buttonName ?? 'NA',
                            style: isEnable ?? true
                                ? isFilled ?? true
                                    ? style ??
                                        Styles.tsBlackBold16
                                            .copyWith(color: AppColors.white)
                                    : Styles.tsBlackBold16
                                : Styles.tsBlackBold16
                                    .copyWith(color: AppColors.white)),
                      ),
            ),
          ),
        ),
      ],
    );
  }
}
