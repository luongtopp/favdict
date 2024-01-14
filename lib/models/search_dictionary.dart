class SearchDictionary {
  final String searchDictionaryId;
  final String? dictionary;
  final String cateforyId;

  const SearchDictionary({
    required this.searchDictionaryId,
    required this.dictionary,
    required this.cateforyId,
  });
  Map<String, dynamic> toMap() {
    return {
      'search_dictionary_id': searchDictionaryId,
      'dictionaty': dictionary,
      'catefory_id': cateforyId
    };
  }

  @override
  String toString() {
    return '''SearchDictionary{searchDictionary: $searchDictionaryId, 
      dictionary: $dictionary, category: $cateforyId}''';
  }
}
