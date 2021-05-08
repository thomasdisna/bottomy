import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:foodiz/Responsive.dart';


import 'package:shared_preferences/shared_preferences.dart';

import 'Constants.dart';





class ThirdSection extends StatefulWidget {
  @override
  _ThirdSectionState createState() => _ThirdSectionState();
}

class _ThirdSectionState extends State<ThirdSection> {

  bool _viewmore;
  bool _homekitchen;
  final _searchController = TextEditingController();
  final _chatController = TextEditingController();

  @override
  void initState() {
    _viewmore = false;
    _homekitchen = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width /4;
    return SingleChildScrollView(
      child: Container(
        // height: h,
        decoration: BoxDecoration(color: Colors.black),
        width: w,
        child: Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 10.00,top: 13),
          child: Column(crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset("assets/Template1/image/Foodie/icons/shopping-basket.png",height: 22,),
                      SizedBox(
                        width: 10,
                      ),
                      Text("Purchase List", style: f14w),
                    ],
                  ),
                  Container(
                    height: 18,
                    width: 18,
                    child: Center(child: Text("5", style: f11)),
                    decoration: BoxDecoration(
                        color: Color(0xFF48c0d8), shape: BoxShape.circle),
                  ),
                ],
              ),
              SizedBox(
                height: 17,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset("assets/Template1/image/Foodie/icons/cart.png",height: 22,),
                      SizedBox(
                        width: 10,
                      ),
                      Text("Cart", style: f14w),
                    ],
                  ),
                  Container(
                    height: 18,
                    width: 18,
                    child: Center(child: Text("5", style: f11)),
                    decoration: BoxDecoration(
                        color: Color(0xFF48c0d8), shape: BoxShape.circle),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Divider(
                thickness: .3,
                color: Colors.grey[400],
              ),
              SizedBox(
                height: 8,
              ),
              Container(
                width: w,
                height: 35,
                decoration: BoxDecoration(color: Colors.grey[800],borderRadius: BorderRadius.circular(4)),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 8.0,right: 10
                      ),
                      child: Icon(
                        (Icons.search),
                        size: 20,
                        color: Colors.white,
                      ),
                    ),

                    Container(
                      width: w-125,
                      child: Center(
                        child: TextField(
                          style: TextStyle(color: Colors.white),
                          autofocus: true,
                          //  keyboardType: TextInputType.visiblePassword,
                          // textInputAction: TextInputAction.search,
                          controller: _searchController,
                          onChanged: (keyword) {},
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintStyle: f13g,
                              contentPadding: EdgeInsets.symmetric(
                               vertical: 19
                              ),
                              hintText: "Search the foodie chat",
                              suffixStyle: TextStyle(color: Colors.black)),
                        ),
                      ),
                    ),

                  ],
                ),
              ),
              Container(
                height: _viewmore ? 10.toDouble() * 44 : 5.toDouble() * 44,
                width: w,
                child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: _viewmore ? 10 : 5,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: ()
                          async{
                          SharedPreferences _pref = await SharedPreferences.getInstance();
                          setState(() {
                            _pref.setBool("show", true);
                            index%2 == 0 ? _pref.setString("showname", "Tojo Thomas") : _pref.setString("showname", "Nithin");
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(top: 13.00),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
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
                                  SizedBox(
                                    width: 7,
                                  ),
                                  GestureDetector(
                                    onTap: () {},
                                    child: Container(width: Responsive.isMobile(context) || Responsive.isTablet(context) ? 60 : 100,
                                      child: Text(index%2 == 0 ? "Tojo Thomas" : "Nithin",
                                          style: f14w,

                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,),
                                    ),
                                  ),
                                ],
                              ),
                              Text(index == 1 ? "15 Min ago" : "Live Now",
                                  style: f7b),
                            ],
                          ),
                        ),
                      );
                    }),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    _viewmore = !_viewmore;
                  });
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(),
                    Text(_viewmore ? "View Less" : "View More", style: f12B),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: w,
                height: 170,
                color: Colors.grey,
                child: Image.asset(
                  "assets/img2.jpg",
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        _homekitchen = !_homekitchen;
                      });
                    },
                    child: Container(width: MediaQuery.of(context).size.width/5.7,
                      child: Text(
                        "Home Kitchen Near You",
                        style: f14w,maxLines: 1,overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.white,
                  )
                ],
              ),
              _homekitchen ?  SizedBox(height: 10,) : Container(),
              _homekitchen
                  ? Container(
                height: 4.toDouble() * 46,
                child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: [
                                Row(crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CircleAvatar(
                                      backgroundImage: NetworkImage(
                                          'https://picsum.photos/250?image=9'),
                                      radius: 13,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                      width: Responsive.isTablet(context) ? MediaQuery.of(context).size.width/10:MediaQuery.of(context).size.width/12,
                                      child: Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                              "Sofis Kitchen",maxLines: 2,overflow: TextOverflow.ellipsis,
                                              style: f14w,
                                            ),

                                          SizedBox(
                                            height: 1,
                                          ),
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.location_on,
                                                color: Colors.grey,
                                                size: 10,
                                              ),
                                              SizedBox(
                                                width: 4,
                                              ),
                                              Text("Kottayam", style: f10g,maxLines: 1,overflow: TextOverflow.ellipsis,)
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.star,
                                                color: Color(0xFFffd55e),
                                                size: 10,
                                              ),
                                              SizedBox(width: 3,),
                                              Text("4.1 Ratings",maxLines: 1,overflow: TextOverflow.ellipsis,
                                                  style: f10g)
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Container(height: 27,
                                  width: w/5,
                                  child: Center(
                                    child: MaterialButton(height: 27,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(2.0))),

                                      color: Color(0xFF48c0d8),
                                      child: new Text('Follow Chef',
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                          style: f12BB),
                                      onPressed: () {},
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          )
                        ],
                      );
                    }),
              )
                  : Container(),
              SizedBox(height: 6,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                    },
                    child: Container(width: MediaQuery.of(context).size.width/5.7,
                      child: Text(
                        "Local Store Near You",
                        style: f14w,maxLines: 1,overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.white,
                  )
                ],
              ),
              SizedBox(height: 6,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                    },
                    child: Container(width: MediaQuery.of(context).size.width/5.7,
                      child: Text(
                        "Restaurant Near You",
                        style: f14w,maxLines: 1,overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.white,
                  )
                ],
              ),
              SizedBox(height: 30,),
            ],
          ),
        ),
      ),
    );
  }
}
