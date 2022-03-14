import 'package:flutter/material.dart';
import 'package:g58_sqlite/providers/user_provider.dart';
import 'package:provider/provider.dart';

class Users extends StatelessWidget {
  const Users({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("Users");
    final _userProvider = Provider.of<UserProvider>(context);
    final users = _userProvider.users;
    return ListView.builder(
      shrinkWrap: true,
      itemCount: users.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: CircleAvatar(
            backgroundImage:
                NetworkImage("${_userProvider.users[index].avatar}"),
          ),
          title: Text("${_userProvider.users[index].nombre}"),
          subtitle: Text("${_userProvider.users[index].apellido}"),
        );
      },
    );
  }
}
