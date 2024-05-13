class VerifyOtpRequest {
  VerifyOtpRequest({
    this.contactNumber,
    this.otp});

  VerifyOtpRequest.fromJson(dynamic json) {
    contactNumber = json['contactNumber'];
  }
  String? contactNumber;
  String? otp;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['contactNumber'] = contactNumber;
    map['otp'] = otp;
    return map;
  }

}