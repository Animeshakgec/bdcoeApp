import 'package:flutter/material.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({super.key});

  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  @override
  Widget build(BuildContext context) {
    var scheight = MediaQuery.of(context).size.height;
    var scwidth = MediaQuery.of(context).size.width;
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(45.0),
          child: AppBar(
            backgroundColor: Colors.transparent,
            title: const Text(
              'Contact Us',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        backgroundColor: const Color(0xff052532),
        body: SafeArea(
          child: SingleChildScrollView(
            child: SizedBox(
              height: scheight,
              width: scwidth,
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.all(20),
                    child: Image.network(
                        height: scheight * 0.3,
                        "https://www.impactbnd.com/hubfs/blog-image-uploads/best-about-us-pages.jpg"),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
