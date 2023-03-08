// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:panadol/logic/blocs/social_auth_bloc/social_auth_bloc.dart';
import 'package:panadol/logic/blocs/phone_auth_bloc/phone_auth_bloc.dart';
import 'package:panadol/view/screens/auth/choose_lang.dart';
import 'package:panadol/view/screens/auth/learning_field.dart';
import 'package:panadol/view/screens/auth/personal_data.dart';
import 'package:panadol/view/screens/auth/registration_page.dart';
import 'package:panadol/view/screens/courses_screens/course_details.dart';
import 'package:panadol/view/screens/courses_screens/my_courses.dart';
import 'package:panadol/view/screens/pages/screens/about_instructor.dart';
import 'package:panadol/view/screens/pages/screens/design.dart';
import 'package:panadol/view/screens/pages/screens/quiz.dart';
import 'package:panadol/view/screens/pages/screens/website_development_tests.dart';
import 'package:panadol/view/screens/pages/widgets/design_cources.dart';
import 'package:panadol/view/screens/splash_screen.dart';
import 'package:panadol/view/screens/taps/navigation.dart';
import 'package:panadol/view/screens/taps/user_account.dart';
import 'package:panadol/view/widgets/courses_forms_data/my_courses_form.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'logic/blocs/learning_material_bloc/learning_material_bloc.dart';
import 'view/screens/auth/learning_goal.dart';
import 'view/screens/pages/screens/about_Panadol.dart';
import 'view/screens/pages/screens/courses.dart';
import 'view/screens/pages/screens/options_download.dart';
import 'view/screens/pages/screens/video_playback_options.dart';
import 'view/screens/pages/widgets/video_player.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? lang = prefs.getString('lang');
  if (lang == null) {
    lang = 'en';
    runApp(MyApp(
      lang: lang,
    ));
  } else {
    runApp(MyApp(
      lang: lang,
    ));
  }
}

class MyApp extends StatefulWidget {
  const MyApp({
    Key? key,
    required this.lang,
  }) : super(key: key);
  final String lang;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  final phoneAuthBloc = PhoneAuthBloc();
  final googleAuthBloc = SocialAuthBloc();
  @override
  void dispose() {
    // TODO: implement dispose
    phoneAuthBloc.close();
    googleAuthBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: Locale(widget.lang),
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''), // English, no country code
        Locale('ar', ''), // arabic, no country code
      ],
      //initialRoute: SplashScreen.pageRoute,
      home: const QuizScreen(),
      debugShowCheckedModeBanner: false,
      routes: {
        SplashScreen.pageRoute: (context) => const SplashScreen(),
        ChooseLang.pageRoute: (context) => const ChooseLang(),
        Registration.pageRoute: (context) => MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (context) => phoneAuthBloc,
                  child: const Registration(),
                ),
                BlocProvider(
                  create: (context) => googleAuthBloc,
                  child: const Registration(),
                ),
              ],
              child: const Registration(),
            ),
        MyCoursesScreen.pageRoute: (context) => const MyCoursesScreen(
              isFav: true,
            ),
      },
    );
  }
}
