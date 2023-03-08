import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    Key? key,
    required this.text,
    required this.height,
    required this.width,
    required this.onPressed,
  }) : super(key: key);
  final String text;
  final double width;
  final double height;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          const Color(
            0xff2B65F6,
          ),
        ),
        
        fixedSize: MaterialStateProperty.all(
          Size(
            width * (74 / 83),
            height * (8 / 147),
          ),
        ),
      ),
      child: Text(
        text,
      ),
    );
  }
}
