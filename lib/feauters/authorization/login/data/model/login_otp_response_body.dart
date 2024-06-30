class LoginOTPResponse {
  bool? status;
  String? message;
  Data? data;

  LoginOTPResponse({this.status, this.message, this.data});

  LoginOTPResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? phone;
  int? code;
  bool? isActive;

  Data({this.phone, this.code, this.isActive});

  Data.fromJson(Map<String, dynamic> json) {
    phone = json['phone'];
    code = json['code'];
    isActive = json['isActive'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['phone'] = this.phone;
    data['code'] = this.code;
    data['isActive'] = this.isActive;
    return data;
  }
}
