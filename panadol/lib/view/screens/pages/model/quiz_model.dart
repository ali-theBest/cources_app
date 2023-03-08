class QuestionModel {
  final String? question;
  final List<String> answers;
  final int rightAnswerIndex;
  QuestionModel({
    required this.question,
    required this.answers,
    required this.rightAnswerIndex,
  });
}
/*
import 'package:flutter/material.dart';

import 'package:panadol/view/screens/pages/data/ques_exampel.dart';
import 'package:panadol/view/screens/pages/screens/result_screen.dart';

import '../../../../models/constants/constant_lists.dart';
import '../../../widgets/custom_buttons/pop_screen_button.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  // ignore: non_constant_identifier_names
  int? choosedAnswerIndex;
  String? choosedAnswer;

  int score = 0;
  bool btnPressed = false;
  PageController? _controller;
  String btnText = "السؤال التالي";
  bool answered = false;

  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: 0);
  }

  List<String> quenum = [
    'الأول',
    'الثاني',
    'الثالث',
    'الرابع',
    'الخامس',
    'السادس',
    'السابع',
    'الثامن',
    'التاسع',
    'العاشر',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        titleSpacing: 0.0,
        backgroundColor: mainColor,
        elevation: 0,
        title: Transform(
          transform: Matrix4.translationValues(170.0, 0.0, 0.0),
          child: const Text(
            ' HTMLإختبار ال',
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
          padding: const EdgeInsets.all(10),
          child: Stack(
            children: [
              PageView.builder(
                physics: const BouncingScrollPhysics(),
                //this index for the page which will be between 1:10
                itemBuilder: (context, index) {
                  return Column(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Directionality(
                        textDirection: TextDirection.rtl,
                        child: Row(
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                index < quenum.length
                                    ? "السؤال ${quenum[index]}"
                                    : "",
                                textAlign: TextAlign.start,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontFamily: "Tajawal",
                                  fontSize: 10.0,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 140,
                            ),
                            Container(
                              alignment: Alignment.topLeft,
                              width: 80,
                              color: Colors.blue,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  const Icon(
                                    Icons.timer,
                                    size: 14,
                                    color: Colors.white,
                                  ),
                                  TweenAnimationBuilder<Duration>(
                                      duration: const Duration(minutes: 3),
                                      tween: Tween(
                                          begin: const Duration(minutes: 3),
                                          end: Duration.zero),
                                      onEnd: () {
                                        print('Timer ended');
                                      },
                                      builder: (BuildContext context,
                                          Duration value, Widget? child) {
                                        final minutes = value.inMinutes;
                                        final seconds = value.inSeconds % 60;
                                        return Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20),
                                          child: Align(
                                            alignment: Alignment.topLeft,
                                            child: Text('$minutes:$seconds',
                                                style: const TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 12,
                                                )),
                                          ),
                                        );
                                      }),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 60.0,
                        child: Text(
                          "${questions[index].question}",
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 12.0,
                              fontFamily: "Tajawal",
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      for (int i = 0; i < 4; i++)
                        customAnswerForm(
                          answerIndex: i,
                          questionsIndex: index,
                        ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  );
                },
                itemCount: questions.length,
              ),
              Positioned(
                bottom: 100,
                right: 20,
                left: 20,
                child: SizedBox(
                  width: 400,
                  child: RawMaterialButton(
                    onPressed: () {
                      if (_controller!.page?.toInt() == questions.length - 1) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ResultScreen(score)));
                      } else {
                        _controller!.nextPage(
                            duration: const Duration(milliseconds: 250),
                            curve: Curves.easeInExpo);

                        setState(() {
                          btnPressed = true;
                        });
                      }
                    },
                    fillColor: const Color(0xff2B65F6),
                    elevation: 0.0,
                    child: Text(
                      btnText,
                      style: const TextStyle(
                        color: Colors.black,
                        fontFamily: "Tajawal",
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 50,
                right: 100,
                child: Container(
                  color: const Color(0xffE5E6F9),
                  height: 35,
                  width: 80,
                  child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        'الخروج',
                        style: TextStyle(
                          fontFamily: "Tajawal",
                          fontSize: 12,
                          height: 3 / 2,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      )),
                ),
              ),
            ],
          )),
    );
  }

  Container customAnswerForm({
    required int questionsIndex,
    required int answerIndex,
    required bool isRight,
  }) {
    return Container(
      width: 400,
      height: 30.0,
      margin: const EdgeInsets.only(bottom: 20.0, left: 12.0, right: 12.0),
      child: RawMaterialButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        fillColor: choosedAnswerIndex == null
            ? Colors.white
            : choosedAnswerIndex == questions[questionsIndex].rightAnswerIndex
                ? Colors.blue
                : Colors.white,
        onPressed: () {
          setState(() {
            choosedAnswerIndex = answerIndex;
          });
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(questions[questionsIndex].answers[answerIndex],
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 18.0,
                  fontFamily: "Tajawal",
                )),
          ),
        ),
      ),
    );
  }
}

*/