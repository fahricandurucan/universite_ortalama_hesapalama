import 'package:flutter/material.dart';
import 'package:universite_ortalama_hesapalama/constants/AppConstants.dart';

class ShowAverageWidget extends StatelessWidget {

  late int lesson;
  late double average;

  ShowAverageWidget({required this.lesson,required this.average});


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          lesson > 0 ?
          Text("${lesson} ders girildi",style: TextStyle(fontSize: 16,color: AppConstants.mainColor),)
              :
          Text("Ders Seçiniz",style: TextStyle(fontSize: 16,color: AppConstants.mainColor),),
          Padding(
            padding: EdgeInsets.only(top: 4,bottom: 4),
            child: Text("${average.toStringAsFixed(2)}",style: TextStyle(fontSize: 42,fontWeight: FontWeight.bold,color: AppConstants.mainColor),),
          ),
          Text("Ortalama",style: TextStyle(fontSize: 16,color: AppConstants.mainColor),),
        ],
      ),
    );
  }
}
