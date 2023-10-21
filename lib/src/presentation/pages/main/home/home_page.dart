import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:exam_max_way/src/core/routes/routes_name.dart';
import 'package:exam_max_way/src/core/utils/app_colors.dart';
import 'package:exam_max_way/src/injecter_container.dart';
import 'package:exam_max_way/src/presentation/bloc/home/home_bloc.dart';
import 'package:exam_max_way/src/presentation/pages/location/pages/location_page.dart';
import 'product_detail/models/product_detail_argument.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController searchController = TextEditingController();
  final _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<HomeBloc>()
        ..add(CategoryEvent())
        ..add(BannerEvent())
        ..add(ProductCategoryEvent()),
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: AppColors.whiteColors,
            appBar: AppBar(
              backgroundColor: Colors.white,
              toolbarHeight: 100.h,
              elevation: 0,
              automaticallyImplyLeading: false,
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LocationPage()));
                      },
                      icon: const Icon(
                        Icons.location_on_outlined,
                        color: AppColors.blackColors,
                      ),
                  ),
                  TextFormField(
                    controller: searchController,
                    decoration: InputDecoration(
                      fillColor: AppColors.whiteColors,
                      filled: true,
                      prefixIcon: const Icon(Icons.search_rounded),
                      hintText: 'Search...',
                      // hintStyle: AppStyle.SFProDisplay24xW500White,
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: AppColors.whiteColors),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ],
              ),
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(50.h),
                child: Padding(
                  padding: EdgeInsets.all(8.w),
                  child: SizedBox(
                    height: 60.h,
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      padding: EdgeInsets.symmetric(horizontal: 8.w),
                      scrollDirection: Axis.horizontal,
                      itemCount: state.categoryResponse?.categories?.length,
                      itemBuilder: (context, index) {
                        bool isActive = state.selectIndex.contains(index);
                        return GestureDetector(
                          onTap: () {
                            context
                                .read<HomeBloc>()
                                .add(SelectCategoryEvent(index: index));
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.w),
                            child: Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: isActive
                                        ? Colors.amber
                                        : AppColors.whiteColors,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 16.w, vertical: 10.w),
                                    child: Center(
                                      child: Text(state.categoryResponse
                                          ?.categories?[index].title?.uz ??
                                          ''),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
            body: state.stateStatus == StateStatus.loading
                ? const Center(
              child: CircularProgressIndicator.adaptive(),
            )
                : ListView(
              children: [
                SizedBox(
                  height: 16.h,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(12.r),
                        topLeft: Radius.circular(12.r)),
                  ),
                  height: 172.h,
                  // width: double.infinity,
                  child: Padding(
                    padding: EdgeInsets.all(8.w),
                    child: PageView.builder(
                        controller: _controller,
                        physics: const BouncingScrollPhysics(),
                        itemCount: state.bannerResponse?.banners?.length,
                        itemBuilder: (context, index) {
                          if (state.bannerResponse?.banners ==
                              ConnectionState.waiting) {
                            return const Center(
                                child: CircularProgressIndicator());
                          }
                          return Padding(
                            padding:
                            EdgeInsets.symmetric(horizontal: 8.w),
                            child: Column(
                              children: [
                                Container(
                                  width: 343.w,
                                  height: 153.h,
                                  decoration: BoxDecoration(
                                    color: AppColors.whiteColors,
                                    borderRadius:
                                    BorderRadius.circular(12.r),
                                  ),
                                  child: state.bannerResponse
                                      ?.banners?[index].image ==
                                      null
                                      ? const SizedBox()
                                      : Image.network(
                                    '${state.bannerResponse!.banners![index].image}',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),
                  ),
                ),
                Container(
                  height: 16.h,
                  width: double.infinity.w,
                  decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(12.r),
                          bottomRight: Radius.circular(12.r))),
                  child: Center(
                    child: SmoothPageIndicator(
                        controller: _controller,
                        count: 2,
                        effect: const ExpandingDotsEffect(
                            activeDotColor: AppColors.defaultYellow,
                            dotColor: AppColors.whiteColors,
                            dotHeight: 4,
                            dotWidth: 8,
                            spacing: 4)),
                  ),
                ),
                SizedBox(
                  height: 16.h,
                ),
                if (state.productsWithCategoryResponse != null) ...{
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: state
                        .productsWithCategoryResponse!.categories!.length,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      final item = state.productsWithCategoryResponse!
                          .categories![index];
                      if (state.productsWithCategoryResponse!
                          .categories![index].products ==
                          null) {
                        return const SizedBox();
                      }
                      if (state.selectIndex.isEmpty) {
                        return Container(
                          padding:
                          const EdgeInsets.symmetric(vertical: 12),
                          margin: const EdgeInsets.symmetric(vertical: 8),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20)),
                          child: Padding(
                            padding:
                            EdgeInsets.symmetric(horizontal: 12.w),
                            child: ListView.builder(
                                itemCount: state
                                    .productsWithCategoryResponse!
                                    .categories![index]
                                    .products ==
                                    null
                                    ? 0
                                    : state
                                    .productsWithCategoryResponse!
                                    .categories![index]
                                    .products!
                                    .length +
                                    1,
                                shrinkWrap: true,
                                physics:
                                const NeverScrollableScrollPhysics(),
                                itemBuilder: (context, i) {
                                  if (i == 0) {
                                    return Padding(
                                      padding:
                                      const EdgeInsets.only(top: 10),
                                      child: Text(
                                        (item.title?.uz).toString(),
                                        style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    );
                                  } else {
                                    final productItem = state
                                        .productsWithCategoryResponse!
                                        .categories![index]
                                        .products![i - 1];

                                    return InkWell(
                                      onTap: () {
                                        Navigator.pushNamed(
                                            context, RouteName.details,
                                            arguments:
                                            ProductDetailArgument(
                                              currency: productItem.currency??"ma'lumot y'q",
                                              outPrice: productItem.outPrice??0,
                                              productName: productItem.title?.uz??"ma'lumot y'q",
                                                productDescription: productItem.description?.uz??"ma'lumot y'q",
                                                productId: productItem.id!),);
                                      },
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                CrossAxisAlignment
                                                    .start,
                                                children: [
                                                  SizedBox(
                                                    width:
                                                    MediaQuery.sizeOf(
                                                        context)
                                                        .width -
                                                        150,
                                                    child: Text(
                                                      '${productItem.title!.uz}',
                                                      style:
                                                      const TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                        FontWeight
                                                            .w400,
                                                      ),
                                                      overflow:
                                                      TextOverflow
                                                          .ellipsis,
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 4,
                                                  ),
                                                  Text(
                                                      productItem
                                                          .description!
                                                          .uz ??
                                                          '',
                                                      style:
                                                      const TextStyle(
                                                        fontSize: 16,
                                                        color:
                                                        Colors.grey,
                                                      )),
                                                  SizedBox(
                                                    height: 20.h,
                                                  ),
                                                  Text(
                                                    "${productItem.outPrice} so'm",
                                                    style:
                                                    const TextStyle(
                                                        fontSize: 16),
                                                  ),
                                                ],
                                              ),
                                              const Expanded(
                                                  child: SizedBox()),
                                              state
                                                  .productsWithCategoryResponse!
                                                  .categories![0]
                                                  .products![index]
                                                  .image!
                                                  .isEmpty
                                                  ? SizedBox(
                                                  width: 120.w,
                                                  height: 120.h,
                                                  child: Image.asset(
                                                      'assets/png_image/splash.png'))
                                                  : Image.network(
                                                state
                                                    .productsWithCategoryResponse!
                                                    .categories![0]
                                                    .products![
                                                index]
                                                    .image
                                                    .toString(),
                                              ),
                                            ],
                                          ),
                                          if (i !=
                                              state
                                                  .productsWithCategoryResponse!
                                                  .categories![index]
                                                  .products!
                                                  .length) ...{
                                            Container(
                                              color: Colors.grey,
                                              height: 0.4,
                                            )
                                          },
                                        ],
                                      ),
                                    );
                                  }
                                }),
                          ),
                        );
                      } else {
                        if (state.selectIndex.contains(index)) {
                          return Container(
                            padding:
                            const EdgeInsets.symmetric(vertical: 12),
                            margin:
                            const EdgeInsets.symmetric(vertical: 8),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20)),
                            child: Padding(
                              padding:
                              EdgeInsets.symmetric(horizontal: 12.w),
                              child: ListView.builder(
                                  itemCount: state
                                      .productsWithCategoryResponse!
                                      .categories![index]
                                      .products ==
                                      null
                                      ? 0
                                      : state
                                      .productsWithCategoryResponse!
                                      .categories![index]
                                      .products!
                                      .length +
                                      1,
                                  shrinkWrap: true,
                                  physics:
                                  const NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, i) {
                                    if (i == 0) {
                                      return Padding(
                                        padding: const EdgeInsets.only(
                                            top: 10),
                                        child: Text(
                                          item.toString(),
                                          style: const TextStyle(
                                              fontSize: 20,
                                              fontWeight:
                                              FontWeight.w600),
                                        ),
                                      );
                                    } else {
                                      final productItem = state
                                          .productsWithCategoryResponse!
                                          .categories![index]
                                          .products![i - 1];
                                      return Column(
                                        children: [
                                          Row(
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                CrossAxisAlignment
                                                    .start,
                                                children: [
                                                  SizedBox(
                                                    width:
                                                    MediaQuery.sizeOf(
                                                        context)
                                                        .width -
                                                        150,
                                                    child: Text(
                                                      '${productItem.title!.uz}',
                                                      style:
                                                      const TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                        FontWeight
                                                            .w400,
                                                      ),
                                                      overflow:
                                                      TextOverflow
                                                          .ellipsis,
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 4,
                                                  ),
                                                  Text(
                                                      productItem
                                                          .description!
                                                          .uz ??
                                                          '',
                                                      style:
                                                      const TextStyle(
                                                        fontSize: 16,
                                                        color:
                                                        Colors.grey,
                                                      )),
                                                  SizedBox(
                                                    height: 20.h,
                                                  ),
                                                  Text(
                                                    "${productItem.outPrice} so'm",
                                                    style:
                                                    const TextStyle(
                                                        fontSize: 16),
                                                  ),
                                                ],
                                              ),
                                              const Expanded(
                                                  child: SizedBox()),
                                              state
                                                  .productsWithCategoryResponse!
                                                  .categories![0]
                                                  .products![index]
                                                  .image!
                                                  .isEmpty
                                                  ? SizedBox(
                                                  width: 120.w,
                                                  height: 120.h,
                                                  child: Image.asset(
                                                      'assets/png_image/splash.png'))
                                                  : Image.network(
                                                state
                                                    .productsWithCategoryResponse!
                                                    .categories![0]
                                                    .products![
                                                index]
                                                    .image
                                                    .toString(),
                                              ),
                                            ],
                                          ),
                                          if (i !=
                                              state
                                                  .productsWithCategoryResponse!
                                                  .categories![index]
                                                  .products!
                                                  .length) ...{
                                            Container(
                                              color: Colors.grey,
                                              height: 0.4,
                                            )
                                          },
                                        ],
                                      );
                                    }
                                  }),
                            ),
                          );
                        } else {
                          return const SizedBox();
                        }
                      }
                    },
                  ),
                }
              ],
            ),
          );
        },
      ),
    );
  }
}