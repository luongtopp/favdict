import 'package:favdict/Views/search_history_view.dart';
import 'package:flutter/material.dart';

class ViewHomeApp extends StatefulWidget {
  const ViewHomeApp({super.key});

  @override
  State<ViewHomeApp> createState() => _ViewHomeApp();
}

class _ViewHomeApp extends State<ViewHomeApp> {
  int currentPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    Widget page;
    switch (currentPageIndex) {
      case 0:
        page = DictionaryList();
        break;
      case 1:
        page = const Placeholder();
        break;
      default:
        throw UnimplementedError('no widget for $currentPageIndex');
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF216487),
        toolbarHeight: 1,
      ),
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 200),
        child: page,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF216487),
        selectedItemColor: const Color(0xFFE4F3FF),
        unselectedItemColor: const Color.fromARGB(255, 149, 163, 173),
        elevation: 0,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: currentPageIndex == 0
                ? const Icon(Icons.home)
                : const Icon(Icons.home_outlined),
            label: 'Trang chủ',
          ),
          BottomNavigationBarItem(
            icon: currentPageIndex == 1
                ? const Icon(Icons.favorite)
                : const Icon(Icons.favorite_outline),
            label: 'Danh mục',
          ),
        ],
        onTap: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        currentIndex: currentPageIndex,
      ),
    );
  }
}
