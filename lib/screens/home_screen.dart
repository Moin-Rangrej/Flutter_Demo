import 'package:chat_bot_app/model/user.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Dio dio = Dio();
  // List<User> users = [];
  List<dynamic> users = [];

  Future<void> fetchUsers() async {
    try {
      final response = await dio.get("https://randomuser.me/api/?results=100");
      final data = response.data;
      final result = data['results'] as List<dynamic>;
      print("result>>> $result");
      final tranformed = result.map((user) {
        return User(
            gender: user['gender'],
            email: user['email'],
            phone: user['phone'],
            cell: user['cell'],
            nat: user['nat']);
      }).toList();
      setState(() {
        users = result;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Welcome"),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.all(5),
        child: Column(
          children: [
            const Text("Welcome to Home"),
            ElevatedButton(
                onPressed: fetchUsers, child: const Text("fectUser")),
            Expanded(
              child: ListView.builder(
                  itemCount: users.length,
                  itemBuilder: (context, index) {
                    print("Hello>> ${users[index]['name']['first']}");
                    final name = users[index]['name'];
                    final String fullName = name['title'] +
                        " " +
                        name['first'] +
                        " " +
                        name['last'];
                    return ListTile(
                      leading: CircleAvatar(
                        child: Image.network(
                          users[index]['picture']['thumbnail'].toString(),
                          height: 200,
                          width: 200,
                        ),
                      ),
                    );
                  }),
              // child: ListView.builder(
              //     itemCount: users.length,
              //     itemBuilder: (context, index) {
              //       final user = users[index];
              //       final email = user.email;
              //       final gender = user.gender;

              //       return ListTile(
              //         title: Text("email: $email"),
              //         subtitle: Text("gender: $gender"),
              //       );
              //     })
            )
          ],
        ),
      )),
    );
  }
}
