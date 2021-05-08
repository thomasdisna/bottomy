import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Membership extends StatefulWidget {
  @override
  _MembershipState createState() => _MembershipState();
}

class _MembershipState extends State<Membership> {

  bool personalInfo;

  bool vendorInfo;

  bool bankDetails;

  bool _checkbox = false;

  TextEditingController _firstName = TextEditingController();
  TextEditingController _lastName = TextEditingController();
  TextEditingController _address = TextEditingController();
  TextEditingController _number = TextEditingController();
  TextEditingController _altNumber = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _homeKitchenName = TextEditingController();
  TextEditingController _licenseNo = TextEditingController();
  TextEditingController _kitchenAddress = TextEditingController();
  TextEditingController _landMark = TextEditingController();
  TextEditingController _accountName = TextEditingController();
  TextEditingController _accountNumber = TextEditingController();
  TextEditingController _IFSCCode = TextEditingController();
  TextEditingController _branchName = TextEditingController();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      personalInfo = true;
      vendorInfo = true;
      bankDetails = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    return Dialog(
      backgroundColor: Colors.transparent,
      clipBehavior: Clip.antiAlias,
      child: SingleChildScrollView(
        child: Container(
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Color(0xff3a3a3a),
          ),
          width: w / 1.9,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: w,
                  color: Color(0xffffd55d),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Center(
                        child: Text(
                      "Register as a Home Kitchen",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    )),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Partner with Foodizwall and do more Get Started",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 19,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),

                ///Personal in formation
                InkWell(
                  onTap: () {
                    setState(() {
                      personalInfo = !personalInfo;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Personal Information",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w200),
                          ),
                          personalInfo ? Icon(
                            Icons.arrow_drop_up_outlined,
                            size: 25,
                            color: Colors.white,
                          ) : Icon(
                            Icons.arrow_drop_down_outlined,
                            size: 25,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Divider(
                    thickness: 1,
                    color: Colors.grey[600],
                  ),
                ),
                personalInfo ? Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            color: Color(0xff656565),
                            height: 35,
                            width: w / 6.5,
                            child: TextFormField(
                              controller: _firstName,
                              decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.only(left: 5, bottom: 14),
                                border: InputBorder.none,
                                hintText: "First Name",
                                hintStyle: TextStyle(
                                    color: Colors.grey[400], fontSize: 15),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Container(
                            color: Color(0xff656565),
                            height: 35,
                            width: w / 6.5,
                            child: TextFormField(
                              controller: _lastName,
                              decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.only(left: 5, bottom: 14),
                                border: InputBorder.none,
                                hintText: "Last Name",
                                hintStyle: TextStyle(
                                    color: Colors.grey[400], fontSize: 15),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        color: Color(0xff656565),
                        height: 35,
                        width: w / 1.9,
                        child: TextFormField(
                          controller: _address,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(left: 5, bottom: 14),
                            border: InputBorder.none,
                            hintText: "permanent Adress ",
                            hintStyle:
                                TextStyle(color: Colors.grey[400], fontSize: 15),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      ///Drop down
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              color: Color(0xff656565),
                              height: 35,
                              child: TextFormField(
                                controller: _address,
                                decoration: InputDecoration(
                                  contentPadding:
                                      EdgeInsets.only(left: 5, bottom: 14),
                                  border: InputBorder.none,
                                  hintText: "Place*",
                                  hintStyle: TextStyle(
                                      color: Colors.grey[400], fontSize: 15),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Expanded(
                            child: Container(
                              color: Color(0xff656565),
                              height: 35,
                              child: TextFormField(
                                controller: _address,
                                decoration: InputDecoration(
                                  contentPadding:
                                      EdgeInsets.only(left: 5, bottom: 14),
                                  border: InputBorder.none,
                                  hintText: "District*",
                                  hintStyle: TextStyle(
                                      color: Colors.grey[400], fontSize: 15),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Expanded(
                            child: Container(
                              color: Color(0xff656565),
                              height: 35,
                              child: TextFormField(
                                controller: _address,
                                decoration: InputDecoration(
                                  contentPadding:
                                      EdgeInsets.only(left: 5, bottom: 14),
                                  border: InputBorder.none,
                                  hintText: "Pin Code*",
                                  hintStyle: TextStyle(
                                      color: Colors.grey[400], fontSize: 15),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 5,),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              color: Color(0xff656565),
                              height: 35,
                              child: TextFormField(
                                controller: _number,
                                decoration: InputDecoration(
                                  contentPadding:
                                  EdgeInsets.only(left: 5, bottom: 14),
                                  border: InputBorder.none,
                                  hintText: "Contact Number ",
                                  hintStyle: TextStyle(
                                      color: Colors.grey[400], fontSize: 15),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Expanded(
                            child: Container(
                              color: Color(0xff656565),
                              height: 35,
                              child: TextFormField(
                                controller: _altNumber,
                                decoration: InputDecoration(
                                  contentPadding:
                                  EdgeInsets.only(left: 5, bottom: 14),
                                  border: InputBorder.none,
                                  hintText: "Alternative number",
                                  hintStyle: TextStyle(
                                      color: Colors.grey[400], fontSize: 15),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Expanded(
                            child: Container(
                              color: Color(0xff656565),
                              height: 35,
                              child: TextFormField(
                                controller: _email,
                                decoration: InputDecoration(
                                  contentPadding:
                                  EdgeInsets.only(left: 5, bottom: 14),
                                  border: InputBorder.none,
                                  hintText: "Email Address*",
                                  hintStyle: TextStyle(
                                      color: Colors.grey[400], fontSize: 15),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ) : Container(),
                SizedBox(
                  height: 15,
                ),
                ///vendor
                InkWell(
                  onTap: () {
                    setState(() {
                      vendorInfo = !vendorInfo;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "vendor Information",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w200),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Row(
                                children: [
                                  Checkbox(
                                    value: _checkbox,
                                    onChanged: (value) {
                                      setState(() {
                                        _checkbox = !_checkbox;
                                      });
                                    },
                                  ),

                                  Text(
                                    "Same as Above",
                                    style: TextStyle(fontSize: 12,color: Colors.white),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          vendorInfo ? Icon(
                            Icons.arrow_drop_up_outlined,
                            size: 25,
                            color: Colors.white,
                          ) : Icon(
                            Icons.arrow_drop_down_outlined,
                            size: 25,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Divider(
                    thickness: 1,
                    color: Colors.grey[600],
                  ),
                ),
                vendorInfo ? Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            color: Color(0xff656565),
                            height: 35,
                            width: w / 6.5,
                            child: TextFormField(
                              controller: _homeKitchenName,
                              decoration: InputDecoration(
                                contentPadding:
                                EdgeInsets.only(left: 5, bottom: 14),
                                border: InputBorder.none,
                                hintText: "Home kitchen Name*",
                                hintStyle: TextStyle(
                                    color: Colors.grey[400], fontSize: 15),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Expanded(
                            child: Container(
                              color: Color(0xff656565),
                              height: 35,
                              child: TextFormField(
                                controller: _licenseNo,
                                decoration: InputDecoration(
                                  contentPadding:
                                  EdgeInsets.only(left: 5, bottom: 14),
                                  border: InputBorder.none,
                                  hintText: "FSSAI License No.(if not available our team will guide to get registered)",
                                  hintStyle: TextStyle(
                                      color: Colors.grey[400], fontSize: 15),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        color: Color(0xff656565),
                        height: 35,
                        width: w / 1.9,
                        child: TextFormField(
                          controller: _kitchenAddress,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(left: 5, bottom: 14),
                            border: InputBorder.none,
                            hintText: "Kitchen Adress ",
                            hintStyle:
                            TextStyle(color: Colors.grey[400], fontSize: 15),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      ///Drop down
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              color: Color(0xff656565),
                              height: 35,
                              child: TextFormField(
                                controller: _address,
                                decoration: InputDecoration(
                                  contentPadding:
                                  EdgeInsets.only(left: 5, bottom: 14),
                                  border: InputBorder.none,
                                  hintText: "Place*",
                                  hintStyle: TextStyle(
                                      color: Colors.grey[400], fontSize: 15),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Expanded(
                            child: Container(
                              color: Color(0xff656565),
                              height: 35,
                              child: TextFormField(
                                controller: _address,
                                decoration: InputDecoration(
                                  contentPadding:
                                  EdgeInsets.only(left: 5, bottom: 14),
                                  border: InputBorder.none,
                                  hintText: "District*",
                                  hintStyle: TextStyle(
                                      color: Colors.grey[400], fontSize: 15),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Expanded(
                            child: Container(
                              color: Color(0xff656565),
                              height: 35,
                              child: TextFormField(
                                controller: _address,
                                decoration: InputDecoration(
                                  contentPadding:
                                  EdgeInsets.only(left: 5, bottom: 14),
                                  border: InputBorder.none,
                                  hintText: "Pin Code*",
                                  hintStyle: TextStyle(
                                      color: Colors.grey[400], fontSize: 15),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 5,),
                      Container(
                    color: Color(0xff656565),
                    height: 35,
                    width: w / 1.9,
                    child: TextFormField(
                      controller: _landMark,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 5, bottom: 14),
                        border: InputBorder.none,
                        hintText: "LandMark",
                        hintStyle:
                        TextStyle(color: Colors.grey[400], fontSize: 15),
                      ),
                    ),
                  ),
                    ],
                  ),
                ) : Container(),
                SizedBox(
                  height: 15,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      bankDetails = !bankDetails;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Bank Details",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w200),
                          ),
                          bankDetails ? Icon(
                            Icons.arrow_drop_up_outlined,
                            size: 25,
                            color: Colors.white,
                          ) : Icon(
                            Icons.arrow_drop_down_outlined,
                            size: 25,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Divider(
                    thickness: 1,
                    color: Colors.grey[600],
                  ),
                ),
                bankDetails ? Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Container(
                              color: Color(0xff656565),
                              height: 35,

                              child: TextFormField(
                                controller: _accountName,
                                decoration: InputDecoration(
                                  contentPadding:
                                  EdgeInsets.only(left: 5, bottom: 14),
                                  border: InputBorder.none,
                                  hintText: "Beneficiary Account Name*",
                                  hintStyle: TextStyle(
                                      color: Colors.grey[400], fontSize: 15),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Expanded(
                            child: Container(
                              color: Color(0xff656565),
                              height: 35,
                              child: TextFormField(
                                controller: _accountNumber,
                                decoration: InputDecoration(
                                  contentPadding:
                                  EdgeInsets.only(left: 5, bottom: 14),
                                  border: InputBorder.none,
                                  hintText: "Account Number*",
                                  hintStyle: TextStyle(
                                      color: Colors.grey[400], fontSize: 15),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Container(
                              color: Color(0xff656565),
                              height: 35,

                              child: TextFormField(
                                controller: _IFSCCode,
                                decoration: InputDecoration(
                                  contentPadding:
                                  EdgeInsets.only(left: 5, bottom: 14),
                                  border: InputBorder.none,
                                  hintText: "IFSC Code*",
                                  hintStyle: TextStyle(
                                      color: Colors.grey[400], fontSize: 15),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Expanded(
                            child: Container(
                              color: Color(0xff656565),
                              height: 35,
                              child: TextFormField(
                                controller: _branchName,
                                decoration: InputDecoration(
                                  contentPadding:
                                  EdgeInsets.only(left: 5, bottom: 14),
                                  border: InputBorder.none,
                                  hintText: "Branch Name*",
                                  hintStyle: TextStyle(
                                      color: Colors.grey[400], fontSize: 15),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ) : Container(),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20,right: 20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("Photo*",style: TextStyle(color: Colors.grey[400],fontSize: 14),),
                      SizedBox(
                        width: 15,
                      ),
                      Container(
                        height: 60,
                        width: w/5,

                        child: Center(child: Text("Upload photo",style: TextStyle(color: Colors.white,fontSize: 15),)),
                        decoration: BoxDecoration(
                          color:Color(0xff656565),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),

                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20,right: 20,bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      MaterialButton(
                        color: Color(0xff48c0d8),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        minWidth: w / 8,
                        onPressed: () {},
                        child: Text(
                          "submit",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w400),
                        ),
                      )

                    ],
                  ),
                ),





              ],
            ),
          ),
        ),
      ),
    );
  }
}
