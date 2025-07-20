import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class PasswordScreen extends StatelessWidget {
  const PasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Password')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Sizes.size36),
        child: Column(children: [Text('Password')]),
      ),
    );
  }
}
