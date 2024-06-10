import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:movies/ApiManager/apiManager.dart';
import 'package:movies/ViewModel/new_release_cubit.dart';
import 'package:movies/di/di.dart';
import 'package:movies/model/dataSource/new_relase_data_source.dart';
import 'package:movies/ui/HomeTap/MovieWidget.dart';
import 'package:movies/ui/HomeTap/Release/release_loading.dart';

class newListWidget extends StatefulWidget {
  const newListWidget({super.key});

  @override
  State<newListWidget> createState() => _newListWidgetState();
}

class _newListWidgetState extends State<newListWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          NewReleaseCubit(getIt<NewReleaseDataSource>())..getNewReleases(),
      child: BlocBuilder<NewReleaseCubit, NewReleaseState>(
        builder: (context, state) {
          if (state is NewReleaseSuccess) {
            var newReleasesList = state.newReleasesResponse;
            return MovieWidget(newReleasesList.results);
          }
          else if (state is NewReleaseError) {
            return Center(
              child: Column(
                children: [
               //   Lottie.asset('assets/error.json'),
                  Text(state.errorMessage),
                ],
              ),
            );
          }

          else {
            return GridView.builder(
              itemCount: 10,
              itemBuilder:(context, index) {
                return const ReleaseLoading();
              },
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                childAspectRatio: 0.5,
              ),
            );
          }
        },
      ),
    );

  }
}
