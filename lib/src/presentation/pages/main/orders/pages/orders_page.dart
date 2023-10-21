

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:exam_max_way/src/core/utils/app_colors.dart';
import 'package:exam_max_way/src/presentation/pages/main/orders/widgets/active_order_button.dart';

class OrdersPage extends StatefulWidget {
  const OrdersPage({super.key});

  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
TextEditingController controller=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize:
      Size.fromHeight(120),
          child: Container(
            color: Colors.white,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    child: Text(
                      'Мои заказы',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontFamily: 'SF Pro Text',
                        fontWeight: FontWeight.w600,
                        height: 0.06,
                        letterSpacing: -0.41,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    child: Container(
                      height: 45.h,
                      width: 343.w,
                      decoration: ShapeDecoration(
                        color: AppColors.whiteColors,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)
                          ),
                      ),
                      child: Row(
                        children: [
                          Expanded(child: ActiveOrderButton(text: 'Active Order', color: AppColors.white, onTap: (){}, textColor: AppColors.black,)),
                          Expanded(child: ActiveOrderButton(text: 'Orders History', color: AppColors.whiteColors, onTap: (){}, textColor: AppColors.blackColors,)),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
      ),
      // body: Column(
      //   children: [
      //     SizedBox(height:16.h),
      //     TextFormField(
      //       controller: controller,
      //     ),
      //     SizedBox(height:20),
      //     IconButton(onPressed: (){
      //       saveProductBox.add(controller.text);
      //       setState(() {
      //
      //       });
      //     }, icon: Icon(Icons.add)),
      //     SizedBox(height: 20,),
      //    ListView.builder(
      //      shrinkWrap: true,
      //      itemCount: saveProductBox.values.length,
      //      itemBuilder: (context, index) {
      //        return Text(saveProductBox.values.toList()[index]);
      //      } ,)
      //   ]
      // )
    );
  }
}
