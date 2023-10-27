import 'package:flutter/material.dart';

import 'movieWidget.dart';

class movieCard extends StatelessWidget {
  const movieCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      margin: EdgeInsets.symmetric(horizontal: 4),
      child: Card(
          color: Color(0xff343534),
          surfaceTintColor: Colors.transparent,
          elevation: 12,
          child: Padding(
            padding: const EdgeInsets.only(right:12,bottom:10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                movieWidget(),
                Padding(
                  padding: const EdgeInsets.only(left:11.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Theme.of(context).colorScheme.secondary,
                        size: 16,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 2.0),
                        child: Text(
                          '4.5',
                          style: TextStyle(color: Colors.white),
                        ),
                      )
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 11.0),
                  child: Text(
                    'Deadpool 2',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 11.0),
                  child: Text(
                    '2018  R  1h 59m',
                    style: TextStyle(
                      color: Color(0xffB5B4B4),
                      fontWeight: FontWeight.w400,
                      fontSize: 8,
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}