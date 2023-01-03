import 'package:big_data/firebase_services/firebase_database/firebase_database.dart';
import 'package:big_data/firebase_services/firebase_userdata.dart';
import 'package:big_data/firebase_services/user_data.dart';
import 'package:big_data/screens/contact_us.dart';
import 'package:big_data/screens/profile_screen/Edit_Profile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../firebase_services/google_signin.dart';
import '../../utils/link_screens.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();
    // fetchData();
    readPayer();
    setState(() {});
  }

  Widget build(BuildContext context) {
    var scheight = MediaQuery.of(context).size.height;
    var scwidth = MediaQuery.of(context).size.width;
    readPayer();
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(45.0),
          child: AppBar(
            leading: const Icon(Icons.person),
            backgroundColor: const Color.fromARGB(255, 4, 12, 16),
            title: const Text(
              'Profile',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            actions: <Widget>[
              IconButton(
                icon: const Icon(
                  Icons.power_settings_new_outlined,
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
                onPressed: () async {
                  final provider =
                      Provider.of<GoogleSignInProvider>(context, listen: false);
                  provider.logout();
                  FirebaseAuth.instance.signOut();
                  await Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const LinkScreen()));
                },
              )
            ],
          ),
        ),
        backgroundColor: const Color(0xff052532),
        body: SafeArea(
          child: Container(
            decoration: const BoxDecoration(
              backgroundBlendMode: BlendMode.dstIn,
              gradient: LinearGradient(
                colors: [Color(0x11ffffff), Colors.blueAccent],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            height: double.infinity,
            width: double.infinity,
            child: SingleChildScrollView(
                child: Column(
              children: [
//                 StreamBuilder(
//   stream: firestoreDB,
//   builder: (context,snapshot){
//     if(!snapshot.hasData)return CircularProgressIndicator();
//     return ListView.builder(itemCount: snapshot.data?.docs.length,
//       itemBuilder: (context,int index){
//         return
//       });
//   }
// ),
                Container(
                  decoration: const BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        //<-- SEE HERE
                        color: Color.fromARGB(255, 130, 184, 246),
                        blurRadius: 40.0,
                      ),
                    ],
                  ),
                  margin: EdgeInsets.only(top: scheight * 0.03),
                  height: scheight * 0.24,
                  width: scwidth * 0.40,
                  child: Card(
                    elevation: 10,
                    margin: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(
                        color: Color.fromARGB(255, 130, 184, 246),
                        width: 4, //<-- SEE HERE
                      ),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: Image.network(UserInformation.imageurl,
                          height: scheight * 0.2,
                          width: scwidth * 0.3,
                          fit: BoxFit.cover),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 15),
                  margin: EdgeInsets.only(top: scheight * 0.03),
                  child: Text(
                    UserInformation.userName,
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                      //fontFamily: 'Ubuntu',
                      fontSize: 20,
                      color: Color.fromARGB(255, 95, 220, 255),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 15),
                  child: Text(
                    '${UserInformation.domain[0]}\n  ${UserInformation.year} Year',
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                      //fontFamily: 'Ubuntu',
                      fontSize: 12,
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  padding: const EdgeInsets.only(left: 15),
                  margin: EdgeInsets.only(top: scheight * 0.03),
                  child: const Text(
                    'About Me',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      //fontFamily: 'Ubuntu',
                      fontSize: 20,
                      color: Color.fromARGB(255, 95, 220, 255),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const EditProfile()));
                  },
                  child: Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 15),
                        alignment: Alignment.topLeft,
                        height: 4,
                        width: 35,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: const Color.fromARGB(255, 95, 220, 255)),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.only(top: scheight * 0.005),
                  child: Text(
                    '${UserInformation.bio}',
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                      //fontFamily: 'Ubuntu',
                      fontSize: 15,
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(color: Colors.white, height: 2, width: scwidth * 0.7),
                SizedBox(
                  width: double.infinity,
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: scheight * 0.02),
                        padding: const EdgeInsets.only(left: 15, right: 30),
                        child: const Icon(
                          Icons.person,
                          size: 30,
                          color: Color.fromARGB(255, 95, 220, 255),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: scheight * 0.02),
                        child: const Text(
                          'Edit Profile',
                          style: TextStyle(
                            //fontFamily: 'Ubuntu',
                            fontSize: 20,
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(),
                      ),
                      Container(
                        padding: const EdgeInsets.only(right: 50),
                        margin: EdgeInsets.only(top: scheight * 0.02),
                        child: IconButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const EditProfile()));
                            },
                            icon: const Icon(
                              Icons.arrow_forward_ios,
                              size: 30,
                              color: Color.fromARGB(255, 95, 220, 255),
                            )),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: scheight * 0.02),
                        padding: const EdgeInsets.only(left: 15, right: 30),
                        child: const Icon(
                          Icons.handshake,
                          size: 30,
                          color: Color.fromARGB(255, 95, 220, 255),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: scheight * 0.02),
                        child: const Text(
                          'Collaborate ',
                          style: TextStyle(
                            //fontFamily: 'Ubuntu',
                            fontSize: 20,
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(),
                      ),
                      Container(
                        padding: const EdgeInsets.only(right: 50),
                        margin: EdgeInsets.only(top: scheight * 0.02),
                        child: IconButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const EditProfile()));
                            },
                            icon: const Icon(
                              Icons.arrow_forward_ios,
                              size: 30,
                              color: Color.fromARGB(255, 95, 220, 255),
                            )),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: scheight * 0.02),
                        padding: const EdgeInsets.only(left: 15, right: 30),
                        child: const Icon(
                          Icons.phone,
                          size: 30,
                          color: Color.fromARGB(255, 95, 220, 255),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: scheight * 0.02),
                        child: const Text(
                          'Contact Us',
                          style: TextStyle(
                            //fontFamily: 'Ubuntu',
                            fontSize: 20,
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(),
                      ),
                      Container(
                        padding: const EdgeInsets.only(right: 50),
                        margin: EdgeInsets.only(top: scheight * 0.02),
                        child: IconButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const ContactUs()));
                            },
                            icon: const Icon(
                              Icons.arrow_forward_ios,
                              size: 30,
                              color: Color.fromARGB(255, 95, 220, 255),
                            )),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(color: Colors.white, height: 2, width: scwidth * 0.7),
                const SizedBox(
                  height: 10,
                ),
              ],
            )),
          ),
        ));
  }
}
