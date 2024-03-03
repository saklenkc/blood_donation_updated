import 'package:chat_app_flutter_three/auth/auth_service.dart';
import 'package:chat_app_flutter_three/components/MyDrawer.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void logout() {
    final _auth = AuthService();
    _auth.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade600,
        centerTitle: true,
        title: Text(
          "HomePage",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
              onPressed: logout, icon: Icon(Icons.logout, color: Colors.white))
        ],
      ),
      drawer: MyDrawer(),
    );
  }
}
