// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class MyCourseForm extends StatelessWidget {
  const MyCourseForm({Key? key, required this.isFavorite}) : super(key: key);
  final bool isFavorite;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xffE5E6F9),
      margin: const EdgeInsets.all(10),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 0,
          vertical: 3,
        ),
        onTap: () {},
        leading: Image.network(
          "http://t0.gstatic.com/licensed-image?q=tbn:ANd9GcQgklhgD0zVQoATeorXmrSJ1JBDH9YmkG9OLdgmJ04C5uUNIADhmQLPIUFw98w0y-QSXVLSRM3suAiJhzxSjqabwT5FahrMOsKFMLAJodBf",
          fit: BoxFit.fitWidth,
          width: 80,
        ),
        title: const Text(
          'course name',
          style: TextStyle(
            fontFamily: "Tajawal",
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 12,
            height: 3 / 2,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'duration : 9 h',
              style: TextStyle(
                fontFamily: "Tajawal",
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 12,
                height: 3 / 2,
              ),
            ),
            subTitle(
              isFav: isFavorite,
            ),
          ],
        ),
        trailing: const Text(
          'instructor name',
          style: TextStyle(
            fontFamily: "Tajawal",
            fontWeight: FontWeight.bold,
            color: Color(0xff2B65F6),
            fontSize: 10,
            height: 3 / 2,
          ),
        ),
      ),
    );
  }

  Widget subTitle({required bool isFav}) {
    if (isFav) {
      return Row(
        children: [
          const Text(
            '(370)',
            style: TextStyle(
              fontFamily: "Tajawal",
              fontSize: 7,
              fontWeight: FontWeight.bold,
              height: 1.4,
            ),
          ),
          RatingBar(
            initialRating: 3.5,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            itemPadding: const EdgeInsets.symmetric(horizontal: 1),
            itemSize: 10,
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
            '3.5',
            style: TextStyle(
              fontFamily: "Tajawal",
              fontSize: 7,
              fontWeight: FontWeight.bold,
              height: 1.4,
              color: Colors.amber,
            ),
          ),
        ],
      );
    } else {
      return Row(
        children: const [
          Expanded(
            flex: 3,
            child: LinearProgressIndicator(
              color: Color(
                0xff2B65F6,
              ),
              value: .7,
              backgroundColor: Colors.white,
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              '70%',
              style: TextStyle(
                fontFamily: "Tajawal",
                fontWeight: FontWeight.bold,
                color: Color(0xff2B65F6),
                fontSize: 12,
                height: 3 / 2,
              ),
            ),
          ),
        ],
      );
    }
  }
}
