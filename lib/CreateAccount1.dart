import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



import 'Constants.dart';

import 'CreateAccount2.dart';
import 'Responsive.dart';

class CreateAccount1 extends StatefulWidget {
  @override
  _CreateAccount1State createState() => _CreateAccount1State();
}

class _CreateAccount1State extends State<CreateAccount1> {
  String _radioValue1 = " ";
  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h =MediaQuery.of(context).size.height;
    var D = Responsive.isDesktop(context);
    var T = Responsive.isTablet(context);
    var M = Responsive.isMobile(context);
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius:
          BorderRadius.only(
              topRight: Radius
                  .circular(
                  20),
              topLeft: Radius
                  .circular(
                  20),
              bottomRight:
              Radius
                  .circular(
                  20),
              bottomLeft: Radius
                  .circular(
                  20))),
      child: SingleChildScrollView(
        child: Container(
          height:h/1.3,width: D?w/2:w/1.4,decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.white),
          child: Padding(
            padding: const EdgeInsets.only(left:20.0,right: 20.00),
            child:
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Create An Account",style: f14bl,),
                    IconButton(icon: Icon(Icons.close),onPressed: (){
                      Navigator.pop(context);
                    },)
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(height:h/12,
                      width: w/4.4,
                      child: TextFormField(decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey[400])
                          ),
                          focusedBorder:  OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFF47c0da))
                          ),
                          hintStyle: f13gg,
                          hintText: "First Name"),),
                    ),
                    Container(height:h/12,width: w/4.4,
                      child: TextFormField(decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey[400])
                          ),
                          focusedBorder:  OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFF47c0da))
                          ),
                          hintStyle: f13gg,
                          hintText: "Last Name"),),
                    ),
                  ],
                ),
                SizedBox(height: 20,),
                TextFormField(decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey[400])
                    ),
                    focusedBorder:  OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF47c0da))
                    ),
                    hintStyle: f13gg,
                    hintText: "Email Address "),),
                SizedBox(height: 20,),
                TextFormField(decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey[400])
                    ),
                    focusedBorder:  OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF47c0da))
                    ),
                    hintStyle: f13gg,
                    hintText: "Username"),),
                SizedBox(height: 20,),
                Row(children: [
                  Text("Birth Day",style: bf15,),
                  SizedBox(width: 10,),
                  Container(height: h/30,width: w/12,
                    child: TextFormField(
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color: Colors.grey)),
                        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color: Color(0xFF48c0d8))),

                      ),

                    ),),
                  SizedBox(width: 10,),
                  Container(height: h/30,width:w/12,
                    child: TextFormField(
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color: Colors.grey)),
                        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color: Color(0xFF48c0d8))),

                      ),

                    ),),
                  SizedBox(width: 10,),
                  Container(height: h/30,width:w/12,
                    child: TextFormField(
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color: Colors.grey)),
                        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color: Color(0xFF48c0d8))),

                      ),

                    ),),

                ],),
                SizedBox(height: 20,),

                Row(
                  children: [
                    Text("Gender",style: bf15,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Radio(
                            activeColor: Colors.pink,

                            value: 0,
                            groupValue: _radioValue1,
                            onChanged:(val){
                              setState(() {
                                _radioValue1 = val;

                              });
                            }
                        ),
                        new Text(
                          'Male',style: D?  fm15: fm12,

                        ),
                        new Radio(
                            activeColor: Colors.pink,
                            value: 1,
                            groupValue: _radioValue1,
                            onChanged:(val){
                              setState(() {
                                _radioValue1 = val;

                              });
                            }
                        ),
                        new Text(
                          'Female',
                          style:D?  fm15: fm12,
                        ),
                        new Radio(
                            activeColor: Colors.pink,
                            value: 2,
                            groupValue: _radioValue1,
                            onChanged:(val){
                              setState(() {
                                _radioValue1 = val;

                              });
                            }
                        ),
                        new Text(
                          'Others',
                          style:D?  fm15: fm12,
                        ),
                      ],
                    ),
                  ],
                ) ,
                SizedBox(height: 20,),
                MaterialButton(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),onPressed: (){
                  Navigator.pop(context);
                  showDialog(context: context, builder: (BuildContext  context){
                    return CreateAccount2();
                  });
                },child: Padding(
                  padding: const EdgeInsets.only(top:8.0,bottom: 8.00,left: 25.00,right: 25.00),
                  child: Text("Next",overflow: TextOverflow.ellipsis,
                    maxLines: 1,style: f14bl,),
                ),color: Color(0xFFffd550),),
                SizedBox(height: 20,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,

                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left:20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("By clicking Sign Up,you agree to our",style: D?pf10b:pf10bm,),
                          Text("Terms,Data Policy and",style:D? pf10bl:pf10blm,)
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,


                      children: [
                        Text("Cookie Policy",style:D? pf10bl:pf10blm),
                        Text(".Yom may receive SMS notification from us and can opt out",style:D? pf10b:pf10bm,)
                      ],
                    ),
                    Text("at any time",style: D?pf10b:pf10bm,)
                  ],
                )






              ],
            ),



          ),),
      ),





    );
  }
}
