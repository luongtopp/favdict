import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DictionaryDatabase {
  static Database? _database;
  final String tableName = 'dictionary';

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await initDatabase();
    return _database!;
  }

  Future<Database> initDatabase() async {
    String path = join(await getDatabasesPath(), 'dictionary_database.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute('''
          CREATE TABLE $tableName (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            word TEXT,
            meaning TEXT
          )
        ''');
      },
    );
  }

  Future<void> insertWord(String word, String meaning) async {
    final db = await database;
    await db.insert(tableName, {'word': word, 'meaning': meaning});
  }

  Future<List<Map<String, dynamic>>> getSavedWords() async {
    final db = await database;
    return await db.query(tableName);
  }
}
