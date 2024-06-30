import 'package:captain_eco/core/errors/failure.dart';
import 'package:captain_eco/feauters/authorization/login/data/model/login_no_otp_response_body.dart';
import 'package:captain_eco/feauters/authorization/login/data/model/login_request_body.dart';
import 'package:dartz/dartz.dart';
import '../model/login_otp_response_body.dart';

class LoginRepo {

  // final ApiService _apiService;
  // LoginRepo(this._apiService);

  // Future<Either<FailureApi, Either<LoginNoOTPResponse, LoginOTPResponse>>> login(LoginRequestBody loginRequestBody) async {
    // try {
    //   final response = await _apiService.login(loginRequestBody);
    //   return Right(response);
    // } on ServerException catch (failure) {
    //   return Left(ServerFailure(failure.errorMessageModel.message));
    // }
  // }
}