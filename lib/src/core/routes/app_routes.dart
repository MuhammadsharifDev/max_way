import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:exam_max_way/src/core/routes/routes_name.dart';
import 'package:exam_max_way/src/injecter_container.dart';
import 'package:exam_max_way/src/presentation/bloc/auth/auth_bloc.dart';
import 'package:exam_max_way/src/presentation/bloc/product_detail/product_detail_bloc.dart';
import 'package:exam_max_way/src/presentation/bloc/profile/profile_bloc.dart';
import 'package:exam_max_way/src/presentation/main_page.dart';
import 'package:exam_max_way/src/presentation/pages/auth/check_code/check_code_page.dart';
import 'package:exam_max_way/src/presentation/pages/auth/login/login_page.dart';
import 'package:exam_max_way/src/presentation/pages/location/pages/location_page.dart';
import 'package:exam_max_way/src/presentation/pages/main/home/home_page.dart';
import 'package:exam_max_way/src/presentation/pages/main/home/product_detail/models/product_detail_argument.dart';
import 'package:exam_max_way/src/presentation/pages/main/home/product_detail/product_detail_page.dart';
import 'package:exam_max_way/src/presentation/pages/main/profile/branchs/branch_arguments.dart';
import 'package:exam_max_way/src/presentation/pages/main/profile/branchs/branchs_page.dart';
import 'package:exam_max_way/src/presentation/pages/main/profile/branchs/detail/detail_page.dart';
import 'package:exam_max_way/src/presentation/pages/main/profile/edit/edit_page.dart';
import 'package:exam_max_way/src/presentation/pages/main/profile/my_location/my_location_page.dart';
import 'package:exam_max_way/src/presentation/pages/main/profile/setting/setting_page.dart';
import 'package:exam_max_way/src/presentation/pages/order_create/pages/order_create_page.dart';
import 'package:exam_max_way/src/presentation/pages/splash/splash_page.dart';

sealed class AppRoutes {
  AppRoutes._();

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.splash:
        return MaterialPageRoute(builder: (_) => const SplashPage());
      case RouteName.CheckCodePage:
        return MaterialPageRoute(builder: (_) => const CheckCodePage());
      case RouteName.main:
        return MaterialPageRoute(builder: (_) => const MainPage());
      case RouteName.bottomNav:
        return MaterialPageRoute(builder: (_) => const Placeholder());
      case RouteName.details:
        return MaterialPageRoute(
          builder: (_) {
            var argument = settings.arguments as ProductDetailArgument;
            return BlocProvider(
              create: (context) => sl<ProductDetailBloc>()
                ..add(LoadDataEvent(productId: argument.productId)),
              child: ProductDetail(arguments: argument),
            );
          },
        );
      case RouteName.login:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            child: const LoginPage(),
            create: (context) => sl<AuthBloc>(),
          ),
        );
      case RouteName.home:
        return MaterialPageRoute(builder: (_) => const HomePage());
      case RouteName.orderCreate:
        return MaterialPageRoute(builder: (_) => const OrderCreatePage());
      case RouteName.location:
        return MaterialPageRoute(builder: (_) => const LocationPage());
      case RouteName.editPage:
        return MaterialPageRoute(builder: (_) => const EditPage());
      case RouteName.branchsPage:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => sl<ProfileBloc>()..add(BranchsEvent()),
            child: const AllBranchsPage(),
          ),
        );
      case RouteName.branchsDetailPage:
        var argument = settings.arguments as BranchArguments;
        return MaterialPageRoute(
          builder: (_) => BranchsDetailPage(arguments: argument),
        );
      case RouteName.settingPage:
        return MaterialPageRoute(builder: (_) => const SettingPage());
      case RouteName.myLocationPage:
        return MaterialPageRoute(builder: (_) => const MyLocationPage());
      default:
        return MaterialPageRoute(builder: (_) => const Scaffold());
    }
  }
}
