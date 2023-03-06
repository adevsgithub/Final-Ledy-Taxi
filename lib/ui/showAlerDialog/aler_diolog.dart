import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class CongratulationDialog extends StatelessWidget {
  const CongratulationDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: Image.asset('assets/images/aler_diolog_image.png'),
      titlePadding: const EdgeInsets.fromLTRB(70, 70, 70, 40),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      // ignore: prefer_const_literals_to_create_immutables
      children: [
        SizedBox(height: 20.h),
        Text(
          'Tabriklaymiz!',
          style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 30.h),
        Text(
          'Siz muvaffaqiyatli ro’yhatdan o’tdingiz',
          style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 30.h),
      ],
    );
  }
}
