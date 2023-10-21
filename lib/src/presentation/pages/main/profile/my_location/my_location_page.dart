import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:exam_max_way/src/core/routes/routes_name.dart';
import 'package:exam_max_way/src/core/utils/app_colors.dart';
import 'package:exam_max_way/src/core/utils/app_icons.dart';
import 'package:exam_max_way/src/core/utils/app_images.dart';
import 'package:exam_max_way/src/core/widgets/global_button.dart';
import 'package:exam_max_way/src/core/widgets/text_items.dart';

class MyLocationPage extends StatelessWidget {
  const MyLocationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: AppColors.black,
            ),
          ),
          elevation: 0,
          backgroundColor: AppColors.white,
          title: CustomText.items(
              text: 'Мои адреса', size: 20, color: AppColors.black),
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: SizedBox(
                height: 164.h,
                width: 164.w,
                child: Image.asset(
                  AppImages.restaurantImage,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            CustomText.items(text: 'У вас нет сохраненных адресов', size: 15),
          ],
        ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          height: 52.h,
          width: double.infinity,
          child: GlobalButton(text: 'Добавить новый адрес',onPressed: () {
            Navigator.pushNamed(context, RouteName.location);
          },),
        ),
      ),
    );
  }
}
