import 'package:flutter/material.dart';

import 'package:panadol/view/screens/pages/data/ques_exampel.dart';

import '../../../../models/constants/constant_lists.dart';
import '../../../widgets/custom_buttons/pop_screen_button.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({Key? key}) : super(key: key);

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
  List<Question> questionList = getQuestions();
  int currentQuestionIndex = 0;
  // int score = 0;
  Answer? selectedAnswer;
  // String correctAnswer = "green";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFFFEF8F4),
      appBar: AppBar(
        centerTitle: false,
        titleSpacing: 0.0,
        backgroundColor: mainColor,
        elevation: 0,
        title: Transform(
          transform: Matrix4.translationValues(170.0, 0.0, 0.0),
          child: const Text(
            ' HTML إختبار ال',
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
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          _questionWidget(),
          _answerList(),
          _nextButton(),
          _exitButton(),
        ]),
      ),
    );
  }

  _questionWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      // mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Directionality(
          textDirection: TextDirection.rtl,
          child: Row(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "السؤال ${quenum[currentQuestionIndex]}",
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                    color: Colors.black,
                    fontFamily: "Tajawal",
                    // fontWeight: FontWeight.bold,
                    fontSize: 9.0,
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
                        builder: (BuildContext context, Duration value,
                            Widget? child) {
                          final minutes = value.inMinutes;
                          final seconds = value.inSeconds % 60;
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
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
          height: 10,
        ),
        // Assuming the correct answer is stored in a variable named `correctAnswer`

        Row(
          children: List.generate(
            100 ~/ 10,
            (index) => Expanded(
              child: Container(
                color: index % 2 == 0
                    // ignore: unrelated_type_equality_checks
                    ? (index ~/ 2 == selectedAnswer ? Colors.green : Colors.red)
                    : Colors.green,
                height: 2,
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
        Container(
          margin: const EdgeInsets.only(top: 0, bottom: 0),
          //  height: 60,
          alignment: Alignment.center,
          // width: double.infinity,
          //padding: const EdgeInsets.all(32),
          child: Text(
            questionList[currentQuestionIndex].questionText,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        )
      ],
    );
  }

  _answerList() {
    return Column(
      children: questionList[currentQuestionIndex]
          .answersList
          .map(
            (e) => _answerButton(e),
          )
          .toList(),
    );
  }

  Widget _answerButton(Answer answer) {
    bool isSelected = answer == selectedAnswer;

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 8),
      height: 40,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: isSelected ? Colors.white : Colors.black,
          backgroundColor: isSelected ? Colors.blue : Colors.white,
          // shape: const StadiumBorder(),
        ),
        onPressed: () {
          if (selectedAnswer == null) {
            if (answer.isCorrect) {
              score++;
            }
            setState(() {
              selectedAnswer = answer;
            });
          }
        },
        child: Text(answer.answerText),
      ),
    );
  }

  _nextButton() {
    bool isLastQuestion = false;
    if (currentQuestionIndex == questionList.length - 1) {
      isLastQuestion = true;
    }

    return SizedBox(
      // width: MediaQuery.of(context).size.width * 0.5,
      width: 300,
      // height: 48,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          // shape: const StadiumBorder(),
          backgroundColor: Colors.blueAccent,
        ),
        onPressed: () {
          if (isLastQuestion) {
            //display score

            showDialog(context: context, builder: (_) => _showScoreDialog());
          } else {
            //next question
            setState(() {
              selectedAnswer = null;
              currentQuestionIndex++;
            });
          }
        },
        child: Text(isLastQuestion ? "Submit" : "التالي"),
      ),
    );
  }

  _exitButton() {
    return Container(
      width: 130,
      margin: const EdgeInsets.only(top: 0.0, bottom: 60),
      child: MaterialButton(
        onPressed: () => Navigator.pop(context),
        color: const Color(0XFFE5E6F9),
        height: 40,
        minWidth: double.infinity,
        child: const Text(
          'خروج',
          style: TextStyle(
            color: Colors.black,
            fontFamily: "Tajawal",
            fontWeight: FontWeight.bold,
            fontSize: 10.0,
          ),
        ),
      ),
    );
  }

  _showScoreDialog() {
    bool isPassed = false;

    if (score >= questionList.length * 0.6) {
      //pass if 60 %
      isPassed = true;
    }
    String title = isPassed ? "Passed " : "Failed";

    return AlertDialog(
        title: Text(
          "$title | Score is $score",
          style: TextStyle(color: isPassed ? Colors.green : Colors.redAccent),
        ),
        content: ElevatedButton(
          child: const Text("Restart"),
          onPressed: () {
            Navigator.pop(context);
            setState(() {
              currentQuestionIndex = 0;
              score = 0;
              selectedAnswer = null;
            });
          },
        ));
  }
}
