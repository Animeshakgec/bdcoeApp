// ignore_for_file: deprecated_member_use
import 'package:big_data/firebase_services/firebase_userdata.dart';
import 'package:big_data/firebase_services/user_data.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
//import '../firebase_services/firebase_storage/firebase_storage.dart';

import '../firebase_services/firebase_database/firebase_database.dart';
import '../firebase_services/google_signin.dart';
import '../utils/bottom_nav_bar.dart';
import '../utils/button_style.dart';
import '../utils/link_screens.dart';

enum MenuItem {
  item1,
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

// getList() async {
//   //final List<Fcuser> fcuser = await FirebaseCrud.getAllfaculty();
//   final List<Fcuser> fcuser = await getAllfaculty();
//   return fcuser;
// }
// getList() async {
//   //final List<Fcuser> fcuser = await FirebaseCrud.getAllfaculty();
//   // final List<Fcuser> fcuser = await FirebaseCrud.readfaculty();
//   return await FirebaseCrud.readfaculty();
// }
// getList() async {
//   //final List<Fcuser> fcuser = await FirebaseCrud.getAllfaculty();
//   // await getAllfaculty();
//   return await getAllfaculty();
// }

class _HomePageState extends State<HomePage> {
  @override
  // void initState() {
  //   super.initState();
  //   setState(() {});
  // }
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  // fetchdatafaculty() async{
  //   dynamic resultant= await
  // }

  final List<String> imglist = [
    "images/bigdata.jpg",
    "images/competitive programing.jpg",
    "images/web development.jpg",
    "images/app development.jpg",
    "images/ml.jpg",
    "images/design.jpg",
  ];
  final List<String> name = [
    "BigData",
    "Competitive Programming",
    "Web Development",
    "App Development",
    "Machine Learning",
    "Designing",
  ];
  @override
  Widget build(BuildContext context) {
    // List<Fcuser> f = [];
    // f.add(getList());
    //print(fcuser);
    readPayer();
    return Scaffold(
      backgroundColor: const Color(0xff052532),
      // bottomNavigationBar: navigationBar(),
      appBar: AppBar(
        actions: [
          Container(
            padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
            width: MediaQuery.of(context).size.width,
            color: const Color(0xff052532),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      height: 50.0,
                      width: 60.0,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                        image: AssetImage("assets/images/bdcoe_logo.png"),
                        fit: BoxFit.contain,
                      )),
                      child: const Text(""),
                    ),
                    Column(
                      children: [
                        Text(
                          'BIG DATA',
                          style: GoogleFonts.getFont(
                            'Montserrat',
                            fontWeight: FontWeight.bold,
                            fontSize: 23.0,
                            color: Colors.white,
                            letterSpacing: 2,
                          ),
                        ),
                        Text(
                          'Centre of Excellence',
                          style: GoogleFonts.getFont(
                            'Montserrat',
                            fontSize: 10.0,
                            fontWeight: FontWeight.w500,
                            color: Colors.lightBlue,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const Icon(
                  Icons.chat,
                  size: 30.0,
                  color: Colors.white,
                ),
                // SizedBox(
                //   height: MediaQuery.of(context).size.height / 6,
                //   width: MediaQuery.of(context).size.width / 3,
                //   child: logoo(),
                // ),
              ],
            ),
          ),
        ],
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 15.0,
              ),
              // SizedBox(
              //   height: 5.0,
              // ),
              Center(
                child:
                    // Container(
                    //     height: 160.0,
                    //     width: 160.0,
                    //     decoration: new BoxDecoration(
                    //         image: new DecorationImage(
                    //       image: new AssetImage("images/bdcoe-logo.png"),
                    //       fit: BoxFit.cover,
                    //     ))),

                    Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 8),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Padding(
                            padding: EdgeInsets.only(right: 8.0),
                            child: Text(
                              "Decode",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontFamily: "Ubuntu",
                                  fontSize: 37.0),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 8.0),
                            child: Text(
                              "your",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontFamily: "Ubuntu",
                                  fontSize: 37.0),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 8.0),
                            child: Text(
                              "Destiny",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontFamily: "Ubuntu",
                                  fontSize: 37.0),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "We Learn",
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "  ",
                    ),
                    Text(
                      "|",
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "  ",
                    ),
                    Text(
                      "We Execute",
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "  ",
                    ),
                    Text(
                      "|",
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      "  ",
                    ),
                    Text(
                      "We Improve",
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Container(
                      height: MediaQuery.of(context).size.width - 200.0,
                      width: MediaQuery.of(context).size.width - 65.0,
                      decoration: const BoxDecoration(
                          image: const DecorationImage(
                        image: AssetImage("images/illustration.png"),
                        fit: BoxFit.fill,
                      ))),
                ),
              ),
              // Container(
              //   child: Center(
              //     child: Row(
              //       children: [
              //         logo("WE LEARN "),
              //         Text(
              //           "|",
              //           style: TextStyle(color: Colors.white, fontSize: 20),
              //         ),
              //         logo(" WE EXECUTE "),
              //         Text(
              //           "|",
              //           style: TextStyle(color: Colors.white, fontSize: 20),
              //         ),
              //         logo(" WE IMPROVE "),
              //       ],
              //     ),
              //   ),
              // ),
              about(),
              const SizedBox(
                height: 2.0,
              ),
              Text(
                "OUR DOMAINS",
                style: GoogleFonts.getFont(
                  'Ubuntu',
                  fontWeight: FontWeight.bold,
                  fontSize: 28.0,
                  color: Colors.white,
                ),
                // style: TextStyle(
                //     fontSize: 28.0,
                //     fontFamily: "Ubuntu",
                //     fontWeight: FontWeight.bold,
                //     color: Colors.white),
              ),
              const SizedBox(
                height: 15.0,
              ),
              slider(),
              const SizedBox(
                height: 17.0,
              ),
              Text(
                "FACULTY MEMBERS",
                style: GoogleFonts.getFont(
                  "Ubuntu",
                  fontWeight: FontWeight.bold,
                  fontSize: 28.0,
                  color: Colors.white,
                ),
              ),

              //             FutureBuilder(
              //   future:storage.downloadURL(''),
              //   builder:(BuildContext context,AsyncSnapshot<String> snapshot){
              //     if(snapshot.connectionState==ConnectionState.done && snapshot.hasData){
              //       return //box(name1,, linkdin1, name2, image2, linkdin2);
              //     }
              //     if(snapshot.connectionState==ConnectionState.waiting||!snapshot.hasData){
              //       return CircularProgressIndicator();
              //     }
              //     return //box();
              //   }
              // );
              //box("name1", "www.google.com", "name2", "www.google.com"),
              // StreamBuilder<List<facuser>>(
              //   stream: readfaculty(),
              //   builder: (context, snapshot){
              //     if(snapshot.hasError){
              //       return Text('facutly is not working');
              //     }
              //     else if(snapshot.hasData){
              //       final Facuser=snapshot.data!;
              //       return ListView(
              //         scrollDirection: Axis.horizontal,
              //         children: [
              //           Facuser.map(buildfacuser).toList(),
              //           ],
              //         );
              //     }
              //     else{
              //       return Center(child: CircularProgressIndicator(),);
              //     }
              //   },
              // ),
              const SizedBox(
                height: 10.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  box(FacultyUserData.fname1!, FacultyUserData.position1!,
                      FacultyUserData.fimageurl1!, FacultyUserData.linkedin1!),
                  box(FacultyUserData.fname2!, FacultyUserData.position2!,
                      FacultyUserData.fimageurl2!, FacultyUserData.linkedin2!),
                ],
              ),
              const SizedBox(
                height: 10.0,
              ),
              Text(
                "COORDINATORS",
                style: GoogleFonts.getFont(
                  "Ubuntu",
                  fontWeight: FontWeight.bold,
                  fontSize: 28.0,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Coordinaters(
                CoordinatorUserData.fname1!,
                CoordinatorUserData.domain1!,
                CoordinatorUserData.year1!,
                CoordinatorUserData.fimageurl1!,
                CoordinatorUserData.linkedin1!,
                CoordinatorUserData.github1!,
              ),
              Coordinaters(
                  CoordinatorUserData.fname2!,
                  CoordinatorUserData.domain2!,
                  CoordinatorUserData.year2!,
                  CoordinatorUserData.fimageurl2!,
                  CoordinatorUserData.linkedin2!,
                  CoordinatorUserData.github2!),
              Coordinaters(
                  CoordinatorUserData.fname3!,
                  CoordinatorUserData.domain3!,
                  CoordinatorUserData.year3!,
                  CoordinatorUserData.fimageurl3!,
                  CoordinatorUserData.linkedin3!,
                  CoordinatorUserData.github3!),
            ],
          ),
        ),
      )),
    );
  }
  // Widget buildfacuser(facuser user)=>box(user.name, user.imageurl,user.linkdin);
  // Stream<List<facuser>> readfaculty()=>
  // FirebaseFirestore.instance
  // .collection('faculty')
  // .snapshots()
  // .map((snapshot)=>snapshot.docs.map((doc)=>facuser.fromJson(doc.data().toList())));

  Widget logo(String l) {
    return DefaultTextStyle(
      style: const TextStyle(
        fontSize: 20.0,
        color: Colors.black87,
      ),
      child: AnimatedTextKit(
        animatedTexts: [
          WavyAnimatedText(l,
              textStyle: const TextStyle(
                  fontSize: 21.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white)),
        ],
        isRepeatingAnimation: true,
        repeatForever: true,
        onTap: () {},
      ),
    );
  }

  Widget about() {
    return Padding(
      padding: const EdgeInsets.only(top: 0.0),
      child: Container(
        margin: const EdgeInsets.all(20.0),
        child: Column(children: [
          const Text("Big Data Centre of Excellence",
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.white,
                fontFamily: "Ubuntu",
              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text("is the",
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                    fontFamily: "Ubuntu",
                  )),
              Text(" R & D Centre ",
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.blue,
                    fontFamily: "Ubuntu",
                  )),
              Text("established under ",
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                    fontFamily: "Ubuntu",
                  ))
            ],
          ),
          const Text("Ajay Kumar Garg Engineering College",
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.blue,
                fontFamily: "Ubuntu",
              )),
          const Text(" At BDCOE , We strive to stimulate",
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.white,
                fontFamily: "Ubuntu",
              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(" interest in",
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                    fontFamily: "Ubuntu",
                  )),
              Text(" Big Data",
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.blue,
                    fontFamily: "Ubuntu",
                  )),
              Text(" concept and",
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                    fontFamily: "Ubuntu",
                  ))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(" related technologies",
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.blue,
                    fontFamily: "Ubuntu",
                    letterSpacing: 1,
                  )),
              Text(" among the",
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                    fontFamily: "Ubuntu",
                    letterSpacing: 1,
                  ))
            ],
          ),
          const Text("students of the Instutions",
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.white,
                fontFamily: "Ubuntu",
                letterSpacing: 1,
              )),
        ]),
      ),
    );
  }

  Widget slider() {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
              autoPlay: true,
              // autoPlayInterval: const Duration(seconds: 4),
              enlargeCenterPage: true,
              height: 190.0),
          items: imglist.map(
            (i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: MediaQuery.of(context).size.width - 110.0,
                    // margin: const EdgeInsets.symmetric(
                    //     horizontal: 0.0, vertical: 0.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    child: Stack(children: [
                      Stack(
                        // alignment: Alignment.topCenter,
                        children: [
                          Container(
                            foregroundDecoration: BoxDecoration(
                              color: const Color.fromARGB(100, 22, 44, 33),
                              border: Border.all(color: Colors.black),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(20.0)),
                              image: DecorationImage(
                                  image: AssetImage(i), fit: BoxFit.cover),
                              // gradient: LinearGradient(
                              //   begin: Alignment.topRight,
                              //   end: Alignment.bottomLeft,
                              //   colors: [
                              //     Color.fromARGB(100, 22, 44, 33),
                              //     Color.fromARGB(100, 22, 44, 33)
                              //   ],
                              // ),
                              // boxShadow: [
                              //   new BoxShadow(
                              //     color: Colors.grey,
                              //     offset: const Offset(6.0, 6.0),
                              //   ),
                              // ],
                            ),
                          ),
                          Container(
                            constraints: const BoxConstraints.expand(),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                gradient: const LinearGradient(
                                    colors: [
                                      Color.fromARGB(98, 0, 0, 0),
                                      Color.fromARGB(118, 255, 255, 255)
                                    ],
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.topCenter)),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 15.0, top: 148.0),
                            child: Text(
                              name[imglist.indexOf(i)],
                              style: GoogleFonts.getFont(
                                'Ubuntu',
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 148.0),
                        child: Positioned(
                          bottom: 0.0,
                          left: 0.0,
                          right: 0.0,
                          child: Container(
                            // width: 300,
                            // Clip clipBehavior = Clip.values,
                            // decoration: BoxDecoration(
                            //   borderRadius: BorderRadius.circular(500),
                            //   // clip=Clip.antiAliasWithSaveLayer,
                            //   // clipBehavior = Clip.values,
                            //   gradient: LinearGradient(
                            //     colors: [
                            //       Color.fromARGB(199, 19, 0, 0),
                            //       Color.fromARGB(0, 163, 161, 161),
                            //     ],
                            //     begin: Alignment.bottomCenter,
                            //     end: Alignment.topCenter,
                            //   ),
                            // ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  bottom: 8.0, right: 8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  InkWell(
                                      onTap: () {},
                                      child: const Icon(
                                        Icons.arrow_circle_right_outlined,
                                        size: 30,
                                      )),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ]),
                  );
                },
              );
            },
          ).toList(),
          // options: CarouselOptions(height: 200.0),
        )
      ],
    );
  }

  Widget logoo() {
    return Container(
        height: 145,
        margin: const EdgeInsets.all(20.0),
        width: MediaQuery.of(context).size.width,
        decoration: new BoxDecoration(
            image: const DecorationImage(
          image: AssetImage("images/big_data_logo.png"),
          fit: BoxFit.cover,
        )));
  }

  Widget box(String name1, String position, String image1, String linkdin1) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: Container(
          height: 270.0,
          width: MediaQuery.of(context).size.width / 2.5,
          // color: Color.fromARGB(0, 0, 0, 0),
          // color: Color(0xff193546),
          // color: Colors.blue,
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
            borderRadius: BorderRadius.circular(25.0),
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.all(10.0),
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
                          fit: BoxFit.contain,
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
                Container(
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
                                fontSize: 20.0,
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 2.0),
                              child: Text(
                                position,
                                style: GoogleFonts.getFont(
                                  'Ubuntu',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20.0,
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
                          width: 18.0,
                        ),
                        InkWell(
                          onTap: () async {
                            if (await canLaunchUrl(Uri.parse(linkdin1))) {
                              await launch(linkdin1);
                            } else {
                              throw "cannot load url";
                            }
                          },
                          child: Container(
                            padding: EdgeInsets.only(top: 2.0),
                            height: 25,
                            width: 25,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                              image: AssetImage("images/linkedin1.png"),
                              fit: BoxFit.contain,
                            )),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget Coordinaters(String name, String domain, String year, String imageurl,
      String git, String linkdin) {
    return Container(
      margin: const EdgeInsets.only(left: 11.0, right: 11.0),
      height: 190.0,
      width: MediaQuery.of(context).size.width - 50.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        gradient: const LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [
            // Colors.
            Color.fromARGB(173, 33, 107, 197),
            // Color(0xff001f32),
            // Color.fromARGB(60, 172, 168, 168),
            Color(0xff001f32),
            // Color.fromARGB(255, 45, 44, 44)
            // Color.fromARGB(125, 169, 168, 168),
            // Color(0xff001f32)
          ],
        ),
      ),
      child: Row(children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(30.0),
            ),
            margin: const EdgeInsets.all(11.0),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              elevation: 3,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30.0),
                child: SizedBox(
                  height: 215,
                  width: 150,
                  child: Image.network(
                    imageurl,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ),
        ),
        // const SizedBox(
        //   height: 160.0,
        //   child: VerticalDivider(
        //     thickness: 0.3,
        //     color: Colors.white,
        //   ),
        // ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.only(left: 15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 10,
                ),
                Text(
                  name,
                  style: GoogleFonts.getFont(
                    'Ubuntu',
                    fontWeight: FontWeight.w600,
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 11,
                ),
                Text(
                  domain,
                  style: GoogleFonts.getFont(
                    'Ubuntu',
                    fontWeight: FontWeight.w600,
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 11,
                ),
                Text(
                  year,
                  style: GoogleFonts.getFont(
                    'Ubuntu',
                    fontWeight: FontWeight.w600,
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 21,
                ),
                // ignore: avoid_unnecessary_containers
                Container(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () async {
                            if (await canLaunchUrl(Uri.parse(git))) {
                              await launch(git);
                            } else {
                              throw "cannot load url";
                            }
                          },
                          child: Container(
                            height: 25.0,
                            width: 25.0,
                            // padding: EdgeInsets.only(right: 80.0),
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                              image: AssetImage("images/ggithub.png"),
                              fit: BoxFit.contain,
                            )),
                          ),
                        ),
                        const SizedBox(
                          height: 20.0,
                          width: 20.0,
                        ),
                        InkWell(
                          onTap: () async {
                            if (await canLaunchUrl(Uri.parse(linkdin))) {
                              // ignore: deprecated_member_use
                              await launch(linkdin);
                            } else {
                              throw "cannot load url";
                            }
                          },
                          child: Container(
                            height: 25.0,
                            width: 25.0,
                            padding: const EdgeInsets.only(left: 80.0),
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                              image: AssetImage("images/llinkedin.png"),
                              fit: BoxFit.contain,
                            )),
                          ),
                        ),
                      ]),
                )
              ],
            ),
          ),
        )
      ]),
    );
  }
}
