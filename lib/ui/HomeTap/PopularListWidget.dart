import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/ViewModel/homeModel.dart';
import 'package:movies/ui/HomeTap/popularWidget.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shimmer/shimmer.dart';

class PopularListWidget extends StatefulWidget {
  PopularListWidget();

  @override
  State<PopularListWidget> createState() => _PopularListWidgetState();
}

class _PopularListWidgetState extends State<PopularListWidget> {
  var model = homeViewModel();

  @override
  void initState() {
    super.initState();
    model.getMovieData();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<homeViewModel, moviePopularState>(
      builder: (context, state) {
        if (state is LoadingState) {
          return CarouselSlider.builder(
            itemCount: 10,
            itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
                Shimmer.fromColors(
                    baseColor: Colors.grey,
                    highlightColor: Colors.white,
                    child: Container(
                      height: 30.h,
                      width: 80.w,
                      color: Colors.grey,
                    ),),
            options: CarouselOptions(
              autoPlay: true,
              height: 30.h,
              autoPlayInterval: const Duration(seconds: 5),
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              scrollDirection: Axis.horizontal,
            ),
          );
        }
        else if (state is ErrorState) {
          return Center(
            child: ElevatedButton(
              child: Text(
                state.errorMessage ?? 'Error',
                style: const TextStyle(color: Colors.white),
              ),
              onPressed: () {
                model.getMovieData();
              },
            ),
          );
        } else if (state is SuccessState) {
          return CarouselSlider.builder(
            itemCount: state.results.length,
            itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
                popularWidget(state.results[itemIndex]),
            options: CarouselOptions(
              autoPlay: true,
              height: 35.h,
              autoPlayInterval: const Duration(seconds: 5),
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              scrollDirection: Axis.horizontal,
            ),
          );
        } else {
          return CarouselSlider.builder(
            itemCount: 10,
            itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
                Shimmer.fromColors(
                  baseColor: Colors.grey,
                  highlightColor: Colors.white,
                  child: Container(
                    height: 30.h,
                    width: 80.w,
                    color: Colors.grey,
                  ),),
            options: CarouselOptions(
              autoPlay: true,
              height: 30.h,
              autoPlayInterval: const Duration(seconds: 5),
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              scrollDirection: Axis.horizontal,
            ),
          );
        }
      },
      bloc: model,
    );
  }
}