import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import 'Constants.dart';

class FoodBank extends StatefulWidget {
  @override
  _FoodBankState createState() => _FoodBankState();
}

class _FoodBankState extends State<FoodBank> {
  TabController _stackController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width ;
    return Scaffold(
      backgroundColor: Color(0xFF18191b),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top:10.0,right: 10,left: 10,bottom: 10),

              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: w/4.3,
                  height: 50,
                    decoration: BoxDecoration(color: Color(0xFF48c8e1),borderRadius: BorderRadius.circular(5)),

                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(top:8.0),
                        child: Column(

                          children: [
                            Text("Food Bank Guide",style: bf15,),
                            Text("Get started in 5 simple steps",style: f15u,)
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: w/4.3,
                    height: 50,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),color: Color(0xFFffd55d),),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(top:8.0),
                        child: Column(
                          children: [
                            Text("Unlock your first'Food Bank'",style: f15u,),
                            Text("Badge Now",style: f15u,)
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top:8.0,left: 30,right: 30,bottom: 8.00),
              child: Container(height: 70,width: w/2,decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),color: Colors.grey),),
            ),
            SizedBox(height: 10,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    DefaultTabController(
                      length : 3,
                      child: Padding(
                        padding: const EdgeInsets.only(left:8.0,right: 8.00,top: 8,bottom: 8),
                        child: Container( color: Color(0xFF282828),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(

                                child: Container(
                                  width: w/4,
                                  height: 20,

                                  decoration: BoxDecoration( color: Color(0xFF282828),borderRadius: BorderRadius.circular(4)),
                                  child: TabBar(
                                    unselectedLabelColor: Colors.white,
                                    labelColor: Colors.black,
                                    indicator: BoxDecoration(
                                        color: Color((0xFFffd55e)),
                                        borderRadius: BorderRadius.circular(4)),
                                    // indicatorPadding: EdgeInsets.only(left: 10,right: 10,top:5,bottom: 5),
                                    controller: _stackController,
                                    tabs: [
                                      Tab(
                                        child: Text("All",style: TextStyle(fontSize: 14),),
                                      ),
                                      Tab(
                                        child: Text("Available"),
                                      ),
                                      Tab(
                                        child: Text("Just gone"),
                                      ),
                                    ],
                                  ),

                                ),
                              ),
                              SizedBox(height: 10,),
                              Container(
                                width: w/1.8,
                                height: 2.toDouble()*150,
                                child: TabBarView(

                                  controller: _stackController ,
                                  children: [
                                    Container(width: w/4,
                                    child: gridview(),),

                                    Container(color: Colors.grey,),
                                    Container(color: Colors.blue,),
                                  ],
                                ),
                              ),

                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),


              ],
            ),

            Padding(
              padding: const EdgeInsets.only(top:8.0,left: 30,right: 30,bottom: 8.00),
              child: Container(height: 70,width: w/2,decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),color: Colors.grey),),
            ),
            Container(
              width: w/1.8,
              height: 2.toDouble()*150,
              child:gridview() ,
            ),


          ],
        ),
      )
    );
  }
  Widget gridview(){
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      itemCount: 8,
        shrinkWrap: true,
        primary: true,

        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount
          (
      crossAxisSpacing: 0,
          mainAxisSpacing: 0,
          crossAxisCount: 4,
          childAspectRatio: 1

    ), itemBuilder: (BuildContext context,int index){
      return Padding(
        padding: const EdgeInsets.all(3.0),
        child: Container(
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Color(0xFF1f2025),
              ),
          child: Column(
            children: [
              Container(
                height: 70,
                width:
                MediaQuery.of(context)
                    .size
                    .width,
                child:

                Image.asset(
                  "assets/Template1/image/Foodie/arabian.png",
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Food Box for neddy 15",maxLines: 1,style: f18w,),
                        Container()
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(Icons.visibility,color: Colors.white,size: 10,),
                        SizedBox(width: 3,),
                        Text("1585 Views",style: f7b,)

                      ],
                    ),
                    SizedBox(height: 22,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(clipBehavior: Clip.antiAlias,
                              height: 20,width: 20,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              child: Image.asset("assets/Template1/dummy-staff.jpg"),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Rahul",style: f7b,),
                                Text("Kottayam",style:f7b,)
                              ],
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.location_on_outlined,size: 10,color: Colors.white,),
                            Text("2.1 km",style: f7b,)
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),








            ],
          ),

        ),
      );
    });

  }
}
