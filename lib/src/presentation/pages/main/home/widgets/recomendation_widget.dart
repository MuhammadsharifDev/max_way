import 'package:flutter/material.dart';
import 'package:exam_max_way/src/presentation/pages/main/home/widgets/product_item_widget.dart';

class RecommendationsWidget extends StatelessWidget {
  const RecommendationsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(
          top: 16,
          bottom: 16,
        ),
        child: Container(
          width: double.infinity,
          height: 300,
          decoration: BoxDecoration(
            color: Colors.white70,
            borderRadius: BorderRadius.circular(12),
          ),
          child:  const Padding(
            padding: EdgeInsets.only(top: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: 16,
                  ),
                  child: Text(
                    'Наши рекомендации',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                  ),
                ),
                ContainerWidget(
                    text: '35 000 сум', image: 'assets/png/ploff7.png'),
                ContainerWidget(
                    text: '38 000 сум', image: 'assets/png/ploff8.png'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}