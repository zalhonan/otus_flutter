import 'package:flutter/material.dart';
import '../services/colors.dart';
import '../widgets/star.dart';

// Рейтинг в звездах. Получает кол-во звезд, обрезает до диапазона [0, 5]

class Rating extends StatelessWidget {
  int rating;
  Rating(this.rating);

  @override
  Widget build(BuildContext context) {
    if (rating < 0) {
      rating = 0;
    } else if (rating > 5) {
      rating = 5;
    }
    return Container(
      color: kRatingBackground,
      padding: EdgeInsets.fromLTRB(0, 24, 0, 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          for (int i = 0; i < rating; i++) Flexible(flex: 1, child: Star(true)),
          for (int i = 0; i < 5 - rating; i++)
            Flexible(flex: 1, child: Star(false)),
        ],
      ),
    );
  }
}
