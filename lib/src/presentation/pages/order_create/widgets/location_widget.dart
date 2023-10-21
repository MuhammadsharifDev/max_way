import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:exam_max_way/src/core/widgets/global_textformfiled_widget.dart';
import 'package:exam_max_way/src/core/widgets/text_items.dart';
import 'package:exam_max_way/src/presentation/bloc/order_create/order_bloc.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class LocationWidget extends StatefulWidget {
  const LocationWidget({
    super.key,
    required this.entranceController,
    required this.floorController,
    required this.apartController,
    required this.locationController,
  });

  final TextEditingController entranceController;
  final TextEditingController floorController;
  final TextEditingController apartController;
  final TextEditingController locationController;

  @override
  State<LocationWidget> createState() => _LocationWidgetState();
}

class _LocationWidgetState extends State<LocationWidget> {
  late Completer<YandexMapController> mapController =
      Completer<YandexMapController>();

  // Future<void> moveCamera(Point? point) async {
  //   if (point == null) return;
  //   await (await mapController.future).moveCamera(
  //     CameraUpdate.newCameraPosition(
  //       CameraPosition(
  //         zoom: 16,
  //         target: point,
  //       ),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderBloc, OrderState>(
      builder: (context, state) {
        return  Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 16.h,
              ),
              CustomText.items(
                  text: 'Адрес доставки', size: 17, color: Colors.black),
              SizedBox(
                height: 16.h,
              ),
              CustomText.items(
                text: 'Текущий адрес',
                size: 15,
              ),
              SizedBox(
                height: 10.h,
              ),
              TextFormField(
                controller: widget.locationController,
                decoration:
                    GlobalInputDecoration.items(hintext: 'Бешкайрагач 12'),
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 48.h,
                    width: 109.w,
                    child: TextFormField(
                      controller: widget.entranceController,
                      decoration:
                          GlobalInputDecoration.items(hintext: 'Подъезд'),
                    ),
                  ),
                  SizedBox(
                    height: 48.h,
                    width: 109.w,
                    child: TextFormField(
                      controller: widget.floorController,
                      decoration: GlobalInputDecoration.items(hintext: 'Этаж'),
                    ),
                  ),
                  SizedBox(
                    height: 48.h,
                    width: 109.w,
                    child: TextFormField(
                      controller: widget.apartController,
                      decoration:
                          GlobalInputDecoration.items(hintext: 'Квартира'),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              SizedBox(
                height: 250.h,
                width: 343.w,
                child: YandexMap(
                  scrollGesturesEnabled: true,
                  zoomGesturesEnabled: true,
                  onMapCreated: (controller) async {
                    mapController.complete(controller);
                    await (await mapController.future).moveCamera(
                      CameraUpdate.newCameraPosition(
                         CameraPosition(
                          zoom: 18,
                          target: state.point!,
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              CustomText.items(
                text: 'Мои адреса',
                size: 15,
                color: const Color(0xff5F5F5F),
              ),
              SizedBox(
                height: 10.h,
              ),
              TextFormField(
                controller: widget.locationController,
                decoration:
                    GlobalInputDecoration.items(hintext: 'Бешкайрагач 12'),
              ),
            ],
          ),
        );
      },
    );
  }
}
