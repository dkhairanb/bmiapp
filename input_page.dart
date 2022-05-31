// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, camel_case_types, prefer_typing_uninitialized_variables

import 'package:bmi_app/result_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'result_page.dart';

class InputPage extends StatefulWidget {
  @override
  State<InputPage> createState() => _inputPageState();
}

class _inputPageState extends State<InputPage> {
  var selectedGender = 0;
  var sliderValue = 175;
  int weight = 50;
  bool _isElevated = false;

  @override
  Widget build(BuildContext context) {
    final mediaQueryHeight = MediaQuery.of(context)
        .size
        .height; /*untuk mendapatkan tinggi dari device*/
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
        MediaQuery.of(context)
            .padding
            .top; /*variabel untuk mendapatkan tinggi dari body tanpa appbar dan padding atas device*/

    return Scaffold(
      appBar: myAppBar,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(1.0),
            /*untuk mengatur jarak container dengan objek lainnya*/
            child: Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                /*untuk alignment center*/
                children: [
                  Expanded(
                    child: GestureDetector(
                      /*mendeteksi ketika ditekan*/
                      onTap: () {
                        setState(() {
                          selectedGender =
                              0; /*set selectedgender = 0 untuk pria*/
                          _isElevated =
                              !_isElevated; /*variabel untuk neumorphism button*/
                        });
                      },
                      child: Expanded(
                        child: AnimatedContainer(
                          margin: EdgeInsets.all(8),
                          /*mengatur jarak*/
                          duration: const Duration(milliseconds: 200),
                          /*durasi animasi neumorphism button*/
                          height: bodyHeight * 0.2,
                          /*20% dari tinggi body*/
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(29),
                            boxShadow: _isElevated
                                ? [
                                    BoxShadow(
                                      color: Colors.grey[500]!,
                                      offset: const Offset(4, 4),
                                      blurRadius: 15,
                                      spreadRadius: 1,
                                    ),
                                    const BoxShadow(
                                      color: Colors.white,
                                      offset: Offset(-4, -4),
                                      blurRadius: 15,
                                      spreadRadius: 1,
                                    ),
                                  ]
                                : null,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,

                            /*untuk mengatur column menjadi ditengah*/
                            children: [
                              Icon(
                                FontAwesomeIcons.mars /*logo pria*/,
                                color: Colors.white /*warna logo*/,
                                size: 70 /*size logo*/,
                              ),
                              Text(
                                'Male',
                                style: TextStyle(
                                    /*style dari text 'Male'*/
                                    color: Colors.white,
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    height: 1.5),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      /*agar bisa ditekan*/
                      onTap: () {
                        setState(() {
                          selectedGender =
                              1; /*set selectedgender = 1 untuk pria*/
                          _isElevated = !_isElevated;
                        });
                      },
                      child: AnimatedContainer(
                        margin: EdgeInsets.all(8),
                        duration: const Duration(milliseconds: 200),
                        height: bodyHeight * 0.2,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(29),
                          boxShadow: !_isElevated
                              ? [
                                  BoxShadow(
                                    color: Colors.grey[500]!,
                                    offset: const Offset(4, 4),
                                    blurRadius: 15,
                                    spreadRadius: 1,
                                  ),
                                  const BoxShadow(
                                    color: Colors.white,
                                    offset: Offset(-4, -4),
                                    blurRadius: 15,
                                    spreadRadius: 1,
                                  ),
                                ]
                              : null,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          /*untuk mengatur column menjadi ditengah*/
                          children: [
                            Icon(
                              FontAwesomeIcons.mars /*logo pria*/,
                              color: Colors.white /*warna logo*/,
                              size: 70 /*size logo*/,
                            ),
                            Text(
                              'Female',
                              style: TextStyle(
                                  /*style dari text 'Male'*/
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  height: 1.5),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: bodyHeight * 0.3,
                    /*30% dari body*/
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: Text(
                            'Height',
                            style: TextStyle(
                                fontSize: 30,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          /*untuk align text*/
                          children: [
                            Text(
                              sliderValue.toString(),
                              /*mengubah slidervalue menjadi string*/
                              style: TextStyle(
                                  fontSize: 65,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'cm',
                              style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Slider(
                          activeColor: Colors.white,
                          inactiveColor: Colors.white,
                          value: sliderValue.toDouble(),
                          min: 100.0,
                          max: 210.0,
                          onChanged: (value) {
                            setState(() {
                              sliderValue = value
                                  .toInt(); /*mengubah dan menyimpan slidervalue menjadi int*/
                            });
                          },
                        )
                      ],
                    ),
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(29),
                        /*pinggiran container menjadi membulat*/
                        color: Colors.grey[300]),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: bodyHeight * 0.30,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Weight',
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          Text(
                            '$weight',
                            /*display berat*/
                            style: TextStyle(
                                fontSize: 65,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              GestureDetector(
                                onTap: (() {
                                  setState(() {
                                    weight--; /* -1 value berat*/
                                  });
                                }),
                                child: CircleAvatar(
                                  backgroundColor: Colors.white,
                                  radius: 25,
                                  child: Icon(
                                    FontAwesomeIcons.minus,
                                    color: Colors.grey[300],
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    weight++; /* +1 value berat */
                                  });
                                },
                                child: CircleAvatar(
                                  backgroundColor: Colors.white,
                                  radius: 25,
                                  child: Icon(
                                    FontAwesomeIcons.plus,
                                    color: Colors.grey[300],
                                  ),
                                ),
                              ),
                            ],
                          )
                        ]),
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(29),
                        color: Colors.grey[300]),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {});
              Navigator.push(
                context,
                MaterialPageRoute(
                  /*untuk mengubah page ke resultpage*/
                  builder: (context) => resultPage(
                    height: sliderValue,
                    weight: weight,
                    selectedGender: selectedGender, /*data yang dibawa*/
                  ),
                ),
              );
            },
            child: Container(
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(29),
                color: Colors.grey[300],
              ),
              width: 250,
              height: bodyHeight * 0.1,
              child: Center(
                child: Text(
                  'Calculate',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 30),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
