import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class SearchedCourseForm extends StatelessWidget {
  const SearchedCourseForm({
    Key? key,
    required this.imageUrl,
    required this.courseName,
    required this.instructorName,
    required this.rating,
    required this.courseDuration,
    required this.numberOfRates,
  }) : super(key: key);
  final String imageUrl;
  final String instructorName;
  final double courseDuration;
  final String courseName;
  final double rating;
  final int numberOfRates;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xffE5E6F9),
      margin:const EdgeInsets.all(5),
      child: ListTile(
        leading: Image.network(
          imageUrl,
        ),
        title: Text(courseName),
        //todo here add also the time of the course and the rating
        subtitle: Column(
          children: [
            Text(
              'duration : $courseDuration',
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
            )
          ],
        ),
        trailing: Text(
          instructorName,
        ),
        onTap: () {},
      ),
    );
  }
}
