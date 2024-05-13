import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class Dimens {
  //Screen height and width
  static double screenHeight = Get.context!.height;
  static double screenWidth = Get.context!.width;
  static final aspectRatio = screenWidth / screenHeight;

  Dimens._privateConstructor();

  //padding

  ///res

  static final paddingX4 = factorOf(value: 4);
  static final paddingX8 = factorOf(value: 8);
  static final paddingX12 = factorOf(value: 12);
  static final paddingX16 = factorOf(value: 16);
  static final paddingX18 = factorOf(value: 18);
  static final paddingX20 = factorOf(value: 20);
  static final paddingX24 = factorOf(value: 24);
  static final paddingX28 = factorOf(value: 28);
  static final paddingX32 = factorOf(value: 32);
  static final paddingX40 = factorOf(value: 40);

  //margin
  static const marginX1 = 4.0;
  static const marginX2 = 8.0;
  static const marginX3 = 16.0;
  static const marginX4 = 24.0;
  static const marginX5 = 32.0;

  static final radiusX4 = factorOf(value: 4);
  static final radiusX6 = factorOf(value: 6);
  static final radiusX8 = factorOf(value: 8);
  static final radiusX10 = factorOf(value: 10);
  static final radiusX12 = factorOf(value: 12);
  static final radiusX14 = factorOf(value: 14);
  static final radiusX16 = factorOf(value: 16);
  static final radiusX18 = factorOf(value: 18);
  static final radiusX20 = factorOf(value: 20);
  static final radiusX24 = factorOf(value: 22);
  static final radiusX32 = factorOf(value: 24);

  //image scales
  static const imageScaleX1 = 8.0;
  static const imageScaleX2 = 16.0;
  static const imageScaleX3 = 24.0;
  static const imageScaleX4 = 32.0;
  static const imageScaleX5 = 40.0;
  static const imageScaleX6 = 48.0;
  static const imageScaleX7 = 56.0;
  static const imageScaleX8 = 64.0;
  static const imageScaleX9 = 72.0;
  static const imageScaleX10 = 80.0;
  static const imageScaleX12 = 96.0;
  static const imageScaleX14 = 112.0;
  static const imageScaleX24 = 224.0;

  //standard scales
  static final scaleX1 = factorOf(value: 8.0);
  static final scaleX2 = factorOf(value: 16.0);
  static final scaleX3 = factorOf(value: 24.0);
  static final scaleX4 = factorOf(value: 32.0);
  static final scaleX5 = factorOf(value: 40.0);
  static final scaleX6 = factorOf(value: 48.0);
  static final scaleX7 = factorOf(value: 54.0);
  static final scaleX8 = factorOf(value: 64.0);

  //dividers
  static final gapX0_5 = factorOf(value: 5.0);
  static final gapX1 = factorOf(value: 10.0);
  static final gapX2 = factorOf(value: 20.0);
  static final gapX3 = factorOf(value: 30.0);
  static final gapX4 = factorOf(value: 40.0);
  static final gapX5 = factorOf(value: 50.0);
  static final gapX6 = factorOf(value: 60.0);
  static final gapX7 = factorOf(value: 70.0);
  static final gapX8 = factorOf(value: 80.0);
  static final gapX9 = factorOf(value: 90.0);
  static final gapX10 = factorOf(value: 100.0);

  static final gapX1_5 = factorOf(value: 15.0);
  static final gapX2_5 = factorOf(value: 25.0);
  static final gapX3_5 = factorOf(value: 35.0);
  static final gapX4_5 = factorOf(value: 45.0);
  static final gapX5_5 = factorOf(value: 55.0);
  static final gapX6_5 = factorOf(value: 65.0);
  static final gapX7_5 = factorOf(value: 75.0);
  static final gapX8_5 = factorOf(value: 85.0);
  static final gapX9_5 = factorOf(value: 95.0);

  static const heightGap5 = SizedBox(height: 5);
  static const heightGap10 = SizedBox(height: 10);
  static const heightGap20 = SizedBox(height: 20);
  static const heightGap30 = SizedBox(height: 30);
  static const heightGap40 = SizedBox(height: 40);
  static const heightGap50 = SizedBox(height: 50);
  static const heightGap60 = SizedBox(height: 60);
  static const heightGap80 = SizedBox(height: 80);
  static const heightGap100 = SizedBox(height: 100);

  static const widthGap5 = SizedBox(width: 5);
  static const widthGap10 = SizedBox(width: 10);
  static const widthGap20 = SizedBox(width: 20);
  static const widthGap30 = SizedBox(width: 30);
  static const widthGap40 = SizedBox(width: 40);
  static const widthGap50 = SizedBox(width: 50);

  //heights
  static final screenHeightX18 = Dimens.screenHeight / 1.8;
  static final screenHeightXHalf = Get.height / 2;
  static final screenHeightX21 = Get.height / 2.1;
  static final screenHeightXFourth = Get.height / 4;
  static final screenHeightXSixth = Get.height / 6;
  static final screenHeightX34 = Get.height / 3.4;
  static final screenHeightX35 = Get.height * 0.35;
  static final screenHeightX45 = Get.height * 0.45;
  static final screenHeightXEight = Get.height / 8;
  static final screenHeightx17 = Get.height * 0.17;
  static final screenHeightX8 = Get.height / 8;
  static final screenHeightX7 = Get.height / 7;
  static final screenHeightX10 = Get.height / 9.5;
  static final searchListHeight = (Get.height - 170) / 2;

  //width
  static final screenWidthXHalf = Get.width / 2;
  static final screenWidthXThird = Get.width / 3;
  static final screenWidthXFourth = Get.width / 4;
  static final screenWidthXSixth = Get.width / 6;
  static final screenWidthXEight = Get.width / 8;
  static final screenWidthX12 = Get.width / 1.2;
  static final screenWidthX14 = Get.width / 1.4;
  static final screenWidthX17 = Get.width / 1.7;
  static final screenWidthX19 = Get.width / 1.9;
  static final screenWidthX24 = Get.width / 2.4;
  static final screenWidthX38 = Get.width / 3.8;
  static final screenWidthX44 = Get.width / 4.4;

  //misc
  static final profileCardHeight = Get.height * .4;

  //aspectRatio
  static final itemAspectRatio =
      Dimens.screenWidthXHalf / ((Dimens.screenHeight - Dimens.gapX6) / 2.3);

  static double factorOf({required double value}) {
    double factor = screenHeight / value;
    return Dimens.screenHeight / factor;
  }
}
