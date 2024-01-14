import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Overlay Color Example',
      theme: ThemeData(
        // Thiết lập overlayColor cho AlertDialog
        // Điều này sẽ tạo ra một lớp mờ khi hiển thị AlertDialog
        // Màu mờ là một màu đục và áp dụng lên toàn bộ màn hình phía sau
        dialogTheme: DialogTheme(
            backgroundColor: const Color.fromARGB(255, 255, 0, 0)
                .withOpacity(1), // Màu mờ, 0.5 là độ mờ
            shadowColor: Colors.amber,
            surfaceTintColor: Colors.green,
            iconColor: Colors.blue),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: Text('App Title'),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(10), // Chiều cao 48 pixels
          child: Container(
            alignment: Alignment.centerLeft,
            child: DropdownButton<String>(
              dropdownColor: Colors.red,
              borderRadius: BorderRadius.circular(12),
              items: <String>['Item 1', 'Item 2', 'Item 3'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                print(newValue);
              },
            ),
          ),
        ),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text('Dialog Title'),
                content: Text('Dialog content here...'),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('Close'),
                  ),
                ],
              ),
            );
          },
          child: Text('Show Dialog'),
        ),
      ),
    );
  }
}
