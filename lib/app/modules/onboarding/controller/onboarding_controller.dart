import 'dart:io';

import 'package:calorie_app/app/modules/onboarding/views/pledge_screen.dart';
import 'package:calorie_app/app/modules/onboarding/widget/basic_info_widget.dart';
import 'package:calorie_app/app/modules/onboarding/widget/ice_contact_info_widget.dart';
import 'package:calorie_app/base/base_controller.dart';
import 'package:calorie_app/utils/helper/string_list.dart';
import 'package:calorie_app/utils/helper/text_field_wrapper.dart';
import 'package:calorie_app/widgets/dialog/confirmation_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

//will extend onboarding repository <>
class OnBoardingController extends BaseController {
  TextFieldWrapper firstNameWrapper = TextFieldWrapper();
  TextFieldWrapper lastNameWrapper = TextFieldWrapper();
  TextFieldWrapper fullNameWrapper = TextFieldWrapper();
  TextFieldWrapper dobWrapper = TextFieldWrapper();
  TextFieldWrapper genderWrapper = TextFieldWrapper();
  TextFieldWrapper bloodGroupWrapper = TextFieldWrapper();
  TextFieldWrapper relationshipWrapper = TextFieldWrapper();
  TextFieldWrapper qualificationWrapper = TextFieldWrapper();
  TextFieldWrapper specializationWrapper = TextFieldWrapper();
  TextFieldWrapper subSpecializationWrapper = TextFieldWrapper();
  TextFieldWrapper experienceWrapper = TextFieldWrapper();
  TextFieldWrapper feesWrapper = TextFieldWrapper();
  TextFieldWrapper descriptionWrapper = TextFieldWrapper();
  TextFieldWrapper licenseWrapper = TextFieldWrapper();
  TextFieldWrapper licenseNoWrapper = TextFieldWrapper();
  TextFieldWrapper certificateWrapper = TextFieldWrapper();

  RxString selectedCertificateName = RxString('');
  RxString selectedLicenceName = RxString('');

  final basicInfoFormKey = GlobalKey<FormState>();
  final iceContactInfoFormKey = GlobalKey<FormState>();
  final otherFormKey = GlobalKey<FormState>();

  final Rx<File> licenceFile = File("").obs;
  final Rx<File> certificateFile = File("").obs;
  List<String> allowedExtensions = ['jpg', 'pdf', 'png'];

  RxList<String> qualificationList = RxList();
  RxList<String> specializationList = RxList();

  RxList<String> subSpecializationList = RxList();
  RxList<String> selectedSubSpecialization = RxList();

  String selectedBloodGroup = "";
  RxList<String> bloodGroupList = RxList(bloodGroups);

  String selectedRelationship = "";
  RxList<String> relationshipList = RxList(relationships);

  RxMap<String, Widget> displayWidget = RxMap({
    'Basic Info': const BasicInfo(),
    'ICE Contact Info': const ICEContactInfo(),
  });

  RxInt selectedWidgetIdx = RxInt(0);

  DateTime lastDOBDate = DateTime.utc(1900);

  @override
  void onInit() async {
    super.onInit();
  }

  void handelNextBtn() {
    print(selectedWidgetIdx.value);
    if (selectedWidgetIdx.value < 1) {
      switch (selectedWidgetIdx.value) {
        case 0:
          if (basicInfoFormKey.currentState!.validate()) {
            selectedWidgetIdx.value += 1;
          }
          break;
        case 1:
          if (iceContactInfoFormKey.currentState!.validate()) {
            selectedWidgetIdx.value += 1;
          }
          break;
      }
    } else if (selectedWidgetIdx.value == 1) {
      if (iceContactInfoFormKey.currentState!.validate()) {
        Get.dialog(
          ConfirmationDialog(
            title: 'Confirmation',
            message: 'Do you want to submit?',
            isYesField: true,
            isNoField: false,
            btnOneOnTap: () {
              Get.back();
            },
            btnTwoOnTap: () {
              Get.back();
              Get.to(PledgeScreen());
              // submitOnBoarding();
            },
          ),
          barrierDismissible: false,
        );
      }
    }
  }

  void handePreviousBtn() {
    if (selectedWidgetIdx.value > 0) {
      selectedWidgetIdx.value -= 1;
    }
  }

  onSelectedBloodGroup(String value) {
    selectedBloodGroup = value;
    update();
  }

  onSelectedRelationship(String value) {
    selectedRelationship = value;
    update();
  }

  String getFileName(String value) {
    return value.split("/").last.split(".")[0];
  }

  handleScreenInfo() {}
}
