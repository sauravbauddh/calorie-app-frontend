import 'package:calorie_app/app/data/value/dimens.dart';
import 'package:calorie_app/app/modules/onboarding/controller/onboarding_controller.dart';
import 'package:calorie_app/widgets/input_field/common_text_input_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class OtherInfo extends GetView<OnBoardingController> {
  const OtherInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Form(
      key: controller.otherFormKey,
      child: Column(
        children: [
          CommonTextField(
            wrapper: controller.feesWrapper,
            title: 'Fees',
            inputType: TextInputType.number,
            maxLength: 5,
          ),
          Dimens.heightGap20,
          CommonTextField(
            wrapper: controller.descriptionWrapper,
            title: 'About',
            maxLine: 5,
          ),
        ],
      ),
    ));
  }
}
