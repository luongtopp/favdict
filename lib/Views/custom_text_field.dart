import 'package:favdict/ViewModel/state_management.dart';
import 'package:favdict/Views/dict_detail.dart';
import 'package:favdict/data/database_helper.dart';
import 'package:favdict/models/search_dictionary.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // String? findDict;
    var stateManagement = context.watch<StateManagement>();
    return TextFormField(
        cursorColor: Colors.white,
        decoration: inputDecoration(context),
        style: Theme.of(context).textTheme.bodyMedium,
        textInputAction: TextInputAction.go,
        controller: _textController,
        onFieldSubmitted: (value) {
          if (value.isNotEmpty) {
            stateManagement.findDict(SearchDictionary(
              dictionary: value,
              cateforyId: '',
              searchDictionaryId: generateUniqueId(),
            ));
            DatabaseHelper().insertSearchDictionary(SearchDictionary(
              dictionary: value,
              cateforyId: '',
              searchDictionaryId: generateUniqueId(),
            ));
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DictDetail(dictionary: value),
              ),
            );
          } else {
            FocusScope.of(context).unfocus();
          }
        });
  }

  InputDecoration inputDecoration(BuildContext context) {
    return InputDecoration(
      hintText: ' Nhập từ để hỏi',
      border: InputBorder.none,
      hintStyle: Theme.of(context).textTheme.bodyMedium,
    );
  }

  String generateUniqueId() {
    DateTime now = DateTime.now();
    String uniqueId = now.microsecondsSinceEpoch.toString();
    return uniqueId;
  }
}
