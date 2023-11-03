import 'package:flutter/material.dart';
import 'package:movies/BrowseResponse/Genres.dart';
import 'Category.dart';
class CategoryFragment extends StatelessWidget{
  Genres genres;
  Category category;
  CategoryFragment(this.genres,this.category);
  @override
  Widget build(BuildContext context) {
    return Stack(
        alignment: Alignment.center,
        children:[
          Image.asset('assets/${category.imageName}',
            width: 180,
            height: 110,
            fit: BoxFit.cover,),
          Text(genres.name??"",
            style: TextStyle(
              color:Colors.white ,
              fontWeight: FontWeight.bold,
              fontSize: 24,),
          ),
        ] );
  }

}
