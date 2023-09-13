import 'package:flutter/material.dart';
import 'package:forum_app_flutter/model/user.dart';

class LeaderboardCard extends StatefulWidget {
  final User user;
  final int points;

  const LeaderboardCard({Key? key, required this.user, required this.points})
      : super(key: key);

  @override
  LeaderboardCardState createState() => LeaderboardCardState();
}

class LeaderboardCardState extends State<LeaderboardCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Center(
              child: Container(
                margin: const EdgeInsets.only(bottom: 5, right: 30),
                child: Column(
                  children: [
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.network(
                            'https://ui-avatars.com/api/?name=${widget.user.name}&length=1&background=random&size=128',
                            width: 28,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            widget.user.name.toString(),
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: Container(
                margin: const EdgeInsets.only(bottom: 5, left: 40),
                child: Text(
                  widget.points.toString(),
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
