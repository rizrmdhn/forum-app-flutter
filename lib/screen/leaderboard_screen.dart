import 'package:flutter/material.dart';
import 'package:forum_app_flutter/components/app_bar.dart';
import 'package:forum_app_flutter/components/leaderboard_card.dart';
import 'package:forum_app_flutter/model/leaderboard.dart';
import 'package:forum_app_flutter/provider/context.dart';
import 'package:provider/provider.dart';

class LeaderboardScreen extends StatelessWidget {
  final double width;
  final double height;

  const LeaderboardScreen({
    Key? key,
    required this.width,
    required this.height,
  }) : super(key: key);

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
                    leaderboard: value.leaderboardModel.leaderBoard,
                    width: width,
                    height: height,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class LeaderboardList extends StatelessWidget {
  final List<LeaderBoard> leaderboard;
  final double width;
  final double height;

  const LeaderboardList({
    Key? key,
    required this.leaderboard,
    required this.width,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: leaderboard.length,
      itemBuilder: (context, index) {
        return Container(
          decoration: const BoxDecoration(
            color: Color.fromARGB(15, 255, 255, 255),
          ),
          margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
          child: LeaderboardCard(
            user: leaderboard[index].user,
            points: leaderboard[index].score,
            width: width,
            height: height,
          ),
        );
      },
    );
  }
}
