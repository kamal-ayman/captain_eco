// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:get/get.dart';

// class LoginBlocListener extends StatelessWidget {
//   const LoginBlocListener({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocListener<LoginCubit, LoginState>(
//       listenWhen: (previous, current) => current is Loading || current is SuccessLoginNoOTP || current is SuccessLoginOTP || current is Error,
//       listener: (context, state) {
//         state.whenOrNull(
//           successLoginNoOTP: (UserDataLogin userData) async {
//             print('userData.phone');
//             print(userData.phone);
//             await CacheHelper.saveUserDataLogin(userData);
//             if (userData.nationalId?.isEmpty ?? true) {
//               await CacheHelper.saveIsCompleteProfile(false);
//               // can back = false;
//               context.pushNamedAndRemoveUntil(Routes.profileScreen, arguments: false);
//               return;
//             }
//             await CacheHelper.saveIsCompleteProfile(true);
//             context.pushNamedAndRemoveUntil(Routes.homeScreen);
//           },
//           successLoginOTP: (OtpScreenArgsModel otpScreenArgsModel) async {
//             await CacheHelper.setPhone(otpScreenArgsModel.phone);
//             var cubit = context.read<LoginCubit>();
//             await CacheHelper.setSecurePassword(cubit.passwordController.text);
//             context.pushNamed(Routes.otpScreen, arguments: otpScreenArgsModel);
//           },
//           error: (error) => setupErrorState(context, error),
//         );
//       },
//       child: const SizedBox.shrink(),
//     );
//   }

//   void setupErrorState(BuildContext context, String error) {
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         icon: const Icon(
//           Icons.error,
//           color: Colors.red,
//           size: 32,
//         ),
//         content: Text(
//           error,
//           style: TextStyles.black15medium,
//         ),
//         actions: [
//           TextButton(
//             onPressed: () {
//               context.pop();
//             },
//             child: Text(
//               'got_it'.tr,
//               style: TextStyles.black14medium,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
