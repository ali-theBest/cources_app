import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:panadol/models/lecture.dart';
import 'package:panadol/view/widgets/courses_forms_data/course_parts.dart';
import 'package:panadol/view/widgets/custom_buttons/custom_elevated_button.dart';
import 'package:panadol/view/widgets/rating_indicator.dart';

class CourseDetails extends StatelessWidget {
  const CourseDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(
                'http://t0.gstatic.com/licensed-image?q=tbn:ANd9GcQgklhgD0zVQoATeorXmrSJ1JBDH9YmkG9OLdgmJ04C5uUNIADhmQLPIUFw98w0y-QSXVLSRM3suAiJhzxSjqabwT5FahrMOsKFMLAJodBf',
                width: double.infinity,
                height: height * .2,
                fit: BoxFit.cover,
              ),
            ),
            const Text(
              'course title',
            ),
            const Text(
              'hint',
            ),
            Row(
              children: [
                const Text(
                  '(243)', //*this is the number of ratings
                  style: TextStyle(
                    fontFamily: "Tajawal",
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    height: 1.4,
                  ),
                ),
                RatingBar(
                  initialRating: 3.5, //*this will be the rating as double
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
                const Text(
                  '4.3',
                  style: TextStyle(
                    fontFamily: "Tajawal",
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    height: 1.4,
                    color: Colors.amber,
                  ),
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'instructor name ',
                    style: TextStyle(
                      fontFamily: "Tajawal",
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                      height: 1.4,
                      color: Color(0xff2B65F6),
                    ),
                  ),
                ),
              ],
            ),
            const Text(
              'Lectures',
            ),
            const CourseParts(
              courseLectures: lecs,
            ),
            const Text(
              'course description',
            ),
            Text(
              'course description details and more details',
              style: TextStyle(
                fontFamily: "Tajawal",
                fontSize: 11,
                fontWeight: FontWeight.bold,
                height: 3 / 2,
                color: Colors.black.withOpacity(.5),
              ),
            ),
            const Text(
              'instructor',
            ),
            Row(
              children: [
                const CircleAvatar(
                  backgroundImage: NetworkImage(
                    'http://t0.gstatic.com/licensed-image?q=tbn:ANd9GcQgklhgD0zVQoATeorXmrSJ1JBDH9YmkG9OLdgmJ04C5uUNIADhmQLPIUFw98w0y-QSXVLSRM3suAiJhzxSjqabwT5FahrMOsKFMLAJodBf',
                  ),
                  radius: 40,
                ),
                Column(
                  children: const [
                    Text('4 courses'),
                    Text('4343 student'),
                  ],
                ),
              ],
            ),
            const Text('instructor data'),
            ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                shape: MaterialStateProperty.all(
                  const RoundedRectangleBorder(),
                ),
                side: MaterialStateProperty.all(
                  const BorderSide(
                    color: Colors.black,
                    width: 1,
                  ),
                ),
                fixedSize: MaterialStateProperty.all(
                  Size(
                    width * (74 / 83),
                    height * (8 / 147),
                  ),
                ),
              ),
              child: const Text(
                'show profile',
              ),
            ),
            const Text(
              'students rating',
            ),
            const Text(
              '4.6 course rating',
            ),
            const RatingIndicator(
              numberOfRates: 4.3,
              numberOfStars: 5,
            ),
            const RatingIndicator(
              numberOfRates: 3,
              numberOfStars: 4,
            ),
            const RatingIndicator(
              numberOfRates: 2,
              numberOfStars: 3,
            ),
            const RatingIndicator(
              numberOfRates: 1,
              numberOfStars: 2,
            ),
            const RatingIndicator(
              numberOfRates: 5,
              numberOfStars: 1,
            ),
            Row(
              children: [
                CustomElevatedButton(
                  text: 'start',
                  height: height,
                  width: 1,
                  onPressed: () {},
                ),
                CustomElevatedButton(
                  text: 'add to favorites',
                  height: height,
                  width: 1,
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
