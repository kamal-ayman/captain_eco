class LoginRequestBody {
  final String phone;
  final String password;
  String? deviceToken;
  String? latitude, longitude;

  LoginRequestBody({
    required this.phone,
    required this.password,
    required this.deviceToken,
    required this.latitude,
    required this.longitude,
  });

  factory LoginRequestBody.fromJson(Map<String, dynamic> json) =>
      LoginRequestBody(
        phone: json['phone'] as String,
        password: json['password'] as String,
        deviceToken: json['device_token'] as String,
        latitude: json['lat'] as String,
        longitude: json['long'] as String,
      );

  Map<String, dynamic> toJson() => {
        'phone': phone,
        'password': password,
        'device_token': deviceToken,
        'lat': latitude,
        'long': longitude,
      };

}
