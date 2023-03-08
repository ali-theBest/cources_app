// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:panadol/logic/blocs/user_data_bloc/user_data_bloc.dart';
import 'package:panadol/models/user.dart';
import 'package:panadol/view/screens/auth/learning_goal.dart';
import 'package:panadol/view/screens/taps/navigation.dart';
import 'package:panadol/view/widgets/custom_buttons/custom_elevated_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:panadol/view/widgets/custom_buttons/pop_screen_button.dart';

class ConfirmUserData extends StatelessWidget {
  const ConfirmUserData({
    Key? key,
    required this.userId,
    required this.firstName,
    required this.lastName,
    required this.learningGoal,
    required this.learningField,
  }) : super(key: key);
  final String userId;
  final String firstName;
  final String lastName;
  final String learningGoal;
  final String learningField;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final localizationObj = AppLocalizations.of(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: const [
                  PopScreenButton(
                    textDirection: TextDirection.ltr,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    'your answers',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w800,
                      height: 4 / 3,
                      fontFamily: "Tajawal,",
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                localizationObj!.jobGoal,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w800,
                  height: 4 / 3,
                  fontFamily: "Tajawal,",
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    learningField,
                    style: const TextStyle(
                      fontFamily: "Tajawal",
                      fontWeight: FontWeight.bold,
                      fontSize: 12.5,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      localizationObj.edit,
                      style: const TextStyle(
                        color: Color(
                          0xff2B65F6,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                localizationObj.learningReason,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w800,
                  height: 4 / 3,
                  fontFamily: "Tajawal,",
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    learningGoal,
                    style: const TextStyle(
                      fontFamily: "Tajawal",
                      fontWeight: FontWeight.bold,
                      fontSize: 12.5,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SelectLearningGoal(
                            id: userId,
                            firstName: firstName,
                            lastName: lastName,
                          ),
                        ),
                      );
                    },
                    child: Text(
                      localizationObj.edit,
                      style: const TextStyle(
                        color: Color(
                          0xff2B65F6,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: BlocListener<UserDataBloc, UserDataState>(
        listener: (context, state) {
          // TODO: implement listener
          if (state is NewUserDataPushedState) {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (ctx) => BlocProvider.value(
                  value: BlocProvider.of<UserDataBloc>(context),
                  child: NavigationPage(
                    userId: userId,
                  ),
                ),
              ),
            );
          } else if (state is PushUserDataErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.error),
              ),
            );
          } else if (state is PushUserDataLoadingState) {
            print('loading');
          }
        },
        child: CustomElevatedButton(
          text: localizationObj.next,
          height: height,
          width: width,
          onPressed: () {
            //here we will push the user data to the firebase
            MyUser myUser = MyUser(
              profileImagePath: 'profileImagePath',
              firstName: firstName,
              lastName: lastName,
              learningGoal: learningGoal,
              job: learningField,
              userId: userId,
            );
            context.read<UserDataBloc>().add(
                  PushUserDataEvent(myUser: myUser),
                );
          },
        ),
      ),
    );
  }
}
