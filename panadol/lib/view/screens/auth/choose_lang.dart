// ignore_for_file: depend_on_referenced_packages, avoid_print

import 'package:flutter/material.dart';
import 'package:panadol/view/screens/auth/registration_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChooseLang extends StatelessWidget {
  const ChooseLang({Key? key}) : super(key: key);
  static const pageRoute = 'choose_lang_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 10,
              child: Image.asset(
                'assets/images/splash_image.png',
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextButton(
                    onPressed: () async {
                      final SharedPreferences sharedPrefrences =
                          await SharedPreferences.getInstance();
                      sharedPrefrences.setString("lang", 'ar');
                      Navigator.of(context).pushReplacementNamed(
                        Registration.pageRoute,
                      );
                    },
                    child: const Text(
                      '🇸🇦   العربية',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Tajawal',
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const Divider(
                    height: 1,
                    thickness: 1,
                  ),
                  TextButton(
                    onPressed: () async {
                      final SharedPreferences sharedPrefrences =
                          await SharedPreferences.getInstance();
                      sharedPrefrences.setString("lang", 'en');
                      Navigator.of(context).pushReplacementNamed(
                        Registration.pageRoute,
                      );
                    },
                    child: const Text(
                      '🇺🇸  english',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Tajawal',
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
