import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RatingBar extends StatelessWidget {
  final int starCount;
  final double rating;
  final Color color;

  RatingBar(this.starCount, this.rating, this.color);

  Widget ratinBarBuild(BuildContext context, int index) {
    IconData icIcon = Icons.star;
    Color icColor = color;
    if (index >= rating) {
      icIcon = Icons.star_border;
      icColor = color.withOpacity(0.6);
    } else if (index > rating - 1 && index < rating) {
      icIcon = Icons.star_half;
    }
    return Icon(
      icIcon,
      size: 16,
      color: icColor,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(children: List.generate(starCount,(i)=>ratinBarBuild(context, i) ));
  }
}
