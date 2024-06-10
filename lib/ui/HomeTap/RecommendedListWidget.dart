import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/ApiManager/apiManager.dart';
import 'package:movies/model/recommendedResponse/RecommendedResult.dart';
import 'package:movies/ui/HomeTap/movieCard.dart';

import '../../ViewModel/recommended_cubit.dart';
import '../../di/di.dart';
import '../../model/dataSource/recommended_data_source.dart';
import 'Release/release_loading.dart';

class RecommendedListWidget extends StatefulWidget {
  const RecommendedListWidget({super.key});

  @override
  State<RecommendedListWidget> createState() => _RecommendedListWidgetState();
}

class _RecommendedListWidgetState extends State<RecommendedListWidget> {
  @override
  Widget build(BuildContext context) {
    return  BlocProvider(create: (context) =>

    RecommendedCubit(getIt<RecommendedDataSource>())..getRecommended(),
      child: BlocBuilder<RecommendedCubit, RecommendedState>(
        builder: (context, state) {
          if (state is RecommendedSuccess) {
            var recommendedList = state.recommendedResult;
            return MovieCard(recommendedList.results);
          } else if (state is RecommendedError) {
            return Center(
              child: Column(
                children: [
                  // Lottie.asset('assets/error.json'),
                  Text(state.error),
                ],
              ),
            );
          } else {
            return GridView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return  const Center(child:ReleaseLoading() );
              },
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                childAspectRatio: 0.7,
              ),
            );
          }
        }
      ),
    );





    //   FutureBuilder(
    //   future: apiManager.getRecommended(),
    //   builder: (context, snapshot) {
    //     if (snapshot.connectionState == ConnectionState.waiting) {
    //       return const Center(child: CircularProgressIndicator());
    //     } else if (snapshot.hasError || snapshot.data?.success == false) {
    //       return Center(
    //         child: Column(
    //           children: [
    //             Text(
    //                 snapshot.data?.status_message ?? snapshot.error.toString()),
    //             ElevatedButton(onPressed: () {}, child: const Text('Try Again'))
    //           ],
    //         ),
    //       );
    //     }
    //     RecommendedResult recommendedList = snapshot.data!;
    //
    //     return MovieCard(recommendedList.results);
    //   },
    // );
  }
}