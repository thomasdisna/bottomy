import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:foodiz/FirstPage.dart';
import 'package:foodiz/LastPage.dart';
import 'package:foodiz/MainPage.dart';
import 'package:foodiz/widget_style.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Constants.dart';
import 'Responsive.dart';

class HomeScreen extends StatefulWidget {
  // Key for Scaffold Drawer
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _ScaffoldKey = GlobalKey<ScaffoldState>();
  String chatNameVariable = " ";
  setssss()async{
    print("calliiingggg");
    SharedPreferences _pref = await SharedPreferences.getInstance();
    setState(() {
       chatNameVariable=_pref.getString("showname");

      showChatVar =  _pref.getBool("show");

      print("vvvvvvvvvvvvvvvvvvv @@@@@"+showChatVar.toString());
    });
    print("Setted name : "+chatNameVariable);
  }



  @override
  Widget build(BuildContext context) {

    setssss();
    print("CCCCCCCCCCCCCCCCCCCCCCCc "+showChatVar.toString());

    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      key: _ScaffoldKey,
      drawer: FirstSection(),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Color(0xFF1E2026),
        brightness: Brightness.dark,
        elevation: 5,
        title: Image.asset(
          "assets/Template1/image/Foodie/logo.png",
          height: 23,
        ),
        leadingWidth: Responsive.isDesktop(context) ? 0 : 30,
        leading: Responsive.isMobile(context)
            ? Container()
            : Responsive.isDesktop(context)
                ? Container()
                : IconButton(
                    icon: Icon(Icons.menu),
                    onPressed: () {
                      _ScaffoldKey.currentState.openDrawer();
                    },
                  ),
        actions: <Widget>[
          Row(
            children: <Widget>[
               Responsive.isMobile(context)? Container():Container(
                width: MediaQuery.of(context).size.width / 6.5,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.grey[800],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TextField(
                  style: f14w,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 11),
                      prefixIcon: Container(
                        child: Icon(
                          Icons.location_on_outlined,
                          color: Color(0xFF48c0d8),
                          size: 18,
                        ),
                      ),
                      hintText: "Location",
                      hintStyle: f13g),
                ),
              ),
              SizedBox(
                width: 7,
              ),
              Responsive.isMobile(context)? Container():Container(
                width: MediaQuery.of(context).size.width / 4.5,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.grey[800],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TextField(
                  style: f14w,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 11),
                      prefixIcon: Container(
                        child: Icon(
                          Icons.search,
                          color: Colors.white,
                          size: 18,
                        ),
                      ),
                      hintText: "Search for people, trends, pages and groups",
                      hintStyle: f13g),
                ),
              ),
              SizedBox(
                width: 6,
              ),
              IconButton(
                splashColor: Color(0xFF48c0d8),
                icon: Stack(
                  children: [
                    Image.asset(
                      "assets/Template1/image/Foodie/icons/bell.png",
                      height: 20,
                      width: 20,
                    ),
                    Padding(
                        padding: const EdgeInsets.only(left: 11.0),
                        child: Container(
                          height: 14,
                          width: 14,
                          decoration: BoxDecoration(
                              color: Color(0xFF0dc89e),
                              borderRadius: BorderRadius.circular(100)),
                          child: Center(
                              child: Text(
                            "1",
                            style: f10B,
                            textAlign: TextAlign.center,
                          )),
                        ))
                  ],
                ),
                onPressed: () {},
              ),
              Padding(
                padding: const EdgeInsets.only(right: 3),
                child: IconButton(
                    splashColor: Color(0xFF48c0d8),
                    onPressed: () {},
                    icon: Icon(
                      Icons.chat,
                      color: Color(0xFFffd55e),
                      size: 22,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 14, left: 5),
                child: Row(
                  children: [
                    Container(
                      height: 30.0,
                      clipBehavior: Clip.antiAlias,
                      width: 30.0,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: (Color(0xFF48c0d8)),
                          ),
                          borderRadius:
                              BorderRadius.all(Radius.circular(180.0))),
                      child: Center(
                        child: Container(
                          clipBehavior: Clip.antiAlias,
                          height: 28,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(180.0))),
                          width: 28,
                          child: Center(
                              child: Image.asset(
                            "assets/Template1/image/Foodie/icu.png",
                            fit: BoxFit.cover,
                          )),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      "Mammutty Puthuparambil",
                      style: f14w,
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  right: 16,
                ),
                child: Container(
                  height: 27,
                  width: 27,
                  decoration: BoxDecoration(
                      color: Colors.grey[800],
                      borderRadius: BorderRadius.circular(3)),
                  child: Center(
                    child: Icon(
                      Icons.keyboard_arrow_down,
                      size: 23,
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
      body: SafeArea(
        child: Stack(
          alignment: Alignment.bottomRight,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              child: Responsive(
                mobile: Row(
                    children: [
                  Expanded(
                    flex: 3,
                    child: MainPage(),
                  ),
                ]),
                tablet: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 3,
                      child: MainPage(),
                    ),
                    Expanded(
                      flex: 1,
                      child: LastPage(),
                    ),
                  ],
                ),
                desktop: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: _size.width > 1251 ? 1 : 4,
                      child: FirstSection(),
                    ),
                    Expanded(flex: _size.width > 1251 ? 2 : 5, child: MainPage()),
                    Expanded(flex: _size.width > 1251 ? 1 : 5, child: LastPage()),
                  ],
                ),
              ),
            ),
            (Responsive.isDesktop(context) || Responsive.isTablet(context))  &&  showChatVar==true ?  Padding(
              padding: const EdgeInsets.only(right:38.0),
              child: Container(height: _size.height/2,width:_size.width/3.5,color:Colors.grey,child:Column(


                children: [

                  AppBar(
                    backgroundColor: Colors.black,
                    leading: Container(height: 0,),
                    leadingWidth: 0,
                    title: Row(
                      children: [
                        Stack(
                          children: [
                            Container(clipBehavior: Clip.antiAlias,
                              height: 30,width: 30,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              child: Image.asset("assets/Template1/dummy-staff.jpg"),
                            ),
                            Positioned(
                                bottom: 0,
                                right: 0,
                                child: Container(
                                  height: 8,
                                  width: 8,
                                  decoration: BoxDecoration(
                                      color: Colors.green,
                                      shape: BoxShape.circle),
                                ))
                          ],
                        ),
                        SizedBox(width: 4,),
                        Text(chatNameVariable.toString(),style: f14w,)

                      ],
                    ),
                    elevation: 10,
                    actions: [

                      IconButton(icon: Icon(Icons.minimize),color: Color(0xFF47bfda), onPressed: (){}),
                      IconButton(icon: Icon(Icons.close),color: Color(0xFF47bfda), onPressed: () async {
                        SharedPreferences _pref = await SharedPreferences.getInstance();
                        setState(() {
                          _pref.setBool("show", false);
                        });
                      }),
                    ],
                  ),

                  Container(height: _size.height/2-56,color: Color(0xFF1f2025),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Align( alignment: Alignment.topRight,
                              child: Container( decoration: BoxDecoration(
                                  color: Color(0xFF36373c),borderRadius: BorderRadius.only(topRight: Radius.circular(10),topLeft: Radius.circular(10),bottomLeft: Radius.circular(10))),
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(

                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text("Hello",style: f7b,),
                                      Text("19.19",style: f7b)
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Align(alignment: Alignment.topLeft,
                              child: Container( decoration: BoxDecoration(
                                  color: Color(0xFF1679d7),borderRadius: BorderRadius.only(topRight: Radius.circular(10),topLeft: Radius.circular(10),bottomLeft: Radius.circular(10))),
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(

                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text("need to note the problems",style: f7b,),
                                      Text("19.19",style: f7b)
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(color: Color(0xFF68696d),borderRadius: BorderRadius.circular(10)),

                              child: Padding(
                                padding:  EdgeInsets.only(left:8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Send Message"),
                                    Row(
                                      children: [
                                        IconButton(icon: Icon(Icons.attach_file),color: Colors.white, onPressed: (){}),
                                        IconButton(icon: Icon(Icons.send),color: Colors.white, onPressed: (){}),
                                      ],

                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),



                        ],
                      )
                  )


                ],
              ),),
            ) : Container(height: 0,),
          ],
        ),
      ),
    );
  }
}
