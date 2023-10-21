import 'package:flutter/material.dart';
import 'package:exam_max_way/src/presentation/pages/main/home/widgets/product_item_widget.dart';

class DiscountWidget extends StatelessWidget {
  const DiscountWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(top: 12, bottom: 12),
        child: Container(
          width: double.infinity,
          height: 550,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(12),
            ),
          ),
          child: const Padding(
            padding: EdgeInsets.only(left: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 16),
                  child: Text(
                    'Со скидкой', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                  ),
                ),
                ContainerWidget(
                    text: '35 000 сум', image: 'assets/png/ploff1.png'),
                ContainerWidget(
                    text: '47 000 сум', image: 'assets/png/ploff2.png'),
                ContainerWidget(
                    text: '41 000 сум', image: 'assets/png/ploff3.png'),
                ContainerWidget(
                    text: '52 000 сум', image: 'assets/png/ploff4.png'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}