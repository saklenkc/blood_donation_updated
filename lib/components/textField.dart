import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String hinteText;
  final bool obscureText;
  final TextEditingController controller;
  final String label;

  const MyTextField({
    super.key,
    required this.hinteText,
    required this.obscureText,
    required this.controller,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade400),
          ),
          label: Text(label),
          filled: true,
          fillColor: Colors.grey.shade300,
          hintText: hinteText,
        ),
      ),
    );
  }
}
