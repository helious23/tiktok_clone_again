import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/authentication/widgets/form_button.dart';

class LoginFormScreen extends StatefulWidget {
  const LoginFormScreen({super.key});

  @override
  State<LoginFormScreen> createState() => _LoginFormScreenState();
}

class _LoginFormScreenState extends State<LoginFormScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Map<String, String> formData = {};

  void _onSubmitTap() {
    if (_formKey.currentState != null) {
      if (_formKey.currentState!.validate()) {
        _formKey.currentState!.save();
        print(formData);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Log in to TikTok')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: Sizes.size36,
            ),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Gaps.v40,
                  TextFormField(
                    decoration: InputDecoration(hintText: 'Email'),
                    validator: (value) {
                      return null;
                    },
                    onSaved: (value) {
                      formData['email'] = value ?? '';
                    },
                  ),
                  Gaps.v16,
                  TextFormField(
                    decoration: InputDecoration(hintText: 'Password'),
                    validator: (value) {
                      return null;
                    },
                    onSaved: (value) {
                      formData['password'] = value ?? '';
                    },
                  ),
                  Gaps.v28,
                  GestureDetector(
                    onTap: _onSubmitTap,
                    child: FormButton(
                      text: 'Log in',
                      disabled: false,
                    ),
                  ),
                  Gaps.v16,
                  TextButton(
                    onPressed: () {},
                    child: Text('Forgot password?'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
