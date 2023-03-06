import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:final_ledy_taxi_app/ui/pages/pageView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  static const routeName = '/';

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return EasySplashScreen(
      logoWidth: 250.w,
      logo: Image.asset(
        'assets/images/solash_image.png',
        cacheHeight: 157,
        cacheWidth: 125,
      ),
      backgroundColor: Colors.white,
      navigator: OnBoardingPage(),
      durationInSeconds: 1,
    );
  }
}
