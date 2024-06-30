import 'package:captain_eco/core/routing/app_router.dart';
import 'package:captain_eco/core/utils/setup_eco_taxi.dart';
import 'package:flutter/material.dart';
import 'captain_eco.dart';

Future<void> main() async {
  await SetupCaptainEco.setup();
  runApp(CaptainEco(appRouter: AppRouter()));
}
