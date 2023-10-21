import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:exam_max_way/src/core/utils/app_colors.dart';
import 'package:exam_max_way/src/core/widgets/global_textformfiled_widget.dart';
import 'package:exam_max_way/src/core/widgets/text_items.dart';
import 'package:exam_max_way/src/presentation/pages/main/profile/edit/mixin_page.dart';

class EditPage extends StatefulWidget {
  const EditPage({super.key});

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> with EditMixin {
 late DateTime dateTime;
@override
  void initState() {
    dateTime=DateTime.now();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back,
              color: AppColors.black,
            )),
        title: CustomText.items(
            text: 'Редактировать профиль', size: 17, color: AppColors.black),
        centerTitle: true,
        backgroundColor: AppColors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 16.h,
          ),
          Material(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(15),
            child: Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 8.h,
                  ),
                  CustomText.items(
                      text: 'Имя', size: 17, color: AppColors.defaultGrey),
                  SizedBox(
                    height: 10.h,
                  ),
                  TextFormField(
                    controller: nameController,
                    decoration:
                        GlobalInputDecoration.items(hintext: 'Muhammadsharif'),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  CustomText.items(
                      text: 'Номер телефона',
                      size: 17,
                      color: AppColors.defaultGrey),
                  SizedBox(
                    height: 10.h,
                  ),
                  TextFormField(
                    controller: phoneNumberController,
                    decoration: GlobalInputDecoration.items(
                        hintext: '+998 93 222 20 63'),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  CustomText.items(
                      text: 'Дата рождения',
                      size: 17,
                      color: AppColors.defaultGrey),
                  SizedBox(
                    height: 10.h,
                  ),
                  TextFormField(
                    controller: dataBrithdayController,
                    decoration: GlobalInputDecoration.items(
                      hintext:
                          '${dateTime.month}-${dateTime.day}-${dateTime.year}',
                      suffixIcons: CupertinoButton(
                        onPressed: () {
                          showCupertinoModalPopup(
                            context: context,
                            builder: (context) => SizedBox(
                              height: 250.h,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: CustomText.items(
                                        text: 'Done', size: 15),
                                  ),
                                  Expanded(
                                      child:CupertinoDatePicker(
                                        initialDateTime: dateTime,
                                        mode: CupertinoDatePickerMode.date,
                                        onDateTimeChanged: (date) {
                                          setState(() {
                                            dateTime=date;
                                          });
                                        },

                                      ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                        child: const Icon(Icons.calendar_month),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.defaultYellow,
              minimumSize: const Size(double.infinity, 52),
            ),
            child: CustomText.items(text: 'Сохранить', size: 15),
          ),
        ),
      ),
    );
  }
}
