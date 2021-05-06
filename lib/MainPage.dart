import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:foodiz/homekitchen_tab.dart';
import 'package:foodiz/widget_style.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_text_view/smart_text_view.dart';
import 'package:intl/intl.dart';

import 'FoodBank.dart';
import 'LocalStore.dart';
import 'Resturants.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  TabController _tabContoller;

  ScrollController _timControoooo;
  ScrollController scrollController;
  static final _containerHeight = 61.0;
  var _fromTop = 0.toDouble();
  var _allowReverse = true, _allowForward = true;
  var _prevOffset = 0.0;
  var _prevForwardOffset = -_containerHeight;
  var _prevReverseOffset = 0.0;

  _scrollListener() {
    double offset12 = _timControoooo.offset;
    var direction = _timControoooo.position.userScrollDirection;

    if (direction == ScrollDirection.reverse) {
      _allowForward = true;
      if (_allowReverse) {
        _allowReverse = false;
        _prevOffset = offset12;
        _prevForwardOffset = _fromTop;
      }

      var difference = offset12 - _prevOffset;
      _fromTop = _prevForwardOffset + difference;
      if (_fromTop > 0) _fromTop = -_containerHeight;
    } else if (direction == ScrollDirection.forward) {
      _allowReverse = true;
      if (_allowForward) {
        _allowForward = false;
        _prevOffset = offset12;
        _prevReverseOffset = _fromTop;
      }
      var difference = offset12 - _prevOffset;
      _fromTop = _prevReverseOffset + difference;
      if (_fromTop < -_containerHeight) _fromTop = 0;
    }
    setState(() {});
    if (_timControoooo.offset >= _timControoooo.position.maxScrollExtent &&
        !_timControoooo.position.outOfRange) {
      // start loading data
      setState(() {});
    }
    if (_timControoooo.offset <= _timControoooo.position.minScrollExtent &&
        !_timControoooo.position.outOfRange) {
      setState(() {});
    }
  }

  @override
  void initState() {
    _timControoooo = ScrollController();
    _timControoooo.addListener(_scrollListener);
    // TODO: implement initState
    super.initState();
    scrollController = ScrollController();
    scrollController.addListener(() {
      if (scrollController.offset >=
              scrollController.position.maxScrollExtent &&
          !scrollController.position.outOfRange) {
      } else if (scrollController.offset <=
              scrollController.position.minScrollExtent &&
          !scrollController.position.outOfRange) {
      } else {}
    });
    _tabContoller = TabController(length: 6, vsync: this);
    _tabContoller.addListener(_handleTabSelection);
  }

  Future<void> _getData() async {
    setState(() {});
  }

  bool isLoading = false;

  Future _loadData() async {
    // perform fetching data delay
    await new Future.delayed(new Duration(seconds: 3));
    setState(() {
      isLoading = false;
    });
  }

  void _handleTabSelection() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var _location = Positioned(
      top: _fromTop,
      left: 0,
      right: 0,
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.only(top: 7.0, right: 5, left: 5),
              child: Container(
                height: 47.0,
                decoration: BoxDecoration(
                    color: Color(0xFF23252E),
                    border: Border.all(
                      color: Colors.grey[800],
                      width: 1,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 5.0,
                          spreadRadius: 0.0)
                    ]),
                child: TextFormField(
                  autofocus: false,
                  readOnly: true,
                  maxLines: 1,
                  minLines: 1,
                  // controller: timeLineLocation,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please add receiver location';
                    }
                    return null;
                  },
                  onTap: () {},
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.location_on, color: Colors.white),
                      border: InputBorder.none,
                      hintText: "Location",
                      suffixIcon: Icon(
                        Icons.my_location,
                        color: Colors.white,
                      ),
                      hintStyle: TextStyle(color: Colors.white, fontSize: 15)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
    var _tabModules = Container(
      child: Padding(
          padding: EdgeInsets.only(top: _fromTop != 0 ? 7 : 62),
          child: Column(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    color: Color(0xFF23252E),
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 5.0,
                          spreadRadius: 0.0)
                    ]),
                child: _fromTop != 0
                    ? Container(
                        height: 40,
                        width: MediaQuery.of(context).size.width,
                        child: TabBar(
                          indicator: BoxDecoration(
                              color: Color((0xFFffd55e)),
                              borderRadius: BorderRadius.circular(4)),
                          controller: _tabContoller,
                          labelColor: Colors.black,
                          unselectedLabelColor: Colors.white,
                          indicatorColor: Colors.transparent,
                          tabs: <Widget>[
                            Tab(
                              icon: _tabContoller.index == 0
                                  ? Image.asset(
                                      "assets/Template1/image/Foodie/icons/wall.png",
                                      height: 24,
                                      width: 24,
                                      color: Colors.black,
                                    )
                                  : Image.asset(
                                      "assets/Template1/image/Foodie/icons/wall.png",
                                      height: 24,
                                      width: 24,
                                      color: Colors.white,
                                    ),
                            ),
                            Tab(
                              icon: _tabContoller.index == 1
                                  ? Image.asset(
                                      "assets/Template1/image/Foodie/icons/home-kitchen.png",
                                      height: 24,
                                      width: 24,
                                      color: Colors.black,
                                    )
                                  : Image.asset(
                                      "assets/Template1/image/Foodie/icons/home-kitchen.png",
                                      height: 24,
                                      width: 24,
                                      color: Colors.white,
                                    ),
                            ),
                            Tab(
                              icon: _tabContoller.index == 2
                                  ? Image.asset(
                                      "assets/Template1/image/Foodie/icons/shop.png",
                                      height: 26,
                                      width: 26,
                                      color: Colors.black,
                                    )
                                  : Image.asset(
                                      "assets/Template1/image/Foodie/icons/shop.png",
                                      height: 26,
                                      width: 26,
                                      color: Colors.white,
                                    ),
                            ),
                            Tab(
                              icon: _tabContoller.index == 3
                                  ? Image.asset(
                                      "assets/Template1/image/Foodie/icons/market.png",
                                      height: 24,
                                      width: 24,
                                      color: Colors.black,
                                    )
                                  : Image.asset(
                                      "assets/Template1/image/Foodie/icons/market.png",
                                      height: 24,
                                      width: 24,
                                      color: Colors.white,
                                    ),
                            ),
                            Tab(
                              icon: _tabContoller.index == 4
                                  ? Image.asset(
                                      "assets/Template1/image/Foodie/icons/Food-Bank-1.png",
                                      height: 24,
                                      width: 24,
                                      color: Colors.black,
                                    )
                                  : Image.asset(
                                      "assets/Template1/image/Foodie/icons/Food-Bank-1.png",
                                      height: 24,
                                      width: 24,
                                      color: Colors.white,
                                    ),
                            ),
                            Tab(
                              icon: _tabContoller.index == 5
                                  ? Image.asset(
                                      "assets/Template1/image/Foodie/icons/restaurent-wall.png",
                                      height: 24,
                                      width: 24,
                                      color: Colors.black,
                                    )
                                  : Image.asset(
                                      "assets/Template1/image/Foodie/icons/restaurent-wall.png",
                                      height: 24,
                                      width: 24,
                                      color: Colors.white,
                                    ),
                            ),
                          ],
                        ),
                      )
                    : Container(
                        height: 70,
                        child: PreferredSize(
                          child: TabBar(
                            isScrollable: true,
                            indicator: BoxDecoration(
                                color: Color((0xFFffd55e)),
                                borderRadius: BorderRadius.circular(4)),
                            controller: _tabContoller,
                            labelColor: Colors.black,
                            unselectedLabelColor: Colors.white,
                            indicatorColor: Colors.transparent,
                            tabs: <Widget>[
                              Tab(
                                child: Text(
                                  "Foodie Wall",
                                  style: f14,
                                  textAlign: TextAlign.center,
                                ),
                                icon: _tabContoller.index == 0
                                    ? Image.asset(
                                        "assets/Template1/image/Foodie/icons/wall.png",
                                        height: 24,
                                        width: 24,
                                        color: Colors.black,
                                      )
                                    : Image.asset(
                                        "assets/Template1/image/Foodie/icons/wall.png",
                                        height: 24,
                                        width: 24,
                                        color: Colors.white,
                                      ),
                              ),
                              Tab(
                                child: Text(
                                  "Home Kitchen",
                                  style: f14,
                                  textAlign: TextAlign.center,
                                ),
                                icon: _tabContoller.index == 1
                                    ? Image.asset(
                                        "assets/Template1/image/Foodie/icons/home-kitchen.png",
                                        height: 24,
                                        width: 24,
                                        color: Colors.black,
                                      )
                                    : Image.asset(
                                        "assets/Template1/image/Foodie/icons/home-kitchen.png",
                                        height: 24,
                                        width: 24,
                                        color: Colors.white,
                                      ),
                              ),
                              Tab(
                                child: Text(
                                  "Local Store",
                                  style: f14,
                                  textAlign: TextAlign.center,
                                ),
                                icon: _tabContoller.index == 2
                                    ? Image.asset(
                                        "assets/Template1/image/Foodie/icons/shop.png",
                                        height: 26,
                                        width: 26,
                                        color: Colors.black,
                                      )
                                    : Image.asset(
                                        "assets/Template1/image/Foodie/icons/shop.png",
                                        height: 26,
                                        width: 26,
                                        color: Colors.white,
                                      ),
                              ),
                              Tab(
                                child: Text(
                                  "Foodie Market",
                                  style: f14,
                                  textAlign: TextAlign.center,
                                ),
                                icon: _tabContoller.index == 3
                                    ? Image.asset(
                                        "assets/Template1/image/Foodie/icons/market.png",
                                        height: 24,
                                        width: 24,
                                        color: Colors.black,
                                      )
                                    : Image.asset(
                                        "assets/Template1/image/Foodie/icons/market.png",
                                        height: 24,
                                        width: 24,
                                        color: Colors.white,
                                      ),
                              ),
                              Tab(
                                child: Text(
                                  "Food Bank",
                                  style: f14,
                                ),
                                icon: _tabContoller.index == 4
                                    ? Image.asset(
                                        "assets/Template1/image/Foodie/icons/Food-Bank-1.png",
                                        height: 24,
                                        width: 24,
                                        color: Colors.black,
                                      )
                                    : Image.asset(
                                        "assets/Template1/image/Foodie/icons/Food-Bank-1.png",
                                        height: 24,
                                        width: 24,
                                        color: Colors.white,
                                      ),
                              ),
                              Tab(
                                child: Text(
                                  "Restaurants",
                                  style: f14,
                                  textAlign: TextAlign.center,
                                ),
                                icon: _tabContoller.index == 5
                                    ? Image.asset(
                                        "assets/Template1/image/Foodie/icons/restaurent-wall.png",
                                        height: 24,
                                        width: 24,
                                        color: Colors.black,
                                      )
                                    : Image.asset(
                                        "assets/Template1/image/Foodie/icons/restaurent-wall.png",
                                        height: 24,
                                        width: 24,
                                        color: Colors.white,
                                      ),
                              ),
                            ],
                          ),
                          preferredSize: Size.fromHeight(100),
                        ),
                      ),
              ),
              Container(
                height: _fromTop != 0
                    ? MediaQuery.of(context).size.height - 103
                    : MediaQuery.of(context).size.height - 188,
                // padding: EdgeInsets.only(bottom: 200),
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 5.0,
                  ),
                  child: TabBarView(
                    controller: _tabContoller,
                    children: <Widget>[
                      RefreshIndicator(
                        onRefresh: _getData,
                        backgroundColor: Color(0xFF0dc89e),
                        color: Colors.black,
                        child: ListView.builder(
                          controller: _timControoooo,
                          itemCount: 10,
                          // physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              color: Color(0xFF1E2026),
                              child: new GestureDetector(
                                child: new Column(
                                  children: <Widget>[
                                    Container(
                                      // color: Colors.white.withOpacity(0.5),
                                      padding: const EdgeInsets.only(
                                          top: 5.0, bottom: 10),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        children: <Widget>[
                                          Container(
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 5.0, bottom: 2),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: <Widget>[
                                                      GestureDetector(
                                                        onTap: () {
                                                          showDialog(
                                                              context: context,
                                                              builder:
                                                                  (BuildContext
                                                                      context) {
                                                                return Dialog(
                                                                  backgroundColor:
                                                                      Color(
                                                                          0xFF1E2026),
                                                                  child:
                                                                      Container(
                                                                    height: 230,
                                                                    width: 350,
                                                                    child:
                                                                        Padding(
                                                                      padding:
                                                                          const EdgeInsets.all(
                                                                              8.0),
                                                                      child:
                                                                          CachedNetworkImage(
                                                                        placeholder:
                                                                            (context, ind) =>
                                                                                Image.asset(
                                                                          "assets/Template1/image/Foodie/post_dummy.jpeg",
                                                                          fit: BoxFit
                                                                              .cover,
                                                                        ),
                                                                        imageUrl:
                                                                            "https://firebasestorage.googleapis.com/v0/b/foodizwall.appspot.com/o/thumbs%2Ficu.png?alt=media",
                                                                        fit: BoxFit
                                                                            .cover,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                );
                                                              });
                                                        },
                                                        child: Container(
                                                          height: 38.0,
                                                          clipBehavior:
                                                              Clip.antiAlias,
                                                          width: 38.0,
                                                          decoration: BoxDecoration(
                                                              border: Border.all(
                                                                  color: (Color(
                                                                      0xFF48c0d8))),
                                                              borderRadius: BorderRadius
                                                                  .all(Radius
                                                                      .circular(
                                                                          180.0))),
                                                          child: Center(
                                                            child: Container(
                                                              clipBehavior: Clip
                                                                  .antiAlias,
                                                              height: 35,
                                                              decoration: BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius.all(
                                                                          Radius.circular(
                                                                              180.0))),
                                                              width: 35,
                                                              child: Center(
                                                                  child: Image
                                                                      .asset(
                                                                "assets/Template1/image/Foodie/icu.png",
                                                                fit: BoxFit
                                                                    .cover,
                                                              )),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 5,
                                                      ),
                                                      Container(
                                                        child: GestureDetector(
                                                          onTap: (){},
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: <Widget>[
                                                              GestureDetector(
                                                                onTap:(){},



                                                                child: Text(
                                                                  "Amina",
                                                                  style: f15wB,
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                height: 3,
                                                              ),
                                                              Row(
                                                                children: [
                                                                  Text(
                                                                      "2 mits ago",
                                                                      style:
                                                                          f10g),
                                                                ],
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: <Widget>[
                                                      Container(
                                                        height: 23,
                                                        child: MaterialButton(
                                                          onPressed: () {},
                                                          splashColor:
                                                              Color(0xFFffd55e),
                                                          shape: RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          2)),
                                                          height: 23,
                                                          minWidth: 70,
                                                          color:
                                                              Color(0xFF48c0d9),
                                                          child: Center(
                                                              child: Text(
                                                                  "Follow",
                                                                  style: f14B)),
                                                        ),
                                                      ),
                                                      SizedBox(width: 12),
                                                      GestureDetector(
                                                        //Data = [
                                                        // {"name":"amina",
                                                        // "sex": "female"},{}]
                                                          onTap: () async {
                                                            SharedPreferences
                                                                _pref =
                                                                await SharedPreferences
                                                                    .getInstance();
                                                            setState(() {
                                                              _pref.setBool(
                                                                  "show", true);
                                                              _pref.setString("showname", "Amina");
                                                            });
                                                            print("Setting value " +
                                                                _pref
                                                                    .getBool(
                                                                        "show")
                                                                    .toString());
                                                          },
                                                          child: Icon(
                                                            Icons.chat,
                                                            color: Color(
                                                                (0xFFffd55e)),
                                                          )),
                                                      GestureDetector(
                                                        onTap: () {
                                                          showModalBottomSheet(
                                                              backgroundColor:
                                                                  Color(
                                                                      0xFF1E2026),
                                                              context: context,
                                                              clipBehavior: Clip
                                                                  .antiAlias,
                                                              builder:
                                                                  (BuildContext
                                                                      context) {
                                                                return StatefulBuilder(builder:
                                                                    (BuildContext
                                                                            context,
                                                                        StateSetter
                                                                            state) {
                                                                  return Padding(
                                                                    padding: const EdgeInsets
                                                                            .only(
                                                                        bottom:
                                                                            5.0,
                                                                        top: 5,
                                                                        right:
                                                                            10,
                                                                        left:
                                                                            10),
                                                                    child: Wrap(
                                                                      children: <
                                                                          Widget>[
                                                                        //edit post
                                                                        Padding(
                                                                          padding:
                                                                              const EdgeInsets.all(6.0),
                                                                          child:
                                                                              InkWell(
                                                                            onTap:
                                                                                () {},
                                                                            child:
                                                                                Container(
                                                                              child: Row(
                                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                                children: <Widget>[
                                                                                  Image.asset(
                                                                                    "assets/Template1/image/Foodie/icons/pencil.png",
                                                                                    height: 21,
                                                                                    width: 21,
                                                                                  ),
                                                                                  SizedBox(
                                                                                    width: 16,
                                                                                  ),
                                                                                  Text(
                                                                                    "Edit Post",
                                                                                    style: f15wB,
                                                                                  )
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        //delete post
                                                                        Padding(
                                                                          padding:
                                                                              const EdgeInsets.all(6.0),
                                                                          child:
                                                                              InkWell(
                                                                            onTap:
                                                                                () {
                                                                              Navigator.pop(context);
                                                                              showDialog(
                                                                                  context: context,
                                                                                  builder: (BuildContext context) {
                                                                                    return AlertDialog(
                                                                                      backgroundColor: Color(0xFF1E2026),
                                                                                      title: new Text(
                                                                                        "Delete Post?",
                                                                                        style: f16wB,
                                                                                      ),
                                                                                      content: new Text(
                                                                                        "Do you want to delete the post",
                                                                                        style: f14w,
                                                                                      ),
                                                                                      actions: <Widget>[
                                                                                        MaterialButton(
                                                                                          height: 28,
                                                                                          color: Color(0xFFffd55e),
                                                                                          child: new Text(
                                                                                            "Cancel",
                                                                                            style: TextStyle(color: Colors.black),
                                                                                          ),
                                                                                          onPressed: () {
                                                                                            Navigator.pop(context, 'Cancel');
                                                                                          },
                                                                                        ),
                                                                                        MaterialButton(
                                                                                          height: 28,
                                                                                          color: Color(0xFF48c0d8),
                                                                                          child: new Text(
                                                                                            "Delete",
                                                                                            style: TextStyle(color: Colors.black),
                                                                                          ),
                                                                                          onPressed: () {
                                                                                            Navigator.pop(context);
                                                                                          },
                                                                                        ),
                                                                                      ],
                                                                                    );
                                                                                  });
                                                                            },
                                                                            child:
                                                                                Container(
                                                                              child: Row(
                                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                                children: <Widget>[
                                                                                  Icon(
                                                                                    Icons.delete_outline,
                                                                                    size: 26,
                                                                                    color: Colors.white,
                                                                                  ),
                                                                                  SizedBox(
                                                                                    width: 10,
                                                                                  ),
                                                                                  Column(
                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                    children: <Widget>[
                                                                                      Text(
                                                                                        "Delete Post",
                                                                                        style: f15wB,
                                                                                      ),
                                                                                      SizedBox(
                                                                                        height: 3,
                                                                                      ),
                                                                                      Text(
                                                                                        "Delete the entire post",
                                                                                        style: f13w,
                                                                                      ),
                                                                                    ],
                                                                                  )
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        //save post
                                                                        Padding(
                                                                          padding:
                                                                              const EdgeInsets.all(6.0),
                                                                          child:
                                                                              InkWell(
                                                                            onTap:
                                                                                () {
                                                                              Navigator.pop(context);
                                                                            },
                                                                            child:
                                                                                Container(
                                                                              child: Row(
                                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                                children: <Widget>[
                                                                                  Icon(
                                                                                    Icons.bookmark_border,
                                                                                    size: 26,
                                                                                    color: Colors.white,
                                                                                  ),
                                                                                  SizedBox(
                                                                                    width: 10,
                                                                                  ),
                                                                                  Column(
                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                    children: <Widget>[
                                                                                      Text(
                                                                                        "Save Post",
                                                                                        style: f15wB,
                                                                                      ),
                                                                                      SizedBox(
                                                                                        height: 3,
                                                                                      ),
                                                                                      Text(
                                                                                        "Add this to your saved post",
                                                                                        style: f13w,
                                                                                      ),
                                                                                    ],
                                                                                  )
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        //report post
                                                                        Padding(
                                                                          padding:
                                                                              const EdgeInsets.all(6.0),
                                                                          child:
                                                                              InkWell(
                                                                            onTap:
                                                                                () {
                                                                              Navigator.pop(context);
                                                                            },
                                                                            child:
                                                                                Container(
                                                                              child: Row(
                                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                                children: <Widget>[
                                                                                  Icon(
                                                                                    Icons.block,
                                                                                    size: 26,
                                                                                    color: Colors.white,
                                                                                  ),
                                                                                  SizedBox(
                                                                                    width: 10,
                                                                                  ),
                                                                                  Column(
                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                    children: <Widget>[
                                                                                      Text(
                                                                                        "Report & Support",
                                                                                        style: f15wB,
                                                                                      ),
                                                                                      SizedBox(
                                                                                        height: 3,
                                                                                      ),
                                                                                      Text(
                                                                                        "I'am concerned about this post",
                                                                                        style: f13w,
                                                                                      ),
                                                                                    ],
                                                                                  )
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        //follooww user
                                                                        Padding(
                                                                          padding:
                                                                              const EdgeInsets.all(6.0),
                                                                          child:
                                                                              InkWell(
                                                                            onTap:
                                                                                () {
                                                                              showDialog(
                                                                                  context: context,
                                                                                  builder: (BuildContext context) {
                                                                                    return AlertDialog(
                                                                                      backgroundColor: Color(0xFF1E2026),
                                                                                      content: new Text(
                                                                                        "Do you want to Unfollow ?",
                                                                                        style: f14w,
                                                                                      ),
                                                                                      actions: <Widget>[
                                                                                        MaterialButton(
                                                                                          height: 28,
                                                                                          color: Color(0xFFffd55e),
                                                                                          child: new Text(
                                                                                            "Cancel",
                                                                                            style: TextStyle(color: Colors.black),
                                                                                          ),
                                                                                          onPressed: () {
                                                                                            Navigator.pop(context, 'Cancel');
                                                                                          },
                                                                                        ),
                                                                                        MaterialButton(
                                                                                          height: 28,
                                                                                          color: Color(0xFF48c0d8),
                                                                                          child: new Text(
                                                                                            "Unfollow",
                                                                                            style: TextStyle(color: Colors.black),
                                                                                          ),
                                                                                          onPressed: () {
                                                                                            Navigator.pop(context);
                                                                                          },
                                                                                        ),
                                                                                      ],
                                                                                    );
                                                                                  });

                                                                              Navigator.pop(context);
                                                                            },
                                                                            child:
                                                                                Container(
                                                                              child: Row(
                                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                                children: <Widget>[
                                                                                  Image.asset(
                                                                                    "assets/Template1/image/Foodie/icons/person.png",
                                                                                    height: 21,
                                                                                    width: 21,
                                                                                  ),
                                                                                  SizedBox(
                                                                                    width: 16,
                                                                                  ),
                                                                                  Column(
                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                    children: <Widget>[
                                                                                      Text(
                                                                                        "Unfollow",
                                                                                        style: f15wB,
                                                                                      ),
                                                                                      SizedBox(
                                                                                        height: 3,
                                                                                      ),
                                                                                      Text(
                                                                                        "Unfollow  ",
                                                                                        style: f13w,
                                                                                      ),
                                                                                    ],
                                                                                  )
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        // copy   post
                                                                        Padding(
                                                                          padding:
                                                                              const EdgeInsets.all(6.0),
                                                                          child:
                                                                              InkWell(
                                                                            onTap:
                                                                                () {},
                                                                            child:
                                                                                Container(
                                                                              child: Row(
                                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                                children: <Widget>[
                                                                                  Icon(
                                                                                    Icons.link,
                                                                                    size: 26,
                                                                                    color: Colors.white,
                                                                                  ),
                                                                                  SizedBox(
                                                                                    width: 10,
                                                                                  ),
                                                                                  Column(
                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                    children: <Widget>[
                                                                                      Text(
                                                                                        "Copy Link",
                                                                                        style: f15wB,
                                                                                      ),
                                                                                      SizedBox(
                                                                                        height: 3,
                                                                                      ),
                                                                                      Text(
                                                                                        "Copy Post link",
                                                                                        style: f13w,
                                                                                      ),
                                                                                    ],
                                                                                  )
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        //share post
                                                                        Padding(
                                                                          padding:
                                                                              const EdgeInsets.all(6.0),
                                                                          child:
                                                                              InkWell(
                                                                            onTap:
                                                                                () {},
                                                                            child:
                                                                                Container(
                                                                              child: Row(
                                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                                children: <Widget>[
                                                                                  Image.asset(
                                                                                    "assets/Template1/image/Foodie/icons/share.png",
                                                                                    height: 21,
                                                                                    width: 21,
                                                                                  ),
                                                                                  SizedBox(
                                                                                    width: 16,
                                                                                  ),
                                                                                  Column(
                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                    children: <Widget>[
                                                                                      Text(
                                                                                        "Share Post",
                                                                                        style: f15wB,
                                                                                      ),
                                                                                      SizedBox(
                                                                                        height: 3,
                                                                                      ),
                                                                                      Text(
                                                                                        "Share post externally",
                                                                                        style: f13w,
                                                                                      ),
                                                                                    ],
                                                                                  )
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  );
                                                                });
                                                              });
                                                        },
                                                        child: Icon(
                                                            Icons.more_vert,
                                                            color:
                                                                Colors.white),
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                          index == 1
                                              ? Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 8,
                                                          right: 8,
                                                          bottom: 5,
                                                          top: 3),
                                                  child: SmartText(
                                                    text:
                                                        "Chicken Biriyani  -  with salad and pappad",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                    ),
                                                    onOpen: (link) {},
                                                    onTagClick: (tag) {},
                                                  ),
                                                )
                                              : Container(),
                                          Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 8, right: 8),
                                              child: SmartText(
                                                text:
                                                    "asdf sdcfgv dcfvgbh cfvgbh xcfvgh",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                ),
                                                onOpen: (link) {},
                                                onTagClick: (tag) {},
                                              )),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          index == 3
                                              ? Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 5.0),
                                                  child: Container(
                                                    color: Colors.grey[850],
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        SizedBox(
                                                          height: 8,
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 10,
                                                                  right: 10,
                                                                  bottom: 5),
                                                          child: Text(
                                                            "Foodi Market item @ Rs.",
                                                            style: f15wB,
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .only(
                                                            top: 6,
                                                          ),
                                                          child: Container(
                                                            height: 300,
                                                            width:
                                                                MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width,
                                                            child:
                                                                /* CachedNetworkImage(
                                                          imageUrl: "https://firebasestorage.googleapis.com/v0/b/foodizwall.appspot.com/o/thumbs%2Ficu.png?alt=media",
                                                          fit: BoxFit.cover,
                                                          placeholder: (context,
                                                              ind) => Image.asset(
                                                            "assets/Template1/image/Foodie/post_dummy.jpeg",
                                                            fit: BoxFit.cover,)
                                                      )*/
                                                                Image.asset(
                                                              "assets/Template1/image/Foodie/chinese.jpg",
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  top: 8,
                                                                  bottom: 8,
                                                                  left: 10,
                                                                  right: 10),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Text(
                                                                DateFormat
                                                                        .yMMMd()
                                                                    .format(
                                                                        DateTime
                                                                            .now())
                                                                    .toString(),
                                                                style: f13w,
                                                              ),
                                                              Row(
                                                                children: [
                                                                  Text(
                                                                    "\u20B9 100",
                                                                    style:
                                                                        f16wB,
                                                                  ),
                                                                  SizedBox(
                                                                    width: 15,
                                                                  ),
                                                                  Container(
                                                                    height: 25,
                                                                    child:
                                                                        MaterialButton(
                                                                      color: Color(
                                                                          0xFFffd55e),
                                                                      splashColor:
                                                                          Color(
                                                                              0xFF48c0d8),
                                                                      height:
                                                                          25,
                                                                      minWidth:
                                                                          90,
                                                                      shape: RoundedRectangleBorder(
                                                                          borderRadius:
                                                                              BorderRadius.circular(8)),
                                                                      onPressed:
                                                                          () {},
                                                                      child:
                                                                          Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children: [
                                                                          Icon(
                                                                            Icons.chat,
                                                                            size:
                                                                                17,
                                                                            color:
                                                                                Colors.black,
                                                                          ),
                                                                          SizedBox(
                                                                            width:
                                                                                3,
                                                                          ),
                                                                          Text(
                                                                            "Chat",
                                                                            style:
                                                                                f14B,
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  )
                                                                ],
                                                              )
                                                            ],
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                )
                                              : Container(
                                                  height: 0,
                                                ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          index == 5
                                              ? Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 8,
                                                          right: 8,
                                                          top: 5),
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color: Colors
                                                                .grey[300],
                                                            width: .2)),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            "FREE FOOD ITEM",
                                                            style: f16wB,
                                                          ),
                                                          SizedBox(
                                                            height: 3,
                                                          ),
                                                          Text(
                                                            "Bank Item Name",
                                                            style: f15wB,
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    top: 6,
                                                                    bottom: 7),
                                                            child: Container(
                                                              height: 300,
                                                              width:
                                                                  MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width,
                                                              child:
                                                                  /*CachedNetworkImage(
                                                            imageUrl: "https://firebasestorage.googleapis.com/v0/b/foodizwall.appspot.com/o/thumbs%2Ficu.png?alt=media" ,
                                                            fit: BoxFit.cover,
                                                            placeholder: (context,
                                                                ind) => Image.asset(
                                                              "assets/Template1/image/Foodie/post_dummy.jpeg",
                                                              fit: BoxFit.cover,)
                                                        )*/
                                                                  Image.asset(
                                                                "assets/Template1/image/Foodie/biriyani.jpg",
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                          ),
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Row(
                                                                children: [
                                                                  Icon(
                                                                    Icons
                                                                        .location_on,
                                                                    color: Colors
                                                                        .grey,
                                                                    size: 18,
                                                                  ),
                                                                  Text(
                                                                    "3 km Away",
                                                                    style: f15w,
                                                                  )
                                                                ],
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .only(
                                                                        bottom:
                                                                            4.0,
                                                                        top: 4),
                                                                child:
                                                                    Container(
                                                                  height: 30,
                                                                  child:
                                                                      MaterialButton(
                                                                    splashColor:
                                                                        Color(
                                                                            0xFFffd55e),
                                                                    shape: RoundedRectangleBorder(
                                                                        borderRadius:
                                                                            BorderRadius.circular(6)),
                                                                    height: 30,
                                                                    minWidth:
                                                                        150,
                                                                    color: Color(
                                                                        0xFF48c0d9),
                                                                    onPressed:
                                                                        () {},
                                                                    child: Center(
                                                                        child: Text(
                                                                      "Request This",
                                                                      style:
                                                                          f15B,
                                                                    )),
                                                                  ),
                                                                ),
                                                              )
                                                            ],
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              : Container(
                                                  height: 0,
                                                ),
                                          /*index==2 ? Padding(
                                            padding: const EdgeInsets.only(left: 6, right: 6, bottom: 8, top: 3),
                                            child: InkWell(
                                              onTap: (){
                                              },
                                              child: Container(
                                                height: 150,
                                                decoration: BoxDecoration(
                                                    color: Colors.grey[850],
                                                    borderRadius: BorderRadius.circular(8)
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: Container(
                                                    width: MediaQuery
                                                        .of(context)
                                                        .size
                                                        .width,
                                                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Container(
                                                          width: MediaQuery
                                                              .of(context)
                                                              .size
                                                              .width/1.7,
                                                          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                            children: [
                                                              Text(
                                                               "Blog Head",

                                                                style: f16wB,maxLines: 2,overflow: TextOverflow.ellipsis,
                                                              ),
                                                              Text( "Blog Descrii",style: f13w,maxLines: 3,overflow: TextOverflow.ellipsis,),

                                                              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                children: [
                                                                  Text("Posted 2 day ago",style: f13w,),
                                                                  Row(
                                                                    children: [
                                                                      Image.asset("assets/Template1/image/Foodie/icons/eye.png",height: 15,width: 15,),
                                                                      SizedBox(width: 4,),
                                                                      Text("10 Views",style: f13b,)
                                                                    ],
                                                                  )
                                                                ],
                                                              ),

                                                              Row(
                                                                children: [
                                                                  Text("Blog By  ",style: f14w,),
                                                                  Text("Amina",style: f14yB,),
                                                                ],
                                                              ),

                                                            ],
                                                          ),
                                                        ),
                                                        Stack(alignment: Alignment.bottomRight,
                                                          children: [
                                                            Container(clipBehavior: Clip.antiAlias,
                                                              width: 120,
                                                              height: 132,
                                                              decoration: BoxDecoration(
                                                                  borderRadius: BorderRadius.circular(2)
                                                              ),
                                                              child: CachedNetworkImage(
                                                                  imageUrl: "https://firebasestorage.googleapis.com/v0/b/foodizwall.appspot.com/o/thumbs%2Ficu.png?alt=media",
                                                                  fit: BoxFit.cover,placeholder: (context, ind) => Container(
                                                                  clipBehavior: Clip.antiAlias,
                                                                  width: 120,
                                                                  height: 132,
                                                                  decoration: BoxDecoration(
                                                                      borderRadius: BorderRadius.circular(2)
                                                                  ),
                                                                  child: Image.asset("assets/Template1/image/Foodie/post_dummy.jpeg",fit: BoxFit.cover,))
                                                              ),
                                                            ),

                                                            Container(
                                                              height: 50,
                                                              width: 50,
                                                              child: Center(
                                                                child: Container(
                                                                  height: 33,
                                                                  width: 33,
                                                                  decoration: BoxDecoration(
                                                                      color: Colors.black,
                                                                      borderRadius: BorderRadius.circular(100)
                                                                  ),
                                                                  child: Center(child: Image.asset("assets/Template1/image/Foodie/icons/edit.png",color: Colors.white,height:15,width: 15,)),
                                                                ),
                                                              ),
                                                            )
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ) : Container(height:0),*/
                                          index != 3 && index != 5
                                              ? Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 5, bottom: 5),
                                                  child: GestureDetector(
                                                    child: Container(
                                                      height: 350,
                                                      width:
                                                          MediaQuery.of(context)
                                                              .size
                                                              .width,
                                                      child:
                                                          /*CachedNetworkImage(
                                                    imageUrl: "https://firebasestorage.googleapis.com/v0/b/foodizwall.appspot.com/o/thumbs%2Ficu.png?alt=media",
                                                    fit: BoxFit.cover,
                                                    placeholder: (context,
                                                        ind) => Image.asset(
                                                      "assets/Template1/image/Foodie/post_dummy.jpeg",
                                                      fit: BoxFit.cover,)
                                                )*/
                                                          Image.asset(
                                                        "assets/Template1/image/Foodie/arabian.png",
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              : Container(),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 7.0, right: 7, bottom: 5),
                                            child: Container(
                                              child: InkWell(
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: <Widget>[
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: <Widget>[
                                                        GestureDetector(
                                                          onTap: () {},
                                                          child: Text(
                                                              "10 Likes",
                                                              style: f14y),
                                                        ),
                                                        SizedBox(
                                                          width: 13,
                                                        ),
                                                        GestureDetector(
                                                          onTap: () {},
                                                          child: Text(
                                                              "4 Comments",
                                                              style: f14y),
                                                        ),
                                                        SizedBox(
                                                          width: 13,
                                                        ),
                                                        GestureDetector(
                                                          onTap: () {},
                                                          child: Text(
                                                              "0 Shares",
                                                              style: f14y),
                                                        )
                                                      ],
                                                    ),
                                                    index != 5 &&
                                                            index != 0 &&
                                                            index != 2 &&
                                                            index != 3 &&
                                                            index != 7 &&
                                                            index != 9
                                                        ? Row(
                                                            children: [
                                                              Row(
                                                                children: [
                                                                  GestureDetector(
                                                                    onTap:
                                                                        () {},
                                                                    child: Image
                                                                        .asset(
                                                                      "assets/Template1/image/Foodie/icons/shopping-basket.png",
                                                                      height:
                                                                          24,
                                                                      width: 24,
                                                                      color: Color(
                                                                          0xFFffd55e),
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                    width: 16,
                                                                  ),
                                                                  Container(
                                                                    height: 27,
                                                                    child:
                                                                        MaterialButton(
                                                                      splashColor:
                                                                          Color(
                                                                              0xFF48c0d8),
                                                                      shape: RoundedRectangleBorder(
                                                                          borderRadius:
                                                                              BorderRadius.circular(6)),
                                                                      height:
                                                                          27,
                                                                      minWidth:
                                                                          80,
                                                                      color: Color(
                                                                          0xFFffd55e),
                                                                      onPressed:
                                                                          () {},
                                                                      child:
                                                                          Text(
                                                                        "Buy Now",
                                                                        style:
                                                                            f14B,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                    width: 3,
                                                                  )
                                                                ],
                                                              ),
                                                            ],
                                                          )
                                                        : Container()
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 7.0, right: 7, top: 5),
                                            child: Container(
                                              child: InkWell(
                                                child: Container(
                                                  height: 20.0,
                                                  width: double.infinity,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: <Widget>[
                                                      GestureDetector(
                                                        onTap: () {},
                                                        child: Row(
                                                          children: <Widget>[
                                                            Icon(
                                                              Icons.favorite,
                                                              color: Color(
                                                                  0xFFffd55e),
                                                              size: 18,
                                                            ),
                                                            SizedBox(
                                                              width: 5,
                                                            ),
                                                            Text(
                                                              "Liked",
                                                              style: f14w,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      GestureDetector(
                                                        onTap: () {},
                                                        child: Row(
                                                          children: <Widget>[
                                                            Icon(
                                                              Icons
                                                                  .chat_bubble_outline,
                                                              color:
                                                                  Colors.white,
                                                              size: 18,
                                                            ),
                                                            SizedBox(
                                                              width: 5,
                                                            ),
                                                            Text(
                                                              "Comment",
                                                              style: f14w,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      GestureDetector(
                                                        onTap: () {},
                                                        child: Row(
                                                          children: <Widget>[
                                                            Image.asset(
                                                              "assets/Template1/image/Foodie/icons/share.png",
                                                              height: 16,
                                                              width: 16,
                                                            ),
                                                            SizedBox(
                                                              width: 5,
                                                            ),
                                                            Text(
                                                              "Share",
                                                              style: f14w,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      GestureDetector(
                                                        onTap: () {},
                                                        child: Row(
                                                          children: <Widget>[
                                                            Icon(
                                                              Icons.bookmark,
                                                              color: Color(
                                                                  0xFF48c0d8),
                                                              size: 18,
                                                            ),
                                                            SizedBox(
                                                              width: 5,
                                                            ),
                                                            Text(
                                                              "Saved",
                                                              style: f14w,
                                                            ),
                                                          ],
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Divider(
                                      thickness: 7,
                                      color: Colors.black87,
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      _tabContoller.index == 1
                          ? HomeKitchen()
                          : Container(),
                      _tabContoller.index == 2
                          ? LocalStore()
                          : Container(),
                      _tabContoller.index == 3
                          ? Text(
                              "FoodiMarket",
                              style: f15bB,
                            )
                          : Container(),
                      _tabContoller.index == 4
                          ? FoodBank()
                          : Container(),
                      _tabContoller.index == 5
                          ? Resturants()
                          : Container()
                    ],
                  ),
                ),
              )
            ],
          )),
    );
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: Colors.black,
      child: Stack(
        children: <Widget>[
          _tabModules,
          _location,
        ],
      ),
    );
  }
}
