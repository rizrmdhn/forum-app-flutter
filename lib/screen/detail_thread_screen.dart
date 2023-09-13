import 'package:flutter/material.dart';
import 'package:forum_app_flutter/components/app_bar.dart';
import 'package:forum_app_flutter/model/thread.dart';

class DetailThreadScreen extends StatefulWidget {
  final Thread thread;
  const DetailThreadScreen({Key? key, required this.thread}) : super(key: key);

  @override
  DetailThreadScreenState createState() => DetailThreadScreenState();
}

class DetailThreadScreenState extends State<DetailThreadScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: widget.thread.title),
      body: const Center(
        child: Text('Detail Thread Screen'),
      ),
    );
  }
}
