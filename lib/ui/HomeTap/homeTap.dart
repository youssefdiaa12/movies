import 'package:flutter/material.dart';
import 'package:movies/ui/HomeTap/movieCard.dart';
import 'package:movies/ui/HomeTap/movieWidget.dart';

class homeTap extends StatelessWidget {
  const homeTap({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center,
            children: [
          Stack(
            alignment: Alignment.bottomLeft,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                            height: 200,
                            width: double.infinity,

                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.fill,
                              image: AssetImage("assets/oo.png"),
                            )
                            )
                        ),
                        const Center(
                          child: AnimatedCrossFade(
                            crossFadeState: CrossFadeState.showFirst,
                            duration: Duration(seconds: 1),
                            firstChild: Icon(
                              Icons.play_circle_outline,
                              size: 50,
                              color: Colors.white,
                            ),
                            secondChild: Icon(
                              Icons.pause_circle_outline,
                              size: 50,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(right: 56.0),
                    child: Text(
                      "Dora and the lost city of gold",
                      style: TextStyle(fontSize: 14, color: Colors.white),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(right: 149.0),
                    child: Text(
                      "2019  PG-13  2h 7m",
                      style: TextStyle(
                          fontSize: 10,
                          color: Color(0xffB5B4B4),
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ],
              ),
              Stack(
                alignment: Alignment.topLeft,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 12.0, top: 11),
                    child: Image(
                      image: AssetImage("assets/Image1.png"),
                    ),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.bookmark_add_rounded,
                        color: Colors.white,
                        size: 32,
                      ))
                ],
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                color: const Color(0xff282A28),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      margin: const EdgeInsets.all(8),
                      child: const Text(
                        'New Releases',
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    SizedBox(
                      height: 150,
                      child: ListView.builder(
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 10.0),
                            child: movieWidget(),
                          );
                        },
                        itemCount: 10,
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true, // Add this line
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 18,
              ),
              Container(
                color: const Color(0xff282A28),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      margin: EdgeInsets.all(12),
                      child: Text(
                        'Recommended',
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    SizedBox(
                      height: 220,
                      child: ListView.builder(
                        itemBuilder: (context, index) {
                          return movieCard();
                        },
                        itemCount: 10,
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true, // Add this line
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    )
                  ],
                ),
              ),
            ],
          )
        ]),
      ),
    );
  }
}
