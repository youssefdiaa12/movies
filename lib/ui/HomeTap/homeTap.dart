import 'package:flutter/material.dart';
import 'package:movies/ui/HomeTap/PopularListWidget.dart';
import 'package:movies/ui/HomeTap/RecommendedListWidget.dart';
import 'package:movies/ui/HomeTap/newListWidget.dart';

class homeTap extends StatelessWidget {
  const homeTap({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          PopularListWidget(),
          const SizedBox(
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
                    const SizedBox(
                      height: 150,
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 10.0),
                        child: newListWidget(),
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
                    SizedBox(height: 220, child: RecommendedListWidget()),
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
