import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class CourseForm extends StatelessWidget {
  const CourseForm({
    Key? key,
    required this.courseName,
    required this.instructorName,
    required this.rating,
    required this.numberOfRates,
    required this.courseImagePath,
    required this.width,
    required this.height,
    required this.onTap,
  }) : super(key: key);
  final String courseName;
  final String instructorName;
  final double rating;
  final int numberOfRates;
  final String courseImagePath;
  final double width;
  final double height;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: SizedBox(
          height: height,
          width: width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                courseImagePath,
              ),
              Text(
                courseName,
                style: const TextStyle(
                  fontFamily: "Tajawal",
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                  height: 1.4,
                ),
              ),
              Text(
                instructorName,
                style: const TextStyle(
                  fontFamily: "Tajawal",
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                  height: 1.4,
                ),
              ),
              Row(
                children: [
                  Text(
                    '($numberOfRates)',
                    style: const TextStyle(
                      fontFamily: "Tajawal",
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                      height: 1.4,
                    ),
                  ),
                  RatingBar(
                    initialRating: rating,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemPadding: const EdgeInsets.symmetric(horizontal: .5),
                    itemSize: 15,
                    ratingWidget: RatingWidget(
                      full: const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      empty: const Icon(
                        Icons.star_outline,
                        color: Colors.grey,
                      ),
                      half: const Icon(
                        Icons.star_half_outlined,
                        color: Colors.amber,
                      ),
                    ),
                    updateOnDrag: false,
                    onRatingUpdate: (rating) {
                      print(rating);
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
