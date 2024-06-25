import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../utils/dependency_injection.dart';
import 'routes.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    final Object? arguments = settings.arguments;

    switch (settings.name) {
      case Routes.loginScreen:
        // return MaterialPageRoute(
        //   builder: (_) => LoginScreen()
        // );
    }
    return null;
  }
}

// case Routes.loginScreen:
//         return MaterialPageRoute(
//           builder: (_) =>
//               BlocProvider(
//                 create: (context) => LoginCubit(sl()),
//                 child: LoginScreen(),
//               ),
//         );
//       case Routes.otpScreen:
//         return MaterialPageRoute(
//           builder: (_) =>
//               BlocProvider(
//                 create: (context) => OtpCubit(sl()),
//                 child: OtpScreen(otpScreenArgsModel: arguments as OtpScreenArgsModel),
//               ),
//         );
//       case Routes.profileScreen:
//         return MaterialPageRoute(
//           builder: (_) =>
//               BlocProvider(
//                 create: (context) => ProfileCubit(sl()),
//                 child: ProfileScreen(canBack: arguments as bool?),
//               ),
//         );
//
//       case Routes.accountScreen:
//         return MaterialPageRoute(
//           builder: (BuildContext context) {
//             return BlocProvider(
//               create: (context) => AccountCubit(sl()),
//               child: AccountScreen(),
//             );
//           },
//         );
//
//       case Routes.helpCenterScreen:
//         return MaterialPageRoute(
//           builder: (BuildContext context) {
//             return HelpCenterScreen();
//           },
//         );
//       case Routes.membershipScreen:
//         return MaterialPageRoute(
//           builder: (BuildContext context) {
//             return MembershipScreen();
//           },
//         );
//       case Routes.promotionScreen:
//         return MaterialPageRoute(
//           builder: (BuildContext context) {
//             return PromotionScreen();
//           },
//         );
//       case Routes.savedPlacesScreen:
//         return MaterialPageRoute(
//           builder: (BuildContext context) {
//             return SavedPlacesScreen();
//           },
//         );
//       case Routes.shareFriendsScreen:
//         return MaterialPageRoute(
//           builder: (BuildContext context) {
//             return ShareFriendsScreen();
//           },
//         );
//       case Routes.supportTeamScreen:
//         return MaterialPageRoute(
//           builder: (BuildContext context) {
//             return SupportTeamScreen();
//           },
//         );
//       case Routes.aboutUsScreen:
//         return MaterialPageRoute(
//           builder: (BuildContext context) {
//             return AboutUsScreen();
//           },
//         );
//       case Routes.addNewLocation:
//         return MaterialPageRoute(
//           builder: (BuildContext context) {
//             return AddNewLocationScreen();
//           },
//         );
//
//       case Routes.wheelSpinScreen:
//         return MaterialPageRoute(
//           builder: (BuildContext context) {
//             return WheelSpinScreen();
//           },
//         );
//
//       case Routes.homeScreen:
//         return MaterialPageRoute(builder: (_) => HomeScreen());