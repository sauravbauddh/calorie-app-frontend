import 'dart:async';

import 'package:calorie_app/app/data/model/request/login_request.dart';
import 'package:calorie_app/app/data/model/request/verify_otp_request.dart';
import 'package:calorie_app/app/data/repository/auth_repository.dart';
import 'package:calorie_app/utils/app_utils.dart';
import 'package:calorie_app/utils/helper/text_field_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final AuthRepository _authRepository = AuthRepository();

  // Use GetX reactive variables
  final RxBool isValidMobileNumber = false.obs;
  final RxBool isLoading = false.obs;

  final RxString otpVerificationId = ''.obs;
  final RxString otpEnteredByUser = ''.obs;
  final RxString userMobile = ''.obs;

  // Initialize text field wrappers
  final mobileWrapper = TextFieldWrapper();

  // Initialize controllers
  final TextEditingController otpController = TextEditingController();

  // Initialize form keys
  final mobileFormKey = GlobalKey<FormState>();
  final otpFormKey = GlobalKey<FormState>();

  // Timer duration in seconds
  static const int otpResendDuration = 60;

  // Timer variable
  RxInt resendTimer = RxInt(0);

  Timer? _timer;

  @override
  void onInit() {
    super.onInit();
  }

  void startResendTimer() {
    resendTimer.value = otpResendDuration;
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (resendTimer.value > 0) {
        resendTimer.value--;
      } else {
        _timer?.cancel();
      }
    });
  }

  void setLoading(bool status) {
    isLoading.value = status;
  }

  String? validateMobileNumber(String? mobileNumber) {
    if (mobileNumber == null || mobileNumber.isEmpty) {
      return 'Please enter a phone number';
    } else {
      final regex = RegExp(r'^[6789]\d{9}$');
      if (regex.hasMatch(mobileNumber)) {
        isValidMobileNumber.value = true;
        return null;
      } else {
        isValidMobileNumber.value = false;

        return 'Please enter a valid phone number';
      }
    }
  }

  Future<String> sendOTP() async {
    setLoading(true);
    try {
      final response = await _authRepository.logIn(
        LoginRequest(
            contactNumber: mobileWrapper.controller.text),
      );
      if (response.data?.statusCode == 200) {
        // User userData = User.fromJson(response.data?.data);
        print("OTP is:: " + response.data?.data['otp']);
        setLoading(false);
        return response.data?.data['otp'];
      } else {
        AppUtils.showErrorMsg(response: response);
      }
    } catch (exception) {
      print(exception);
    }
    setLoading(false);
    return "";
  }

  Future<void> verifyOtp() async {
    if (otpFormKey.currentState!.validate()) {
      setLoading(true);
      try {
        final response = await _authRepository.verifyOTP(
          VerifyOtpRequest(
              contactNumber: mobileWrapper.controller.text,
          otp: otpController.text),
        );
        if (response.data?.statusCode == 200) {
          print(response.data?.data);
          setLoading(false);
          return response.data?.data;
        } else {
          AppUtils.showErrorMsg(response: response);
        }
      } catch (e) {
        print(e);
        AppUtils.showToast(msg: 'Invalid OTP. Please try again.');
      } finally {
        otpController.clear();
      }
    }
  }
}
