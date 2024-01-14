import 'package:favdict/data/database_helper.dart';
import 'package:favdict/models/search_dictionary.dart';
import 'package:flutter/material.dart';

class StateManagement extends ChangeNotifier {
  static List<SearchDictionary> searchDictionaries = <SearchDictionary>[];

  DatabaseHelper? databaseHelper;

  // Future<SearchDictionary> fetchSearchDictionary() async {
  //   try {
  //     searchDictionaries = await databaseHelper!.getSearchDictionary();
  //     notifyListeners();
  //   } catch (error) {
  //     print('Error: $error');
  //   }
  // }

  void findDict(SearchDictionary searchHistory) {
    searchDictionaries.add(searchHistory);
    notifyListeners();
  }

  void deleteDictItem(String id) {
    searchDictionaries.removeWhere((item) => item.searchDictionaryId == id);
    notifyListeners();
  }

  void deleteSearchDictionary() {
    searchDictionaries.clear();
    notifyListeners();
  }
}
