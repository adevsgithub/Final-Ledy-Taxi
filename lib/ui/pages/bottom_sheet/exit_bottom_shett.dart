import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/app_colors.dart';

class ExitBottomSheet extends StatelessWidget {
  const ExitBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 275.h,
      padding: const EdgeInsets.only(top: 6),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(
            30,
          ),
          topRight: Radius.circular(
            30,
          ),
        ),
      ),
      child: Column(
        children: [
          Container(
            height: 2.h,
            width: 40.w,
            color: AppColors.primaryClr,
          ),
          SizedBox(
            height: 20.h,
          ),
          Text(
            'Chiqish',
            style: TextStyle(fontSize: 18.sp, color: AppColors.primaryClr),
          ),
          Divider(
            color: Color.fromARGB(255, 37, 29, 29),
          ),
          Text(
            'Nahotki bizni tark qilyapsiz?',
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
          ),
          Row(
            children: [
              ElevatedButton(
                style: btmStyle(),
                onPressed: () {},
                child: Text(
                  'Bekor qilish',
                  style: TextStyle(
                    color: AppColors.blcColor,
                    fontSize: 14.sp,
                  ),
                ),
              ),
              ElevatedButton(
                style: btmStyle(),
                onPressed: () {},
                child: Text(
                  'Bekor qilish',
                  style: TextStyle(
                    color: AppColors.blcColor,
                    fontSize: 14.sp,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  ButtonStyle btmStyle() {
    return ElevatedButton.styleFrom(
      minimumSize: const Size(160, 60),
      backgroundColor: Color(0xFFF6F6F6),
      fixedSize: const Size(
        double.infinity,
        50,
      ),
      elevation: 0.0,
      // primary: AppColors.primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          30,
        ),
      ),
    );
  }
}
