import 'package:captain_eco/core/utils/setup_eco_taxi.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'captain_eco.dart';
import 'firebase_options.dart';

Future<void> main() async {
  await SetupCaptainEco.setup();
  runApp(const CaptainEco());
}
