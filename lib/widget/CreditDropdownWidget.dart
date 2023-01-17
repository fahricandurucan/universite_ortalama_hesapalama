import 'package:flutter/material.dart';
import 'package:universite_ortalama_hesapalama/constants/AppConstants.dart';

import '../dataHelper/LessonCredit.dart';

class CreditDropdownWidget extends StatefulWidget {

  late final Function onCreditSelected;  //callBack

  CreditDropdownWidget({required this.onCreditSelected});

  @override
  _CreditDropdownWidgetState createState() => _CreditDropdownWidgetState();
}

class _CreditDropdownWidgetState extends State<CreditDropdownWidget> {

  int valueCredit = 1;

  @override
  Widget build(BuildContext context) {
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
            widget.onCreditSelected(valueCredit);   //callBack
          });
        },
        underline: Container(),
      ),
    );
  }
}
