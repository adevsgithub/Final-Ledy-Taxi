// ignore_for_file: file_names

import 'package:easy_localization/easy_localization.dart';
import 'package:final_ledy_taxi_app/utils/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../utils/app_colors.dart';
import '../../utils/button/elevetd_btm.dart';
import 'bottom_sheet/lang_btm_sheet.dart';
import 'registry/register_page_1.dart';

class OnBoardingPage extends StatefulWidget {
  OnBoardingPage({super.key});
  static const routeName = '/onBoardingPage';
  static int activindex = 0;
  final box = GetStorage();
  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final controller = PageController(viewportFraction: 0.8, keepPage: false);
  int acTiveIndex = 0;

  _doNotOpen() async {
    var prefs = await SharedPreferences.getInstance();
    prefs.setBool(Project.isInitial, false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text('lang').tr()),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 6.w),
                  child: TextButton(
                    onPressed: () async {
                      await _doNotOpen();
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) {
                          return RegisterPage1();
                        }),
                      );
                    },
                    child: Text(
                      'skip'.tr(),
                      style: TextStyle(
                        fontSize: 16,
                        color: OnBoardingPage.activindex.isEven ? AppColors.primaryClr : const Color(0xFFFFB7D4),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 450.h,
              child: PageView(
                controller: controller,
                // ignore: prefer_const_literals_to_create_immutables
                onPageChanged: (index) {
                  acTiveIndex = index;
                  setState(() {});
                },
                children: const [
                  ViewPage1(),
                  ViewPage2(),
                  ViewPage3(),
                ],
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            SmoothPageIndicator(
              controller: controller,
              count: 3,
              effect: ExpandingDotsEffect(
                  radius: 8,
                  spacing: 10,
                  strokeWidth: 1,
                  dotHeight: 8.h,
                  dotWidth: 8.w,
                  dotColor: AppColors.primaryClr.withOpacity(0.1),
                  activeDotColor: AppColors.primaryClr),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: ElevetedBtn(
                onPressed: () async {
                  if (acTiveIndex == 2) {
                    await _doNotOpen();
                    if (mounted) {}
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) {
                        return RegisterPage1();
                      }),
                      (route) => false,
                    );
                  } else {
                    controller.nextPage(duration: const Duration(milliseconds: 500), curve: Curves.fastOutSlowIn);
                  }
                },
                title: acTiveIndex == 2 ? "Start" : 'Next',
              ),
            ),
            GestureDetector(
              onTap: () {
                showModalBottomSheet(
                    backgroundColor: Colors.white,
                    context: context,
                    builder: (context) {
                      return const LanguageBtmSheet();
                    });
              },
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                padding: const EdgeInsets.symmetric(vertical: 12),
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  // border: Border.all(width: 0), // Set border width
                  borderRadius: BorderRadius.all(Radius.circular(10.0)), //
                  color: Color(0xFFFFFFFF),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(right: 30, left: 30),
                      child: Icon(
                        Icons.language,
                        size: 32,
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Til'.tr(),
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 6.h,
                          ),
                          Text('${'Hozirgi til'.tr()} ${'currentLangTitle'.tr()}}')
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ViewPage3 extends StatelessWidget {
  const ViewPage3({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 300.w,
          height: 300.h,
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.scaleDown,
              image: AssetImage(
                'assets/images/vector2.png',
              ),
            ),
          ),
          child: Image.asset('assets/images/onboardingimage2.png'),
        ),
        SizedBox(
          height: 30.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Ayollar va bolalar uchun ',
              style: TextStyle(
                color: AppColors.blcColor,
                fontSize: 20.sp,
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'xavfsiz ',
              style: TextStyle(
                color: AppColors.primaryClr,
                fontSize: 20.sp,
              ),
            ),
            Text(
              'taksi xizmati',
              style: TextStyle(
                fontSize: 20.sp,
                color: AppColors.blcColor,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class ViewPage2 extends StatelessWidget {
  const ViewPage2({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 400.w,
          height: 300.h,
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.scaleDown,
              image: AssetImage(
                'assets/images/vector1.png',
              ),
            ),
          ),
          child: Image.asset('assets/images/onboardingimage1.png'),
        ),
        SizedBox(
          height: 30.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Bizda barcha haydovchilar',
              style: TextStyle(
                color: AppColors.blcColor,
                fontSize: 20.sp,
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'ayollardan ',
              style: TextStyle(
                color: AppColors.primaryClr,
                fontSize: 20.sp,
              ),
            ),
            Text(
              ' iborat',
              style: TextStyle(
                fontSize: 20.sp,
                color: AppColors.blcColor,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class ViewPage1 extends StatelessWidget {
  const ViewPage1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 450.w,
          height: 300.h,
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.scaleDown,
              image: AssetImage(
                'assets/images/vector0.png',
              ),
            ),
          ),
          child: Image.asset('assets/images/onboardingimage0.png'),
        ),
        SizedBox(
          height: 30.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Ishonchli ',
              style: TextStyle(
                color: AppColors.primaryClr,
                fontSize: 20.sp,
              ),
            ),
            Text(
              ' haydovchilar',
              style: TextStyle(
                color: AppColors.blcColor,
                fontSize: 20.sp,
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'xizmatidan foydalaning!',
              style: TextStyle(
                fontSize: 20.sp,
                color: AppColors.blcColor,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class DotIndicator extends StatelessWidget {
  const DotIndicator({
    Key? key,
    required this.isActive,
  }) : super(key: key);
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      decoration: BoxDecoration(
        color: AppColors.primaryClr,
        borderRadius: BorderRadius.circular(10),
      ),
      height: 8.h,
      width: isActive ? 24.w : 8,
      duration: const Duration(
        milliseconds: 500,
      ),
      // color: AppColors.primaryClr,
    );
  }
}
