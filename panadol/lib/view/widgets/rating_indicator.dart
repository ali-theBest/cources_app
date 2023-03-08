import 'package:flutter/material.dart';
import 'package:panadol/view/widgets/custom_rating_bar.dart';

class RatingIndicator extends StatelessWidget {
  const RatingIndicator({
    Key? key,
    required this.numberOfRates,
    required this.numberOfStars,
  }) : super(key: key);
  final double numberOfRates;
  final int numberOfStars;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Container(
            height: 25,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              border: Border.all(
                color: Colors.black,
                width: .8,
              ),
            ),
            child: LinearProgressIndicator(
              value: numberOfRates / 10,
              backgroundColor: const Color.fromARGB(255, 255, 198, 12),
              color: const Color(0xff2B65F6),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: CustomRatingBar(
            numberOfRates: numberOfRates,
            numberOfStars: numberOfStars,
          ),
        ),
        Expanded(
          flex: 1,
          child: Text(
            '${numberOfRates * 10}%',
          ),
        ),
      ],
    );
  }
}
