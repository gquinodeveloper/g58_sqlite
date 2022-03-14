import 'package:flutter/material.dart';
import 'package:g58_sqlite/models/user_model.dart';
import 'package:g58_sqlite/providers/user_provider.dart';
import 'package:provider/provider.dart';

class InsertButton extends StatelessWidget {
  const InsertButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("InsertButton");
    return FloatingActionButton(
      child: const Icon(Icons.crop_square_rounded),
      onPressed: () {
        final _userProvider = Provider.of<UserProvider>(context, listen: false);
        UserModel user = UserModel(
          //id: 0,
          nombre: "Michel",
          apellido: "Torres",
          avatar:
              "https://i.pinimg.com/474x/08/70/cb/0870cb4b06ac2acc79546e2f9cd9b56b.jpg",
        );
        _userProvider.insertUser(user);
      },
    );
  }
}
