import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:foodiz/widget_style.dart';

import 'Responsive.dart';

class LocalStore extends StatefulWidget {
  @override
  _LocalStoreState createState() => _LocalStoreState();
}

class _LocalStoreState extends State<LocalStore> {
  int _cardindex;
  @override
  void initState() {
    // TODO: implement initState
    setState(() {
      _cardindex= 1;

    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    var D = Responsive.isDesktop(context);
    var T = Responsive.isTablet(context);
    var M = Responsive.isMobile(context);
    return Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 200,
                child: ListView.builder(scrollDirection:Axis.horizontal,
                    itemCount: 10,itemBuilder: (BuildContext context,int index){

                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left:8.0,right: 8.00,),
                            child: Container(decoration: BoxDecoration(color: Colors.red,borderRadius: BorderRadius.circular(5)),
                              clipBehavior: Clip.antiAlias,
                              height: 100,
                              width: 99,

                              child: index==0 ? Image.asset(
                                "assets/homekitchen.jpg",
                                fit: BoxFit.cover,

                              ): index == 1 ?  Image.asset(
                                "assets/Template1/image/Foodie/arabian.png",
                                fit: BoxFit.cover,

                              ): index ==2  ? Image.asset(
                                "assets/Template1/image/Foodie/cake.jpeg",
                                fit: BoxFit.cover,

                              ) : index ==3  ? Image.asset(
                                "assets/image/image_recipe/recipe7.png",
                                fit: BoxFit.cover,

                              )  :  index ==4  ? Image.asset(
                                "assets/Template1/image/Foodie/shakes.jpg",
                                fit: BoxFit.cover,

                              ) :  index ==5  ? Image.asset(
                                "assets/Template1/image/Foodie/chinese.jpg",
                                fit: BoxFit.cover,

                              ) : index ==5  ? Image.asset(
                                "assets/Template1/image/Foodie/shakes.jpg",
                                fit: BoxFit.cover,

                              ) : Container(),
                            ),
                          ),

                          Container(width:100,child: Text(index ==0?"Chicken Cutlet": index==1 ? "Arabian Food":  index ==2 ? "Cake": index ==3 ? "Pasta": index == 4 ? "Shake": index == 5  ? "Noodles" :Text(" ") ,maxLines:1,style: TextStyle(color: Colors.white),))


                        ],
                      );
                    }),

              ),
              Padding(
                padding: const EdgeInsets.only(left:10.0),
                child: Container(decoration: BoxDecoration(color: Color(0xFF6e6c6d),borderRadius: BorderRadius.circular(5)),

                  width:D? w/5:  w/2,

                  child: Row(

                    children: [
                      InkWell(
                        onTap: (){
                          setState(() {
                            _cardindex =1;
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Container(decoration:BoxDecoration(borderRadius: BorderRadius.circular(5),color: _cardindex==1 ?Colors.black:Colors.transparent,),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("Popular",style: TextStyle(color: Colors.white),),
                            ),),
                        ),
                      ),
                      InkWell(
                        onTap: (){
                          setState(() {
                            _cardindex =2;
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Container(
                            decoration:BoxDecoration(borderRadius: BorderRadius.circular(5),color: _cardindex==2 ?Colors.black:Colors.transparent,),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("Order Again",style: TextStyle(color: Colors.white),),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: (){
                          setState(() {
                            _cardindex =3;
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Container(
                            decoration:BoxDecoration(borderRadius: BorderRadius.circular(5),color: _cardindex==3 ?Colors.black:Colors.transparent,),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("Favourites",style: TextStyle(color: Colors.white),),
                            ),
                          ),
                        ),
                      ),


                    ],
                  ),
                ),
              ),
              Container(
                height: 200,
                child: ListView.builder(scrollDirection:Axis.horizontal,
                    itemCount: 10,itemBuilder: (BuildContext context,int index){

                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left:8.0,right: 8.00,),
                            child: Container(decoration: BoxDecoration(color: Colors.red,borderRadius: BorderRadius.circular(5)),
                              clipBehavior: Clip.antiAlias,
                              height: 100,
                              width: 99,

                              child: index==0 ? Image.asset(
                                "assets/homekitchen.jpg",
                                fit: BoxFit.cover,

                              ): index == 1 ?  Image.asset(
                                "assets/Template1/image/Foodie/arabian.png",
                                fit: BoxFit.cover,

                              ): index ==2  ? Image.asset(
                                "assets/Template1/image/Foodie/cake.jpeg",
                                fit: BoxFit.cover,

                              ) : index ==3  ? Image.asset(
                                "assets/image/image_recipe/recipe7.png",
                                fit: BoxFit.cover,

                              )  :  index ==4  ? Image.asset(
                                "assets/Template1/image/Foodie/shakes.jpg",
                                fit: BoxFit.cover,

                              ) :  index ==5  ? Image.asset(
                                "assets/Template1/image/Foodie/chinese.jpg",
                                fit: BoxFit.cover,

                              ) : index ==5  ? Image.asset(
                                "assets/Template1/image/Foodie/shakes.jpg",
                                fit: BoxFit.cover,

                              ) : Container(),
                            ),
                          ),

                          Container(width:100,child: Text(index ==0?"Chicken Cutlet": index==1 ? "Arabian Food":  index ==2 ? "Cake": index ==3 ? "Pasta": index == 4 ? "Shake": index == 5  ? "Noodles" :Text(" ") ,maxLines:1,style: TextStyle(color: Colors.white),))


                        ],
                      );
                    }),

              ),
              Container(
                height: 3.toDouble()*200,
                child: ListView.separated(separatorBuilder: (BuildContext context,int index){
                  return SizedBox(height: 5,);
                },
                    itemCount: 3,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (BuildContext context,int index){
                      return Padding(
                        padding: const EdgeInsets.only(left:10.0,right: 10.0),
                        child: Container(
                          decoration: BoxDecoration( color: Color(0xFF1e1e1e),borderRadius: BorderRadius.circular(5)),
                          height: 200,
                          width: w/4,
                          child: Padding(

                            padding: const EdgeInsets.only(left:20.0,right:20,top:5),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
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
                                        SizedBox(width: 10,),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Sofis Kitchen",maxLines: 2,overflow: TextOverflow.ellipsis,
                                              style: f14w,
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
                                          ],
                                        ),
                                        IconButton(icon: Icon(Icons.chat,color: Colors.yellow,size: 20,), onPressed: (){}),
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
                                    Row(
                                      children: [
                                        Text("256 Following",style: f14w,),
                                        SizedBox(width: 10,),
                                        MaterialButton(height: 27,
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(2.0))),

                                          color: Color(0xFF48c0d8),
                                          child: new Text('Follow Kitchen',
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 1,
                                              style: f12BB),
                                          onPressed: () {},
                                        ),
                                      ],
                                    ),


                                  ],
                                ),
                                SizedBox(height: 4,),
                                Container(height:3.toDouble()*45,

                                  child: ListView.separated(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: 3,
                                    itemBuilder: (BuildContext context,int index){
                                      return Padding(
                                        padding: const EdgeInsets.only(left:10.0),
                                        child: Container(
                                          width: 200,
                                          decoration:BoxDecoration(color: Color(0xFF18191b),borderRadius: BorderRadius.circular(4)),
                                          child:Row(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(left:11.0),
                                                child: Container(clipBehavior: Clip.antiAlias,
                                                  height: 100,width: 70,decoration:BoxDecoration(color: Colors.blue,borderRadius: BorderRadius.circular(4)),
                                                  child: Image.asset("assets/Template1/image/Foodie/biriyani.jpg",fit: BoxFit.cover,),),
                                              ),
                                              SizedBox(width: 5,),
                                              Padding(
                                                padding: const EdgeInsets.only(top:12.0),
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    SizedBox(height: 5,),
                                                    Text("Chicken Pasta",style: TextStyle(color:Colors.white,fontSize: 14)),
                                                    SizedBox(height: 5,),
                                                    Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Row(
                                                          children: [
                                                            Icon(
                                                              Icons.star,
                                                              color: Color(0xFFffd55e),
                                                              size: 7,
                                                            ),
                                                            Icon(
                                                              Icons.star,
                                                              color: Color(0xFFffd55e),
                                                              size: 7,
                                                            ),
                                                            Icon(
                                                              Icons.star,
                                                              color: Color(0xFFffd55e),
                                                              size: 7,
                                                            ),
                                                            Icon(
                                                              Icons.star,
                                                              color: Color(0xFFffd55e),
                                                              size: 7,
                                                            ),
                                                            Icon(
                                                              Icons.star,
                                                              color: Color(0xFFffd55e),
                                                              size: 7,
                                                            ),

                                                          ],
                                                        ),
                                                        Text("(Min 5Pcs",style: TextStyle(color:Colors.white,fontSize: 10))
                                                      ],
                                                    ),
                                                    SizedBox(height: 5,),
                                                    Text("₹  150",style: TextStyle(color:Colors.white,fontSize: 12),),
                                                    SizedBox(height: 5,),
                                                    Container(

                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                        children: [
                                                          Icon(Icons.shopping_cart,size: 20,color: Color(0xFFffd55e),),
                                                          Icon(Icons.favorite_border,size: 20,color: Colors.white,),
                                                        ],
                                                      ),
                                                    )

                                                  ],
                                                ),
                                              )
                                            ],
                                          ) ,


                                        ),
                                      );
                                    }, separatorBuilder: (BuildContext context,int index){
                                    return SizedBox(width: 3,);
                                  }, ),
                                )

                              ],
                            ),
                          ),

                        ),
                      );
                    }),
              ),

              SizedBox(height: 10,),



            ],

          ),
        )
    );
  }
}
// Container(height: h,
//               child: ListView.separated(separatorBuilder: (BuildContext context,int index){
//                 return Container(height: 5,width: w,);
//               },
//                   //physics: NeverScrollableScrollPhysics(),
//                   itemCount:5,itemBuilder: (BuildContext context,int index){
//                 return Padding(
//                   padding: const EdgeInsets.only(left:10.0,right: 10.00),
//                   child: Container(
//                     decoration: BoxDecoration( color: Color(0xFF1e1e1e),borderRadius: BorderRadius.circular(5)),
//                     height: 200,
//                     width: w,
//                     child:Padding(
//                       padding: const EdgeInsets.all(20.0),
//                       child: Column(
//                         children: [
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Row(
//                                 children: [
//                                   Container(
//                                     height: 38.0,
//                                     clipBehavior:
//                                     Clip.antiAlias,
//                                     width: 38.0,
//                                     decoration: BoxDecoration(
//                                         border: Border.all(
//                                             color: (Color(
//                                                 0xFF48c0d8))),
//                                         borderRadius: BorderRadius
//                                             .all(Radius
//                                             .circular(
//                                             180.0))),
//                                     child: Center(
//                                       child: Container(
//                                         clipBehavior: Clip
//                                             .antiAlias,
//                                         height: 35,
//                                         decoration: BoxDecoration(
//                                             borderRadius:
//                                             BorderRadius.all(
//                                                 Radius.circular(
//                                                     180.0))),
//                                         width: 35,
//                                         child: Center(
//                                             child: Image
//                                                 .asset(
//                                               "assets/Template1/image/Foodie/icu.png",
//                                               fit: BoxFit
//                                                   .cover,
//                                             )),
//                                       ),
//                                     ),
//                                   ),
//                                   SizedBox(width: 10,),
//                                   Column(
//                                     crossAxisAlignment: CrossAxisAlignment.start,
//                                     children: [
//                                       Text(
//                                         "Sofis Kitchen",maxLines: 2,overflow: TextOverflow.ellipsis,
//                                         style: f14w,
//                                       ),
//                                       Row(
//                                         children: [
//                                           Icon(
//                                             Icons.location_on,
//                                             color: Colors.grey,
//                                             size: 10,
//                                           ),
//                                           SizedBox(
//                                             width: 4,
//                                           ),
//                                           Text("Kottayam", style: f10g,maxLines: 1,overflow: TextOverflow.ellipsis,)
//                                         ],
//                                       ),
//                                     ],
//                                   ),
//                                   IconButton(icon: Icon(Icons.chat,color: Colors.yellow,size: 20,), onPressed: (){}),
//                                   Row(
//                                     children: [
//                                       Icon(
//                                         Icons.star,
//                                         color: Color(0xFFffd55e),
//                                         size: 10,
//                                       ),
//                                       SizedBox(width: 3,),
//                                       Text("4.1 Ratings",maxLines: 1,overflow: TextOverflow.ellipsis,
//                                           style: f10g)
//                                     ],
//                                   ),
//
//                                 ],
//                               ),
//                               Row(
//                                 children: [
//                                   Text("256 Following",style: f14w,),
//                                   SizedBox(width: 10,),
//                                   MaterialButton(height: 27,
//                                     shape: RoundedRectangleBorder(
//                                         borderRadius: BorderRadius.all(
//                                             Radius.circular(2.0))),
//
//                                     color: Color(0xFF48c0d8),
//                                     child: new Text('Follow Kitchen',
//                                         overflow: TextOverflow.ellipsis,
//                                         maxLines: 1,
//                                         style: f12BB),
//                                     onPressed: () {},
//                                   ),
//                                 ],
//                               ),
//
//                             ],
//                           ),
//                         Container(
//
//
//
//
//
//
//                           child: ListView.builder(itemCount: 3,itemBuilder: (BuildContext context,int index){
//                             return Container(height: 50,width: 100,color: index ==2 ? Colors.black : Colors.blue );
//
//                           },
//
//
//                           ),
//                         )
//                         ],
//                       ),
//                     ) ,
//
//                   ),
//                 );
//               }
//
//               ),
//             ),