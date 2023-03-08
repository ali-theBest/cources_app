import 'package:flutter/material.dart';

class SocialSignInIcon extends StatelessWidget {
  const SocialSignInIcon({
    Key? key,
    required this.iconPath,
    required this.onTap,
  }) : super(key: key);
  final String iconPath;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        height: 50,
        width: 50,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
        ),
        child: Image.asset(
          iconPath,
        ),
      ),
    );
  }
}
