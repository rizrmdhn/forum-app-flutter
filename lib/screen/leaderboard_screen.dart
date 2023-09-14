import 'package:flutter/material.dart';
import 'package:forum_app_flutter/components/app_bar.dart';
import 'package:forum_app_flutter/components/leaderboard_card.dart';
import 'package:forum_app_flutter/model/leaderboard.dart';
import 'package:forum_app_flutter/provider/context.dart';
import 'package:provider/provider.dart';

class LeaderboardScreen extends StatefulWidget {
  const LeaderboardScreen({Key? key}) : super(key: key);

  @override
  LeaderboardScreenState createState() => LeaderboardScreenState();
}

class LeaderboardScreenState extends State<LeaderboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ContextModel>(
      builder: (context, value, child) {
        return Scaffold(
          appBar: const CustomAppBar(title: 'Leaderboard', center: true),
          body: Center(
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Center(
                        child: Container(
                          margin: const EdgeInsets.only(top: 25, bottom: 25),
                          child: const Text(
                            'Pengguna',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Center(
                        child: Container(
                          margin: const EdgeInsets.only(top: 25, bottom: 25),
                          child: const Text(
                            'Skor',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: LeaderboardList(
                      leaderboard: value.leaderboardModel.leaderBoard),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class LeaderboardList extends StatefulWidget {
  final List<LeaderBoard> leaderboard;

  const LeaderboardList({Key? key, required this.leaderboard})
      : super(key: key);

  @override
  LeaderboardListState createState() => LeaderboardListState();
}

class LeaderboardListState extends State<LeaderboardList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.leaderboard.length,
      itemBuilder: (context, index) {
        return Container(
          decoration: const BoxDecoration(
            color: Color.fromARGB(15, 255, 255, 255),
          ),
          margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
          child: LeaderboardCard(
            user: widget.leaderboard[index].user,
            points: widget.leaderboard[index].score,
          ),
        );
      },
    );
  }
}
