import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:foodiz/HomeScreen/item_detail.dart';
import 'package:foodiz/SecondPage.dart';
import '../FirstPage.dart';
import '../LastPage.dart';


import 'CenterSection.dart';
import 'FirstSection.dart';

import 'package:shared_preferences/shared_preferences.dart';
import '../Constants.dart';
import '../Responsive.dart';

class HomeScreen extends StatefulWidget {
  // Key for Scaffold Drawer
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  final GlobalKey<ScaffoldState> _ScaffoldKey = GlobalKey<ScaffoldState>();


  String chatNameVariable = " ";

  String card1 = "local store";
  String card2 = "restaurant";
  String card3 = "delivery warrior";


  int firstCon,secondCon,thirdCon,step ;

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
  void initState() {
    // TODO: implement initState
    super.initState();
    firstCon =1;
    secondCon =1;
    thirdCon =1;
    step=1;
  }

  @override
  Widget build(BuildContext context) {

    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    setssss();
    print("CCCCCCCCCCCCCCCCCCCCCCCc "+showChatVar.toString());

    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      endDrawer:ThirdSection(),
      key: _ScaffoldKey,
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
              ),
              Responsive.isTablet(context) ? IconButton(icon: Icon(Icons.menu), onPressed:(){
                _ScaffoldKey.currentState.openEndDrawer();
              } ) : Container(),
            ],
          )

        ],
      ),
      body: SafeArea(
        child: Stack(
          alignment: Alignment.bottomRight,
          children: [
            Container(
                width:  MediaQuery.of(context).size.width,
                child:Responsive(
                  mobile: Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: CenterSection(),
                        ),
                      ]),
                  tablet: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          width: w/4,
                          child:Container(
                            child:SingleChildScrollView(
                              child: Container(
                                height: h,
                                width: w,
                                color: Colors.black,
                                child: SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      // start profile details
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          width: w,
                                          child: Row(
                                            children: [
                                              Container(
                                                height: 30.0,
                                                clipBehavior: Clip.antiAlias,
                                                width: 30.0,
                                                decoration: BoxDecoration(
                                                    border: Border.all(color: (Color(0xFF48c0d8))),
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
                                      ),
                                      //

                                      TileContainer(
                                        iconsDemo: Icons.people,
                                        label: "Followers",
                                      ),
                                      TileContainer(
                                        iconsDemo: Icons.qr_code,
                                        label: "My QR Code",
                                      ),
                                      TileContainer(
                                        iconsDemo: Icons.post_add,
                                        label: "Post",
                                      ),
                                      TileContainer(
                                        iconsDemo: Icons.video_call,
                                        label: "Videos",
                                      ),
                                      TileContainer(
                                        iconsDemo: Icons.star,
                                        label: "Food Reviews",
                                      ),
                                      TileContainer(
                                        iconsDemo: Icons.home,
                                        label: "Foodi Market",
                                      ),
                                      TileContainer(
                                        iconsDemo: Icons.favorite,
                                        label: "Food Bank",
                                      ),
                                      TileContainer(
                                        iconsDemo: Icons.notes,
                                        label: "My Blogs",
                                      ),
                                      TileContainer(
                                        iconsDemo: Icons.saved_search,
                                        label: "Saved Items",
                                      ),

                                      //Divider
                                      Padding(
                                        padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
                                        child: Divider(
                                          height: 1,
                                          color: Colors.grey[700],
                                        ),
                                      ),
                                      //HomeKitchen
                                      Padding(
                                        padding: const EdgeInsets.only(left: 12, right: 12, top: 8),
                                        child: Container(
                                          width: w,
                                          decoration: BoxDecoration(
                                            color: Color(0xff282828),
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.only(left: 8.0),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text(
                                                  "Home Kitchen",
                                                  style: whi,
                                                ),
                                                IconButton(
                                                  icon: Icon(
                                                    Icons.add_circle_outline,
                                                    color: Colors.yellow,
                                                  ),
                                                  onPressed: () {},
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      //Profile
                                      Padding(
                                        padding:
                                        const EdgeInsets.only(left: 13.0, top: 10.0, right: 15.0),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                CircleAvatar(
                                                  radius: 20,
                                                  backgroundImage: NetworkImage(
                                                      'data:image/jpeg;base64,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'),
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Column(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text("Sofis Kitchen", style: f20bw),
                                                    SizedBox(
                                                      height: 5,
                                                    ),
                                                    Text(
                                                      "From Kottayam,Kerala\nMember Since Feb 2020",
                                                      style: f10gry,
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            IconButton(
                                              icon: Icon(Icons.arrow_forward, color: Colors.white),
                                              onPressed: () {},
                                            ),
                                          ],
                                        ),
                                      ),

                                      //Local Market
                                      Padding(
                                        padding: const EdgeInsets.all(12.0),
                                        child: Container(
                                          width: w,
                                          decoration: BoxDecoration(
                                            color: Color(0xff282828),
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 25, right: 15, top: 10, bottom: 10),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Column(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    Icon(
                                                      Icons.home,
                                                      color: Colors.white,
                                                    ),
                                                    Text(
                                                      " Local\nMarket",
                                                      style: whi,
                                                    )
                                                  ],
                                                ),
                                                Column(
                                                  children: [
                                                    Text(
                                                      "Register as a local supplier",
                                                      style: f10w,
                                                    ),
                                                    SizedBox(
                                                      height: 2,
                                                    ),
                                                    InkWell(
                                                      onTap: (){



                                                      },
                                                      child: Container(
                                                        width: w /7,
                                                        decoration: BoxDecoration(
                                                          color: Color(0xff827717),
                                                          borderRadius: BorderRadius.circular(5),
                                                        ),
                                                        child: Padding(
                                                          padding: const EdgeInsets.all(10.0),
                                                          child: Center(
                                                            child: Text(
                                                              card1,
                                                              style: f10w,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(12.0),
                                        child: Container(
                                          width: w,
                                          decoration: BoxDecoration(
                                            color: Color(0xff282828),
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 25, right: 15, top: 10, bottom: 10),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Column(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    Icon(
                                                      Icons.home,
                                                      color: Colors.white,
                                                    ),
                                                    Text(
                                                      "Local\nMarket",
                                                      style: whi,
                                                    )
                                                  ],
                                                ),
                                                Column(
                                                  children: [
                                                    Text(
                                                      "Register as a local Restaurant",
                                                      style: f10w,
                                                    ),
                                                    SizedBox(
                                                      height: 2,
                                                    ),
                                                    InkWell(
                                                      onTap: (){

                                                      },
                                                      child: Container(
                                                        width: w / 7,
                                                        decoration: BoxDecoration(
                                                          color: Color(0xff827717),
                                                          borderRadius: BorderRadius.circular(5),
                                                        ),
                                                        child: Padding(
                                                          padding: const EdgeInsets.all(10.0),
                                                          child: Center(
                                                            child: Text(
                                                              card2,
                                                              style: f10w,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(12.0),
                                        child: Container(
                                          width: w,
                                          decoration: BoxDecoration(
                                            color: Color(0xff282828),
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 25, right: 15, top: 10, bottom: 10),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Column(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    Icon(
                                                      Icons.directions_bike_rounded,
                                                      color: Colors.white,
                                                    ),
                                                    Text(
                                                      "Delivery\nWarrior",
                                                      style: whi,
                                                    )
                                                  ],
                                                ),
                                                Column(
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      "join our delivery warrior team\n"
                                                          "         in just few steps",
                                                      style: f10w,
                                                    ),
                                                    SizedBox(
                                                      height: 2,
                                                    ),
                                                    InkWell(
                                                      onTap: (){

                                                      },
                                                      child: Container(
                                                        width: w / 7,
                                                        decoration: BoxDecoration(
                                                          color: Color(0xff827717),
                                                          borderRadius: BorderRadius.circular(5),
                                                        ),
                                                        child: Padding(
                                                          padding: const EdgeInsets.all(10.0),
                                                          child: Center(
                                                            child: Text(
                                                              card3,
                                                              style: f10w,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      MaterialButton(
                                          color: Colors.red,
                                          child: Text("tap"),
                                          onPressed: (){
                                            setState(() {
                                              secondCon =1;
                                              step =2;
                                            });
                                          })
                                      //
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Container(
                          width: w *2/4,
                          child:secondCon == 1 && step == 1 ? SecondPage() : secondCon == 1 && step == 2 ?Container(
                            color: Colors.green,
                          ):Container(),
                        ),
                      ),
                    ],
                  ),
                  desktop: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: _size.width > 1251 ? 1 : 4,
                        child:Container(
                          child:SingleChildScrollView(
                            child: Container(
                              height: h,
                              width: w,
                              color: Colors.black,
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    // start profile details
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        width: w,
                                        child: Row(
                                          children: [
                                            Container(
                                              height: 30.0,
                                              clipBehavior: Clip.antiAlias,
                                              width: 30.0,
                                              decoration: BoxDecoration(
                                                  border: Border.all(color: (Color(0xFF48c0d8))),
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
                                    ),
                                    //

                                    TileContainer(
                                      iconsDemo: Icons.people,
                                      label: "Followers",
                                    ),
                                    TileContainer(
                                      iconsDemo: Icons.qr_code,
                                      label: "My QR Code",
                                    ),
                                    TileContainer(
                                      iconsDemo: Icons.post_add,
                                      label: "Post",
                                    ),
                                    TileContainer(
                                      iconsDemo: Icons.video_call,
                                      label: "Videos",
                                    ),
                                    TileContainer(
                                      iconsDemo: Icons.star,
                                      label: "Food Reviews",
                                    ),
                                    TileContainer(
                                      iconsDemo: Icons.home,
                                      label: "Foodi Market",
                                    ),
                                    TileContainer(
                                      iconsDemo: Icons.favorite,
                                      label: "Food Bank",
                                    ),
                                    TileContainer(
                                      iconsDemo: Icons.notes,
                                      label: "My Blogs",
                                    ),
                                    TileContainer(
                                      iconsDemo: Icons.saved_search,
                                      label: "Saved Items",
                                    ),

                                    //Divider
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
                                      child: Divider(
                                        height: 1,
                                        color: Colors.grey[700],
                                      ),
                                    ),
                                    //HomeKitchen
                                    Padding(
                                      padding: const EdgeInsets.only(left: 12, right: 12, top: 8),
                                      child: Container(
                                        width: w,
                                        decoration: BoxDecoration(
                                          color: Color(0xff282828),
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.only(left: 8.0),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Home Kitchen",
                                                style: whi,
                                              ),
                                              IconButton(
                                                icon: Icon(
                                                  Icons.add_circle_outline,
                                                  color: Colors.yellow,
                                                ),
                                                onPressed: () {},
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    //Profile
                                    Padding(
                                      padding:
                                      const EdgeInsets.only(left: 13.0, top: 10.0, right: 15.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              CircleAvatar(
                                                radius: 20,
                                                backgroundImage: NetworkImage(
                                                    'data:image/jpeg;base64,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'),
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Column(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text("Sofis Kitchen", style: f20bw),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Text(
                                                    "From Kottayam,Kerala\nMember Since Feb 2020",
                                                    style: f10gry,
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          IconButton(
                                            icon: Icon(Icons.arrow_forward, color: Colors.white),
                                            onPressed: () {},
                                          ),
                                        ],
                                      ),
                                    ),

                                    //Local Market
                                    Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Container(
                                        width: w,
                                        decoration: BoxDecoration(
                                          color: Color(0xff282828),
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 25, right: 15, top: 10, bottom: 10),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Icon(
                                                    Icons.home,
                                                    color: Colors.white,
                                                  ),
                                                  Text(
                                                    " Local\nMarket",
                                                    style: whi,
                                                  )
                                                ],
                                              ),
                                              Column(
                                                children: [
                                                  Text(
                                                    "Register as a local supplier",
                                                    style: f10w,
                                                  ),
                                                  SizedBox(
                                                    height: 2,
                                                  ),
                                                  InkWell(
                                                    onTap: (){



                                                    },
                                                    child: Container(
                                                      width: w /7,
                                                      decoration: BoxDecoration(
                                                        color: Color(0xff827717),
                                                        borderRadius: BorderRadius.circular(5),
                                                      ),
                                                      child: Padding(
                                                        padding: const EdgeInsets.all(10.0),
                                                        child: Center(
                                                          child: Text(
                                                            card1,
                                                            style: f10w,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Container(
                                        width: w,
                                        decoration: BoxDecoration(
                                          color: Color(0xff282828),
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 25, right: 15, top: 10, bottom: 10),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Icon(
                                                    Icons.home,
                                                    color: Colors.white,
                                                  ),
                                                  Text(
                                                    "Local\nMarket",
                                                    style: whi,
                                                  )
                                                ],
                                              ),
                                              Column(
                                                children: [
                                                  Text(
                                                    "Register as a local Restaurant",
                                                    style: f10w,
                                                  ),
                                                  SizedBox(
                                                    height: 2,
                                                  ),
                                                  InkWell(
                                                    onTap: (){

                                                    },
                                                    child: Container(
                                                      width: w / 7,
                                                      decoration: BoxDecoration(
                                                        color: Color(0xff827717),
                                                        borderRadius: BorderRadius.circular(5),
                                                      ),
                                                      child: Padding(
                                                        padding: const EdgeInsets.all(10.0),
                                                        child: Center(
                                                          child: Text(
                                                            card2,
                                                            style: f10w,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Container(
                                        width: w,
                                        decoration: BoxDecoration(
                                          color: Color(0xff282828),
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 25, right: 15, top: 10, bottom: 10),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Icon(
                                                    Icons.directions_bike_rounded,
                                                    color: Colors.white,
                                                  ),
                                                  Text(
                                                    "Delivery\nWarrior",
                                                    style: whi,
                                                  )
                                                ],
                                              ),
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    "join our delivery warrior team\n"
                                                        "         in just few steps",
                                                    style: f10w,
                                                  ),
                                                  SizedBox(
                                                    height: 2,
                                                  ),
                                                  InkWell(
                                                    onTap: (){

                                                    },
                                                    child: Container(
                                                      width: w / 7,
                                                      decoration: BoxDecoration(
                                                        color: Color(0xff827717),
                                                        borderRadius: BorderRadius.circular(5),
                                                      ),
                                                      child: Padding(
                                                        padding: const EdgeInsets.all(10.0),
                                                        child: Center(
                                                          child: Text(
                                                            card3,
                                                            style: f10w,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    MaterialButton(
                                        color: Colors.red,
                                        child: Text("tap"),
                                        onPressed: (){
                                          setState(() {
                                            secondCon =1;
                                            step =2;
                                          });
                                        })
                                    //
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(flex: _size.width > 1251 ? 2 : 5, child: Container(
                        width: w *2/4,
                        child:secondCon == 1 && step == 1 ? SecondPage() : secondCon == 1 && step == 2 ?EachItemDetailPage():Container(),
                      )),
                      Expanded(flex: _size.width > 1251 ? 1 : 5, child: Container(
                        width: w/4,
                        child:ThirdSection(),
                      ),),
                    ],
                  ),
                )
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
