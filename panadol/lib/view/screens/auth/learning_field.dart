import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:panadol/logic/blocs/user_data_bloc/user_data_bloc.dart';
import 'package:panadol/models/constants/constant_lists.dart';
import 'package:panadol/view/screens/auth/confirm_data.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class SelectedLearningField extends StatelessWidget {
  SelectedLearningField({
    Key? key,
    required this.userId,
    required this.firstName,
    required this.lastName,
    required this.learningGoal,
  }) : super(key: key);
  final String userId;
  final String firstName;
  final String lastName;
  final String learningGoal;
  String jobField = '';
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final localizationObj = AppLocalizations.of(context);
    return Scaffold(
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        height: double.infinity,
        margin: EdgeInsets.only(
          top: height * (10 / 147),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                localizationObj!.jobGoal,
                style: const TextStyle(
                  fontSize: 15,
                  fontFamily: 'Tajawal',
                  fontWeight: FontWeight.w800,
                  height: 4 / 3,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                onChanged: (value) {
                  print(value);
                },
                decoration: InputDecoration(
                  focusColor: null,
                  constraints: const BoxConstraints(
                    maxHeight: 30,
                  ),
                  contentPadding: const EdgeInsets.only(
                    top: 4,
                  ),
                  fillColor: const Color(0xffE5E6F9),
                  hintText: localizationObj.jobSearch,
                  prefixIcon: const Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                  filled: true,
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                  border: const OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Text(
                localizationObj.mostFamous,
                style: const TextStyle(
                  fontSize: 15,
                  fontFamily: 'Tajawal',
                  fontWeight: FontWeight.w800,
                  height: 4 / 3,
                ),
              ),
              ListView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: mostFamousJobs
                    .map(
                      (item) => jobItem(
                        context: context,
                        fieldName: item,
                      ),
                    )
                    .toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  ListTile jobItem({
    required BuildContext context,
    required String fieldName,
  }) {
    return ListTile(
      //minVerticalPadding: 4,
      onTap: () {
        jobField = fieldName;
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => BlocProvider(
              create: (context) => UserDataBloc(),
              child: ConfirmUserData(
                userId: userId,
                firstName: firstName,
                lastName: lastName,
                learningGoal: learningGoal,
                learningField: jobField,
              ),
            ),
          ),
        );
      },
      leading: Text(
        fieldName,
        style: const TextStyle(
          fontSize: 12.5,
          fontFamily: "Tajawal",
          fontWeight: FontWeight.bold,
          color: Colors.black,
          height: 1.4,
        ),
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        size: 15,
        color: Colors.black,
      ),
    );
  }
}
