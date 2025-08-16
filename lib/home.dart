import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sample/newpage.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Save token
Future<void> saveToken(String token) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('token', token);
}

// API login function
Future<bool> loginUser(String username, String password) async {
  final url = Uri.parse("https://nexus.ebsgl.com/api/auth/agent-login");

  final response = await http.post(
    url,
    headers: {
      'Content-Type': 'application/x-www-form-urlencoded',
    },
    body: {
      'identifier': username,
      'password': password,
    },
  );

  print("Status Code: ${response.statusCode}");
  print("Response Body: ${response.body}");

  if (response.statusCode == 200) {
    // ✅ Save token (using response body for now)
    await saveToken(response.body.toString());
    print("✅ Login successful, token saved");
    return true;
  } else {
    print("❌ Login failed");
    return false;
  }
}

// Controllers for text fields
final TextEditingController usernameController = TextEditingController();
final TextEditingController passwordController = TextEditingController();

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("LOGIN",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
              SizedBox(height: 45),
              Text("Username", style: TextStyle(fontSize: 20)),
              SizedBox(height: 10),
              TextField(
                controller: usernameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Username",
                ),
              ),
              SizedBox(height: 20),
              Text("Password", style: TextStyle(fontSize: 20)),
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Password",
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  String username = usernameController.text.trim();
                  String password = passwordController.text.trim();

                  if (username.isEmpty || password.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          content:
                              Text("Please enter username and password")),
                    );
                    return;
                  }

                  bool success = await loginUser(username, password);
                  if (success) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => NewPage()),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Invalid username or password")),
                    );
                  }
                },
                child: Text("Login"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
