import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home.dart';

class NewPage extends StatelessWidget {
  const NewPage({super.key});

  // 🔑 Logout function
  Future<void> logout(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('token'); // 
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Log out successfully")),
    );

    
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const HomePage()),
      (Route<dynamic> route) => false, 
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("New Page")),
      body: Center(
        child: ElevatedButton(
          onPressed: () => logout(context),
          child: Text("LogOut"),
        ),
      ),
    );
  }
}
