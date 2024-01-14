import 'package:favdict/test/my_demo/user.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHandler {
  Future<Database> initializedDB() async {
    String path = await getDatabasesPath();
    print('db location : ' + path);
    return openDatabase(
      join(path, "users.db"),
      onCreate: (database, version) async {
        await database.execute(
            "CREATE TABLE users (id INTEGER PRIMARY KEY AUTOINCREMENT, first_name TEXT NOT NULL, last_name TEXT NOT NULL )");
      },
      version: 1,
    );
  }

  Future<int> insertUser(User user) async {
    final Database db = await initializedDB();
    return await db.insert('users', user.toMap());
  }

  Future<List<User>> getAllUsers() async {
    final Database db = await initializedDB();
    List<Map<String, dynamic>> result = await db.query('users');
    return result.map((e) => User.fromMap(e)).toList();
  }

  Future<void> deleteUser(int id) async {
    final Database db = await initializedDB();
    db.delete('users', where: 'id= ?', whereArgs: [id]);
  }

  Future<void> updateUsingHelper(User user) async {
    final Database db = await initializedDB();
    await db
        .update('users', user.toMap(), where: 'id= ?', whereArgs: [user.id]);
  }
}
