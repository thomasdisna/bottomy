
import 'package:flutter/material.dart';

import '../SecondPage.dart';



class CenterSection extends StatefulWidget {
  @override
  _CenterSectionState createState() => _CenterSectionState();
}

class _CenterSectionState extends State<CenterSection> {

  int secondCon;
  int step;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      secondCon=1;
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
      child: secondCon == 1 && step ==1 ? SecondPage() : secondCon == 1 && step == 2 ? Container(
        height: h,
        width: w,
        color: Colors.red,
      ) : Container(),
    );
  }
}
