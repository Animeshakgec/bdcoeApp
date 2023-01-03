import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:big_data/firebase_services/user_data.dart';
import 'package:big_data/models/members_models.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;

import '../../firebase_services/fetching_members.dart';
import '../../firebase_services/firebase_userdata.dart';

class MembersScreen extends StatefulWidget {
  //MembersScreen({Key? key}) : super(key: key);
  @override
  State<MembersScreen> createState() => _MembersScreenState();
}

// List<Members> list = [];
// List<Members> list1 = [];
// List<Members> list2 = [];
// List<Members> list3 = [];

class _MembersScreenState extends State<MembersScreen> {
  // Future fetchMembers() async {
  //   //List<Members> list = [];
  //   final response =
  //       await http.get(Uri.parse("https://bdcoe.onrender.com/api/v1/member"));
  //   //print(json.decode(response.body));
  //   Map<String, dynamic> dat = json.decode(response.body);
  //   final data = dat['data'];
  //   for (int i = 0; i < data.length; i++) {
  //     list.add(Members.fromJson(data[i]));
  //   }
  //   int maxi = 0;
  //   for (int i = 0; i < list.length; i++) {
  //     maxi = max(maxi, list[i].graduation);
  //   }
  //   if (list1.length == 0) {
  //     for (int i = 0; i < list.length; i++) {
  //       if (list[i].graduation == maxi) {
  //         list1.add(Members.fromJson(data[i]));
  //       }
  //     }
  //   }
  //   if (list2.length == 0) {
  //     for (int i = 0; i < list.length; i++) {
  //       if (list[i].graduation == maxi - 1) {
  //         list2.add(Members.fromJson(data[i]));
  //       }
  //     }
  //   }
  //   if (list3.length == 0) {
  //     for (int i = 0; i < list.length; i++) {
  //       if (list[i].graduation == maxi - 2) {
  //         list3.add(Members.fromJson(data[i]));
  //       }
  //     }
  //   }
  //   return list;
  // }

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   setState(() {
  //     fetchMembers();
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    // setState(() {
    // fetchMembers();
    // });
    for (int i = 0; i < list1.length; i++) {
      print(list1[i].fullname);
      print("                 ");
    }
    print("3rd");
    for (int i = 0; i < list2.length; i++) {
      print(list2[i].fullname);
      print("                 ");
    }
    print("4rd");
    for (int i = 0; i < list3.length; i++) {
      print(list3[i].fullname);
      print("                 ");
    }
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 5, 37, 50),
      body: SafeArea(
        child: list.length > 0
            ? SingleChildScrollView(
                child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "OUR MEMBERS",
                    style: GoogleFonts.getFont(
                      "Ubuntu",
                      fontWeight: FontWeight.bold,
                      fontSize: 35.0,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    "4th Year Members",
                    style: GoogleFonts.getFont(
                      "Ubuntu",
                      fontWeight: FontWeight.bold,
                      fontSize: 27.0,
                      color: Colors.white,
                    ),
                  ),
                  Container(
                      width: MediaQuery.of(context).size.width,
                      child: GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 20.0,
                          mainAxisSpacing: 10.0,
                          mainAxisExtent: 260.0,
                          childAspectRatio: 3 / 2,
                        ),
                        itemCount: list3.length,
                        shrinkWrap: true,
                        itemBuilder: (BuildContext ctx, index) {
                          return box(
                              list3.elementAt(index).fullname,
                              list3.elementAt(index).domain,
                              list3.elementAt(index).imageUrl,
                              list3.elementAt(index).linkedin,
                              list3.elementAt(index).github);
                          // box(name1, domain, image1, linkdin1, git)
                        },
                      )),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    "3th Year Members",
                    style: GoogleFonts.getFont(
                      "Ubuntu",
                      fontWeight: FontWeight.bold,
                      fontSize: 27.0,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                      width: MediaQuery.of(context).size.width,
                      child: GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 20.0,
                          mainAxisSpacing: 10.0,
                          mainAxisExtent: 260.0,
                          childAspectRatio: 3 / 2,
                        ),
                        itemCount: list2.length,
                        shrinkWrap: true,
                        itemBuilder: (BuildContext ctx, index) {
                          return box(
                              list2.elementAt(index).fullname,
                              list2.elementAt(index).domain,
                              list2.elementAt(index).imageUrl,
                              list2.elementAt(index).linkedin,
                              list2.elementAt(index).github);
                          // box(name1, domain, image1, linkdin1, git)
                        },
                      )),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    "2th Year Members",
                    style: GoogleFonts.getFont(
                      "Ubuntu",
                      fontWeight: FontWeight.bold,
                      fontSize: 27.0,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                      width: MediaQuery.of(context).size.width,
                      child: GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 20.0,
                          mainAxisSpacing: 10.0,
                          mainAxisExtent: 260.0,
                          childAspectRatio: 3 / 2,
                        ),
                        itemCount: list1.length,
                        shrinkWrap: true,
                        itemBuilder: (BuildContext ctx, index) {
                          return box(
                              list1.elementAt(index).fullname,
                              list1.elementAt(index).domain,
                              list1.elementAt(index).imageUrl,
                              list1.elementAt(index).linkedin,
                              list1.elementAt(index).github);
                          // box(name1, domain, image1, linkdin1, git)
                        },
                      )),
                ],
              ))
            : Container(
                // height: 10.0,
                // width: 10.0,
                padding: EdgeInsets.only(top: 10.0),
                child: Center(child: CircularProgressIndicator())),
      ),
    );
  }

  Widget box(
      String name1, String domain, String image1, String linkdin1, String git) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(22.0),
      child: Container(
        height: 260.0,
        width: MediaQuery.of(context).size.width / 2.3,
        // color: Color.fromARGB(0, 0, 0, 0),
        // color: Color(0xff193546),
        // color: Colors.blue,
        //padding: EdgeInsets.all(.0),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              // Colors.
              // Color.fromARGB(255, 45, 44, 44),
              // Color(0xff001f32),
              // Color.fromARGB(60, 172, 168, 168),
              Color.fromARGB(173, 33, 107, 197),
              Color(0xff001f32),
              // Color.fromARGB(255, 45, 44, 44)
              // Color.fromARGB(125, 169, 168, 168),
              // Color(0xff001f32)
            ],
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(22.0),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.all(4.0),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  elevation: 3,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(25.0),
                    child: SizedBox(
                      height: 170,
                      width: MediaQuery.of(context).size.width / 3,
                      child: Image.network(
                        image1,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              // Container(
              //   decoration: BoxDecoration(
              //       color: Color.fromARGB(100, 22, 44, 33),
              //       borderRadius: BorderRadius.circular(20.0)),
              //   // margin: EdgeInsets.all(20),
              //   // padding: EdgeInsets.all(40),)
              // ),
              Center(
                child: Container(
                  // padding: EdgeInsets.only(top: 227.0),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,

                          //padding:EdgeInsets.
                          children: [
                            Text(
                              name1,
                              style: GoogleFonts.getFont(
                                'Ubuntu',
                                fontWeight: FontWeight.w600,
                                fontSize: 17.4,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              height: 2.0,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 2.0),
                              child: Text(
                                domain,
                                style: GoogleFonts.getFont(
                                  'Ubuntu',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 17.0,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                        // Text(
                        //   "Faculty Incharge",
                        //   style: TextStyle(
                        //       fontSize: 20,
                        //       color: Colors.white,
                        //       fontFamily: "Ubuntu",
                        //       fontWeight: FontWeight.bold),
                        // ),
                        const SizedBox(
                          height: 2.5,
                          width: 5.0,
                        ),
                        Column(
                          children: [
                            InkWell(
                              onTap: () async {
                                if (await canLaunchUrl(Uri.parse(
                                    'https://www.linkedin.com/in/${linkdin1}/'))) {
                                  await launchUrl(Uri.parse(
                                      'https://www.linkedin.com/in/${linkdin1}/'));
                                } else {
                                  throw "cannot load url";
                                }
                              },
                              child: Container(
                                padding: EdgeInsets.only(top: 2.0),
                                height: 23.0,
                                width: 23.0,
                                decoration: const BoxDecoration(
                                    image: DecorationImage(
                                  image: AssetImage("images/linkedin1.png"),
                                  fit: BoxFit.contain,
                                )),
                              ),
                            ),
                            SizedBox(
                              height: 8.0,
                            ),
                            InkWell(
                              onTap: () async {
                                if (await canLaunchUrl(
                                    Uri.parse('https://github.com/${git}'))) {
                                  await launchUrl(
                                      Uri.parse('https://github.com/${git}'));
                                } else {
                                  throw "cannot load url";
                                }
                              },
                              child: Container(
                                height: 23.0,
                                width: 23.0,
                                // padding: EdgeInsets.only(right: 80.0),
                                decoration: const BoxDecoration(
                                    image: DecorationImage(
                                  image: AssetImage("images/github1.png"),
                                  fit: BoxFit.contain,
                                )),
                              ),
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
        ),
      ),
    );
  }
}
