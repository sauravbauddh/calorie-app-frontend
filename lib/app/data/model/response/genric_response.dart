class GenericResponse {
  GenericResponse({
      this.statusCode,
      this.message, 
      this.data, 
      this.error,});

  GenericResponse.fromJson(dynamic json) {
    statusCode = json['statusCode'];
    message = json['message'];
    data = json['data'];
    error = json['error'];
  }
  int? statusCode;
  String? message;
  dynamic data;
  String? error;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['statusCode'] = statusCode;
    map['message'] = message;
    map['data'] = data;
    map['error'] = error;
    return map;
  }

}