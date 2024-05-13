import 'package:calorie_app/app/data/value/dimens.dart';
import 'package:calorie_app/app/modules/onboarding/controller/onboarding_controller.dart';
import 'package:calorie_app/app/modules/onboarding/widget/image_box.dart';
import 'package:calorie_app/app/theme/app_color.dart';
import 'package:calorie_app/utils/helper/validators.dart';
import 'package:calorie_app/widgets/drop_down/value_selector.dart';
import 'package:calorie_app/widgets/input_field/common_text_input_field.dart';
import 'package:calorie_app/widgets/text/common_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BasicInfo extends GetView<OnBoardingController> {
  const BasicInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.basicInfoFormKey,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            heading(text: "Name:", textColor: AppColors.blueTextColor),
            Dimens.heightGap10,
            CommonTextField(
              wrapper: controller.firstNameWrapper,
              hintText: 'First Name',
              validator: mandatoryValidator,
            ),
            Dimens.heightGap10,
            CommonTextField(
              wrapper: controller.lastNameWrapper,
              hintText: 'Last Name',
              validator: mandatoryValidator,
            ),
            Dimens.heightGap20,
            heading(text: "Blood Group:", textColor: AppColors.blueTextColor),
            Dimens.heightGap10,
            ValueSelector(
              data: controller.bloodGroupList,
              selectedValue: controller.selectedBloodGroup,
              title: 'Select Blood Group',
              onTap: (String v) {
                FocusManager.instance.primaryFocus?.unfocus();
                controller.bloodGroupWrapper.controller.text = v;
                controller.onSelectedBloodGroup(v);
                print(controller.selectedBloodGroup);
              },
              child: CommonTextField(
                suffixIcon: const Icon(Icons.keyboard_arrow_down),
                wrapper: controller.bloodGroupWrapper,
                hintText: '-select blood group-',
                validator: mandatoryValidator,
              ),
            ),
            Dimens.heightGap20,
            heading(
              text: "Profile Photo:",
              textColor: AppColors.blueTextColor,
            ),
            Dimens.heightGap10,
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ImageBox(onPressed: () {}),
                  Dimens.widthGap10,
                  ImageBox(onPressed: () {}),
                  Dimens.widthGap10,
                  ImageBox(onPressed: () {}),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
