import 'package:chat_bot_app/components/label.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
        centerTitle: true,
      ),
      body: const SafeArea(
          child: Column(
        children: [
          Text(
            "Welcome",
            style: TextStyle(fontSize: 20),
          ),
          Label(text: "Whereas recognition of the inherent dignity")
        ],
      )),
    );
  }
}
