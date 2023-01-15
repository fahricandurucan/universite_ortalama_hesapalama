import 'package:flutter/material.dart';

class LetterGrades{

  static List<String> allLetterGrade(){
    return ["AA","BA","BB","CB","CC","DC","DD","FD","FF"];
  }

  static double convertToCredit(String letterGrade){
    if(letterGrade == "AA"){
      return 4;
    }
    else if(letterGrade == "BA"){
      return 3.5;
    }
    else if(letterGrade == "BB"){
      return 3;
    }
    else if(letterGrade == "CB"){
      return 2.5;
    }
    else if(letterGrade == "CC"){
      return 2;
    }
    else if(letterGrade == "DC"){
      return 1.5;
    }
    else if(letterGrade == "DD"){
      return 1;
    }
    else if(letterGrade == "FD"){
      return 0.5;
    }
    else{
      return 0;
    }
  }

  static List<DropdownMenuItem<double>> letterOfAllLessons(){
    return allLetterGrade().map((e) => DropdownMenuItem(
        child:Text(e),value: convertToCredit(e),
    )).toList();
  }

}