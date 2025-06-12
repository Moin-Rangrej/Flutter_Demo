import 'package:chat_bot_app/components/Textfield.dart';
import 'package:chat_bot_app/components/button.dart';
import 'package:chat_bot_app/components/label.dart';
import 'package:chat_bot_app/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    void onPressRegister() async {
      bool isValidForm = _formkey.currentState!.validate();
      if (isValidForm) {
        usernameController.clear();
        passwordController.clear();
        emailController.clear();
        FocusScope.of(context).unfocus();
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const Login()));
        final SharedPreferences pref = await SharedPreferences.getInstance();
        pref.setBool("isLogin", true);
      } else {
        const snackBar = SnackBar(content: Text("fill all the fields"));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    }

    @override
    void dispose() {
      usernameController.dispose();
      passwordController.dispose();
      emailController.dispose();
      super.dispose();
    }

    return Scaffold(
      appBar: AppBar(
        title: const Label(text: "Register"),
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
                  hintText: "Enter UserName:",
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
                  controller: emailController,
                  hintText: "Enter email:",
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "please Enter Email";
                    } else {
                      bool emailValid = RegExp(
                              r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
                          .hasMatch(value);
                      if (!emailValid) {
                        return "Please Enter Valid Email";
                      }
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
                CustomButton(onPress: onPressRegister, title: "Register")
              ],
            )),
      )),
    );
  }
}
