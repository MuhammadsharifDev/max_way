import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:exam_max_way/src/core/utils/app_colors.dart';
import 'package:exam_max_way/src/core/widgets/global_button.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

import '../mixin/addres_mixin.dart';
import '../widget/textfield_widget.dart';

class LocationPage extends StatefulWidget {
  const LocationPage({super.key});

  @override
  State<LocationPage> createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> with AddressMixin{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 450.h,
              color: AppColors.whiteColors,
              child: Stack(
                  children: [
                    YandexMap(
                      zoomGesturesEnabled: true,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 16,
                        top: 28
                      ),
                      child: GestureDetector(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child: Container(
                            height: 40,
                            width: 40,
                            decoration: ShapeDecoration(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              shadows: const [
                                BoxShadow(
                                  color: AppColors.blackColors,
                                  blurRadius: 7,
                                  offset: Offset(0, 2),
                                  spreadRadius: 0,
                                )
                              ],
                            ),
                            child: const Icon(
                              Icons.arrow_back_ios_new_outlined,
                              size: 18,
                            )
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 340,
                        left: 330
                      ),
                      child: GestureDetector(
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: ShapeDecoration(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            shadows: const [
                              BoxShadow(
                                color: AppColors.blackColors,
                                blurRadius: 7,
                                offset: Offset(0, 2),
                                spreadRadius: 0,
                              )
                            ],
                          ),
                          child: Icon(Icons.location_on_outlined, size: 24,color: AppColors.black,)
                        ),
                      ),
                    )
                  ],
              ),

              /*Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      bottom: 16,
                      right: 320,
                      left: 16,
                      top: 16,
                    ),
                    child: GestureDetector(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Container(
                        height: 40,
                        width: 40,
                          decoration: ShapeDecoration(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            shadows: const [
                              BoxShadow(
                                color: AppColors.blackColors,
                                blurRadius: 7,
                                offset: Offset(0, 2),
                                spreadRadius: 0,
                              )
                            ],
                          ),
                          child: const Icon(
                            Icons.arrow_back_ios_new_outlined,
                            size: 24,
                          )
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      bottom: 20,
                      right: 16,
                      left: 320,
                      top: 242
                    ),
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        shadows: const [
                          BoxShadow(
                            color: AppColors.blackColors,
                            blurRadius: 7,
                            offset: Offset(0, 2),
                            spreadRadius: 0,
                          )
                        ],
                      ),
                      child: SvgPicture.asset(
                        AppIcons.locationIcon,
                        width: 24,
                        height: 24,
                        color: AppColors.black,
                        clipBehavior: Clip.antiAlias,
                      ),
                    ),
                  ),
                  YandexMap(),
                ],
              ),*/


            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 350.h,
              decoration: const ShapeDecoration(
                color: AppColors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10),
                        topLeft: Radius.circular(10),
                    )
                  )
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, top: 10, bottom: 10),
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 24, bottom: 16),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Адрес доставки',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontFamily: 'SF Pro Display',
                            fontWeight: FontWeight.w600,
                            height: 0.06,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 48.h,
                      child: AddressTextField(text: 'Enter Addres')
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Row(
                        children: [
                          Expanded(
                            child: SizedBox(
                              height: 48.h,
                              width: 109.w,
                              child: AddressTextField(text: 'Подъезд',),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8),
                              child: SizedBox(
                                height: 48.h,
                                width: 109.w,
                                child: AddressTextField(text: 'Этаж',),
                              ),
                            ),
                          ),
                          Expanded(
                            child: SizedBox(
                              height: 48.h,
                              width: 109.w,
                              child: AddressTextField(text: 'Квартира',),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                        height: 48.h,
                        child: AddressTextField(text: 'Ориентир')
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: SizedBox(
                          height: 48.h,
                          child: AddressTextField(text: 'Название адреса')
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.symmetric(vertical: 8),
                      child: GlobalButton(
                          text: 'Подтвердить',
                          onPressed: (){}
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
