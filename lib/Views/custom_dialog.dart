import 'package:favdict/ViewModel/state_management.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomDialog {
  static void showAddUserDialog(BuildContext context) {
    var appState = context.watch<StateManagement>();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFF216487),
        title: Text(
          'Xác nhận',
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontSize: 19,
              ),
        ),
        content: const Text('Bạn có chắc chắn muốn xóa?'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              appState.deleteSearchDictionary();
              Navigator.of(context).pop();
            },
            child: Text(
              'Hủy',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: 15,
                  ),
            ),
          ),
          TextButton(
            onPressed: () {
              // Xử lý dữ liệu nhập vào tại đây
              // Ví dụ: Provider.of<UserListViewModel>(context, listen: false).addUser(name, age);
              Navigator.of(context).pop();
            },
            child: Text(
              'Xóa',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: 15,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
