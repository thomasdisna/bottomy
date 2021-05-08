
import 'package:flutter/material.dart';
import 'package:foodiz/LastPage.dart';



class CenterSection extends StatefulWidget {
  @override
  _CenterSectionState createState() => _CenterSectionState();
}

class _CenterSectionState extends State<CenterSection> {

  int thirdCon;
  int step;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      thirdCon=1;
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
      child: thirdCon == 1 && step ==1 ? ThirdSection() :Container(),
    );
  }
}
