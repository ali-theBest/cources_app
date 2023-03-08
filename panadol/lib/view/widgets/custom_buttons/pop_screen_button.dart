import 'package:flutter/material.dart';

class PopScreenButton extends StatelessWidget {
  const PopScreenButton({
    Key? key,
    required this.textDirection,
  }) : super(key: key);
  final TextDirection textDirection;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: Container(
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.3),
              spreadRadius: 1,
              offset: const Offset(0, 1),
              blurRadius: 2,
            ),
          ],
          color: const Color(0xffE5E6F9),
          borderRadius: BorderRadius.circular(
            6,
          ),
        ),
        child:  Padding(
          padding:const  EdgeInsets.symmetric(horizontal: 10.0, vertical: 8),
          child: Directionality(
            textDirection: textDirection,
            child: const Icon(
              Icons.arrow_back_ios,
              size: 15,
              color: Color(0xff2B65F6),
            ),
          ),
        ),
      ),
    );
  }
}
