import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:exam_max_way/src/core/utils/app_colors.dart';
import 'package:exam_max_way/src/core/widgets/text_items.dart';
import 'package:exam_max_way/src/presentation/pages/main/profile/branchs/branch_arguments.dart';

class BranchsDetailPage extends StatelessWidget {
  const BranchsDetailPage({
    super.key,
    required this.arguments,
  });

  final BranchArguments arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: CustomText.items(
            text: arguments.branchName, size: 17, color: AppColors.black),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back,
            color: AppColors.black,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 16.h,
          ),
          Material(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: SizedBox(
                    height: 150.h,
                    width: 200.w,
                    child: Image.asset(arguments.image,fit: BoxFit.cover,),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 18),
                  child: CustomText.items(text: arguments.branchName, size: 15),
                ),
                SizedBox(
                  height: 15.h,
                ),
                ListTile(
                  title: CustomText.items(text: 'Address', size: 15),
                  leading: const Icon(Icons.location_off_sharp),
                  trailing: CustomText.items(text: arguments.address, size: 15),
                ),
                const Divider(),
                ListTile(
                  title: CustomText.items(text: 'Ориентир', size: 15),
                  leading: const Icon(Icons.location_on_outlined),
                  trailing: CustomText.items(text: 'no data', size: 15),
                ),
                const Divider(),
                ListTile(
                  title: CustomText.items(text: 'Часы работы', size: 15),
                  leading: const Icon(Icons.access_time),
                  trailing: CustomText.items(
                      text: '${arguments.workStart}-${arguments.workEnd}',
                      size: 15),
                ),
                const Divider(),
                ListTile(
                  title: CustomText.items(text: 'Номер телефона', size: 15),
                  leading: const Icon(Icons.phone),
                  trailing:
                      CustomText.items(text: arguments.phoneNumber, size: 15),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
