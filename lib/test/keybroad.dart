import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: KeyboardHideExample(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class KeyboardHideExample extends StatefulWidget {
  @override
  _KeyboardHideExampleState createState() => _KeyboardHideExampleState();
}

class _KeyboardHideExampleState extends State<KeyboardHideExample> {
  final FocusNode _focusNode = FocusNode();

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hide Keyboard Example'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            TextField(
              focusNode: _focusNode,
              decoration: InputDecoration(
                hintText: 'Tap to type and hide keyboard',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Ẩn bàn phím khi button được nhấn
                if (_focusNode.hasFocus) {
                  _focusNode.unfocus();
                }
              },
              child: Text('Hide Keyboard'),
            ),
          ],
        ),
      ),
    );
  }
}
