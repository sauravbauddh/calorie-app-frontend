import 'package:calorie_app/app/data/value/dimens.dart';
import 'package:calorie_app/app/theme/app_color.dart';
import 'package:flutter/material.dart';

class ImageBox extends StatelessWidget {
  final VoidCallback onPressed;

  const ImageBox({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Dimens.screenWidthXFourth,
      height: Dimens.screenHeightX10,
      decoration: const BoxDecoration(
        color: AppColors.boxColor,
        shape: BoxShape.rectangle,
      ),
      child: IconButton(
        icon: const Icon(Icons.add),
        onPressed: onPressed,
      ),
    );
  }
}
