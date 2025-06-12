import 'package:chat_bot_app/utils/textStyles.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPress;
  final String title;
  final TextStyle? textStyle;
  const CustomButton(
      {super.key, required this.onPress, required this.title, this.textStyle});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.cyan
          ),
          onPressed: onPress,
          child: Text(title, style: textStyle ?? buttonTitle())),
    );
  }
}
