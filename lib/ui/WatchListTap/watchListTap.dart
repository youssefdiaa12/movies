import 'package:flutter/material.dart';
import 'package:movies/DataBase/MoiveDao.dart';
import 'package:movies/HomeScreen.dart';
import 'package:movies/ui/SearchTap/resultListWidget.dart';

class watchListTap extends StatelessWidget {
  const watchListTap({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: FutureBuilder(
          future: MovieDao.getTasks(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.blue)),
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => HomeScreen()));
                  },
                  child: Text(
                    snapshot.error?.toString() ?? "",
                  ),
                ),
              );
            } else {
              var taskList = snapshot.data;
              if (taskList == null || taskList.isEmpty) {
                return const Center(
                  child: Text(
                    'No tasks found',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                );
              } else {
                print(taskList.length);
                return Container( // Add a Container to specify the size of the ListView
                  height: MediaQuery.of(context).size.height * 0.8, // Adjust this value as needed
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return resultListWidget(taskList[index].id,
                          primary_release_year:
                          taskList[index].primary_release_year);
                    },
                    itemCount: taskList.length,
                  ),
                );
              }
            }
          },
        ),
      ),
    );
  }
}
