import 'package:flutter/material.dart';
import 'package:movies/ui/HomeTap/PopularListWidget.dart';
import 'package:movies/ui/HomeTap/RecommendedListWidget.dart';
import 'package:movies/ui/HomeTap/newListWidget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class homeTap extends StatelessWidget {
  const homeTap({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          PopularListWidget(),
           SizedBox(
            height: 2.h,
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
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.w400 ,
                        fontFamily: "c"),
                      ),
                    ),
                     SizedBox(
                      height: 32.h,
                      child: const Padding(
                        padding: EdgeInsets.only(bottom: 10.0),
                        child: newListWidget(),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 18,
              ),
              Container(
                color: const Color(0xff282A28),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 8 , vertical: 5),
                      child: const Text(
                        'Recommended',
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.w400 ,
                        fontFamily: "c"),
                      ),
                    ),
                     SizedBox(height: 30.h, child: const RecommendedListWidget()),
                     SizedBox(
                      height: 2.h,
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
