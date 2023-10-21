import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:exam_max_way/src/core/routes/routes_name.dart';
import 'package:exam_max_way/src/core/utils/app_colors.dart';
import 'package:exam_max_way/src/core/utils/app_images.dart';
import 'package:exam_max_way/src/core/widgets/text_items.dart';
import 'package:exam_max_way/src/presentation/bloc/profile/profile_bloc.dart';
import 'package:exam_max_way/src/presentation/pages/main/profile/branchs/branch_arguments.dart';

class AllBranchsPage extends StatelessWidget {
  const AllBranchsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: AppColors.black,
          ),
        ),
        elevation: 0,
        backgroundColor: AppColors.white,
        title:
            CustomText.items(text: 'Филиалы', size: 20, color: AppColors.black),
      ),
      body: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          return state.status==Status.loading
          ?const Center(child: CircularProgressIndicator.adaptive(),)
              :Column(
            children: [
              SizedBox(
                height: 15.h,
              ),
              Expanded(
                child: Material(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(15),
                  child: ListView.builder(
                    itemCount: state.branchsResponse?.branches?.length,
                    itemBuilder: (context, index) {
                      var branch = state.branchsResponse?.branches?[index];
                      return ListTile(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            RouteName.branchsDetailPage,
                            arguments:BranchArguments(
                                branchName: branch?.name??'',
                                phoneNumber: branch?.phone?.toString()??'',
                                image: 'assets/png_image/ploff_logo.jpg',
                                address: branch?.address??'',
                                workEnd: branch?.workHourEnd?.toString()??'',
                                workStart: branch?.workHourStart.toString()??''),
                          );
                        },
                        leading: SizedBox(
                          height: 56.h,
                          width: 56,
                          child: Image.asset(
                            AppImages.ploffLogo,
                            fit: BoxFit.cover,
                          ),
                        ),
                        title: CustomText.items(
                            text: branch?.name ?? 'No data', size: 17),
                        subtitle: CustomText.items(
                            text: branch?.address ?? 'No data',
                            size: 15,
                            color: AppColors.defaultGrey),
                      );
                    },
                  ),
                ),
              ),
              const Divider(),
            ],
          );
        },
      ),
    );
  }
}
