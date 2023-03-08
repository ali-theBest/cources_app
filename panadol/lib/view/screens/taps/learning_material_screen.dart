// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:panadol/logic/blocs/learning_material_bloc/learning_material_bloc.dart';
import 'package:panadol/models/constants/constant_lists.dart';
import 'package:panadol/models/constants/enums.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:panadol/view/widgets/courses_forms_data/course_form.dart';
import 'package:panadol/view/widgets/courses_forms_data/searched_course_from.dart';

class LearningMaterial extends StatefulWidget {
  const LearningMaterial({
    Key? key,
    required this.learningMaterialType,
  }) : super(key: key);
  final LearningMaterialType learningMaterialType;
  static const textStyle = TextStyle(
    fontFamily: "Tajawal",
    fontSize: 13,
    fontWeight: FontWeight.bold,
    height: 1.3,
    color: Colors.black,
  );

  @override
  State<LearningMaterial> createState() => _LearningMaterialState();
}

class _LearningMaterialState extends State<LearningMaterial> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<LearningMaterialBloc>().add(
          GetMaterialsEvent(
            learningMaterialType: widget.learningMaterialType,
            category: mostFamousJobs.first,
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20.0),
      child: BlocBuilder<LearningMaterialBloc, LearningMaterialState>(
        builder: (context, state) {
          if (state is GotMaterialsState) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  decoration: InputDecoration(
                    //TODO : use the translation here
                    hintText: 'search...',
                    constraints: const BoxConstraints(
                      maxHeight: 40,
                    ),
                    contentPadding: const EdgeInsets.only(
                      left: 10,
                      right: 10,
                    ),
                    fillColor: const Color(0xffE5E6F9),
                    filled: true,
                    prefixIconConstraints: const BoxConstraints(
                      minHeight: 40,
                      minWidth: 65,
                    ),
                    prefixIcon: InkWell(
                      onTap: () {},
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xff2B65F6),
                          borderRadius: BorderRadius.circular(
                            30,
                          ),
                        ),
                        child: const Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        30,
                      ),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  onChanged: (value) {
                    context.read<LearningMaterialBloc>().add(
                          SearchForMaterialEvent(
                            learningMaterialType: widget.learningMaterialType,
                            searchKey: value,
                          ),
                        );
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'most viewed ${materialTypes[widget.learningMaterialType]}',
                  //here we will show the most viewed courses or books etc...
                  style: LearningMaterial.textStyle,
                ),
                SingleChildScrollView(
                  padding: const EdgeInsets.only(bottom: 10, top: 10),
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: state.learningMaterial.map((element) {
                      return CourseForm(
                        courseName: element.name,
                        instructorName: element.instructorName,
                        rating: element.rating,
                        numberOfRates: element.numberOfRating,
                        courseImagePath: element.courseImagePath,
                        width: 190,
                        height: 120,
                        onTap: () {},
                      );
                    }).toList(),
                  ),
                ),
                Text(
                  'most popular ${materialTypes[widget.learningMaterialType]}',
                  style: LearningMaterial.textStyle,
                ),
                SingleChildScrollView(
                  padding: const EdgeInsets.only(bottom: 10, top: 10),
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: state.learningMaterial.map((element) {
                      return CourseForm(
                        courseName: element.name,
                        instructorName: element.instructorName,
                        rating: element.rating,
                        numberOfRates: element.numberOfRating,
                        courseImagePath: element.courseImagePath,
                        width: 190,
                        height: 120,
                        onTap: () {},
                      );
                    }).toList(),
                  ),
                ),
                const Text(
                  'Categories',
                  style: LearningMaterial.textStyle,
                ),
                Wrap(
                  children: mostFamousJobs
                      .map(
                        (category) => InkWell(
                          onTap: () {},
                          child: Card(
                            margin: const EdgeInsets.all(
                              5,
                            ),
                            shadowColor: Colors.black,
                            color: Colors.white,
                            elevation: 8,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                30,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                category,
                                style: const TextStyle(
                                  color: Color(0xff2B65F6),
                                  fontSize: 9,
                                  height: 4 / 3,
                                  fontFamily: "Tajawal",
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
                /*Text(
                  'most newest ${materialTypes[widget.learningMaterialType]}',
                  style: LearningMaterial.textStyle,
                ),
                SingleChildScrollView(
                  padding: const EdgeInsets.only(bottom: 10, top: 10),
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: const [],
                  ),
                ),*/
                Text(
                  'most rating ${materialTypes[widget.learningMaterialType]}',
                  style: LearningMaterial.textStyle,
                ),
                //todo show here the most rated courses
                SingleChildScrollView(
                  padding: const EdgeInsets.only(bottom: 10, top: 10),
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: state.learningMaterial.map((element) {
                      return CourseForm(
                        courseName: 'courseName',
                        instructorName: 'instructorName',
                        rating: 4.5,
                        numberOfRates: 858,
                        courseImagePath:
                            'https://cdn.mos.cms.futurecdn.net/Vp9WvV7YKdH4k8sKRePcE8.jpg',
                        width: 190,
                        height: 120,
                        onTap: () {},
                      );
                    }).toList(),
                  ),
                ),
              ],
            );
          } else if (state is GetMaterialsLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is GotSearchedMaterialsState) {
            return Column(
              children: state.learningMaterial.map((element) {
                return const SearchedCourseForm(
                  imageUrl:
                      'https://cdn.mos.cms.futurecdn.net/Vp9WvV7YKdH4k8sKRePcE8.jpg',
                  courseName: 'courseName',
                  instructorName: 'instructorName',
                  rating: 4,
                  courseDuration: 6,
                  numberOfRates: 254,
                );
              }).toList(),
            );
          } else if (state is GetMaterialsErrorState) {
            return Center(
              child: Text(
                state.error,
              ),
            );
          } else {
            return const Center(
              child: Text('No Courses found'),
            );
          }
        },
      ),
    );
  }
}
