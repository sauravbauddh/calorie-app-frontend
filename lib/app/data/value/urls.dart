import 'package:calorie_app/app/data/value/evn.dart';

class URLs {
  URLs._privateConstructor();

  static const logIn = "${Env.baseURL}api/v1/auth/login/mobile";
  static const verifyOTP = "${Env.baseURL}api/v1/auth/login/verifyOTP";
}
