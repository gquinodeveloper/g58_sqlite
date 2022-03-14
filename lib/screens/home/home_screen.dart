import 'package:flutter/material.dart';
import 'package:g58_sqlite/providers/user_provider.dart';
import 'package:g58_sqlite/screens/home/widgets/insert_button.dart';
import 'package:g58_sqlite/screens/home/widgets/users.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("HomeScreen");
    return Scaffold(
      appBar: AppBar(
        title: const Text("User - SQLITE"),
      ),
      body: Column(
        children: const [
          SizedBox(height: 30.0),
          Text("Header"),
          Body(),
          Text("Footer"),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: const InsertButton(),
    );
  }
}

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("Body");
    final _userProvider = Provider.of<UserProvider>(context, listen: false);
    _userProvider.getAllUser();
    return const Users();
  }
}
