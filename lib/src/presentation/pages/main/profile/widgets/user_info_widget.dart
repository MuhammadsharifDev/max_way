import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:exam_max_way/src/core/routes/app_routes.dart';
import 'package:exam_max_way/src/core/routes/routes_name.dart';
import 'package:exam_max_way/src/core/utils/app_colors.dart';
import 'package:exam_max_way/src/core/utils/app_icons.dart';
import 'package:exam_max_way/src/core/widgets/text_items.dart';

class UserInfoWidget extends StatelessWidget {
  const UserInfoWidget({super.key, required this.username, required this.userPhoneNumber});
  final String username;
  final String userPhoneNumber;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.only(left: 16,right: 16),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10.h,),
                CustomText.items(text: username, size: 20),
                SizedBox(height: 10.h,),
                CustomText.items(text: userPhoneNumber, size: 15,color: AppColors.defaultGrey),
              ],
            ),
            const Spacer(),
            GestureDetector(
              onTap: (){
                Navigator.pushNamed(context, RouteName.editPage);
              },
              child: SvgPicture.asset(AppIcons.editIcon),
            )
          ],
        ),
      ),
    );
  }
}
