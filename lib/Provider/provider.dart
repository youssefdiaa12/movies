import 'package:flutter/material.dart';
import 'package:movies/DataBase/MoiveDao.dart';
import 'package:movies/DataBase/MoviesList.dart';
import 'package:movies/DataBase/User.dart' as myuser;
import 'package:movies/DataBase/userDao.dart';
import 'package:movies/SearchResponse/Results.dart';

class provider extends ChangeNotifier {
  bool is_visible = true;
  myuser.User? user;


  Future<void> login() async {
    user = await userDao.getuser();
  }

  Future<void> deleteTask( MoviesList ?taskia) async{
    await MovieDao.deleteTask(taskia);
    notifyListeners();
    return;
  }
  Future<void> addTask(MoviesList taskia) async{
    await MovieDao.createTask(taskia);
    notifyListeners();
    return;
  }
  Future<MoviesList> getTask(MoviesList obj) async {
    var dbRef = await MovieDao.gettaskcollection().doc(obj.id).get();
    print(dbRef.data()?.id);
    return dbRef.data()!;
  }








}
//bf376d3cbdbf47c9a8c4bf1ef7d27f8a
