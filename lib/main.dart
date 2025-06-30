import 'package:chat_bot_app/provider/Products/category_provider.dart';
import 'package:chat_bot_app/provider/counter.dart';
import 'package:chat_bot_app/screens/login_screen.dart';
import 'package:chat_bot_app/screens/product_category.dart';
import 'package:chat_bot_app/screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'screens/demo1.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => Counter()),
    ChangeNotifierProvider(create: (_) => CategoryProvider()),
  ], child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isLogin = false;

  @override
  void initState() {
    super.initState();
    _checkLoginStatus();
  }

  Future<void> _checkLoginStatus() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    final loginstatus = pref.getBool("isLogin") ?? false;
    setState(() {
      isLogin = loginstatus;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isLogin == null) {
      return const MaterialApp(
        home: Scaffold(
          body: Center(child: CircularProgressIndicator.adaptive()),
        ),
      );
    }

    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home:
            const Demo1()); //isLogin ? const Login() : const Register());
  }
}
