import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:movies/DataBase/MoviesList.dart';
import 'package:movies/DataBase/userDao.dart';

class MovieDao {
  static CollectionReference<MoviesList> gettaskcollection() {
    var db = userDao
        .getusercollection()
        .doc("bf376d3cbdbf47c9a8c4bf1ef7d27f8a")
        .collection('movie')
        .withConverter(
            fromFirestore: (snapshot, options) =>
                MoviesList.fromFireStore(snapshot.data()!),
            toFirestore: (value, options) => value.toFireStore());

    return db;
  }

  static Future<void> createTask(MoviesList taskia,) async {
    var dbRef = gettaskcollection().doc();
    taskia.id = dbRef.id;
    await dbRef.set(taskia);
  }

  static Future<List<MoviesList>> getTasks() async {
    var dbRef = await gettaskcollection().get();
    var taskList = dbRef.docs.map((snapshot) => snapshot.data()).toList();
return taskList;
  }

  static Future<void> deleteTask(MoviesList? taskia) async {
    await gettaskcollection().doc(taskia?.id).delete();
  }

  static Stream<List<MoviesList>> listForTasks() async* {

    var data = gettaskcollection().snapshots();
    yield* data.map((snapshot) =>
        snapshot.docs.map((snapshot) => snapshot.data()).toList());

  }
}
