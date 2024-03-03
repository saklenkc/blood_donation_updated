import 'package:chat_app_flutter_three/pages/login_page.dart';
import 'package:chat_app_flutter_three/pages/register_page.dart';
import 'package:flutter/material.dart';

class LoginorRegister extends StatefulWidget {
  const LoginorRegister({super.key});

  @override
  State<LoginorRegister> createState() => _LoginorRegisterState();
}

class _LoginorRegisterState extends State<LoginorRegister> {
  bool showLoginPage = true;

  void togglesPages() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!showLoginPage) {
      return RegisterPage(ontap: togglesPages);
    } else {
      return LoginPage(onTap: togglesPages);
    }
  }
}
