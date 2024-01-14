import 'package:favdict/ViewModel/state_management.dart';
import 'package:favdict/Views/view_home_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() async {
  runApp(
    ChangeNotifierProvider(
      create: (context) => StateManagement(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        systemNavigationBarColor: Color(0xFF216487),
      ),
    );
    final ColorScheme colorScheme = ColorScheme.fromSeed(
      brightness: MediaQuery.platformBrightnessOf(context),
      seedColor: Colors.blue,
    );
    const TextTheme textTheme = TextTheme(
      bodyMedium: TextStyle(
        color: Color(0xFFFFFFFF),
        fontFamily: 'Roboto',
        fontSize: 16, // Kích thước font
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400, // Độ đậm của font
        height: 1.3285701, // Line-height
      ),
    );
    ThemeData themeData = ThemeData(
        colorScheme: colorScheme,
        textTheme: textTheme,
        useMaterial3: true,
        textSelectionTheme: const TextSelectionThemeData(
            selectionHandleColor: Color(0xFFFFFFFF)));

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themeData,
      title: 'FAVDICT',
      home: const ViewHomeApp(),
    );
  }
}
