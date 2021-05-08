
import 'package:flutter/material.dart';

import '../FirstPage.dart';




class FirstSection extends StatefulWidget {
  @override
  _FirstSectionState createState() => _FirstSectionState();
}

class _FirstSectionState extends State<FirstSection> {

  int firstCon;
  int step;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      firstCon=1;
      step=1;
    });
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery
        .of(context)
        .size
        .height;
    var w = MediaQuery
        .of(context)
        .size
        .width;
    return Container(
      height: h,
      width: w,
      child: firstCon == 1 && step ==1 ? FirstPage() :Container(),
    );
  }
}
