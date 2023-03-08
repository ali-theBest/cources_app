import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:panadol/logic/blocs/learning_material_bloc/learning_material_bloc.dart';
import 'package:panadol/models/firebase/apis/auth_api.dart';
import 'package:panadol/view/screens/auth/choose_lang.dart';
import 'package:panadol/view/screens/taps/navigation.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  static const pageRoute = 'splash_screen';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final FirebaseAuthApi firebaseAuthApi = FirebaseAuthApi();
  bool checkIfUser() {
    bool isUser = firebaseAuthApi.isUser;
    return isUser;
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(
        seconds: 3,
      ),
      () {
        checkIfUser()
            ? Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => BlocProvider(
                    create: (context) => LearningMaterialBloc(),
                    child: const NavigationPage(
                      userId: 'userId',
                    ),
                  ),
                ),
              )
            : Navigator.of(context).pushReplacementNamed(
                ChooseLang.pageRoute,
              );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/images/splash_image.png',
        ),
      ),
    );
  }
}
