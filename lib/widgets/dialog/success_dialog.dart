import 'package:calorie_app/app/data/value/dimens.dart';
import 'package:calorie_app/app/theme/app_color.dart';
import 'package:calorie_app/widgets/text/common_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SuccessDialog extends StatelessWidget {
  final onTap;
  const SuccessDialog({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Dialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Dimens.radiusX18)),
        child: Container(
          height: Dimens.screenHeightX35,
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimens.radiusX6)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                flex: 3,
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.successColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(Dimens.radiusX18),
                      topRight: Radius.circular(Dimens.radiusX18),
                    ),
                  ),
                  child: const Center(
                      child: Icon(
                    Icons.verified_outlined,
                    color: AppColors.white,
                    size: Dimens.imageScaleX10,
                  )),
                ),
              ),
              Expanded(
                flex: 4,
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(Dimens.radiusX18),
                      bottomRight: Radius.circular(Dimens.radiusX18),
                    ),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        heading(text: 'Success!'),
                        body(
                            text:
                                'Your application is send for approval hgjsb iubbjf ifewif eig wydgwi di'),
                        Dimens.heightGap20,
                        InkWell(
                          onTap: onTap,
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(Dimens.radiusX12),
                                color: AppColors.verifiedColor),
                            child: title(text: 'Ok', textColor: AppColors.white)
                                .paddingSymmetric(
                                    horizontal: Dimens.gapX4,
                                    vertical: Dimens.gapX1),
                          ),
                        )
                      ],
                    ).paddingSymmetric(horizontal: Dimens.gapX1),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
