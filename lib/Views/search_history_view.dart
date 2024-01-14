import 'package:favdict/ViewModel/state_management.dart';
import 'package:favdict/Views/custom_text_field.dart';
import 'package:favdict/Views/dict_detail.dart';
import 'package:favdict/data/database_helper.dart';
import 'package:favdict/models/search_dictionary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';

class DictionaryList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SearchHistoryView();
}

class _SearchHistoryView extends State<StatefulWidget> {
  String? textValue;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFE4F3FF),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 37.2, 0, 0),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: const Color(0xFF017FB1),
                ),
                width: 370.5,
                height: 77.19,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
                    child: CustomTextField(),
                  ),
                ),
              ),
              const SizedBox(height: 9.3),
              FutureBuilder<List<SearchDictionary>>(
                  future: DatabaseHelper()
                      .getSearchDictionary(), // Future trả về List<String>
                  builder: (BuildContext context,
                      AsyncSnapshot<List<SearchDictionary>> snapshot) {
                    // Sử dụng snapshot.data để truy cập danh sách chuỗi
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else {
                      StateManagement.searchDictionaries.addAll(snapshot.data!);
                      return SizedBox(
                        height: 315.27,
                        child: SingleChildScrollView(
                          child: Consumer<StateManagement>(
                            builder: (context, yourModel, child) {
                              return Column(children: [
                                ...StateManagement.searchDictionaries
                                    .map((item) => GestureDetector(
                                          onTap: () => {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    DictDetail(
                                                        dictionary: item
                                                            .dictionary
                                                            .toString()),
                                              ),
                                            )
                                          },
                                          child: Container(
                                            clipBehavior: Clip.hardEdge, // this
                                            padding:
                                                const EdgeInsets.only(left: 25),
                                            width: 370.5,
                                            height: 59.52,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              color: const Color(0xFF3899CD),
                                              //   margin: const EdgeInsetsDirectional.only(bottom: 17.67),
                                            ),
                                            margin: const EdgeInsetsDirectional
                                                .only(bottom: 17.67),

                                            child: Slidable(
                                              endActionPane: ActionPane(
                                                extentRatio: 0.211,
                                                motion: const ScrollMotion(),
                                                children: [
                                                  SlidableAction(
                                                    onPressed:
                                                        (BuildContext context) {
                                                      yourModel.deleteDictItem(
                                                          item.searchDictionaryId);
                                                      DatabaseHelper()
                                                          .deleteSearchDictionary(
                                                              item.searchDictionaryId);
                                                    },
                                                    backgroundColor:
                                                        const Color(0xFFFF897D),
                                                    foregroundColor:
                                                        const Color(0xFFFFFFFF),
                                                    icon: Icons.delete,
                                                  ),
                                                ],
                                              ),
                                              child: Align(
                                                alignment: Alignment.centerLeft,
                                                child: Text(
                                                    item.dictionary.toString(),
                                                    textAlign: TextAlign.left,
                                                    maxLines: 1,
                                                    softWrap: true,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyMedium!
                                                        .copyWith(
                                                            fontSize: 14)),
                                              ),
                                            ),
                                          ),
                                        ))
                                    .toList()
                                    .reversed
                                    .take(6)
                                    .toList(),
                                if (StateManagement
                                    .searchDictionaries.isNotEmpty)
                                  GestureDetector(
                                    onTap: () => {
                                      showDialog(
                                        context: context,
                                        builder: (context) => AlertDialog(
                                          backgroundColor: Color(0xFF216487),
                                          title: Text(
                                            'Xác nhận',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium!
                                                .copyWith(
                                                  fontSize: 19,
                                                ),
                                          ),
                                          content: const Text(
                                              'Bạn có chắc chắn muốn xóa?'),
                                          actions: <Widget>[
                                            TextButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                              child: Text(
                                                'Hủy',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyMedium!
                                                    .copyWith(
                                                      fontSize: 15,
                                                    ),
                                              ),
                                            ),
                                            TextButton(
                                              onPressed: () {
                                                DatabaseHelper()
                                                    .deleteAllData();
                                                yourModel
                                                    .deleteSearchDictionary();
                                                Navigator.of(context).pop();
                                              },
                                              child: Text(
                                                'Xóa',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyMedium!
                                                    .copyWith(
                                                      fontSize: 15,
                                                    ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    },
                                    child: Container(
                                      width: 370.5,
                                      height: 46,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color: const Color(0xFFFF897D),
                                      ),
                                      margin: const EdgeInsetsDirectional.only(
                                          bottom: 17.67),
                                      child: Center(
                                        child: Text(
                                          'Xóa lịch sử',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium!
                                              .copyWith(
                                                fontSize: 14,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ),
                              ]);
                            },
                          ),
                        ),
                      );
                    }
                  })
            ],
          ),
        ),
      ),
    );
  }
}
