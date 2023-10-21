import 'package:flutter/material.dart';

class ChooseLangButton extends StatelessWidget {
  const ChooseLangButton({
    super.key,
    required this.lang,
    required this.imgPath,
    required this.onTap,
  });

  final String lang;
  final String imgPath;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: SizedBox(
        height: 40,
        child: Image.asset(
          'assets/png_image/$imgPath.png',
        ),
      ),
      title: Text(
        lang,
        style: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),
      ),
    );
  }
}
