import 'package:favdict/test/sqlite/data_demo.dart';
import 'package:flutter/material.dart';

class DictionaryProvider extends ChangeNotifier {
  final DictionaryDatabase database = DictionaryDatabase();
  List<Map<String, dynamic>> _savedWords = [];

  List<Map<String, dynamic>> get savedWords => _savedWords;

  Future<void> fetchSavedWords() async {
    _savedWords = await database.getSavedWords();
    notifyListeners(); // Thêm dòng này để thông báo thay đổi
  }

  Future<void> addWord(String word, String meaning) async {
    await database.insertWord(word, meaning);
    await fetchSavedWords();
  }
}
