import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:exam_max_way/src/core/routes/app_routes.dart';
import 'package:exam_max_way/src/core/routes/routes_name.dart';
import 'package:exam_max_way/src/domain/network/saved_product.dart';
import 'package:exam_max_way/src/injecter_container.dart';
import 'package:exam_max_way/src/presentation/bloc/home/home_bloc.dart';
import 'package:exam_max_way/src/presentation/bloc/main/main_bloc.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentary = await getApplicationDocumentsDirectory();
  Hive.init(appDocumentary.path);
  await Hive.openBox("saveProducts");
  Hive.registerAdapter(SavedProductAdapter());
  await init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => sl<MainBloc>()),
        BlocProvider(create: (_) => sl<HomeBloc>()),
      ],
      child: const KeyboardDismisser(
        child: ScreenUtilInit(
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            initialRoute: RouteName.main,
            onGenerateRoute: AppRoutes.onGenerateRoute,
          ),
        ),
      ),
    );
  }
}

/// flutter packages pub run build_runner build --delete-conflicting-outputs
/// d4b1658f-3271-4973-8591-98a82939a664
