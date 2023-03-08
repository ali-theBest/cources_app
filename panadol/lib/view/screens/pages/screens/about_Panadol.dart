import 'package:flutter/material.dart';
import 'package:panadol/view/widgets/custom_buttons/pop_screen_button.dart';

import '../../../../models/constants/constant_lists.dart';

class AboutPanadol extends StatefulWidget {
  const AboutPanadol({super.key});

  @override
  State<AboutPanadol> createState() => _OptionsDownloadState();
}

class _OptionsDownloadState extends State<AboutPanadol> {
  bool switchValue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        titleSpacing: 0.0,
        backgroundColor: mainColor,
        elevation: 0,
        title: Transform(
          transform: Matrix4.translationValues(180.0, 0.0, 0.0),
          child: const Text(
            'Panadol عن',
            style: TextStyle(
              fontFamily: "Tajawal",
              fontSize: 13,
              height: 3 / 2,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
        leading: const PopScreenButton(
          textDirection: TextDirection.ltr,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          const ListTile(
            leading: Icon(Icons.arrow_back_ios, color: Colors.black),
            title: Align(
              alignment: Alignment.topRight,
              child: Text(
                'تعليمات الاستخدام',
                style: TextStyle(
                  fontFamily: "Tajawal",
                  fontSize: 13,
                  height: 3 / 2,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            contentPadding: EdgeInsets.only(
              left: 18.0,
            ),
          ),
          Column(
            children: const [
              ListTile(
                leading: Icon(Icons.arrow_back_ios, color: Colors.black),
                title: Align(
                  alignment: Alignment.topRight,
                  child: Text(
                    'سياسة الخصوصية',
                    style: TextStyle(
                      fontFamily: "Tajawal",
                      fontSize: 13,
                      height: 3 / 2,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                contentPadding: EdgeInsets.only(
                  left: 18.0,
                ),
              ),
            ],
          ),
          Column(
            children: const [
              ListTile(
                leading: Icon(Icons.arrow_back_ios, color: Colors.black),
                title: Align(
                  alignment: Alignment.topRight,
                  child: Text(
                    'سياسة الملكية الفكرية',
                    style: TextStyle(
                      fontFamily: "Tajawal",
                      fontSize: 13,
                      height: 3 / 2,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                contentPadding: EdgeInsets.only(
                  left: 18.0,
                ),
              ),
            ],
          )
        ]),
      ),
    );
  }
}
