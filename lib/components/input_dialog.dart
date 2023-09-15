import 'package:flutter/material.dart';
import 'package:forum_app_flutter/model/user.dart';

class InputDialog extends StatefulWidget {
  final String title;
  final String category;
  final String body;
  final User authUser;

  const InputDialog({
    Key? key,
    required this.title,
    required this.category,
    required this.body,
    required this.authUser,
  }) : super(key: key);

  @override
  InputDialogState createState() => InputDialogState();
}

class InputDialogState extends State<InputDialog> {
  @override
  Widget build(BuildContext context) {
    return const AlertDialog(
      title: Text('Tambah Thread'),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Judul',
              ),
            ),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Kategori',
              ),
            ),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Isi',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
