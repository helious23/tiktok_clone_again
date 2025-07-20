import 'package:flutter/material.dart';

class LoginFormScreen extends StatelessWidget {
  const LoginFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Log in to TikTok')),
      body: Column(children: [Text('Log in to TikTok')]),
    );
  }
}
