import 'dart:io';
import 'package:g58_sqlite/models/user_model.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBProvider {
  //instance of sigleton
  static final DBProvider db = DBProvider._();
  DBProvider._();

  //Retornar instance of DB
  static late Database _databaseTemporal;
  static Database? _database;
  Future<Database> get database async {
    if (_database != null) return _database ?? _databaseTemporal;
    _database = await createDB();

    return _database ?? _databaseTemporal;
  }

  Future<Database> createDB() async {
    //1.- Determinar la ubicación o path donde se creará nuestra BD
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    //2.- Crear BD
    final path = join(documentDirectory.path, "BDVenta.db");
    print(path);

    return openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute('''
        CREATE TABLE User(
          id INTEGER PRIMARY KEY,
          nombre TEXT,
          apellido TEXT,
          avatar TEXT
        )
        ''');
        /* await db.execute('''
        CREATE TABLE perfil(
          id INTEGER PRIMARY KEY,
          nombre TEXT,
        )
        '''); */
      },
    );
  }

  Future<int> insertUser(UserModel user) async {
    //verificar la DB
    final db = await database;
    final response = await db.insert("User", user.toJson());
    return response;
  }

  Future<List<UserModel>> getAllUser() async {
    //verificar la DB
    final db = await database;
    final response = await db.query("User");

    return response.isNotEmpty
        ? response.map((json) => UserModel.fromJson(json)).toList()
        : [];
  }
}
