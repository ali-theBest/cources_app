// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:panadol/logic/blocs/social_auth_bloc/social_auth_bloc.dart';
import 'package:panadol/logic/blocs/phone_auth_bloc/phone_auth_bloc.dart';
import 'package:panadol/logic/blocs/user_data_bloc/user_data_bloc.dart';
import 'package:panadol/logic/cubits/image_picker_cubit/image_pick_cubit.dart';

import 'package:panadol/models/constants/enums.dart';
import 'package:panadol/view/screens/auth/otp_screen.dart';
import 'package:panadol/view/screens/auth/personal_data.dart';
import 'package:panadol/view/screens/taps/navigation.dart';
import 'package:panadol/view/widgets/custom_buttons/custom_dropdown_button.dart';

import 'package:panadol/view/widgets/custom_buttons/custom_elevated_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:panadol/view/widgets/custom_text_field.dart';
import 'package:panadol/view/widgets/custom_buttons/social_signin_icons.dart';
import 'package:country_calling_code_picker/picker.dart';

class Registration extends StatefulWidget {
  const Registration({Key? key}) : super(key: key);
  static const pageRoute = 'registration_page';

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  //now we need controllers to get the value from the fields
  final phoneNumberController = TextEditingController();
  String countryCode = '+20';
  int selectedCountryIndex = 67;
  Future<List<Country>> getCountriesCodes() async {
    return await getCountries(context);
  }

  @override
  void initState() {
    // TODO: implement initState
    getCountriesCodes();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    phoneNumberController.dispose();
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
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(top: 20),
          child: Column(
            children: [
              const SizedBox(
                height: 150,
                child: Text(
                  'Log in',
                  style: TextStyle(
                    fontSize: 30,
                    color: Color.fromARGB(255, 16, 37, 91),
                    fontFamily: 'Tajwal',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              CustomTextField(
                controller: phoneNumberController,
                hint: localizationObj!.phoneNumber,
                label: '${localizationObj.add}${localizationObj.phoneNumber}',
                inputType: TextInputType.phone,
                fieldsType: FieldsType.phoneNumber,
                height: height,
                width: width,
                prefixIcon: FutureBuilder<List<Country>>(
                  future: getCountriesCodes(),
                  builder: (context, snapshot) {
                    List<Country>? countriesCodesList = snapshot.data;

                    if (snapshot.hasData) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 2),
                          width: 50,
                          decoration: const BoxDecoration(
                            border: Border(
                              right: BorderSide(
                                color: Colors.black,
                                width: .2,
                              ),
                            ),
                          ),
                          child: MyFormDropDownButton(
                            dropItems: countriesCodesList!,
                            //todo set the value as item in the list using the index
                            value: countriesCodesList[selectedCountryIndex],
                            onChanged: (country) {
                              selectedCountryIndex =
                                  countriesCodesList.indexOf(country!);
                              countryCode = country.callingCode;
                              setState(() {});
                            },
                            validator: (value) {},
                          ),
                        ),
                      );
                    } else {
                      return const CircularProgressIndicator();
                    }
                  },
                ),
                validator: (value) {
                  if (value == null) {
                    return 'you must enter you phone number';
                  } else if (value.length < 10) {
                    return 'please, enter a valid phone number';
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(
                height: 20,
              ),
              BlocListener<PhoneAuthBloc, PhoneAuthState>(
                listener: (context, state) {
                  // TODO: implement listener
                  if (state is CodeRequestedState) {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => OTPScreen(
                          phoneNumber:
                              '$countryCode${phoneNumberController.text}',
                        ),
                      ),
                    );
                  } else if (state is SignInLoadingState) {
                    print('loading');
                  }
                },
                child: CustomElevatedButton(
                  height: height,
                  width: width,
                  text: localizationObj.login,
                  onPressed: () {
                    if (phoneNumberController.value.text.isNotEmpty) {
                      context.read<PhoneAuthBloc>().add(
                            SignInPhoneEvent(
                              phoneNumber:
                                  '$countryCode${phoneNumberController.value.text}',
                            ),
                          );
                    } else if (phoneNumberController.value.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            'phone number can not be empty',
                          ),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            'please enter a valid phone number',
                          ),
                        ),
                      );
                    }
                  },
                ),
              ),
              const SizedBox(
                height: 100,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  localizationObj.anotherWayToLogin,
                  style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              BlocListener<SocialAuthBloc, SocialAuthState>(
                listener: (context, state) async {
                  if (state is UserAlreadyRegisteredSocialState) {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => BlocProvider(
                          //TODO here you will get the user data from the firebase
                          //todo because the user already have an account
                          create: (context) => UserDataBloc(),
                          child: NavigationPage(
                            userId: state.userId,
                          ),
                        ),
                      ),
                    );
                  } else if (state is NewSocialUserState) {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (ctx) => MultiBlocProvider(
                          //TODO: you can use this provider when you earn all the data form
                          //*the user and ready to push it to the firebase
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
                          //TODO here you will move to the next page and
                          //todo gain the user data in the end you will push
                          //todo the data to the firebase
                          child: PersonalDataScreen(
                            userId: state.userId,
                          ),
                        ),
                      ),
                    );
                  } else if (state is FacebookSignInErrorState) {
                    print(state.error);
                  } else if (state is GoogleSignInErrorState) {
                    print(state.error);
                  }
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SocialSignInIcon(
                      iconPath: 'assets/images/social_media_images/google.png',
                      onTap: () {
                        context.read<SocialAuthBloc>().add(
                              const SignInWithGoogleEvent(),
                            );
                      },
                    ),
                    SocialSignInIcon(
                      iconPath:
                          'assets/images/social_media_images/facebook.png',
                      onTap: () {
                        context.read<SocialAuthBloc>().add(
                              const SignInWithFacebookEvent(),
                            );
                      },
                    ),
                    SocialSignInIcon(
                      iconPath: 'assets/images/social_media_images/apple.png',
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
