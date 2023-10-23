import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:exam_max_way/src/core/routes/routes_name.dart';
import 'package:exam_max_way/src/core/widgets/global_button.dart';
import 'package:exam_max_way/src/domain/network/saved_product.dart';

class BasketPage extends StatefulWidget {
  const BasketPage({super.key,});

  @override
  State<BasketPage> createState() => _BasketPageState();
}

class _BasketPageState extends State<BasketPage> {
  var saveProductBox = Hive.box('saveProducts');

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Basket Page"),
      ),
      body: ListView.builder(
        shrinkWrap: true,
        itemCount:saveProductBox.values.length,
          itemBuilder: (context, index) {
          List<SavedProduct> cars=saveProductBox.values.toList().cast();
            return ListTile(
              title: Text(cars[index].name),
              subtitle: Text(cars[index].description),
              trailing: SizedBox(
                height: 40,
                width: 40,
                child: Image.asset(cars[index].image),
              )
            );
          },
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SizedBox(
            height: 52.h,
            child: GlobalButton(
                onPressed: () =>
                    Navigator.pushNamed(context, RouteName.orderCreate),
                text: 'Оформить заказ'),
          ),
        ),
      ),
    );
  }
}
