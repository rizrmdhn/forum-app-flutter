import 'package:flutter/material.dart';
import 'package:forum_app_flutter/provider/context.dart';
import 'package:provider/provider.dart';

class CreateComment extends StatefulWidget {
  final String threadId;

  const CreateComment({Key? key, required this.threadId}) : super(key: key);

  @override
  CreateCommentState createState() => CreateCommentState();
}

class CreateCommentState extends State<CreateComment> {
  final commentController = TextEditingController();

  @override
  void dispose() {
    commentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ContextModel>(
      builder: (context, value, child) => Column(
        children: [
          TextField(
            controller: commentController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Komentar',
            ),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              context.read<ContextModel>().addComment(
                    widget.threadId,
                    commentController.text,
                  );
              commentController.clear();
            },
            style: TextButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 34, 40, 49),
              minimumSize: const Size(double.infinity, 40),
            ),
            child: const Text('Kirim', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
