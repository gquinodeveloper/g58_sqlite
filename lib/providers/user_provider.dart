//PROVIDER
import 'package:flutter/material.dart';
import 'package:g58_sqlite/models/user_model.dart';
import 'package:g58_sqlite/providers/db_provider.dart';

class UserProvider extends ChangeNotifier {
  List<UserModel> users = [];
  insertUser(UserModel user) async {
    final response = await DBProvider.db.insertUser(user);
    user.id = response;
    users.add(user);
    notifyListeners();
  }

  getAllUser() async {
    users = await DBProvider.db.getAllUser();
    //users.addAll(response);
    notifyListeners();
  }
}
