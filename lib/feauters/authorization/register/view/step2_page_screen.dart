import 'package:flutter/material.dart';

class Step2PageScreen extends StatefulWidget {
  const Step2PageScreen({super.key});

  @override
  State<Step2PageScreen> createState() => _Step2PageScreenState();
}

class _Step2PageScreenState extends State<Step2PageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Step 2'),
      ),
    );
  }
}
