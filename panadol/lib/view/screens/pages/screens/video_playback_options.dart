import 'package:flutter/material.dart';
import 'package:panadol/view/widgets/custom_buttons/pop_screen_button.dart';

import '../../../../models/constants/constant_lists.dart';

class VideoPlaybackOptions extends StatefulWidget {
  const VideoPlaybackOptions({super.key});

  @override
  State<VideoPlaybackOptions> createState() => _OptionsDownloadState();
}

class _OptionsDownloadState extends State<VideoPlaybackOptions> {
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
          transform: Matrix4.translationValues(130.0, 0.0, 0.0),
          child: const Text(
            'خيارات تشغيل الفيديو',
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
        child: Column(
          children: [
            ListTile(
              leading: Switch(
                value: switchValue,
                onChanged: (bool value) {
                  setState(() {
                    switchValue = value;
                  });
                },
              ),
              title: const Align(
                alignment: Alignment.topRight,
                child: Text(
                  'تشغيل الصوت في الخلفية',
                  style: TextStyle(
                    fontFamily: "Tajawal",
                    fontSize: 13,
                    height: 3 / 2,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              contentPadding: const EdgeInsets.only(
                left: 5.0,
              ),
            ),
            Column(
              children: [
                ListTile(
                  leading: Switch(
                    value: switchValue,
                    onChanged: (bool value) {
                      setState(() {
                        switchValue = value;
                      });
                    },
                  ),
                  title: const Align(
                    alignment: Alignment.topRight,
                    child: Text(
                      'التشغيل الاوتوماتيكي للمحاضرة التالية',
                      style: TextStyle(
                        fontFamily: "Tajawal",
                        fontSize: 13,
                        height: 3 / 2,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  contentPadding: const EdgeInsets.only(
                    left: 5.0,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
