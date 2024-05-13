import 'package:calorie_app/app/data/value/dimens.dart';
import 'package:calorie_app/app/data/value/strings.dart';
import 'package:calorie_app/app/modules/onboarding/controller/onboarding_controller.dart';
import 'package:calorie_app/app/theme/app_color.dart';
import 'package:calorie_app/utils/helper/text_field_wrapper.dart';
import 'package:calorie_app/utils/helper/validators.dart';
import 'package:calorie_app/widgets/drop_down/value_selector.dart';
import 'package:calorie_app/widgets/input_field/common_text_input_field.dart';
import 'package:calorie_app/widgets/text/common_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ICEContactInfo extends GetView<OnBoardingController> {
  const ICEContactInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.iceContactInfoFormKey,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            subHeading(
              text: "ICE contact ( Emergency contact ) :",
              textColor: AppColors.blueTextColor,
            ),
            Dimens.heightGap10,
            CommonTextField(
              wrapper: controller.fullNameWrapper,
              hintText: 'Enter Name',
              validator: mandatoryValidator,
            ),
            Dimens.heightGap10,
            ValueSelector(
              data: controller.relationshipList,
              selectedValue: controller.selectedRelationship,
              title: 'Select Relationship',
              onTap: (String v) {
                FocusManager.instance.primaryFocus?.unfocus();
                controller.relationshipWrapper.controller.text = v;
                controller.onSelectedRelationship(v);
                print(controller.selectedRelationship);
              },
              child: CommonTextField(
                suffixIcon: const Icon(Icons.keyboard_arrow_down),
                wrapper: controller.relationshipWrapper,
                hintText: '-select relationship-',
                validator: mandatoryValidator,
              ),
            ),
            Dimens.heightGap20,
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: CommonTextField(
                    prefixIcon: Container(
                      width: 20,
                      alignment: Alignment.center,
                      child: label(text: '+91'),
                    ),
                    wrapper: TextFieldWrapper(),
                    hintText: AppStrings.enterMobileNumber,
                    inputType:
                    const TextInputType.numberWithOptions(signed: true),
                    maxLength: 10,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter a phone number';
                      } else {
                        // return controller.validateMobileNumber(value);
                      }
                    },
                  ),
                ),
              ],
            ),
            Dimens.heightGap10,
            Align(
              alignment: Alignment.topRight,
              child: GestureDetector(
                onTap: () {
                  // Add functionality to add another account
                },
                child: subHeading(
                  text: "Add another account +",
                  textColor: AppColors.orangeButtonColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
