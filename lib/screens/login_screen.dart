import 'package:chat_bot_app/components/Textfield.dart';
import 'package:chat_bot_app/components/button.dart';
import 'package:chat_bot_app/components/label.dart';
import 'package:chat_bot_app/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  bool? isChecked = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final SharedPreferences pref = await SharedPreferences.getInstance();
      final uname = pref.getString("uname");
      final password = pref.getString("password");
      usernameController.text = uname ?? "";
      passwordController.text = password ?? "";
    });
  }

  void onPressLogin() async {
    try {
      FocusScope.of(context).unfocus();
      bool isValidForm = _formkey.currentState!.validate();
      if (isValidForm) {
        if (isChecked == true) {
          final SharedPreferences pref = await SharedPreferences.getInstance();
          pref.setString("uname", usernameController.text);
          pref.setString("password", passwordController.text);
        }
        usernameController.clear();
        passwordController.clear();
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const HomeScreen()));
      } else {
        const snackBar = SnackBar(content: Text("fill all the fields"));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    } catch (e) {
      final snackBar =
          SnackBar(content: Text("SomeThing went wrong ${e.toString()}"));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Label(text: "Login"),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.05),
        child: Form(
            key: _formkey,
            child: Column(
              children: [
                CustomTextfield(
                  controller: usernameController,
                  hintText: "Enter username:",
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "please enter the name";
                    }
                    return null;
                  },
                ),
                CustomTextfield(
                  controller: passwordController,
                  hintText: "Enter password:",
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.text,
                  obsecureText: true,
                  validator: (pw) {
                    if (pw == null || pw.isEmpty) {
                      return "Please Enter Password";
                    }
                    return null;
                  },
                ),
                CheckboxListTile.adaptive(
                    title: const Text("Remember me"),
                    controlAffinity: ListTileControlAffinity.platform,
                    value: isChecked,
                    onChanged: (bool? val) {
                      setState(() {
                        isChecked = val;
                      });
                    }),
                CustomButton(onPress: onPressLogin, title: "login")
              ],
            )),
      )),
    );
  }
}
