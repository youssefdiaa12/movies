import 'package:flutter/material.dart';

class movieWidget extends StatelessWidget {
  double left, top, right, bottom;
movieWidget({required this.left, required this.top, required this.right, required this.bottom});
  @override
  Widget build(BuildContext context) {
    return  Stack(
      alignment: Alignment.topLeft,
      children: [
         Padding(
          padding: EdgeInsets.only(left:left,top:top,right:right,bottom:bottom),
          child: const Image(image: AssetImage("assets/Image1.png"),height: 137,
              width: 96,fit: BoxFit.fill),
        ),
        IconButton(onPressed: (){}, icon: const Icon(Icons.bookmark_add_rounded,
          color: Colors.white,
          size: 32,))

      ],
    );

  }
}

