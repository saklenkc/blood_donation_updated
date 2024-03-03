import 'package:chat_app_flutter_three/auth/auth_service.dart';
import 'package:chat_app_flutter_three/components/buttonController.dart';
import 'package:chat_app_flutter_three/components/textField.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmpasswordController = TextEditingController();

  final void Function()? ontap;

  RegisterPage({
    super.key,
    required this.ontap,
  });

  void register(BuildContext context) {
    final _auth = AuthService();

    if (_passwordController.text == _confirmpasswordController.text) {
      try {
        _auth.signUpWithEmailAndPassword(
          _emailController.text,
          _passwordController.text,
        );
      } catch (e) {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: Text(e.toString()),
                ));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.message,
              color: Colors.grey.shade500,
              size: 50.0,
            ),
            SizedBox(height: 40),
            Text(
              "Welcome back, You've been Missed ! ",
              style: TextStyle(
                color: Colors.grey.shade500,
                fontSize: 16.0,
              ),
            ),
            SizedBox(height: 12),
            MyTextField(
              obscureText: false,
              hinteText: "Enter Email",
              label: "Email",
              controller: _emailController,
            ),
            SizedBox(height: 12),
            MyTextField(
              obscureText: true,
              hinteText: "Enter Password",
              label: "Password",
              controller: _passwordController,
            ),
            SizedBox(height: 12),
            MyTextField(
              obscureText: true,
              hinteText: "Enter Confirm Password",
              label: "Confirm Password",
              controller: _confirmpasswordController,
            ),
            SizedBox(height: 12),
            MyButton(
              text: "Register",
              ontap: () => register(context),
            ),
            SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already Have An Account?",
                  style: TextStyle(color: Colors.grey.shade600),
                ),
                GestureDetector(
                  onTap: ontap,
                  child: Text(
                    " Let's Login",
                    style: TextStyle(
                        color: Colors.grey.shade600,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
