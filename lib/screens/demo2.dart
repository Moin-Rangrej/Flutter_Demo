import 'package:chat_bot_app/provider/counter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Demo2 extends StatefulWidget {
  const Demo2({super.key});

  @override
  State<Demo2> createState() => _Demo2State();
}

class _Demo2State extends State<Demo2> {
  @override
  Widget build(BuildContext context) {
    final number = Provider.of<Counter>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("This is Demo2"),
        backgroundColor: Colors.amberAccent,
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            children: [
              Text("count ${number.count}"),
              ElevatedButton.icon(
                  onPressed: number.increament,
                  label: const Text("Increament")),
              ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text("Go Back"))
            ],
          ),
        ),
      )),
    );
  }
}
