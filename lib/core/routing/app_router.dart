import 'package:captain_eco/feauters/authorization/login/view/login_screen.dart';
import 'package:captain_eco/feauters/authorization/register/view/register_screen.dart';
import 'package:captain_eco/feauters/authorization/register/view/step1_page_screen.dart';
import 'package:captain_eco/feauters/authorization/register/view/step2_page_screen.dart';
import 'package:captain_eco/feauters/home/view/home_page_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../utils/dependency_injection.dart';
import 'routes.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    final Object? arguments = settings.arguments;

    switch (settings.name) {
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (BuildContext context) {
            return LoginScreen();
          },
        );

      case Routes.registerScreen:
        return MaterialPageRoute(
          builder: (BuildContext context) {
            return RegisterScreen();
          },
        );

      case Routes.homepageScreen:
        return MaterialPageRoute(
          builder: (BuildContext context) {
            return HomePageScreen();
          },
        );

      case Routes.step1PageScreen:
        return MaterialPageRoute(
          builder: (BuildContext context) {
            return Step1PageScreen();
          },
        );

      case Routes.step2PageScreen:
        return MaterialPageRoute(
          builder: (BuildContext context) {
            return Step2PageScreen();
          },
        );
    }
    return null;
  }
}