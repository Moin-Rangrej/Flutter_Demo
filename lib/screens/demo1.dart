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
  final isHide = false;

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
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("Hello this is Flutter Text"),
          ),
          RichText(
              text: TextSpan(
                  text: "Hello123",
                  style: DefaultTextStyle.of(context).style,
                  children: const <TextSpan>[
                TextSpan(
                    text: "How are You?",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontFamily: "Lubri")),
                TextSpan(
                    text: "I am fine",
                    style: TextStyle(
                        color: Colors.blue, fontSize: 25, fontFamily: "Ubuatu"))
              ])),
          Container(
            child: Text("THis is Flutter Container"),
          ),
          const SizedBox(child: Text("sizeBox shrink")),
          const Visibility(visible: false, child: Text("Visibility Hide me")),
          const Offstage(offstage: false, child: Text("Hide me")),
          SizedBox.fromSize(
            size: Size.copy(Size(300, 30)),
            child: Text("THis is sizeBox fromSize"),
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
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (_) => const Demo2()))
                  },
              child: Center(child: Text("Demo2"))),
          Text(
            "Count ${number.count}",
            style: TextStyle(),
          ),
          TextField(),
          TextFormField(),
          Flexible(
            fit: FlexFit.tight,
            child: Container(
              height: 50,
              width: 100,
              color: Colors.red,
            ),
          )
        ],
      )),
    );
  }
}
