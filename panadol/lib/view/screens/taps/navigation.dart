// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:panadol/models/constants/enums.dart';
import 'package:panadol/view/screens/taps/exams.dart';
import 'package:panadol/view/screens/taps/learning_material_screen.dart';
import 'package:panadol/view/screens/taps/user_account.dart';

class NavigationPage extends StatefulWidget {
  static const pageRoute = "navigation_page";
  const NavigationPage({
    Key? key,
    required this.userId,
  }) : super(key: key);
  final String userId;

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  int _selectedPage = 3;
  List<Widget> homeWidgets = [
    const LearningMaterial(
      learningMaterialType: LearningMaterialType.course,
    ),
    const LearningMaterial(
      learningMaterialType: LearningMaterialType.book,
    ),
    const LearningMaterial(
      learningMaterialType: LearningMaterialType.article,
    ),
    const ExamsPage(),
    const UserAccountScreen(),
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //use this later when you will use the data form the firebase
    //you should use this line in the user profile tap
    // context.read<UserDataBloc>().add(GetUserDataEvent(id: widget.userId));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: homeWidgets[_selectedPage]),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(
                15,
              ),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black38,
                spreadRadius: 0,
                blurRadius: 2,
              )
            ]),
        child: ClipRRect(
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(
              15,
            ),
          ),
          child: BottomNavigationBar(
            onTap: (value) {
              setState(() {
                _selectedPage = value;
              });
            },
            currentIndex: _selectedPage,
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.grey,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            selectedLabelStyle: const TextStyle(
              color: Colors.blue,
              fontFamily: "Tajawal",
              fontSize: 7,
              height: 1.3,
              fontWeight: FontWeight.bold,
            ),
            unselectedLabelStyle: const TextStyle(
              color: Colors.grey,
              fontFamily: "Tajawal",
              fontSize: 7,
              height: 1.3,
              fontWeight: FontWeight.bold,
            ),
            items: [
              BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/images/icons/courses.png',
                  color: _selectedPage == 0
                      ? const Color(0xff2B65F6)
                      : Colors.grey,
                ),
                label: 'courses',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/images/icons/books.png',
                  color: _selectedPage == 1
                      ? const Color(0xff2B65F6)
                      : Colors.grey,
                ),
                label: 'books',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/images/icons/articles.png',
                  color: _selectedPage == 2
                      ? const Color(0xff2B65F6)
                      : Colors.grey,
                ),
                label: 'articles',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/images/icons/exams.png',
                  color: _selectedPage == 3
                      ? const Color(0xff2B65F6)
                      : Colors.grey,
                ),
                label: 'exams',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/images/icons/account.png',
                  color: _selectedPage == 4
                      ? const Color(0xff2B65F6)
                      : Colors.grey,
                ),
                label: 'profile',
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.rectangle,
          border: Border.all(
            color: Colors.black,
            width: .5,
          ),
        ),
        height: 70,
        width: 370,
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Image.network(
                'http://t0.gstatic.com/licensed-image?q=tbn:ANd9GcQgklhgD0zVQoATeorXmrSJ1JBDH9YmkG9OLdgmJ04C5uUNIADhmQLPIUFw98w0y-QSXVLSRM3suAiJhzxSjqabwT5FahrMOsKFMLAJodBf',
                width: 108,
                fit: BoxFit.fitWidth,
              ),
            ),
            Expanded(
                flex: 5,
                child: Row(
                  children: [
                    controlButton(
                      iconPath: 'assets/icons/control icons/remove_15.png',
                      timeEdit: true,
                      onPressed: () {},
                    ),
                    controlButton(
                      iconPath: 'assets/icons/control icons/play.png',
                      timeEdit: false,
                      onPressed: () {},
                    ),
                    controlButton(
                      iconPath: 'assets/icons/control icons/add_15.png',
                      timeEdit: true,
                      onPressed: () {},
                    ),
                    controlButton(
                      iconPath: 'assets/icons/control icons/headPhones.png',
                      timeEdit: false,
                      onPressed: () {},
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }

  TextButton controlButton({
    required String iconPath,
    required bool timeEdit,
    required void Function()? onPressed,
  }) {
    return TextButton(
      onPressed: onPressed,
      child: timeEdit
          ? Stack(
              children: [
                Image.asset(
                  iconPath,
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 5.0, left: 2),
                  child: Text(
                    '15',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 9,
                    ),
                  ),
                ),
              ],
            )
          : Image.asset(
              iconPath,
            ),
    );
  }
}
