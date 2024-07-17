import 'package:flutter/material.dart';
import 'package:my_application/pages/register_page.dart';

class RegisterNowRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Not a member?",
          style: TextStyle(color: Colors.grey[700]),
        ),
        const SizedBox(width: 2),
        TextButton(
          child: Text(
            "Register now",
            style: TextStyle(
              color: Colors.blueAccent,
              fontWeight: FontWeight.bold,
            ),
          ),
          onPressed: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) {
              return RegisterPage();
            }));
          },
        ),
      ],
    );
  }
}
