import 'package:flutter/material.dart';
import 'package:panadol/models/constants/constant_lists.dart';
import 'package:panadol/view/screens/pages/screens/website_development_tests.dart';
import 'package:panadol/view/screens/pages/widgets/course_page.dart';

import '../../../widgets/custom_buttons/pop_screen_button.dart';

class AboutInstructor extends StatefulWidget {
  const AboutInstructor({super.key, required this.isFav});
  final bool isFav;

  @override
  State<AboutInstructor> createState() => _AboutInstructorState();
}

class _AboutInstructorState extends State<AboutInstructor> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        titleSpacing: 0.0,
        backgroundColor: mainColor,
        elevation: 0,
        title: Transform(
          transform: Matrix4.translationValues(200.0, 0.0, 0.0),
          child: const Text(
            'المحاضر',
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
      body: SingleChildScrollView(
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage(
                      'assets/images/pages/image.jpeg',
                      
                    ),
                  ),
                  const Spacer(),
                  RichText(
                      textAlign: TextAlign.end,
                      text: const TextSpan(
                          text: 'DR Talat Shaltot\n',
                          style: TextStyle(
                              fontFamily: "Tajawal",
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              height: 1.4,
                              color: Colors.blue),
                          children: <TextSpan>[
                            TextSpan(
                              text: 'User Experience Design,Data Analytical\n',
                              style: TextStyle(
                                  fontFamily: "Tajawal",
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                  //height: 1.4,
                                  color: Colors.black),
                            ),
                          ])),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 100, 0),
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: SizedBox(
                height: 45,
                child: Row(
                  children: [
                    Column(
                      children: [
                        RichText(
                            textAlign: TextAlign.end,
                            text: const TextSpan(
                                text: 'اجمالي التقييمات\n',
                                style: TextStyle(
                                    fontFamily: "Tajawal",
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                    // height: 1.4,
                                    color: Colors.blue),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: '99\n',
                                    style: TextStyle(
                                        fontFamily: "Tajawal",
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold,
                                        // height: 1.4,
                                        color: Colors.black),
                                  ),
                                ]))
                      ],
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    Column(
                      children: [
                        RichText(
                            textAlign: TextAlign.end,
                            text: const TextSpan(
                                text: 'اجمالي عدد الطلاب\n',
                                style: TextStyle(
                                    fontFamily: "Tajawal",
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                    //height: 1.4,
                                    color: Colors.blue),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: '99\n',
                                    style: TextStyle(
                                        fontFamily: "Tajawal",
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold,
                                        // height: 1.4,
                                        color: Colors.black),
                                  ),
                                ]))
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.topRight,
              child: Text(
                'نبذة عن المحاضر',
                style: TextStyle(
                  fontFamily: "Tajawal",
                  fontSize: 13,
                  height: 3 / 2,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: Text(
                    ''' تتكون محاضرات الكورس من 20 محاضرة تساعدك علي تعلم جميع اللغات.البرمجية المستخدمة في انشاء المواقع الالكترونية بدايتا مع لغات (HTML-CSS-JAVA SCRIPT) من ثم التعلم و التدريب علي الFrameworks الخاصه بالعملية التطويرية يساعدك علي التطور في العمل علي بالعملية التطويرية''',
                    style: TextStyle(
                        color: Colors.black.withOpacity(
                          .5,
                        ),
                        fontFamily: 'Tajawal',
                        fontSize: 12,
                        height: 3 / 2,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.topRight,
              child: Text(
                'كورسات المحاضر (11)',
                style: TextStyle(
                  fontFamily: "Tajawal",
                  fontSize: 13,
                  height: 3 / 2,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 11,
            itemBuilder: (context, _) => MyCoursePage(
              isFavorite: widget.isFav,
            ),
          ),
        ]),
      ),
    );
  }
}
