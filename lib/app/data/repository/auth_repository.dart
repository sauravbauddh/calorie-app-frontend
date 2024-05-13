import 'package:calorie_app/app/data/model/dto/response.dart';
import 'package:calorie_app/app/data/model/request/login_request.dart';
import 'package:calorie_app/app/data/model/response/genric_response.dart';
import 'package:calorie_app/app/data/value/urls.dart';
import 'package:calorie_app/base/base_repository.dart';
import 'package:calorie_app/utils/helper/exception_handler.dart';

class AuthRepository extends BaseRepository {


  Future<RepoResponse<GenericResponse>> logIn(LoginRequest data) async {
    final response =
    await controller.post(path: URLs.logIn, data: data.toJson());

    return response is APIException
        ? RepoResponse(error: response)
        : RepoResponse(data: GenericResponse.fromJson(response));
  }

  Future<RepoResponse<GenericResponse>> verifyOTP(dynamic data) async {
    final response =
    await controller.post(path: URLs.verifyOTP, data: data.toJson());

    return response is APIException
        ? RepoResponse(error: response)
        : RepoResponse(data: GenericResponse.fromJson(response));
  }


}