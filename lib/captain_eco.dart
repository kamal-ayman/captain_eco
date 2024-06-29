import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CaptainEco extends StatelessWidget {
  const CaptainEco({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Firebase Example App'),
        ),
        body: const Center(
          child: Text('Firebase Example App'),
        ),
      ),
    );
  }
}
