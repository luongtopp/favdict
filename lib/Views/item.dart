// import 'package:favdict/ViewModel/ViewModel.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_slidable/flutter_slidable.dart';
// import 'package:provider/provider.dart';

// class HistoryCard extends StatelessWidget {
//   late var item;
//   late var con;
//   HistoryCard({
//     super.key,
//     required this.item,
//     required this.con,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       clipBehavior: Clip.hardEdge, // this
//       padding: const EdgeInsets.only(left: 25),
//       width: 370.5,
//       height: 59.52,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(12),
//         color: const Color(0xFF3899CD),
//         //   margin: const EdgeInsetsDirectional.only(bottom: 17.67),
//       ),
//       margin: const EdgeInsetsDirectional.only(bottom: 17.67),

//       child: Slidable(
//         endActionPane: ActionPane(
//           extentRatio: 0.211,
//           motion: ScrollMotion(),
//           children: [
//             SlidableAction(
//               onPressed: (BuildContext context) {
//                 var appState = con.watch<MyAppState>();
//                 print('con');
//                 appState.xoaTuDien(item.id);
//               },
//               backgroundColor: Color(0xFFFF897D),
//               foregroundColor: Colors.white,
//               icon: Icons.delete,
//             ),
//           ],
//         ),
//         child: Align(
//           alignment: Alignment.centerLeft,
//           child: Text(item.name,
//               textAlign: TextAlign.left,
//               maxLines: 1,
//               softWrap: true,
//               overflow: TextOverflow.ellipsis,
//               style: Theme.of(context)
//                   .textTheme
//                   .bodyMedium!
//                   .copyWith(fontSize: 14)),
//         ),
//       ),
//     );
//   }
// }
