import 'package:flutter/material.dart';
import 'package:movies/DataBase/User.dart' as myuser;
import 'package:movies/DataBase/userDao.dart';

class provider extends ChangeNotifier {
  bool is_visible = true;
  myuser.User? user;


  Future<void> login() async {
    user = await userDao.getuser();
  }






}
//bf376d3cbdbf47c9a8c4bf1ef7d27f8a
