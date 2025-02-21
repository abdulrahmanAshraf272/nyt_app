import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nyt_app/core/dependency_injection.dart';
import 'package:nyt_app/core/routes/app_routes.dart';

void main() {
  setupGetIt();
  runApp(MyApp(appRoutes: AppRoutes()));
}

class MyApp extends StatelessWidget {
  final AppRoutes appRoutes;
  const MyApp({super.key, required this.appRoutes});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          onGenerateRoute: appRoutes.generateRoute,
        );
      },
    );
  }
}
