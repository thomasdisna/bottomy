import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import 'package:pin_code_fields/pin_code_fields.dart';

import 'Constants.dart';


class CreateAccount2 extends StatefulWidget {
  @override
  _CreateAccount2State createState() => _CreateAccount2State();
}

class _CreateAccount2State extends State<CreateAccount2> {
  @override
  Widget build(BuildContext context) {
    // var D = Responsive.isDesktop(context);
    // var T = Responsive.isTablet(context);
    // var M = Responsive.isMobile(context);
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
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
      child: Container( height:h/1.3,width: w/2,decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.white),
        child: Padding(
          padding: const EdgeInsets.only(left:20.0,right: 20.00),
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Create An Account",style: f14bl),
                      IconButton(icon: Icon(Icons.close),onPressed: (){
                        Navigator.pop(context);
                      },)
                    ],
                  ),
                  SizedBox(height: 10,),
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
                      hintText: "Mobile Number"),),
                  SizedBox(height: 10,),
                  Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),border: Border.all(width: 1,color: Colors.grey)),
                    height: h/12,width: w/2.1,
                  ),
                  SizedBox(height: 10,),
                  Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),border: Border.all(width: 1,color: Colors.grey)),
                    height: h/12,width: w/2.1,
                  ),
                  SizedBox(height: 10,),
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
                      hintText: "Password "),),
                  SizedBox(height: 10,),
                  Text("Password need with minimum 8 characters nd include letters,numbers and special",maxLines: 1,style: TextStyle(color: Colors.grey[400]),),
                  Text("characters",maxLines: 1,style: TextStyle(color: Colors.grey[400]),),
                  SizedBox(height: 10,),
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
                      hintText: "Password "),),
                  SizedBox(height: 10,),




                  // DropdownButton(
                  //   value: gst,
                  //   hint: Text("Select",style: f14g,),
                  //   dropdownColor: Color(0xFF1E2026),
                  //   iconEnabledColor: Colors.grey,
                  //   iconSize: 25,
                  //   elevation: 16,isExpanded: true,
                  //   style: f14w,
                  //   underline: Container(height: 0,),
                  //   onChanged: (newValue) {
                  //     setState(() {
                  //       gst = newValue;
                  //     });
                  //     print("TTTTTTTTTTTTTTTt "+gst);
                  //   },
                  //   items: State.map((item) {
                  //     return DropdownMenuItem(
                  //       value: item,
                  //       child: Text(item+"%"),
                  //     );
                  //   }).toList(),
                  // ),


                ],

              ),
              MaterialButton(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),onPressed: (){
                Navigator.pop(context);
                showDialog(context: context, builder:(BuildContext context){
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
                            Center(child: Text("We sen you a four-digit code to +91xxxxxx5642",style: f14bv,)),
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
                });
              },child: Padding(
                padding: const EdgeInsets.only(top:8.0,bottom: 8.00,left: 25.00,right: 25.00),
                child: Text("Next",overflow: TextOverflow.ellipsis,
                  maxLines: 1,style: f14bl,),
              ),color: Color(0xFFffd550),),
            ],
          ),
        ),
      ),
    ),

  );
  }
}
