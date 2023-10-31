import 'package:cloud_firestore/cloud_firestore.dart';

class MoviesList {

  String? id;
  String ?primary_release_year;

  MoviesList(this.id,{this.primary_release_year});

  Map<String, dynamic> toFireStore() {
    return {
      'id': id,
      'primary_release_year':primary_release_year
   };
  }

  MoviesList.fromFireStore(Map<String, dynamic>? mp)
      : this(mp?['id'],primary_release_year:mp?['primary_release_year']);
}
