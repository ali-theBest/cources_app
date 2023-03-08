// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:panadol/view/screens/pages/widgets/course_page.dart';

class MyCoursesPage extends StatefulWidget {
  const MyCoursesPage({
    Key? key,
    required this.isFav,
  }) : super(key: key);
  final bool isFav;
  @override
  State<MyCoursesPage> createState() => _MyCoursesPageState();
}

class _MyCoursesPageState extends State<MyCoursesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: SafeArea(
            child: Column(children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color.fromARGB(255, 159, 164, 255),
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(25.0),
                ),
                margin: const EdgeInsets.all(12),
                child: Row(
                  children: const <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 8),
                      child: Icon(
                        Icons.search,
                        color: Colors.blue,
                        size: 20,
                      ),
                    ),
                    Expanded(
                      child: TextField(
                        textAlign: TextAlign.right,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "...إبحث",
                          hintStyle: TextStyle(color: Color(0XFF0E0D11)),
                          contentPadding:
                              EdgeInsets.symmetric(vertical: 8, horizontal: 14),
                          isDense: true,
                        ),
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.black,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Column(
                children: [
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 10,
                    itemBuilder: (context, _) => MyCoursePage(
                      isFavorite: widget.isFav,
                    ),
                  ),
                ],
              ),
            ]),
          ),
        ));
  }
}
