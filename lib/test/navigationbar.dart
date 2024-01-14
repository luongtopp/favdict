import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hide Navigation Bar Example',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  void hideNavigationBar() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.top]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hide Navigation Bar Example'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            hideNavigationBar(); // Ẩn thanh điều hướng khi ấn nút
          },
          child: Text('Hide Navigation Bar'),
        ),
      ),
    );
  }
}
