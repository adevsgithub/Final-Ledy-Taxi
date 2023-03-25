import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:final_ledy_taxi_app/ui/pages/pageView.dart';
import 'package:final_ledy_taxi_app/ui/splash/loading_screen.dart';
import 'package:final_ledy_taxi_app/utils/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashPage extends StatelessWidget {
  static const routeName = '/';
  const SplashPage({super.key});

  Future<Object> _isInitial() async {
    var prefs = await SharedPreferences.getInstance();
    var isInitial = prefs.getBool(Project.isInitial);
    // prefs.clear();
    return isInitial ?? true ? OnBoardingPage() : LoadingScreen();
  }

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
      futureNavigator: _isInitial(),
      showLoader: false,
      // durationInSeconds: 1,
    );
  }
}
