import 'package:flutter/material.dart';
import 'package:my_application/pages/first_page.dart';

class NotNowRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          onPressed: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) {
              return FirstPage();
            }));
          },
          child: Text(
            "Not now",
            style: TextStyle(color: Colors.blueAccent),
          ),
        ),
        Text(
          "(Using without sign in)",
          style: TextStyle(fontSize: 12),
        ),
      ],
    );
  }
}
