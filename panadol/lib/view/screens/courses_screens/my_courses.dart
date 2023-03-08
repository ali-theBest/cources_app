import 'package:flutter/material.dart';
import 'package:panadol/view/widgets/courses_forms_data/my_courses_form.dart';
import 'package:panadol/view/widgets/custom_buttons/pop_screen_button.dart';

class MyCoursesScreen extends StatelessWidget {
  const MyCoursesScreen({
    Key? key,
    required this.isFav,
  }) : super(key: key);
  static const pageRoute = 'my_courses_page';
  final bool isFav;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          isFav ? 'my favorite courses' : 'my courses',
          style: const TextStyle(
            fontFamily: "Tajawal",
            fontSize: 13,
            height: 3 / 2,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: const [
          PopScreenButton(
            textDirection: TextDirection.rtl,
          ),
        ],
      ),
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: 10,
        itemBuilder: (context, _) => MyCourseForm(
          isFavorite: isFav,
        ),
      ),
    );
  }
}
