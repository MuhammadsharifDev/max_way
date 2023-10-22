import 'package:exam_max_way/src/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:exam_max_way/src/core/utils/app_icons.dart';
import 'package:exam_max_way/src/core/widgets/global_textformfiled_widget.dart';
import 'package:exam_max_way/src/core/widgets/text_items.dart';
import 'package:exam_max_way/src/presentation/bloc/auth/auth_bloc.dart';
import 'package:exam_max_way/src/presentation/bloc/order_create/order_bloc.dart';
import 'package:exam_max_way/src/presentation/pages/order_create/mixins/deliver_mixin.dart';
import 'package:exam_max_way/src/presentation/pages/order_create/widgets/location_widget.dart';

class DeliverTab extends StatefulWidget {
  const DeliverTab({super.key});

  @override
  State<DeliverTab> createState() => _DeliverTabState();
}

class _DeliverTabState extends State<DeliverTab> with DeliverMixin {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OrderBloc, OrderState>(
      listener: (context, state) {},
      builder: (context, state) {
        return state.deliveryPageStatus.isLoading
            ? const Center(
                child: CircularProgressIndicator.adaptive(),
              )
            : SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 16.h,
                    ),
                    ColoredBox(
                      color: Colors.white,
                      child: LocationWidget(
                        entranceController: entrancecontroller,
                        apartController: apartmentcontroller,
                        floorController: floorcontroller,
                        locationController: locationcontroller,
                      ),
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    Material(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 16, right: 16),
                            child: CustomText.items(
                                text: 'Хотели бы что бы вам позвонил курьер?',
                                size: 17),
                          ),
                          Row(
                            children: [
                              Radio(
                                activeColor: AppColors.defaultInkColor,
                                value: 1,
                                groupValue: value1,
                                onChanged: (value) => setState(() {
                                  value1 = value!;
                                }),
                              ),
                              SizedBox(
                                width: 12.w,
                              ),
                              CustomText.items(text: 'Да', size: 15),
                            ],
                          ),
                          const Divider(thickness: 1),
                          Row(
                            children: [
                              Radio(
                                activeColor: AppColors.defaultInkColor,
                                value: 2,
                                groupValue: value1,
                                onChanged: (value) => setState(() {
                                  value1 = value!;
                                }),
                              ),
                              SizedBox(
                                width: 12.w,
                              ),
                              CustomText.items(text: 'Нет', size: 15),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    Material(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 16, right: 16),
                            child: CustomText.items(
                                text: 'Время доставка', size: 17),
                          ),
                          ListTile(
                            leading: SvgPicture.asset(AppIcons.motorbikeIcon),
                            title: CustomText.items(
                                text: 'Срочная доставка', size: 15),
                            trailing: Radio(
                              activeColor: AppColors.defaultInkColor,
                              value: 1,
                              groupValue: value2,
                              onChanged: (value) => setState(() {
                                value2 = value!;
                                isVisible = false;
                              }),
                            ),
                          ),
                          const Divider(
                            thickness: 1,
                          ),
                          ListTile(
                            leading: SvgPicture.asset(AppIcons.clockIcon),
                            title: CustomText.items(
                                text: 'Доставка по расписанию', size: 15),
                            trailing: Radio(
                              activeColor: AppColors.defaultInkColor,
                              value: 2,
                              groupValue: value2,
                              onChanged: (value) => setState(() {
                                value2 = value!;
                                isVisible = !isVisible;
                              }),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    Visibility(
                      visible: isVisible,
                      child: SizedBox(
                        width: double.infinity,
                        height: 100.h,
                        child: ColoredBox(
                          color: Colors.white,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText.items(
                                  text: 'Выберите время', size: 15),
                              SizedBox(
                                height: 16.h,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SizedBox(
                                  width: 180.w,
                                  child: TextFormField(
                                    decoration: GlobalInputDecoration.items(
                                        suffixIcons: IconButton(
                                            onPressed: () {},
                                            icon: const Icon(Icons
                                                .keyboard_arrow_down_rounded)),
                                        hintext: '10:20'),
                                  ),
                                ),
                              ),
                            ],
                          ),
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
                            child:
                                CustomText.items(text: 'Тип оплаты', size: 17),
                          ),
                          ListTile(
                            leading: SvgPicture.asset(AppIcons.moneyIcon),
                            title: CustomText.items(text: 'Наличные', size: 15),
                            trailing: Radio(
                              activeColor: AppColors.defaultInkColor,
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
                              activeColor: AppColors.defaultInkColor,
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
                              activeColor: AppColors.defaultInkColor,
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
                    SizedBox(
                      height: 12.h,
                    ),
                  ],
                ),
              );
      },
    );
  }
}
