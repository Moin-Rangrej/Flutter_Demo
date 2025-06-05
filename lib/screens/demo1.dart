import 'package:chat_bot_app/provider/counter.dart';
import 'package:chat_bot_app/screens/demo2.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Demo1 extends StatefulWidget {
  const Demo1({super.key});

  @override
  State<Demo1> createState() => _Demo1State();
}

class _Demo1State extends State<Demo1> {
  @override
  Widget build(BuildContext context) {
    final number = Provider.of<Counter>(context);
    print("number>>> ${number.count}");
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello World"),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add), onPressed: () => {number.increament()}),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("Hello this is Flutter Text"),
            ),
            Container(
              child: Text("THis is Flutter Container"),
            ),
            ElevatedButton(
                onPressed: () => {print("click on Elevated Button")},
                child: Text("Hello")),
            InkWell(
              onTap: () => {print("This is Inkwell widget")},
              child: const SizedBox(
                height: 30,
                child: Text(
                  "THis is Flutter SizeBox",
                  style: TextStyle(color: Colors.brown),
                ),
              ),
            ),
            GestureDetector(
                onTap: () => {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (_) => const Demo2()))
                    },
                child: Center(child: Text("Demo2"))),
            Text(
              "Count ${number.count}",
              style: TextStyle(),
            )
          ],
        ),
      )),
    );
  }
}
