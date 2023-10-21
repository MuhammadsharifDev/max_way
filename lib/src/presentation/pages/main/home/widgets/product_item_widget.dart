import 'package:flutter/material.dart';
import 'package:exam_max_way/src/core/routes/app_routes.dart';
import 'package:exam_max_way/src/core/routes/routes_name.dart';

class ContainerWidget extends StatelessWidget {
  const ContainerWidget({Key? key, required this.text, required this.image})
      : super(key: key);
  final String image;
  final String text;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, RouteName.home);
      },
      child: SizedBox(
        width: double.infinity,
        height: 125,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Чайханский плов',
                    ),
                    const Text(
                      'Своим именем чайханский плов обязан \nстарой ташкентской традиции «ош»...',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff858585),
                      ),
                    ),
                    Text(
                      text,
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Image.asset(
                    image,
                    width: 88,
                    height: 88,
                  ),
                ),
              ],
            ),
            Image.asset(
              'assets/png/Rectangle.png',
            ),
          ],
        ),
      ),
    );
  }
}
