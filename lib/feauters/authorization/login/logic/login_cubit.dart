// import 'package:dartz/dartz.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:get/get.dart';
// import 'login_state.dart';
// import 'package:geolocator/geolocator.dart';

// class LoginCubit extends Cubit<LoginState> {
//   // final LoginRepo _loginRepo;

//   // LoginCubit(this._loginRepo) : super(const LoginState.initial());

//   final GlobalKey<FormState> formKey = GlobalKey<FormState>();
//   final TextEditingController phoneController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();

//   Future<void> emitLoginStates(LoginRequestBody loginRequestBody) async {
//     emit(const LoginState.loading());
//     Position? pos = await determinePosition();
//     print(pos?.longitude);
//     print(pos?.latitude);
//     if (pos == null) {
//       emit(LoginState.error(error: 'Location services are disabled.'.tr));
//       return;
//     }
//     loginRequestBody.latitude = pos.latitude.toString();
//     loginRequestBody.longitude = pos.longitude.toString();
//     // deviceToken
//     try {
//       loginRequestBody.deviceToken = await FirebaseMessaging.instance.getToken();
//     } catch (e) {
//       print(e);
//     }
//     final Either<FailureApi, Either<LoginNoOTPResponse, LoginOTPResponse>> response = await _loginRepo.login(loginRequestBody);
//     response.fold(
//           (errorHandler) {
//         emit(LoginState.error(error: errorHandler.message));
//       },
//           (res) {
//         res.fold((LoginNoOTPResponse loginNoOTPResponse) {
//           emit(LoginState.successLoginNoOTP(loginNoOTPResponse.data!.user!));
//         }, (LoginOTPResponse loginOTPResponse) {
//           emit(LoginState.successLoginOTP(OtpScreenArgsModel(otp: loginOTPResponse.data!.code.toString(), phone: phoneController.text)));
//         });
//       },
//     );
//   }

//   /// Determine the current position of the device.
//   ///
//   /// When the location services are not enabled or permissions
//   /// are denied the `Future` will return an error.
//   Future<Position?> determinePosition() async {
//     bool serviceEnabled;
//     LocationPermission permission;
//     serviceEnabled = await Geolocator.isLocationServiceEnabled();
//     if (!serviceEnabled) {
//       print('Location services are disabled.');
//       return null;
//     }

//     permission = await Geolocator.checkPermission();
//     if (permission == LocationPermission.denied) {
//       permission = await Geolocator.requestPermission();
//       if (permission == LocationPermission.denied) {
//         print('Location permissions are denied');
//         return null;
//       }
//     }

//     if (permission == LocationPermission.deniedForever) {
//       print('Location permissions are permanently denied, we cannot request permissions.');
//       return null;
//     }
//     return await Geolocator.getCurrentPosition();
//   }
// }
