import 'package:flutter/material.dart';
import 'package:panadol/models/constants/constant_lists.dart';
import 'package:panadol/view/widgets/exam_form.dart';

class ExamsPage extends StatelessWidget {
  const ExamsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 30,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            'Panadol اختبارات',
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'Tajawal',
              fontWeight: FontWeight.bold,
              fontSize: 13,
            ),
          ),
        ),
        Expanded(
          child: GridView(
            padding: EdgeInsets.symmetric(
              vertical: screenHeight * .0292,
              horizontal: screenWidth * .0486,
            ),
            scrollDirection: Axis.vertical,
            //shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 150,
              crossAxisSpacing: 5,
              mainAxisExtent: screenHeight * .19,
              mainAxisSpacing: 10,
              childAspectRatio: 10 / 13,
            ),
            //todo if the snapshot.studying year has the studying year material.
            children: mostFamousJobs
                .map(
                  (item) => ExamForm(
                    materialName: 'Web Develomentاختبار ال',
                    screenHeight: screenHeight,
                    screenWidth: screenWidth,
                    imagePath: 'assets/images/exam_image.png',
                    onTap: () {},
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }
}
