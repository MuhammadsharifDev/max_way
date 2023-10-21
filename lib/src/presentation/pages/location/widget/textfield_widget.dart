
import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';

class AddressTextField extends StatelessWidget {
  AddressTextField({super.key, required this.text});
  final String text;
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        labelText: text,
        labelStyle: const TextStyle(
          color: AppColors.blackColors,
          fontSize: 14,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w400,
        ),
        fillColor: AppColors.defaultYellow,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(
            color: AppColors.defaultYellow,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(
            color: AppColors.whiteColors,
          ),
        ),
      ),
    );
  }
}
