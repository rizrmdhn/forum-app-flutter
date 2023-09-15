import 'package:flutter/material.dart';
import 'package:forum_app_flutter/components/app_bar.dart';
import 'package:forum_app_flutter/components/thread_list.dart';
import 'package:forum_app_flutter/model/user.dart';
import 'package:forum_app_flutter/provider/context.dart';
import 'package:provider/provider.dart';

class ForumScreen extends StatefulWidget {
  final User authUser;
  final double width;
  final double height;

  const ForumScreen({
    Key? key,
    required this.authUser,
    required this.width,
    required this.height,
  }) : super(key: key);

  @override
  ForumScreenState createState() => ForumScreenState();
}

class ForumScreenState extends State<ForumScreen> {
  final judulController = TextEditingController();
  final categoryController = TextEditingController();
  final textController = TextEditingController();

  @override
  void dispose() {
    judulController.dispose();
    categoryController.dispose();
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ContextModel>(
      builder: (context, value, child) => Scaffold(
        appBar: const CustomAppBar(title: 'Forum'),
        body: Center(
          child: ThreadList(
            thread: value.threadModel.threads,
            authUser: widget.authUser,
            width: widget.width,
            height: widget.height,
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text('Tambah Thread'),
                  content: SingleChildScrollView(
                    child: ListBody(
                      children: <Widget>[
                        TextField(
                          controller: judulController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Judul',
                          ),
                        ),
                        const SizedBox(height: 10),
                        TextField(
                          controller: categoryController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Kategori',
                          ),
                        ),
                        const SizedBox(height: 10),
                        TextField(
                          controller: textController,
                          maxLines: 5,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Konten',
                          ),
                        ),
                      ],
                    ),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('Batal'),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                        context.read<ContextModel>().addThread(
                              judulController.text,
                              categoryController.text,
                              textController.text,
                            );

                        judulController.clear();
                        categoryController.clear();
                        textController.clear();
                      },
                      child: const Text('Tambah'),
                    ),
                  ],
                );
              },
            );
          },
          backgroundColor: Colors.black,
          child: const Icon(Icons.add, size: 30),
        ),
      ),
    );
  }
}
