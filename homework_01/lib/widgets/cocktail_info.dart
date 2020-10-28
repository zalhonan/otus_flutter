import 'package:flutter/material.dart';
import '../services/colors.dart';

// Информация о коктейле. Получает заголовок и описание

class CocktailInfo extends StatelessWidget {
  CocktailInfo(this.title, this.description);

  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 17,
          ),
        ),
        Container(
          height: 8,
        ),
        Container(
          child: Text(
            description,
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          padding: EdgeInsets.fromLTRB(16, 6, 16, 6),
          decoration: BoxDecoration(
            color: kItemBackground,
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        Container(
          height: 20,
        )
      ],
    );
  }
}
