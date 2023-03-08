import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class DesignWidget extends StatefulWidget {
  const DesignWidget({super.key});

  @override
  State<DesignWidget> createState() => _DesignWidgetState();
}

class _DesignWidgetState extends State<DesignWidget> {
  double? rating;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        reverse: true,
        child: Row(
          children: [
            for (int index = 0; index < 6; index++)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        'assets/images/pages/programming.png',
                        fit: BoxFit.fitWidth,
                        height: 100,
                        width: 95,
                      ),
                    ],
                  ),
                  const Text(
                    'courseName',
                    style: TextStyle(
                      fontFamily: "Tajawal",
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                      height: 1.4,
                    ),
                  ),
                  const Text(
                    'instructorName',
                    style: TextStyle(
                        fontFamily: "Tajawal",
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                        height: 1.4,
                        color: Colors.blue),
                  ),
                  Row(
                    children: [
                      const Text(
                        '(2364)',
                        style: TextStyle(
                          fontFamily: "Tajawal",
                          fontSize: 8,
                          fontWeight: FontWeight.bold,
                          height: 1.4,
                        ),
                      ),
                      RatingBar(
                        initialRating: 2,
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
                          //print(rating);
                        },
                      ),
                    ],
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
