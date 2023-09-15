import 'package:flutter/material.dart';
import 'package:forum_app_flutter/model/user.dart';

class LeaderboardCard extends StatelessWidget {
  final User user;
  final int points;
  final double width;
  final double height;

  const LeaderboardCard({
    Key? key,
    required this.user,
    required this.points,
    required this.width,
    required this.height,
  }) : super(key: key);

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
                margin: const EdgeInsets.only(bottom: 5, right: 25),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.network(
                            'https://ui-avatars.com/api/?name=${user.name}&length=1&background=random&size=128',
                            width: 28,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            user.name.toString(),
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
                margin: const EdgeInsets.only(bottom: 5, left: 35),
                child: Text(
                  points.toString(),
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
