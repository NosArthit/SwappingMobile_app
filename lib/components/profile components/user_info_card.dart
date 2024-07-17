import 'package:flutter/material.dart';

class UserInfoCard extends StatelessWidget {
  final String title;
  final String content;
  final double contentSize;

  const UserInfoCard({
    Key? key,
    required this.title,
    required this.content,
    this.contentSize = 15.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: contentSize,
            ),
          ),
          SizedBox(height: 5),
          Text(
            content,
            style: TextStyle(
              fontSize: contentSize,
            ),
          ),
        ],
      ),
    );
  }
}
