import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/authentication/widgets/form_button.dart';
import 'package:tiktok_clone/features/onboarding/interests_screen.dart';

class LoginFormScreen extends StatefulWidget {
  const LoginFormScreen({super.key});

  @override
  State<LoginFormScreen> createState() => _LoginFormScreenState();
}

class _LoginFormScreenState extends State<LoginFormScreen> {
  // Form validation 을 위해 formKey 생성
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // formKey로 validation 되지만, Form 자체를 control 하기 위해 controller 생성
  final TextEditingController _emailController =
      TextEditingController();
  final TextEditingController _passwordController =
      TextEditingController();

  String _email = '';
  String _password = '';
  bool _obscureText = true;

  @override
  void initState() {
    super.initState();
    _emailController.addListener(() {
      setState(() {
        _email = _emailController.text;
      });
    });
    _passwordController.addListener(() {
      setState(() {
        _password = _passwordController.text;
      });
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  String? _isEmailValid(String? value) {
    if (value == null || value.isEmpty) return "Email is required";
    final bool regExp = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    ).hasMatch(value);
    if (!regExp) return "Email is not valid";
    return null;
  }

  String? _isPasswordValid(String? value) {
    if (value == null || value.isEmpty) return "Password is required";
    if (value.length < 8 || value.length > 20) {
      return "Password must be 8 to 20 characters";
    }
    if (!RegExp(r'[a-zA-Z]').hasMatch(value)) {
      return "Password must contain letters";
    }
    if (!RegExp(r'[0-9]').hasMatch(value)) {
      return "Password must contain numbers";
    }
    if (!RegExp(r'[!-/:-@[-`{-~]').hasMatch(value)) {
      return "Password must contain special characters";
    }
    return null;
  }

  void _onScaffoldTap() {
    FocusScope.of(context).unfocus();
  }

  void _onClearTap() {
    _passwordController.clear();
  }

  void _onSubmitTap() {
    if (_formKey.currentState != null) {
      if (_formKey.currentState!.validate()) {
        _formKey.currentState!.save();
        // validation이 통과했을 때만 현재 컨트롤러의 값을 사용
        // print({'email': _email, 'password': _password});
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) => const InterestsScreen(),
          ),
          (route) => false,
        );
      }
    }
  }

  void _onEmailSaved(String? value) {
    if (value != null) {
      _email = value;
    }
  }

  void _onPasswordSaved(String? value) {
    if (value != null) {
      _password = value;
    }
  }

  void _toggleObscureText() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onScaffoldTap,
      child: Scaffold(
        appBar: AppBar(title: Text('Log in to TikTok')),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.size36,
          ),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gaps.v40,
                Text(
                  "Log in to TikTok",
                  style: TextStyle(
                    fontSize: Sizes.size24,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Gaps.v16,
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  onEditingComplete: _onSubmitTap,
                  autocorrect: false,
                  cursorColor: Theme.of(context).primaryColor,
                  validator: _isEmailValid,
                  onSaved: _onEmailSaved,
                  decoration: InputDecoration(
                    hintText: 'Email',
                    hintStyle: TextStyle(color: Colors.grey.shade400),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey.shade400,
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey.shade400,
                      ),
                    ),
                    errorBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.red.shade400,
                      ),
                    ),
                    focusedErrorBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.red.shade400,
                      ),
                    ),
                  ),
                ),
                Gaps.v16,
                TextFormField(
                  controller: _passwordController,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: _obscureText,
                  onEditingComplete: _onSubmitTap,
                  autocorrect: false,
                  cursorColor: Theme.of(context).primaryColor,
                  validator: _isPasswordValid,
                  onSaved: _onPasswordSaved,
                  decoration: InputDecoration(
                    suffix: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        GestureDetector(
                          onTap: _onClearTap,
                          child: FaIcon(
                            FontAwesomeIcons.solidCircleXmark,
                            color: Colors.grey.shade500,
                            size: Sizes.size20,
                          ),
                        ),
                        Gaps.h14,
                        GestureDetector(
                          onTap: _toggleObscureText,
                          child: FaIcon(
                            _obscureText
                                ? FontAwesomeIcons.eye
                                : FontAwesomeIcons.eyeSlash,
                            color: Colors.grey.shade500,
                            size: Sizes.size20,
                          ),
                        ),
                      ],
                    ),
                    hintText: 'Password',
                    hintStyle: TextStyle(color: Colors.grey.shade400),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey.shade400,
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey.shade400,
                      ),
                    ),
                    errorBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.red.shade400,
                      ),
                    ),
                    focusedErrorBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.red.shade400,
                      ),
                    ),
                  ),
                ),
                Gaps.v28,
                GestureDetector(
                  onTap: _onSubmitTap,
                  child: FormButton(
                    text: 'Log in',
                    disabled:
                        _isEmailValid(_email) != null ||
                        _isPasswordValid(_password) != null,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
