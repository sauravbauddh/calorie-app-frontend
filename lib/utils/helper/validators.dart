import 'package:calorie_app/app/data/value/strings.dart';
import 'package:get/get.dart';

String? mandatoryValidator(String? value) {
  if (value == null || value.isEmpty) {
    return ErrorMessages.mandatory;
  }
  return null;
}

String? emailValidator(String? value) {
  if (!GetUtils.isEmail(value ?? "")) {
    return ErrorMessages.invalidEmail;
  }
  return null;
}

bool isValidEmail(String email) {
  // Regular expression for email validation
  final emailRegExp =
      RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
  return emailRegExp.hasMatch(email);
}

String? nameValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter a name';
  }
  // Use a regular expression to check if the input contains only letters and spaces
  final RegExp nameRegExp = RegExp(r'^[a-zA-Z\s]+$');
  if (!nameRegExp.hasMatch(value)) {
    return 'Only letters and spaces are allowed';
  }
  return null; // Return null if the input is valid
}

String? ageValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter an age';
  }

  // Use a regular expression to check if the input contains only digits
  final RegExp ageRegExp = RegExp(r'^[0-9]{1,3}$'); // Matches 1 to 3 digits

  if (!ageRegExp.hasMatch(value)) {
    return 'Please enter a valid age (up to 3 digits)';
  }

  int? age = int.tryParse(value);

  if (age == null || age < 1 || age > 999) {
    return 'Please enter a valid age between 1 and 999';
  }

  return null; // Return null if the input is valid
}

String? pincodeValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter a PIN code';
  }

  // Check if the input can be parsed as an integer
  int? pincode = int.tryParse(value);

  if (pincode == null) {
    return 'PIN code must be a numeric value';
  }

  // Ensure that the PIN code has exactly 6 digits
  if (value.length != 6) {
    return 'PIN code must contain exactly 6 digits';
  }

  return null; // Return null if the input is valid
}
