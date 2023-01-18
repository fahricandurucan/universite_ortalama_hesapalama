import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:universite_ortalama_hesapalama/constants/AppConstants.dart';
import 'package:universite_ortalama_hesapalama/dataHelper/LessonCredit.dart';
import 'package:universite_ortalama_hesapalama/dataHelper/LetterGrades.dart';
import 'package:universite_ortalama_hesapalama/models/Lesson.dart';
import 'package:universite_ortalama_hesapalama/widget/CreditDropdownWidget.dart';
import 'package:universite_ortalama_hesapalama/widget/ShowAverageWidget.dart';

import 'widget/LetterDropdownWidget.dart';

class AverageCalculationPage extends StatefulWidget {
  const AverageCalculationPage({Key? key}) : super(key: key);

  @override
  _AverageCalculationPageState createState() => _AverageCalculationPageState();
}

class _AverageCalculationPageState extends State<AverageCalculationPage> {

  var textController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  var girilenDeger = "";
  late String lessonName = "";

  List<Lesson> allLesson = [] ;
  double average = 0.0;
  double valueLetter = 4;
  int valueCredit = 1;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, //when we open keybor of emulator if we have error, this fixed
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
                                controller: textController,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: AppConstants.mainColor.shade100.withOpacity(0.3),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.all(Radius.circular(22)),
                                  ),
                                  hintText: "Ders adı",
                                ),
                                onSaved: (deger){
                                  setState(() {
                                    girilenDeger = deger!;
                                  });
                                },
                                validator: (s){
                                  if(s!.length<=0){
                                    return "Ders adını giriniz!";
                                  }
                                  else{
                                    return null;
                                  }
                                },
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Expanded(
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 8),
                                      child: LetterDropdownWidget(
                                        onLetterSelected: (deger){  //callBack funciton
                                          valueLetter = deger;
                                        },
                                      ),
                                    ),
                                ),
                                Expanded(
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 8),
                                      child: CreditDropdownWidget(
                                        onCreditSelected: (deger){   //callBack
                                          valueCredit = deger;
                                        },
                                      ),
                                    ),
                                ),
                                IconButton(
                                  color: AppConstants.mainColor,
                                  onPressed: (){
                                    if(formKey.currentState!.validate()){
                                      formKey.currentState?.save();
                                      setState(() {
                                        var lesson = Lesson(name: girilenDeger, letterGrade: valueLetter.toDouble(), credit: valueCredit.toInt());
                                        allLesson.add(lesson);
                                        findAverage(allLesson);
                                        textController.text ="";
                                        valueLetter = 4;
                                        valueCredit = 1;
                                      });
                                    }
                                  },
                                  icon:Icon(Icons.arrow_forward_ios_sharp),
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
                child: ShowAverageWidget(lesson: allLesson.length, average: average),
              ),
            ],
          ),
          Expanded(
            child:
            allLesson.length == 0 ?
            Center(child:Text("Lütfen ders ekleyiniz..!",style: TextStyle(fontSize: 22,fontStyle: FontStyle.italic,color: Colors.red),))
                : listOfLessons(),
          ),
        ],
      )
    );
  }

  Widget listOfLessons() {
    // List<Lesson> allLessonCopy = allLesson;
    return ListView.builder(
      itemCount: allLesson.length,
      itemBuilder: (context, index){
        var lesson = allLesson[index];
        return Dismissible(
            key: UniqueKey(),
            direction: DismissDirection.startToEnd,
            onDismissed: (x){
              setState(() {
                allLesson.removeAt(index);
                findAverage(allLesson);
              });
            },
            child: Padding(
              padding: const EdgeInsets.all(3),
              child: Card(
                shadowColor: AppConstants.mainColor,
                elevation: 3,
                child: ListTile(
                  leading: CircleAvatar(child: Text("${(lesson.credit*lesson.letterGrade).toInt()}"),),
                  title: Text(lesson.name),
                  subtitle: Text("${lesson.credit} Kredi, Not Değeri ${lesson.letterGrade}"),
                ),
              ),
            ),
        );
      },
    );
  }
  void findAverage(List<Lesson> list) {
    double sum = 0;
    int sumOfCredit = 0;
    for(int i =0;i<list.length;i++){
      print(list[i].name);
      sum += (list[i].credit*list[i].letterGrade);
      sumOfCredit += list[i].credit;
    }
    if(list.isEmpty){
      average = 0;
    }
    else{
      average = sum/sumOfCredit;
    }



  }

}
