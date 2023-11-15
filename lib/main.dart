import 'package:ecommerce/myTheme.dart';
import 'package:ecommerce/splash%20screen.dart';
import 'package:ecommerce/ui/authentication/Register/register%20screen.dart';
import 'package:ecommerce/ui/authentication/login/login%20screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(430, 932),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            initialRoute: SplashScreen.routeName,
            routes: {
              RegisterScreen.routeName: (context) => RegisterScreen(),
              LoginScreen.routeName: (context) => LoginScreen(),
              SplashScreen.routeName: (context) => SplashScreen(),
            },
            theme: MyTheme.lightTheme,
          );
        });
  }
}
