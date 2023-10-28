import 'package:flutter/material.dart';

class movieWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topLeft,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 4),
          child: Padding(
            padding: const EdgeInsets.only(left:12.0,top:11.0),
            child: const Image(
              height: 137,
              width: 86,
              image: AssetImage("assets/Image1.png"),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.zero,
          child: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.bookmark_add_rounded,
              color: Colors.white,
              size: 24,
            ),
          ),
        ),
      ],
    );
  }
}
