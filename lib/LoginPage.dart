import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'file:///D:/flutter/bottomy/lib/Constants.dart';

import 'package:pin_code_fields/pin_code_fields.dart';

import 'Responsive.dart';

import 'CreateAccount1.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _radioValue1 = " ";
  String gst = " " ;
  List State = ["Kerala","TamilNadu"];

  @override
  Widget build(BuildContext context) {
    var D = Responsive.isDesktop(context);
    var T = Responsive.isTablet(context);
    var M = Responsive.isMobile(context);
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
           alignment: Alignment.center,
          children: [
            Container(width: w,height: h,color: Color(0xFF121212),
             alignment: Alignment.bottomCenter,
            child:Column(mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Center(child: Padding(
                  padding: const EdgeInsets.only(bottom:15.0),
                  child: Text("About  | Terms and Conditions  |  Privacy  |  Shipping  |  Refund Policies  ",style: f14w,),
                )),
              ],
            ) ,),
            Row(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [

                SizedBox(width: w/4,),
               D ?Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   Image.asset("assets/buto.jpeg"),
                   SizedBox(height: h/11,),
                   Text("First Ever",style: f18wb,),
                   SizedBox(height: 3,),
                   Container(color: Color(0xFFffd550),child: Text(" Social Media Platform    ",style: f30B,),),
                   SizedBox(height: 3,),
                   Text("For Food Lovers",style: f18wb,),


                 ],

               ):Container(),

                 D?SizedBox(width: w/7,):Container(),

                Column(
                 mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top:130.0,bottom: 130),
                      child: Container(
                        decoration: BoxDecoration(color: white,borderRadius: BorderRadius.circular(10),boxShadow: [shadow]),
                          // height: h/1.7,
                          width:D? w/3.8 :w/1.8,

                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                          children: [
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
                                hintText: "Email Address or Mobile Number"),),
                            SizedBox(height: 10,),
                            TextFormField(

                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                focusedBorder:  OutlineInputBorder(
                                    borderSide: BorderSide(color: Color(0xFF48c0d8))
                                ),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey[400])
                                ),
                                hintStyle: f13gg,
                                hintText: "Password",),),
                            SizedBox(height: 10,),
                            MaterialButton(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),onPressed: (){},minWidth:w/3.8,child: Padding(
                              padding: const EdgeInsets.only(top:12.0,bottom: 12.00),
                              child: Text("Login In",overflow: TextOverflow.ellipsis,
                                maxLines: 1,style: f14bl,),
                            ),color: Color(0xFFffd550),),
                            SizedBox(height: 10,),
                            MaterialButton(
                              shape: RoundedRectangleBorder(),
                              onPressed: (){},minWidth:w/3.8,child: Text("Forgotten password ?",overflow: TextOverflow.ellipsis,
                              maxLines: 1,style: f14bl,),),
                            Padding(
                              padding: const EdgeInsets.only(left:10.0,right: 10.00,top: 10.00),
                              child: Divider(height: 1,thickness: 1,),
                            ),
                            SizedBox(height: h/25,),
                            MaterialButton(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                              onPressed: (){
                                showDialog(context: context,
                                    barrierDismissible: true,
                                    builder: (BuildContext context){
                                      return CreateAccount1();
                                    });
                              },minWidth:w/3.8,child: Padding(
                              padding: const EdgeInsets.only(top:12.0,bottom: 12.00),

                              child: Text("Don't have an account ? SignUp",style: f14bl,overflow: TextOverflow.ellipsis,
                                maxLines: 1,),
                            ),color: Color(0xFF48c0d8),),

                          ],
                      ),
                        ),),
                    ),
                  ],
                ),
              ],
            )

          ],
        ),


    );
  }
}
