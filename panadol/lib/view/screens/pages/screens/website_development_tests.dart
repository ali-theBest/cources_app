import 'package:flutter/material.dart';

import '../../../../models/constants/constant_lists.dart';
import '../../../widgets/custom_buttons/pop_screen_button.dart';

class WebsiteDevelopmentTests extends StatefulWidget {
  const WebsiteDevelopmentTests({super.key});

  @override
  State<WebsiteDevelopmentTests> createState() =>
      _WebsiteDevelopmentTestsState();
}

class _WebsiteDevelopmentTestsState extends State<WebsiteDevelopmentTests> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        titleSpacing: 0.0,
        backgroundColor: mainColor,
        elevation: 0,
        title: Transform(
          transform: Matrix4.translationValues(90.0, 0.0, 0.0),
          child: const Text(
            'Web Development اختبارات ال',
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
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: 11,
              itemBuilder: (context, _) {
                return Row(
                  children: [
                    Image.asset(
                      'assets/images/pages/web.png',
                      fit: BoxFit.fitWidth,
                      height: 60,
                      width: 60,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RichText(
                          textAlign: TextAlign.start,
                          text: const TextSpan(
                              text: 'اختبار الHTML\n',
                              style: TextStyle(
                                  fontFamily: "Tajawal",
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  //height: 1.4,
                                  color: Colors.black),
                              children: <TextSpan>[
                                TextSpan(
                                  text:
                                      ' المستوي الإحترافيHTML اختبار خاص بلغة البرمجة\n',
                                  style: TextStyle(
                                      fontFamily: "Tajawal",
                                      fontSize: 8,
                                      fontWeight: FontWeight.bold,
                                      // height: 1.4,
                                      color: Colors.grey),
                                ),
                              ])),
                    ),
                    Container(
                      color: const Color(0xff2B65F6),
                      height: 23,
                      width: 50,
                      child: TextButton(
                        onPressed: () {},
                        child: const Text('ابدأ',
                            style: TextStyle(
                              fontFamily: "Tajawal",
                              fontSize: 10,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            )),
                      ),
                    )
                  ],
                );
              }),
        ),
      ),
    );
  }
}
