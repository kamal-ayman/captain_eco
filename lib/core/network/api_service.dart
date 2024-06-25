import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:captain_eco/core/errors/api_error_handler.dart';
import 'package:captain_eco/core/errors/exceptions.dart';
import 'package:captain_eco/core/network/success_message_model.dart';
import 'package:captain_eco/core/translations/appLanguage.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import '../errors/failure.dart';
import 'api_constance.dart';
import 'error_message_model.dart';


abstract class ApiService {
  // Future<Either<LoginNoOTPResponse, LoginOTPResponse>> login(LoginRequestBody loginRequestBody);
  //
  // Future<LogoutResponse> logout(LogoutRequestBody loginRequestBody);
  //
  // Future<OTPSuccessResponse> verifyCode(OTPVerifyCodeRequestBody otpVerifyCodeRequestBody);
  //
  // Future<OTPResendResponse> resendOtp(OTPResendCodeRequestBody otpResendCodeRequestBody);
  //
  // Future<UserDataProfile> getProfileData(ProfileRequestBody profileGetDataRequestBody);
  //
  // Future<UserDataProfile> updateProfile(ProfileUpdateRequestBody profileRequestBody);
  //
  // Future<SuccessMessageModel> changePassword(ProfileChangePasswordRequestBody profileChangePasswordRequestBody);

}


class ApiServiceImp implements ApiService {
  final Dio _dio = createAndSetUpDio();

  // @override
  // Future<Either<LoginNoOTPResponse, LoginOTPResponse>> login(LoginRequestBody loginRequestBody) async {
  //   final response = await _dio.post(
  //     ApiConstance.login,
  //     data: loginRequestBody.toJson(),
  //   );
  //   if (!response.data['status']) {
  //     throw ServerException(
  //       errorMessageModel: ErrorMessageModel.fromJson(response.data),
  //     );
  //   }
  //   if (!response.data['data']['isActive']) {
  //     return Right(LoginOTPResponse.fromJson(response.data));
  //   }
  //   return Left(LoginNoOTPResponse.fromJson(response.data));
  // }
  //
  // @override
  // Future<OTPSuccessResponse> verifyCode(OTPVerifyCodeRequestBody otpVerifyCodeRequestBody) async {
  //   final response = await _dio.post(
  //     ApiConstance.verifyCode,
  //     data: otpVerifyCodeRequestBody.toJson(),
  //   );
  //   if (response.data['status']) {
  //     return OTPSuccessResponse.fromJson(response.data);
  //   }
  //   throw ServerException(
  //     errorMessageModel: ErrorMessageModel.fromJson(response.data),
  //   );
  // }
  //
  // @override
  // Future<OTPResendResponse> resendOtp(OTPResendCodeRequestBody otpResendCodeRequestBody) async {
  //   final response = await _dio.post(
  //     ApiConstance.resendCode,
  //     data: otpResendCodeRequestBody.toJson(),
  //   );
  //   if (response.data['status']) {
  //     return OTPResendResponse.fromJson(response.data);
  //   }
  //   throw ServerException(
  //     errorMessageModel: ErrorMessageModel.fromJson(response.data),
  //   );
  // }
  //
  // @override
  // Future<UserDataProfile> getProfileData(ProfileRequestBody profileGetDataRequestBody) async {
  //   final response = await _dio.get(
  //     ApiConstance.getProfileData,
  //     data: profileGetDataRequestBody.toJson(),
  //   );
  //   if (response.data['status']) {
  //     return UserDataProfile.fromJson(response.data);
  //   }
  //   throw ServerException(
  //     errorMessageModel: ErrorMessageModel.fromJson(response.data),
  //   );
  // }
  //
  // @override
  // Future<UserDataProfile> updateProfile(ProfileUpdateRequestBody profileRequestBody) async {
  //   print('token: ${ApiConstance.token}');
  //   print('request body: ${profileRequestBody.toJson()}');
  //   final response = await _dio.post(
  //     options: Options(headers: {
  //       'authorization': ApiConstance.token,
  //     }),
  //     ApiConstance.updateProfile,
  //     data: profileRequestBody.toJson(),
  //   );
  //   if (response.data['status']) {
  //     return UserDataProfile.fromJson(response.data);
  //   }
  //   throw ServerException(
  //     errorMessageModel: ErrorMessageModel.fromJson(response.data),
  //   );
  // }
  //
  // @override
  // Future<SuccessMessageModel> changePassword(ProfileChangePasswordRequestBody profileChangePasswordRequestBody) async {
  //   try {
  //     final response = await _dio.post(
  //       ApiConstance.changePassword,
  //       data: profileChangePasswordRequestBody.toJson(),
  //     );
  //     if (response.data['status']) {
  //       return SuccessMessageModel.fromJson(response.data);
  //     }
  //     throw ServerException(
  //       errorMessageModel: ErrorMessageModel.fromJson(response.data),
  //     );
  //   } catch (e) {
  //     throw ServerException(
  //       errorMessageModel: ErrorMessageModel(
  //         number: '500',
  //         message: 'Server Error',
  //         status: false,
  //       ),
  //     );
  //   }
  // }
  //
  // @override
  // Future<LogoutResponse> logout(LogoutRequestBody loginRequestBody) async {
  //   try {
  //     final response = await _dio.post(
  //       ApiConstance.logout,
  //       options: Options(headers: {
  //         ..._dio.options.headers,
  //         'authorization': ApiConstance.token,
  //       }),
  //     );
  //     if (response.data['status']) {
  //       return LogoutResponse.fromJson(response.data);
  //     }
  //     throw ServerException(
  //       errorMessageModel: ErrorMessageModel.fromJson(response.data),
  //     );
  //   } catch (e) {
  //     throw ServerException(
  //       errorMessageModel: ErrorMessageModel(
  //         number: '500',
  //         message: 'Server Error',
  //         status: false,
  //       ),
  //     );
  //   }
  // }
}


Dio createAndSetUpDio() {
  Dio dio = Dio();
  dio
    ..options.connectTimeout = const Duration(seconds: 10)
    ..options.receiveTimeout = const Duration(seconds: 10)
    ..options.baseUrl = ApiConstance.baseUrl
    ..options.headers = {
      'lang': AppLanguage.languageCode,
      'Content-Type': 'application/json',
      'Connection': 'keep-alive',
      'Accept': '*/*',
      'Accept-Encoding': 'gzip, deflate, br',
    };

  dio.interceptors.add(PrettyDioLogger(
    requestHeader: false,
    requestBody: true,
    responseBody: true,
    responseHeader: false,
    error: true,
    compact: true,
    maxWidth: 90,
    request: true,
  ));
  return dio;
}
