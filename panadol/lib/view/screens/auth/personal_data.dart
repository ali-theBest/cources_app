// ignore_for_file: depend_on_referenced_packages

import 'dart:io';

import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:panadol/models/constants/enums.dart';
import 'package:panadol/view/screens/auth/learning_goal.dart';
import 'package:panadol/view/widgets/custom_buttons/custom_elevated_button.dart';
import 'package:panadol/view/widgets/custom_text_field.dart';
import 'package:panadol/logic/cubits/image_picker_cubit/image_pick_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PersonalDataScreen extends StatefulWidget {
  const PersonalDataScreen({
    Key? key,
    required this.userId,
  }) : super(key: key);
  //?this id will be the phone number or the google email or facebook email
  final String userId;

  @override
  State<PersonalDataScreen> createState() => _PersonalDataScreenState();
}

class _PersonalDataScreenState extends State<PersonalDataScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  File? imagePath;

  @override
  void dispose() {
    // TODO: implement dispose
    firstNameController.clear();
    firstNameController.dispose();
    lastNameController.clear();
    lastNameController.dispose();
    print('disposed');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final localizationObj = AppLocalizations.of(context);
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        height: double.infinity,
        margin: EdgeInsets.only(
          top: height * (20 / 147),
        ),
        decoration: const BoxDecoration(
          color: Color.fromARGB(51, 0, 0, 0),
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(25),
          ),
        ),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 8),
                  width: 100,
                  height: 100,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: BlocBuilder<ImagePickCubit, ImagePickState>(
                    builder: (context, state) {
                      if (state is PickedImageState) {
                        imagePath = state.file;
                      }
                      return InkWell(
                        borderRadius: BorderRadius.circular(100),
                        onTap: () {
                          context.read<ImagePickCubit>().pickImageEvent();
                        },
                        child: state is PickedImageState
                            ? CircleAvatar(
                                radius: 50,
                                backgroundImage: FileImage(state.file),
                              )
                            : Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(Icons.camera_enhance_outlined),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    localizationObj!.addProfilePhoto,
                                    style: const TextStyle(
                                      fontSize: 8,
                                      fontFamily: 'Tajawal',
                                      height: 4 / 3,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                      );
                    },
                  ),
                ),

                //todo add the textfield here for the first name and last name.
                CustomTextField(
                  controller: firstNameController,
                  hint: '${localizationObj!.add} ${localizationObj.firstName}',
                  label: localizationObj.firstName,
                  inputType: TextInputType.name,
                  fieldsType: FieldsType.name,
                  height: height,
                  width: width,
                  prefixIcon: null,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return " ${localizationObj.firstName} ${localizationObj.notEmpty}";
                    } else {
                      return null;
                    }
                  },
                ),
                CustomTextField(
                  controller: lastNameController,
                  hint: '${localizationObj.add} ${localizationObj.lastName}',
                  label: localizationObj.lastName,
                  inputType: TextInputType.name,
                  fieldsType: FieldsType.name,
                  height: height,
                  width: width,
                  prefixIcon: null,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return " ${localizationObj.lastName} ${localizationObj.notEmpty}";
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 50,
                ),
                CustomElevatedButton(
                  text: localizationObj.next,
                  height: height,
                  width: width,
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      if (imagePath == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              'please select a profile image',
                            ),
                          ),
                        );
                      } else {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => SelectLearningGoal(
                              //TODO : add here the image instance to upload it later
                              id: widget.userId,
                              firstName: firstNameController.value.text,
                              lastName: lastNameController.value.text,
                            ),
                          ),
                        );
                      }
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
