class LoginRequest {
  LoginRequest({
    this.contactNumber,});

  LoginRequest.fromJson(dynamic json) {
  contactNumber = json['contactNumber'];
  }
  String? contactNumber;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['contactNumber'] = contactNumber;
    return map;
  }

}