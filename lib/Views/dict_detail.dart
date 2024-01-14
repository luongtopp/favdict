import 'package:favdict/test/web_view.dart';
import 'package:flutter/material.dart';

class DictDetail extends StatelessWidget {
  String dictionary;

  DictDetail({super.key, required this.dictionary});
  String a = 'sdfd';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF216487),
          toolbarHeight: 51.52,
          title: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              return Container(
                width: constraints.maxWidth,
                child: Row(
                  children: <Widget>[
                    const Icon(
                      Icons.arrow_back,
                      color: Color(0xFFFFFFFF),
                    ),
                    SizedBox(width: 20),
                    SizedBox(
                      width: 170,
                      height: 30,
                      child: Text(dictionary,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                                  color: const Color(0xFFFFFFFF),
                                  fontSize: 20)),
                    ),
                    const SizedBox(width: 68),
                    GestureDetector(
                      onTap: () => {print('đã nâhsn')},
                      child: const Center(
                        widthFactor: 2,
                        heightFactor: 2,
                        child: Icon(
                          Icons.search,
                          color: Color(0xFFFFFFFF),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => {print('đã nâhsn')},
                      child: const Center(
                        widthFactor: 2,
                        heightFactor: 2,
                        child: Icon(
                          Icons.favorite,
                          color: Color(0xFFFFFFFF),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        body: WebViewExample(dict: dictionary),
      ),
      debugShowCheckedModeBanner: false,
      title: 'uu',
    );
  }

  IconButton newMethod() {
    return IconButton(
      icon: Icon(Icons.exit_to_app),
      onPressed: () {
        // Xử lý khi nút "Thoát" được nhấn
        print('Exit button pressed');
      },
    );
  }

  Widget navigationItem() {
    return Row();
  }
}
