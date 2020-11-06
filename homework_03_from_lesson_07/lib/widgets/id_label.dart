import 'package:flutter/material.dart';
import '../services/colors.dart';

class IdLabel extends StatelessWidget {
  IdLabel(this.label);

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        label,
        style: TextStyle(
          fontSize: 16,
        ),
      ),
      padding: EdgeInsets.fromLTRB(16, 6, 16, 6),
      decoration: BoxDecoration(
        color: kItemBackground,
        borderRadius: BorderRadius.circular(30),
      ),
    );
  }
}
