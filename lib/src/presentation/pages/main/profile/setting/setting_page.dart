import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:exam_max_way/src/core/utils/app_colors.dart';
import 'package:exam_max_way/src/core/utils/app_icons.dart';
import 'package:exam_max_way/src/core/utils/app_images.dart';
import 'package:exam_max_way/src/core/widgets/text_items.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  bool switchValue = true;

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
            text: 'Настройки', size: 15, color: AppColors.black),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 16.h,
          ),
          Material(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(12),
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.language),
                  title: CustomText.items(text: 'Язык', size: 15),
                  trailing: const Icon(Icons.keyboard_arrow_right_sharp),
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return SizedBox(
                          height: 240.h,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 10.h,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: CustomText.items(text: 'Язык', size: 18),
                              ),
                              const Divider(),
                              ListTile(
                                leading: SizedBox(
                                  height: 32.h,
                                  width: 32.w,
                                  child: Image.asset(AppImages.ruLogo),
                                ),
                                title:
                                    CustomText.items(text: 'Русский', size: 18),
                                onTap: () {},
                              ),
                              const Divider(),
                              ListTile(
                                leading: SizedBox(
                                  height: 32.h,
                                  width: 32.w,
                                  child: Image.asset(AppImages.uzLogo),
                                ),
                                title: CustomText.items(
                                    text: 'O’zbekcha', size: 18),
                                onTap: () {},
                              ),
                              const Divider(),
                              ListTile(
                                leading: SizedBox(
                                  height: 32.h,
                                  width: 32.w,
                                  child: Image.asset(AppImages.enLogo),
                                ),
                                title:
                                    CustomText.items(text: 'English', size: 18),
                                onTap: () {},
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                ),
                const Divider(),
                ListTile(
                  leading: const Icon(Icons.notifications),
                  title: CustomText.items(text: 'Уведомление', size: 15),
                  trailing: CupertinoSwitch(
                    value: switchValue,
                    activeColor: AppColors.defaultInkColor,
                    onChanged: (bool? value) {
                      setState(() {
                        switchValue = value ?? false;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
