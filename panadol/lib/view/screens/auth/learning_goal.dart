// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:panadol/view/screens/auth/learning_field.dart';
import 'package:panadol/view/widgets/custom_buttons/custom_elevated_button.dart';

class SelectLearningGoal extends StatefulWidget {
  const SelectLearningGoal({
    Key? key,
    required this.id,
    required this.firstName,
    required this.lastName,
  }) : super(key: key);

  final String id;
  final String firstName;
  final String lastName;

  @override
  State<SelectLearningGoal> createState() => _SelectLearningGoalState();
}

class _SelectLearningGoalState extends State<SelectLearningGoal> {
  //todo: create a method to call the user data event
  //todo : also this will get the email or
  //todo we can get it form the previous page in the constructor
  String selectedLearningGoal = "";

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final localizationObj = AppLocalizations.of(context);
    final List<String> learningGoal = [
      localizationObj!.newJob,
      localizationObj.evoluteInJob,
      localizationObj.becomeAManger,
      localizationObj.gainExperience,
    ];

    return Scaffold(
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        height: double.infinity,
        margin: EdgeInsets.only(
          top: height * (20 / 147),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              localizationObj.learningReason,
              style: const TextStyle(
                fontFamily: "Tajawal",
                fontSize: 15,
                height: (4 / 3),
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              localizationObj.towQuestionsForHelp,
              style: const TextStyle(
                fontFamily: "Tajawal",
                fontSize: 11,
                fontWeight: FontWeight.bold,
                height: (4 / 3),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Text(
              localizationObj.jobGoal,
              style: const TextStyle(
                fontFamily: "Tajawal",
                fontSize: 13,
                height: (4 / 3),
                fontWeight: FontWeight.w800,
              ),
            ),
            myRadio(learningGoal.first),
            myRadio(learningGoal[1]),
            myRadio(learningGoal[2]),
            myRadio(learningGoal[3]),
          ],
        ),
      ),
      floatingActionButton: CustomElevatedButton(
        text: localizationObj.next,
        height: height,
        width: width,
        onPressed: () {
          if (selectedLearningGoal != '') {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => SelectedLearningField(
                  userId: widget.id,
                  firstName: widget.firstName,
                  lastName: widget.lastName,
                  learningGoal: selectedLearningGoal,
                ),
              ),
            );
          }
        },
      ),
    );
  }

  Container myRadio(String learningGoal) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 3),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(3),
        border: Border.all(
          width: .5,
        ),
        shape: BoxShape.rectangle,
      ),
      child: RadioListTile<String>(
        value: learningGoal,
        groupValue: selectedLearningGoal,
        onChanged: (value) {
          setState(() {
            selectedLearningGoal = value!;
          });
          print(value);
        },
        title: Text(
          learningGoal,
          style: const TextStyle(
            fontFamily: "Tajawal",
            fontSize: 13,
            height: (4 / 3),
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
    );
  }
}
