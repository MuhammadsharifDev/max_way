import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:exam_max_way/src/core/utils/app_icons.dart';
import 'package:exam_max_way/src/core/widgets/text_items.dart';

class TimeDeliverWidget extends StatefulWidget {
  const TimeDeliverWidget({super.key, required this.value2, });
   final int value2;

  @override
  State<TimeDeliverWidget> createState() => _TimeDeliverWidgetState();
}

class _TimeDeliverWidgetState extends State<TimeDeliverWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText.items(text: 'Время доставка', size: 17),
        ListTile(
          leading: SvgPicture.asset(AppIcons.motorbikeIcon),
          title: CustomText.items(text: 'Срочная доставка', size: 15),
          trailing: Radio(
            activeColor: Colors.orange,
            value: 1,
            groupValue: widget.value2,
            onChanged: (value) => setState(() {
              value!=widget.value2;
            }),
          ),
        ),
        const Divider(thickness: 1,),
        ListTile(
          leading: SvgPicture.asset(AppIcons.clockIcon),
          title: CustomText.items(text: 'Доставка по расписанию', size: 15),
          trailing: Radio(
            activeColor: Colors.orange,
            value: 2,
            groupValue: widget.value2,
            onChanged: (value) => setState(() {
              value!=widget.value2;
            }),
          ),
        ),
      ],
    );
  }
}
