import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/app_colors.dart';

class UserLcPanel extends StatelessWidget {
  const UserLcPanel({super.key, required this.funcBtn});
  final Function() funcBtn;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 60.w,
              height: 2.h,
              color: AppColors.primaryClr,
            ),
          ],
        ),
        SizedBox(
          height: 40.h,
          width: 340.w,
          child: textrow(),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 20),
          child: textForm(),
        ),
        SizedBox(
          height: 150,
          child: listViuv(),
        ),
      ],
    );
  }

  ListView listViuv() {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          margin: const EdgeInsets.all(8),
          height: 132.h,
          width: 62.w,
          decoration: BoxDecoration(
              // color: AppColors.primaryClr,
              borderRadius: const BorderRadius.all(Radius.circular(26)),
              border: Border.all(color: AppColors.primaryClr)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text(
                '16 km',
                style: TextStyle(color: AppColors.primaryClr, fontSize: 16),
              ),
              Image.asset(
                'assets/icons/love_ic.png',
                cacheHeight: 24,
                cacheWidth: 24,
              ),
              const Text(
                'Uyim',
                style: TextStyle(color: AppColors.primaryClr, fontSize: 16),
              ),
            ],
          ),
        );
      },
      itemCount: 7,
    );
  }

  TextField textForm() {
    return TextField(
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xFFF0F0F0),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFFFAFAFA)),
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
        hintText: 'Qayerga boramiz?',
        suffixIcon: GestureDetector(
          onTap: funcBtn,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('|   '),
              Image.asset(
                'assets/icons/global_ic.png',
                cacheHeight: 24,
                cacheWidth: 24,
              )
            ],
          ),
        ),
      ),
    );
  }

  Row textrow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Salom',
          style: TextStyle(fontSize: 20.sp, color: AppColors.primaryClr),
        ),
        Text(
          ' Madina!',
          style: TextStyle(fontSize: 20.sp),
        ),
      ],
    );
  }
}
