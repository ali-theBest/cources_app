// ignore_for_file: depend_on_referenced_packages
import 'package:flutter/material.dart';
import 'package:panadol/logic/blocs/phone_auth_bloc/phone_auth_bloc.dart';
import 'package:panadol/logic/blocs/user_data_bloc/user_data_bloc.dart';
import 'package:panadol/logic/cubits/image_picker_cubit/image_pick_cubit.dart';
import 'package:panadol/view/screens/auth/personal_data.dart';
import 'package:panadol/view/screens/taps/navigation.dart';

import 'package:panadol/view/widgets/custom_buttons/custom_elevated_button.dart';
import 'package:pinput/pinput.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({
    Key? key,
    required this.phoneNumber,
  }) : super(key: key);
  final String phoneNumber;

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  final pinController = TextEditingController();
  final focusNode = FocusNode();
  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void dispose() {
    pinController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final localizationObj = AppLocalizations.of(context);
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    const fillColor = Color(0xffDBD6D3);
    //const borderColor = Color.fromRGBO(23, 171, 144, 0.4);

    final defaultPinTheme = PinTheme(
      width: 46,
      height: 78,
      textStyle: const TextStyle(
        fontSize: 22,
        color: Color.fromRGBO(30, 60, 87, 1),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
    );
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(
              horizontal: 8,
              vertical: 80,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/splash_image.png',
                  height: 90,
                  width: 90,
                ),
                const SizedBox(
                  height: 40,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8.0,
                    ),
                    child: Text(
                      localizationObj!.registerCode,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        fontFamily: "Tajawal",
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8.0,
                    ),
                    child: Text(
                      localizationObj.codeSent,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 10,
                        fontFamily: "Tajawal",
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  widget.phoneNumber,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                    color: Color(0xff2B65F6),
                    fontFamily: "Tajawal",
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Directionality(
                  textDirection: TextDirection.ltr,
                  child: Pinput(
                    controller: pinController,
                    length: 6,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    focusNode: focusNode,
                    androidSmsAutofillMethod:
                        AndroidSmsAutofillMethod.smsUserConsentApi,
                    listenForMultipleSmsOnAndroid: true,
                    defaultPinTheme: defaultPinTheme,
                    onClipboardFound: (value) {
                      debugPrint('onClipboardFound: $value');
                      pinController.setText(value);
                    },
                    hapticFeedbackType: HapticFeedbackType.lightImpact,
                    onCompleted: (pin) {
                      debugPrint('onCompleted: ');
                    },
                    onChanged: (value) {
                      debugPrint('onChanged: ');
                    },
                    cursor: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(bottom: 9),
                          width: 22,
                          height: 1,
                        ),
                      ],
                    ),
                    followingPinTheme: defaultPinTheme.copyWith(
                      decoration: defaultPinTheme.decoration!.copyWith(
                        color: fillColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    focusedPinTheme: defaultPinTheme.copyWith(
                      decoration: defaultPinTheme.decoration!.copyWith(
                        borderRadius: BorderRadius.circular(8),
                        color: fillColor,
                      ),
                    ),
                    submittedPinTheme: defaultPinTheme.copyWith(
                      decoration: defaultPinTheme.decoration!.copyWith(
                        color: fillColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    errorPinTheme: defaultPinTheme.copyBorderWith(
                      border: Border.all(color: Colors.redAccent),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                BlocListener<PhoneAuthBloc, PhoneAuthState>(
                  listener: (context, state) {
                    if (state is UserAlreadyRegisteredPhoneState) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (ctx) => BlocProvider(
                            create: (context) => UserDataBloc(),
                            child: NavigationPage(
                              userId: widget.phoneNumber,
                            ),
                          ),
                        ),
                      );
                    } else if (state is NewPhoneUserState) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => MultiBlocProvider(
                            providers: [
                              BlocProvider(
                                create: (context) => UserDataBloc(),
                                child: PersonalDataScreen(userId: state.userId),
                              ),
                              BlocProvider(
                                create: (context) => ImagePickCubit(),
                                child: PersonalDataScreen(userId: state.userId),
                              )
                            ],
                            child: PersonalDataScreen(
                              userId: widget.phoneNumber,
                            ),
                          ),
                        ),
                      );
                    } else if (state is SignInErrorState) {
                      print('error');
                    }
                  },
                  child: CustomElevatedButton(
                    text: localizationObj.registration,
                    height: height,
                    width: width,
                    onPressed: () {
                      context.read<PhoneAuthBloc>().add(
                            GetOTPCodeEvent(
                              code: pinController.value.text,
                              id: widget.phoneNumber,
                            ),
                          );
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      localizationObj.codeDidNotArrive,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                        fontFamily: "Tajawal",
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        localizationObj.resendCode,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                          color: Color(0xff2B65F6),
                          fontFamily: "Tajawal",
                        ),
                      ),
                    ),
                  ],
                ),
                Text(
                  localizationObj.or,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                    fontFamily: "Tajawal",
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    localizationObj.registerWithAccount,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                      color: Color(0xff2B65F6),
                      fontFamily: "Tajawal",
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
