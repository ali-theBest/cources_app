import 'package:flutter/material.dart';
import 'package:panadol/models/lecture.dart';

class CourseParts extends StatefulWidget {
  const CourseParts({
    Key? key,
    required this.courseLectures,
  }) : super(key: key);
  final List<Lecture> courseLectures;

  @override
  State<CourseParts> createState() => _CoursePartsState();
}

class _CoursePartsState extends State<CourseParts> {
  bool visible = false;
  int? lecIndex=0;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: widget.courseLectures.length,
      itemBuilder: (context, index) => Column(
        children: [
          InkWell(
            onTap: () {
              setState(() {
                visible = !visible;
                lecIndex = index;
              });
            },
            child: Text(
              widget.courseLectures[index].name,
              style: const TextStyle(
                color: Colors.black,
              ),
            ),
          ),
          Visibility(
            visible: visible,
            child: Column(
              children: widget.courseLectures[index].lectureSections
                  .map(
                    (section) => widget
                            .courseLectures[lecIndex!].lectureSections
                            .contains(section)
                        ? InkWell(
                            onTap: () {
                              print(section.name);
                              print(section.sectionDuration);
                            },
                            child: Text(
                              section.name,
                            ),
                          )
                        : Container(),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
