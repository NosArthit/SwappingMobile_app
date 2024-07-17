import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {
  final String title;
  final Widget content;

  InfoCard({required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.teal[100],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      elevation: 80,
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Text(
              title,
              style: TextStyle(
                  color: Colors.teal[700], fontWeight: FontWeight.w700),
            ),
            content,
          ],
        ),
      ),
    );
  }
}
