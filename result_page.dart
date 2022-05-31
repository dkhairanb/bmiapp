// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, prefer_typing_uninitialized_variables, use_key_in_widget_constructors, camel_case_types, annotate_overrides, must_be_immutable

import 'package:bmi_app/input_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'formula.dart';
import 'bmi_message.dart';

class resultPage extends StatefulWidget {
  int weight;
  int height;
  var selectedGender;
  var bmiComments;
  resultPage(
      {required this.height,
      required this.weight,
      required this.selectedGender});

  @override
  State<resultPage> createState() => _resultPageState();
}

class _resultPageState extends State<resultPage> {
  Logic logic = Logic();
  double bmiResult = 0; /*value default bmi*/
  @override
  void initState() {
    bmiResult = logic.bmiCalculation(
        height: widget.height, weight: widget.weight); /*hasil kalkulasi bmi*/
    super.initState();
  }

  Widget build(BuildContext context) {
    final mediaQueryHeight = MediaQuery.of(context).size.height;
    final myAppBar = AppBar(
        backgroundColor: Colors.grey[300],
        automaticallyImplyLeading: false,
        /*untuk menghilangkan back button di appbar*/
        title: Center(
          child: Text(
            "BMI App",
            style: GoogleFonts.openSans(
                color: Colors.white, fontSize: 29, fontWeight: FontWeight.bold),
          ),
        ));
    final bodyHeight = mediaQueryHeight -
        myAppBar.preferredSize.height -
        MediaQuery.of(context).padding.top;

    return Scaffold(
      appBar: myAppBar,
      body: Column(children: [
        Expanded(
          child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                /*mengatur alignment dari text*/
                children: [
                  Text(
                    'BMI Result',
                    style: TextStyle(
                        fontSize: 40,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    bmiResult.toStringAsFixed(1),
                    /*mengubah hasil bmi menjadi string dan 1 desimal*/
                    style: TextStyle(
                        fontSize: 60,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  Text(
                    pressedGender(bmiResult.toInt(), widget.selectedGender),
                    /*menunjukkan pesan sesuai dengan gender*/
                    style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ],
              ),
              margin: EdgeInsets.all(10),
              width: double.infinity,
              /*lebar*/
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(29),
                color: Colors.grey[300],
              )),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        InputPage())); /*route untuk kembali ke inputpage*/
          },
          child: Container(
            margin: EdgeInsets.all(15),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(29),
                color: Colors.grey[300]),
            width: 250,
            height: bodyHeight * 0.1,
            child: Center(
              child: Text(
                'Re-calculate',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        )
      ]),
    );
  }
}
