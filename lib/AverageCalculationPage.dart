import 'package:flutter/material.dart';
import 'package:universite_ortalama_hesapalama/constants/AppConstants.dart';

class AverageCalculationPage extends StatefulWidget {
  const AverageCalculationPage({Key? key}) : super(key: key);

  @override
  _AverageCalculationPageState createState() => _AverageCalculationPageState();
}

class _AverageCalculationPageState extends State<AverageCalculationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent, // there is no any colors for appbar
        title: Center(child: Text(AppConstants.appbarTitle,style: TextStyle(fontSize: 24,color: Colors.green),),),
      ),
      body: Center(
        child: Text("MERHABA"),
      ),
    );
  }
}
