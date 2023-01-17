import 'package:flutter/material.dart';

import '../constants/AppConstants.dart';
import '../models/Lesson.dart';

class ShowAverageWidget extends StatefulWidget {

  late int lesson;
  // late List<Lesson> list;
  late double average;

  // double average = 0;
  ShowAverageWidget({required this.lesson,required this.average});

  @override
  _ShowAverageWidgetState createState() => _ShowAverageWidgetState();
}

class _ShowAverageWidgetState extends State<ShowAverageWidget> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // findAverage(widget.list);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          widget.lesson > 0 ?
          Text("${widget.lesson} ders girildi",style: TextStyle(fontSize: 16,color: AppConstants.mainColor),)
              :
          Text("Ders Seçiniz",style: TextStyle(fontSize: 16,color: AppConstants.mainColor),),
          Padding(
            padding: EdgeInsets.only(top: 4,bottom: 4),
            child: Text("${widget.average.toStringAsFixed(2)}",style: TextStyle(fontSize: 42,fontWeight: FontWeight.bold,color: AppConstants.mainColor),),
          ),
          Text("Ortalama",style: TextStyle(fontSize: 16,color: AppConstants.mainColor),),
        ],
      ),
    );
  }
  // void findAverage(List<Lesson> list) {
  //   double sum = 0;
  //   for(int i =0;i<list.length-1;i++){
  //     sum += list[i].credit;
  //   }
  //   widget.average = sum/list.length;
  //   print("averageee" + widget.average.toString());
  //
  // }
}

