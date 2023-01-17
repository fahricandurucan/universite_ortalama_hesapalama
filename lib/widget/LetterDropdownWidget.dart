import 'package:flutter/material.dart';

import '../constants/AppConstants.dart';
import '../dataHelper/LetterGrades.dart';

class LetterDropdownWidget extends StatefulWidget {

  late final Function onLetterSelected;  //callBack

  LetterDropdownWidget({required this.onLetterSelected});

  @override
  _LetterDropdownWidgetState createState() => _LetterDropdownWidgetState();
}

class _LetterDropdownWidgetState extends State<LetterDropdownWidget> {

  double valueLetter = 4;


  @override
  Widget build(BuildContext context) {
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
            widget.onLetterSelected(valueLetter);  //callBack
          });
        },
        underline: Container(),
      ),
    );
  }
}
