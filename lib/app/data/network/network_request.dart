import 'dart:convert';
import 'dart:developer';

import 'package:calorie_app/app/data/value/evn.dart';
import 'package:calorie_app/utils/helper/exception_handler.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class NetworkRequester {
  late Dio _dio;
  late Dio _formDio;

  NetworkRequester() {
    prepareRequest();
    prepareFormRequest();
  }

  void prepareRequest() {
    BaseOptions dioOptions = BaseOptions(
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      sendTimeout: const Duration(seconds: 30),
      baseUrl: Env.baseURL,
      contentType: Headers.jsonContentType,
      responseType: ResponseType.json,
      headers: {'Accept': Headers.jsonContentType},
    );

    _dio = Dio(dioOptions);

    _dio.interceptors.clear();

    _dio.interceptors.add(LogInterceptor(
      error: true,
      request: true,
      requestBody: true,
      requestHeader: true,
      responseBody: true,
      responseHeader: false,
      logPrint: _printLog,
    ));
  }

  void prepareFormRequest() {
    BaseOptions dioOptions = BaseOptions(
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        baseUrl: Env.baseURL,
        contentType: "multipart/form-data",
        responseType: ResponseType.json);

    _formDio = Dio(dioOptions);

    _formDio.interceptors.clear();

    _formDio.interceptors.add(LogInterceptor(
      error: true,
      request: true,
      requestBody: true,
      requestHeader: true,
      responseBody: true,
      responseHeader: false,
      logPrint: _printLog,
    ));
  }

  _printLog(Object object) => log(object.toString());

  Future<dynamic> get({
    required String path,
    Map<String, dynamic>? query,
    Map<String, dynamic>? jsonData,
    String? bearerToken, // New parameter for the bearer token
  }) async {
    try {
      final response = await _dio.get(
        path,
        queryParameters: query,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $bearerToken'
          },
        ),
        data: jsonData != null ? json.encode(jsonData) : null,
      );
      return response.data;
    } on Exception catch (exception) {
      return ExceptionHandler.handleError(exception);
    }
  }

  Future<dynamic> post({
    required String path,
    Map<String, dynamic>? query,
    Map<String, dynamic>? data,
    String? bearerToken,
  }) async {
    try {
      final Map<String, String> headers = {};

      if (bearerToken != null && bearerToken.isNotEmpty) {
        headers['Authorization'] = 'Bearer $bearerToken';
      }

      final response = await _dio.post(
        path,
        queryParameters: query,
        data: data,
        options: Options(
          headers: headers,
        ),
      );
      return response.data;
    } on Exception catch (error) {
      return ExceptionHandler.handleError(error);
    }
  }

  Future<dynamic> put({
    required String path,
    Map<String, dynamic>? query,
    Map<String, dynamic>? data,
    String? bearerToken,
  }) async {
    try {
      final Map<String, String> headers = {};

      if (bearerToken != null && bearerToken.isNotEmpty) {
        headers['Authorization'] = 'Bearer $bearerToken';
      }

      final response = await _dio.put(
        path,
        queryParameters: query,
        data: data,
        options: Options(
          headers: headers,
        ),
      );
      return response.data;
    } on Exception catch (error) {
      return ExceptionHandler.handleError(error);
    }
  }

  Future<dynamic> patch({
    required String path,
    Map<String, dynamic>? query,
    Map<String, dynamic>? data,
  }) async {
    try {
      final response =
          await _dio.patch(path, queryParameters: query, data: data);
      return response.data;
    } on Exception catch (error) {
      return ExceptionHandler.handleError(error);
    }
  }

  Future<dynamic> delete({
    required String path,
    Map<String, dynamic>? query,
    Map<String, dynamic>? data,
    String? bearerToken,
  }) async {
    try {
      final Map<String, String> headers = {};

      if (bearerToken != null && bearerToken.isNotEmpty) {
        headers['Authorization'] = 'Bearer $bearerToken';
      }

      final response = await _dio.delete(
        path,
        queryParameters: query,
        data: data,
        options: Options(
          headers: headers,
        ),
      );
      return response.data;
    } on Exception catch (error) {
      return ExceptionHandler.handleError(error);
    }
  }

  Future downloadFile(
      {required String path,
      Map<String, dynamic>? query,
      var showDownloadProgress}) async {
    Dio dio = Dio();

    dio.interceptors.addAll([
      LogInterceptor(
        error: true,
        request: true,
        requestBody: true,
        requestHeader: true,
        responseBody: true,
        responseHeader: true,
      )
    ]);
    try {
      Response response = await dio.get(
        path,
        queryParameters: query,
        onReceiveProgress: showDownloadProgress,
        options: Options(
            responseType: ResponseType.bytes,
            followRedirects: false,
            validateStatus: (status) {
              return status! < 500;
            }),
      );
      return response.data;
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<dynamic> download(
      {required String url,
      required String savePath,
      required Function(int i, int y) callback}) async {
    Dio dio = Dio();
    try {
      final response =
          await dio.download(url, savePath, onReceiveProgress: callback);
      return response.data;
    } on Exception catch (exception) {
      return ExceptionHandler.handleError(exception);
    }
  }

  postFormData({
    required String path,
    Map<String, dynamic>? data,
    String? bearerToken,
  }) async {
    try {
      final Map<String, String> headers = {};

      if (bearerToken != null && bearerToken.isNotEmpty) {
        headers['Authorization'] = 'Bearer $bearerToken';
      }

      final response = await _formDio.post(
        path,
        data: FormData.fromMap(data!),
        options: Options(
          headers: headers,
        ),
      );
      return response.data;
    } on Exception catch (error) {
      return ExceptionHandler.handleError(error);
    }
  }

  putFormData({
    required String path,
    Map<String, dynamic>? data,
    String? bearerToken,
  }) async {
    final Map<String, String> headers = {};

    if (bearerToken != null && bearerToken.isNotEmpty) {
      headers['Authorization'] = 'Bearer $bearerToken';
    }

    try {
      final response = await _formDio.put(
        path,
        data: FormData.fromMap(data!),
        options: Options(
          headers: headers,
        ),
      );
      return response.data;
    } on Exception catch (error) {
      return ExceptionHandler.handleError(error);
    }
  }

// Future downloadFile({required String path}) async {
//   Dio dio = Dio();
//   try {
//     var response = await dio.get(
//       path,
//       options: Options(responseType: ResponseType.bytes),
//     );
//     return response.data;
//   } on Exception catch (exception) {
//     return ExceptionHandler.handleError(exception);
//   }
// }
}
