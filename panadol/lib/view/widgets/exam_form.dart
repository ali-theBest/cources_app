import 'package:flutter/material.dart';

class ExamForm extends StatelessWidget {
  const ExamForm({
    Key? key,
    required this.materialName,
    required this.screenHeight,
    required this.screenWidth,
    required this.imagePath,
    required this.onTap,
  }) : super(key: key);
  final String materialName;
  final String imagePath;
  final double screenHeight;
  final double screenWidth;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            imagePath,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            materialName,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontFamily: "Tajawal",
              fontSize: 9,
              fontWeight: FontWeight.bold,
              height: 4 / 3,
            ),
          ),
        ],
      ),
    );
  }
}
