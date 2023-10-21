import 'package:flutter/material.dart';
import 'package:exam_max_way/src/presentation/pages/order_create/pages/deliver_tab/deliver_tab.dart';

mixin DeliverMixin  on State<DeliverTab> {
  int value1 = 1;
  int value2 = 1;
  int value3 = 1;
  bool isVisible=false;


  TextEditingController entrancecontroller=TextEditingController();
  TextEditingController floorcontroller=TextEditingController();
  TextEditingController apartmentcontroller=TextEditingController();
  TextEditingController locationcontroller=TextEditingController();
}
