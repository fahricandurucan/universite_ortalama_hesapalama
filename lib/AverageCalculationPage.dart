import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:universite_ortalama_hesapalama/constants/AppConstants.dart';
import 'package:universite_ortalama_hesapalama/dataHelper/LessonCredit.dart';
import 'package:universite_ortalama_hesapalama/dataHelper/LetterGrades.dart';
import 'package:universite_ortalama_hesapalama/widget/ShowAverageWidget.dart';

class AverageCalculationPage extends StatefulWidget {
  const AverageCalculationPage({Key? key}) : super(key: key);

  @override
  _AverageCalculationPageState createState() => _AverageCalculationPageState();
}

class _AverageCalculationPageState extends State<AverageCalculationPage> {


  var formKey = GlobalKey<FormState>();

  double valueLetter = 4;
  int valueCredit = 6;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent, // there is no any colors for appbar
        title: Center(child: Text(AppConstants.appbarTitle,style: TextStyle(fontSize: 24,color: AppConstants.mainColor),),),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                flex: 2,
                  child: Container(
                    child: Form(
                      key: formKey,
                      child:Column(
                          children: [
                            Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8,vertical: 8),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: AppConstants.mainColor.shade100.withOpacity(0.3),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.all(Radius.circular(22)),
                                  ),
                                  hintText: "Ders adı",
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Expanded(
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 8),
                                      child: buildLetterGrade(),
                                    ),
                                ),
                                Expanded(
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 8),
                                      child: buildLessonCredit(),
                                    ),
                                ),
                                IconButton(
                                  color: AppConstants.mainColor,
                                    onPressed: (){}, icon:Icon(Icons.arrow_forward_ios_sharp),
                                ),
                              ],
                            ),
                          ],
                        ),
                    ),
                  ),
              ),
              Expanded(
                flex: 1,
                child: ShowAverageWidget(lesson: 2, average: 2.85),
              ),
            ],
          ),
          Center(child: Text("LİSTE GELECEK"),)
        ],
      )
    );
  }

  buildLetterGrade() {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
      decoration: BoxDecoration(
        color: AppConstants.mainColor.shade200.withOpacity(0.3),
        borderRadius: BorderRadius.all(Radius.circular(22)),
      ),
      child: DropdownButton<double>(
        value: valueLetter,
        items: LetterGrades.letterOfAllLessons(),
        iconEnabledColor: AppConstants.mainColor.shade200,
        onChanged: (selected){
          setState(() {
            valueLetter = selected!;
          });
        },
        underline: Container(),
      ),
    );
  }

  buildLessonCredit() {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
      decoration: BoxDecoration(
        color: AppConstants.mainColor.shade200.withOpacity(0.3),
        borderRadius: BorderRadius.all(Radius.circular(22)),
      ),
      child: DropdownButton<int>(
        value: valueCredit,
        items: LessonCredit.allLessonCredit(),
        iconEnabledColor: AppConstants.mainColor.shade200,
        onChanged: (selected){
          setState(() {
            valueCredit = selected!;
          });
        },
        underline: Container(),
      ),
    );
  }
}
