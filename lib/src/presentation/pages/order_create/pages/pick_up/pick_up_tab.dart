import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:exam_max_way/src/core/utils/app_colors.dart';
import 'package:exam_max_way/src/core/utils/app_icons.dart';
import 'package:exam_max_way/src/core/utils/app_images.dart';
import 'package:exam_max_way/src/core/widgets/text_items.dart';
import 'package:exam_max_way/src/presentation/bloc/order_create/order_bloc.dart';
import 'package:exam_max_way/src/presentation/pages/order_create/mixins/payment_mixin.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class PickupTab extends StatefulWidget {
  const PickupTab({super.key});

  @override
  State<PickupTab> createState() => _PickupTabState();
}

class _PickupTabState extends State<PickupTab> with PaymentMixin {
  late Completer<YandexMapController> mapController =
      Completer<YandexMapController>();

  Future<void> moveCamera(OrderState state) async {
    if (state.point == null) return;
    await (await mapController.future).moveCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          zoom: 18,
          target: state.point!,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderBloc, OrderState>(
      builder: (context, state) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 16.h),
                Material(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(15),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 16.h,
                        ),
                        CustomText.items(
                            text: 'Ближайший филиал',
                            size: 15,
                            color: AppColors.black),
                        SizedBox(height: 16.h),
                        SizedBox(
                          height: 200.h,
                          width: double.infinity,
                          child: YandexMap(
                            onMapCreated: (controller) async {
                              mapController.complete(controller);
                              moveCamera(state);
                            },
                          ),
                        ),
                        SizedBox(height: 16.h),
                        ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: state.branchsResponse?.branches?.length,
                          itemBuilder: (context, index) {
                            var branch =
                                state.branchsResponse?.branches?[index];
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ListTile(
                                onTap: () {
                                  double? lat = branch?.location?.lat;
                                  double? lon = branch?.location?.long;
                                  if (lat != null && lon != null) {
                                    context.read<OrderBloc>().add(
                                          BranchsLocationEvent(
                                            point: Point(
                                              latitude: lat,
                                              longitude: lon,
                                            ),
                                          ),
                                        );

                                    moveCamera(state);
                                  }
                                },
                                leading: SizedBox(
                                  height: 24.h,
                                  width: 24.w,
                                  child:
                                      Image.asset(AppImages.restaurantImage),
                                ),
                                title: CustomText.items(
                                    text: branch?.name ?? '', size: 17),
                                subtitle: CustomText.items(
                                    text: branch?.address ?? '', size: 15),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 12.h,
                ),
                ColoredBox(
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 18, right: 16),
                        child: CustomText.items(text: 'Тип оплаты', size: 17),
                      ),
                      ListTile(
                        leading: SvgPicture.asset(AppIcons.moneyIcon),
                        title: CustomText.items(text: 'Наличные', size: 15),
                        trailing: Radio(
                          activeColor: AppColors.defaultYellow,
                          value: 1,
                          groupValue: value3,
                          onChanged: (value) => setState(() {
                            value3 = value!;
                          }),
                        ),
                      ),
                      const Divider(
                        thickness: 1,
                      ),
                      ListTile(
                        leading: SvgPicture.asset(AppIcons.paymeIcon),
                        title: CustomText.items(text: 'Payme', size: 15),
                        trailing: Radio(
                          activeColor: AppColors.defaultYellow,
                          value: 2,
                          groupValue: value3,
                          onChanged: (value) => setState(() {
                            value3 = value!;
                          }),
                        ),
                      ),
                      const Divider(
                        thickness: 1,
                      ),
                      ListTile(
                        leading: SvgPicture.asset(AppIcons.clickIcon),
                        title: CustomText.items(text: 'Click', size: 15),
                        trailing: Radio(
                          activeColor:AppColors.defaultYellow,
                          value: 3,
                          groupValue: value3,
                          onChanged: (value) => setState(() {
                            value3 = value!;
                          }),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
