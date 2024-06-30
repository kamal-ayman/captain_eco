class LoginNoOTPResponse {
  bool? status;
  String? message;
  Data? data;

  LoginNoOTPResponse({this.status, this.message, this.data});

  LoginNoOTPResponse.fromJson(Map<String, dynamic> json) {
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
  UserDataLogin? user;
  bool? isActive;

  Data({this.user, this.isActive});

  Data.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new UserDataLogin.fromJson(json['user']) : null;
    isActive = json['isActive'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['isActive'] = this.isActive;
    return data;
  }
}

class UserDataLogin {
  int? id;
  String? fName;
  String? lName;
  String? email;
  String? phone;
  String? image;
  String? address;
  String? lat;
  String? long;
  String? userRandomKey;
  String? nationalId;
  String? dateOfBirth;
  String? gender;
  int? wallet;
  String? token;
  String? createdAt;

  UserDataLogin(
      {this.id,
        this.fName,
        this.lName,
        this.email,
        this.phone,
        this.image,
        this.address,
        this.lat,
        this.long,
        this.userRandomKey,
        this.nationalId,
        this.dateOfBirth,
        this.gender,
        this.wallet,
        this.token,
        this.createdAt});

  UserDataLogin.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fName = json['f_name'];
    lName = json['l_name'];
    email = json['email'];
    phone = json['phone'];
    image = json['image'];
    address = json['address'];
    lat = json['lat'];
    long = json['long'];
    userRandomKey = json['user_random_key'];
    nationalId = json['national_id'];
    dateOfBirth = json['date_of_birth'];
    gender = json['gender'];
    wallet = json['wallet'];
    token = json['token'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['f_name'] = this.fName;
    data['l_name'] = this.lName;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['image'] = this.image;
    data['address'] = this.address;
    data['lat'] = this.lat;
    data['long'] = this.long;
    data['user_random_key'] = this.userRandomKey;
    data['national_id'] = this.nationalId;
    data['date_of_birth'] = this.dateOfBirth;
    data['gender'] = this.gender;
    data['wallet'] = this.wallet;
    data['token'] = this.token;
    data['created_at'] = this.createdAt;
    return data;
  }
}
