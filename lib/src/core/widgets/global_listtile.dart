import 'package:flutter/material.dart';
import 'package:exam_max_way/src/core/widgets/text_items.dart';

class GlobalListTile extends StatelessWidget {
  const GlobalListTile(
      {super.key,
      required this.name,
       this.onPressed,
      required this.leadingIcon,
      required this.trailingIcon});

  final String name;
  final VoidCallback? onPressed;
  final IconData leadingIcon;
  final IconData trailingIcon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading:  Icon(
        leadingIcon
      ),
      trailing:  Icon(trailingIcon),
      title: CustomText.items(text: name, size: 15),
      onTap: onPressed,
    );
  }
}
