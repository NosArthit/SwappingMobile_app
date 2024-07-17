import 'package:flutter/material.dart';

class InfoRow extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;

  InfoRow({required this.label, required this.value, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          Text(
            "$label   ",
            style: TextStyle(color: Colors.teal[700]),
          ),
          Icon(icon, color: Colors.teal[700]),
          Text(
            "  :   ",
            style: TextStyle(color: Colors.teal[700]),
          ),
          Expanded(
            child: Text(
              value,
              style: TextStyle(color: Colors.teal[700]),
            ),
          ),
        ],
      ),
    );
  }
}
