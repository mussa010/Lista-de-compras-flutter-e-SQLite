// ignore_for_file: file_names

import '../model/user.dart';
import 'package:sqflite/sqflite.dart';
import '../database/script.dart';
import '../database/connection.dart';

class UserDAO {

  static Future<void> dropTableUser() async {
    final db = await Connection.get();
    await db.execute(dropUser);
  }

  static Future<int> newUser(User newUser) async {
    final db = await Connection.get();
    return db.insert("User", newUser.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace
    );
  }

   Future<User> getUser(String email) async {
    final db = await Connection.get();

    List<Map<String, dynamic>> map = await db.query("User", where: "email = ?", whereArgs: [email]);
    db.close();
    return User.fromJson(map[0]);
  }

  static Future<List<User>> getAllUsers() async{
    final db = await Connection.get();

    final List<Map<String, dynamic>> map = await db.query("User");
    List<User> allUsers = [];
    for(int i = 0; i < map.length; i++) {
      allUsers.add(User.fromJson(map[i]));
    }
    return allUsers;
  }

  static Future<int> lenght() async {
    final db = await Connection.get();
    final List<Map<String, dynamic>> map = await db.query("User");

    List<User> allUsers = List.generate(map.length, (index) => User.fromJson(map[index]));

    return allUsers.length;
  }
}