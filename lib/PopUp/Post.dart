import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Feed extends StatefulWidget {
  @override
  _FeedState createState() => _FeedState();
}

class _FeedState extends State<Feed> {

  int step;

  final _blogTile = TextEditingController();
  final _blogText = TextEditingController();
  final _youtubeLink = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    step = 0;
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    return Dialog(
      backgroundColor: Colors.transparent,
      child: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Color(0xff27282a),
          ),
          width: w / 2.5,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Create Post",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w300,
                          fontSize: 17),
                    ),
                    Container(
                      height: 15,
                      width: 15,
                      decoration: BoxDecoration(
                        color: Color(0xfff2d569),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.close_rounded,
                        size: 10,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Divider(
                      color: Colors.grey[600],
                      thickness: 1,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              backgroundImage:
                                  AssetImage("lib/images/demo.jpg"),
                              radius: 25,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Mammutty Puthuparambil",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 17),
                            )
                          ],
                        ),
                        MaterialButton(
                          color: Color(0xff48c0d8),
                          minWidth: w / 12,
                          onPressed: () {},
                          child: Text(
                            "Post",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w400),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 40,
                      width: w / 2.1,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.black,
                      ),
                      child: TextFormField(
                        style: TextStyle(color: Colors.white),
                        controller: _blogTile,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 15, bottom: 10),
                          border: InputBorder.none,
                          hintText: "Write Blog Title ...",
                          hintStyle: TextStyle(
                            color: Colors.grey[400],
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Container(
                      height: h / 4.5,
                      width: w / 2.1,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.black,
                      ),
                      child: TextFormField(
                        maxLines: null,
                        minLines: null,
                        expands: true,
                        style: TextStyle(color: Colors.white),
                        controller: _blogText,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 15, top: 10),
                          border: InputBorder.none,
                          hintText:
                              "Write what is on your mind? #tag @mentions",
                          hintStyle: TextStyle(
                            color: Colors.grey[400],
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Container(
                            height: 30,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.black,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 15,
                                  width: 15,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0xffe19c62),
                                  ),
                                ),
                                SizedBox(
                                  width: 3,
                                ),
                                Text(
                                  "Upload image",
                                  style: TextStyle(
                                      fontSize: 11, color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          child: Container(
                            height: 30,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.black,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 15,
                                  width: 15,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0xffcb5d5b),
                                  ),
                                ),
                                SizedBox(
                                  width: 3,
                                ),
                                Text(
                                  "Upload video",
                                  style: TextStyle(
                                      fontSize: 11, color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    step == 0
                        ? Container(
                            height: 40,
                            width: w / 2.1,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.black,
                            ),
                            child: TextFormField(
                              style: TextStyle(color: Colors.white),
                              controller: _youtubeLink,
                              decoration: InputDecoration(
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.all(7),
                                  child: Image.asset("lib/images/youtube.png"),
                                ),
                                contentPadding:
                                    EdgeInsets.only(left: 30, top: 10),
                                border: InputBorder.none,
                                hintText: "Copy youtube video link.",
                                hintStyle: TextStyle(
                                  color: Colors.grey[400],
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          )
                        : step == 1
                            ? Container(
                                height: 100,
                                width: 6.toDouble() * 150,
                                child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: 6,
                                    itemBuilder: (context, index) {
                                      return Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Stack(
                                            alignment: Alignment.topRight,
                                            children: [
                                              Container(
                                                height: h / 5,
                                                width: w / 11,
                                                child: Center(
                                                  child: Text(
                                                    "image " +
                                                        (index + 1).toString(),
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  ),
                                                ),
                                                decoration: BoxDecoration(
                                                    color: Colors.black,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5)),
                                              ),
                                              Positioned(
                                                child: Container(
                                                  height: h / 15,
                                                  width: 15,
                                                  decoration: BoxDecoration(
                                                    color: Color(0xfff2d569),
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child: Icon(
                                                    Icons.close_rounded,
                                                    size: 10,
                                                  ),
                                                ),
                                                bottom: 67,
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                        ],
                                      );
                                    }),
                              )
                            : step == 2
                                ? Container(
                                  width: w/2.1,
                                    height: 30,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.drive_folder_upload,
                                          color: Colors.white,
                                          size: 30,
                                        ),
                                        SizedBox(
                                          width: 8,
                                        ),
                                        Text(
                                          "Upload video from computer",
                                          style: TextStyle(color: Colors.white,fontWeight: FontWeight.w400),
                                        ),
                                      ],
                                    ),
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius:
                          BorderRadius.circular(
                              5),
                      ),
                                  )
                                : Container(),
                    SizedBox(
                      height: 25,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30, right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              InkWell(
                                child: Container(
                                  height: 70,
                                  width: 70,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0xffdc975d),
                                  ),
                                ),
                                onTap: () {
                                  setState(() {
                                    step = 1;
                                  });
                                },
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "image",
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          ),
                          SizedBox(
                            width: 40,
                          ),
                          Column(
                            children: [
                              InkWell(
                                child: Container(
                                  height: 70,
                                  width: 70,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0xffc85c5d),
                                  ),
                                ),
                                onTap: () {
                                  setState(() {
                                    step = 2;
                                  });
                                },
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Video",
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          ),
                          SizedBox(
                            width: 40,
                          ),
                          Column(
                            children: [
                              InkWell(
                                child: Container(
                                  height: 70,
                                  width: 70,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0xffef56c),
                                  ),
                                ),
                                onTap: () {
                                  setState(() {
                                    step = 3;
                                  });
                                },
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Foodi Blog",
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          ),
                          SizedBox(
                            width: 40,
                          ),
                          Column(
                            children: [
                              InkWell(
                                child: Container(
                                  height: 70,
                                  width: 70,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0xff38c4af),
                                  ),
                                ),
                                onTap: () {
                                  setState(() {
                                    step = 4;
                                  });
                                },
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Market",
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          ),
                          SizedBox(
                            width: 40,
                          ),
                          Column(
                            children: [
                              InkWell(
                                child: Container(
                                  height: 70,
                                  width: 70,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0xfff5ad36),
                                  ),
                                ),
                                onTap: () {
                                  setState(() {
                                    step = 5;
                                  });
                                },
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Food Bank",
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
