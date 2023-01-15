import 'package:flutter/material.dart';

class LessonCredit{

  static List<String> credit(){
    return ["1","2","3","4","5","6","7","8","9","10"];
  }

  static List<DropdownMenuItem<int>> allLessonCredit(){
    return credit().map((e) => DropdownMenuItem(
      child: Text(e),value: int.parse(e),)
    ).toList();
  }
}