import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodiz/widget_style.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import 'Constants.dart';

class CreateAccount3 extends StatefulWidget {
  @override
  _CreateAccount3State createState() => _CreateAccount3State();
}

class _CreateAccount3State extends State<CreateAccount3> {
  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h =MediaQuery.of(context).size.height;
    // var D = Responsive.isDesktop(context);
    // var T = Responsive.isTablet(context);
    // var M = Responsive.isMobile(context);

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
          height: h/1.8,width: w/2,
          decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(5)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.only(left:10.0,right: 10.00),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Create An Account",style: f14bl),
                    IconButton(icon: Icon(Icons.close),onPressed: (){
                      Navigator.pop(context);
                    },)
                  ],
                ),
              ),
              SizedBox(height: 20,),

              Center(child: Text("Verify Your Mobile Number",style:  bf15,)),
              SizedBox(height: 10,),
              Center(child: Text("We sent you a four-digit code to +91xxxxxx5642",style: f14bv,)),
              SizedBox(height: 5,),
              Center(child: Text("Enter the code below to conform your mobile number",style: f14bv,)),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.only(left:150.0,right: 150.00),
                child: PinCodeTextField(appContext:context, length: 4, onChanged: (value){
                  print(value);
                },
                  pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(5),
                      inactiveColor: Colors.grey[400]
                  ),),
              ),
              SizedBox(height: 20,),
              MaterialButton(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),onPressed: (){
                Navigator.pop(context);
                showDialog(context: context, builder: (BuildContext context){
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
                      child: Container(height: h/2,width: w/3,decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(5)),
                        child: Column(

                          children:[
                            SizedBox(height: 10,),
                            Padding(
                              padding: const EdgeInsets.only(left:10.0,right: 10.00),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Create An Account",style: f14bl),
                                  IconButton(icon: Icon(Icons.close),onPressed: (){
                                    Navigator.pop(context);
                                  },)
                                ],
                              ),
                            ),


                            Image.asset("assets/images_black.png",height: 100,width: 100,),
                            SizedBox(height: 10,),
                            Text("Upload Profile Photo",style: f15u,),
                            SizedBox(height: 30,),
                            MaterialButton(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),onPressed: (){Navigator.pop(context);},child: Padding(
                              padding: const EdgeInsets.only(top:12.0,bottom: 12.00),
                              child: Text("Sign Up",overflow: TextOverflow.ellipsis,
                                maxLines: 1,style: f14bl,),
                            ),color: Color(0xFFffd550),),


                          ],
                        ),




                      ),
                    ),
                  );
                });
              },child: Padding(
                padding: const EdgeInsets.only(top:12.0,bottom: 12.00),
                child: Text("Verify",overflow: TextOverflow.ellipsis,
                  maxLines: 1,style: f14bl,),
              ),color: Color(0xFFffd550),),



            ],),

        ),
      ),
    );
  }
}
