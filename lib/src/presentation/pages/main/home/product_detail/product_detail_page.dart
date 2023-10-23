import 'package:exam_max_way/src/core/widgets/toast_wdget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:exam_max_way/src/core/utils/app_colors.dart';
import 'package:exam_max_way/src/core/widgets/global_button.dart';
import 'package:exam_max_way/src/core/widgets/text_items.dart';
import 'package:exam_max_way/src/domain/network/saved_product.dart';
import 'package:exam_max_way/src/presentation/bloc/product_detail/product_detail_bloc.dart';
import 'package:exam_max_way/src/presentation/pages/main/home/product_detail/models/product_detail_argument.dart';

class ProductDetail extends StatefulWidget {
  final ProductDetailArgument arguments;

  const ProductDetail({
    required this.arguments,
    super.key,
  });

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  String? svet;


  @override
  Widget build(BuildContext context) {
    var saveProductBox = Hive.box('saveProducts');
    return BlocConsumer<ProductDetailBloc, ProductDetailState>(
      listener: (context, state) {},
      builder: (_, state) {
        return Scaffold(
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                toolbarHeight: 230,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  background: Image.asset(
                    'assets/png_image/burger.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 100.h,
                        width: double.infinity,
                        child: Material(
                          borderRadius: BorderRadius.circular(15),
                          color: AppColors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText.items(
                                    text: widget.arguments.productName,
                                    size: 20),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Row(
                                  children: [
                                    CustomText.items(
                                        text: widget
                                                .arguments.productDescription ??
                                            '',
                                        size: 15,
                                        color: AppColors.defaultGrey),
                                    const Spacer(),
                                    CustomText.items(
                                        text:
                                            '${widget.arguments.outPrice.toString()} ${widget.arguments.currency}',
                                        size: 15,
                                        color: AppColors.black),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          bottomNavigationBar: SizedBox(
            height: 130.h,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        height: 35.h,
                        width: 110.w,
                        child: Material(
                          color: AppColors.white,
                          shape: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                onPressed: () {
                                  context.read<ProductDetailBloc>().add(
                                        RemoveProductEvent(
                                            removePrice: state.coast -
                                                widget.arguments.outPrice
                                                    .toInt(),
                                            decrementCount: state.number - 1),
                                      );
                                },
                                icon: const Icon(Icons.remove),
                              ),
                              CustomText.items(
                                  text: state.number.toString(), size: 18),
                              IconButton(
                                onPressed: () {
                                  context.read<ProductDetailBloc>().add(
                                        AddProductEvent(
                                          // qosh: widget.arguments.outPrice()+1,
                                          incrementCount: state.number + 1,
                                          addPrice: state.coast +
                                              widget.arguments.outPrice.toInt(),
                                        ),
                                      );
                                },
                                icon: const Icon(Icons.add),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Spacer(),
                      CustomText.items(
                          text:
                              '${state.coast.toString()} ${widget.arguments.currency}',
                          size: 20),
                    ],
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  GlobalButton(
                    text: 'Добавить в корзину ',
                    onPressed: () {
                      saveProductBox.add(SavedProduct(
                          name: widget.arguments.productName,
                          description: widget.arguments.outPrice.toString(),
                          coast: widget.arguments.productName,
                          image: 'assets/png_image/burger.jpg'),
                      );
                        if(saveProductBox.isNotEmpty){
                          getMyToast(message: 'Saved Product');
                        }else{
                           showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return Text('Error',style: TextStyle(color: Colors.red),);
                              },
                          );
                        }
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
