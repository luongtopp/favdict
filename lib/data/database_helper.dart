import 'package:favdict/models/search_dictionary.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Đảm bảo Flutter đã được khởi tạo

  var dbHelper = DatabaseHelper();

  await dbHelper.insertSearchDictionary(const SearchDictionary(
    searchDictionaryId: '2',
    dictionary: 'hello',
    cateforyId: '',
  ));
  await dbHelper.insertSearchDictionary(const SearchDictionary(
    searchDictionaryId: '3',
    dictionary: 'alo',
    cateforyId: '',
  ));
}

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._();

  factory DatabaseHelper() => _instance;

  static Database? _database;

  DatabaseHelper._();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await initDatabase();
    return _database!;
  }

  Future<Database> initDatabase() async {
    final path = await getDatabasesPath();
    return openDatabase(
      join(path, 'dictionary_database.db'),
      version: 1,
      onCreate: (db, version) async {
        // Tạo bảng lịch sử tra cứu
        await db.execute('''
        CREATE TABLE search_dictionary(
          search_dictionary_id TEXT NOT NULL PRIMARY KEY,
          dictionaty TEXT,
          catefory_id TEXT,
          FOREIGN KEY (catefory_id) REFERENCES category_dict(catefory_id)
        )
      ''');

        await db.execute('''
        CREATE TABLE category_dict(
          catefory_id TEXT NOT NULL PRIMARY KEY,
          category_name TEXT NOT NULL
        )
      ''');
      },
    );
  }

  Future<void> insertSearchDictionary(SearchDictionary searchDictionary) async {
    final db = await database;
    await db.insert(
      'search_dictionary',
      searchDictionary.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<SearchDictionary>> getSearchDictionary() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('search_dictionary');
    return List.generate(
      maps.length,
      (i) {
        return SearchDictionary(
          searchDictionaryId: maps[i]['search_dictionary_id'] as String,
          dictionary: maps[i]['dictionaty'] as String,
          cateforyId: maps[i]['catefory_id'] as String,
        );
      },
    );
  }

  Future<void> deleteAllData() async {
    final Database db = await database; // Lấy đối tượng Database từ kết nối

    // Xóa dữ liệu từ mỗi bảng trong cơ sở dữ liệu
    await db.delete('search_dictionary');

    // ... và các bảng khác
  }

  Future<void> deleteSearchDictionary(String searchDictionaryId) async {
    final db = await database;
    await db.delete(
      'search_dictionary',
      where: 'search_dictionary_id = ?',
      whereArgs: [searchDictionaryId],
    );
  }
}
