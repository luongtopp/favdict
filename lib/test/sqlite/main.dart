import 'package:favdict/test/sqlite/provider.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DictionaryProvider(),
      child: MaterialApp(
        title: 'Your Dictionary App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: DictionaryScreen(),
      ),
    );
  }
}

class DictionaryScreen extends StatelessWidget {
  final TextEditingController wordController = TextEditingController();
  final TextEditingController meaningController = TextEditingController();
  @override
  void initState() {
    Provider.of<DictionaryProvider>(context as BuildContext, listen: false)
        .fetchSavedWords();
  }

  @override
  Widget build(BuildContext context) {
    var dictionaryProvider = Provider.of<DictionaryProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Dictionary'),
      ),
      body: Column(
        children: [
          TextField(
              controller: wordController,
              decoration: InputDecoration(labelText: 'Word')),
          TextField(
              controller: meaningController,
              decoration: InputDecoration(labelText: 'Meaning')),
          ElevatedButton(
            onPressed: () async {
              await dictionaryProvider.addWord(
                  wordController.text, meaningController.text);
              wordController.clear();
              meaningController.clear();
            },
            child: Text('Add Word'),
          ),
          Expanded(
            child: FutureBuilder(
              future: dictionaryProvider.fetchSavedWords(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else {
                  return ListView.builder(
                    itemCount: dictionaryProvider.savedWords.length,
                    itemBuilder: (context, index) {
                      var word = dictionaryProvider.savedWords[index]['word'];
                      var meaning =
                          dictionaryProvider.savedWords[index]['meaning'];
                      return ListTile(
                        title: Text(word),
                        subtitle: Text(meaning),
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
