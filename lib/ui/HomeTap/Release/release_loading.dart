import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shimmer/shimmer.dart';

class ReleaseLoading extends StatelessWidget {
  const ReleaseLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey,
      highlightColor: Colors.white,
      child: Stack(
      alignment: Alignment.topLeft,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 4),
          child: Padding(
            padding: const EdgeInsets.only(left: 12.0, top: 11.0),
            child: InkWell(
                onTap: () {

                },
                child:Container(
                  height: 19.h,
                  width: 28.w,
                  color: Colors.grey,
                )
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.zero,
          child: IconButton(
            onPressed: () {
            },
            icon: const Icon(
              Icons.bookmark_add_rounded,
              color: Colors.white,
              size: 24,
            ),
          ),
        ),
      ],
    ),
    );
  }
}
