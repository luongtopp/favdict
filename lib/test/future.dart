// import 'package:favdict/ViewModel/state_management.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class SearchDictionaryWidget extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (_) => StateManagement(),
//       child: Consumer<StateManagement>(
//         builder: (context, searchDictNotifier, _) {
//           return Scaffold(
//             appBar: AppBar(
//               title: Text('Search Dictionary'),
//             ),
//             body: FutureBuilder(
//               future: searchDictNotifier.fetchSearchDictionary(),
//               builder: (context, snapshot) {
//                 if (snapshot.connectionState == ConnectionState.waiting) {
//                   return CircularProgressIndicator();
//                 } else if (snapshot.hasError) {
//                   return Text('Error: ${snapshot.error}');
//                 } else {
//                   return ListView.builder(
//                     itemCount: searchDictNotifier.searchDictionaries.length,
//                     itemBuilder: (context, index) {
//                       final searchDict =
//                           searchDictNotifier.searchDictionaries[index];
//                       return ListTile(
//                         title: Text(searchDict.cateforyId),
//                         // Hiển thị thông tin khác nếu cần
//                       );
//                     },
//                   );
//                 }
//               },
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
