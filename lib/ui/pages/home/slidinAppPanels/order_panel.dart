// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/app_colors.dart';
import '../../../../utils/button/elevetd_btm.dart';

class OrderPanel extends StatelessWidget {
  const OrderPanel({super.key, required this.funcBtn});
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
          height: 20.h,
        ),
        TextRow(
          title: 'Masofa',
          kmtext: '6.5 km',
          myColor: AppColors.blcColor,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            children: [
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: Icon(
                  Icons.my_location,
                  size: 28.h,
                  color: AppColors.greenColor,
                ),
                title: Text(
                  'Chilonzor 9 dahasi 13'.tr(),
                  style: TextStyle(
                    fontSize: 17.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                subtitle: Text(
                  'Qatortol ko’cha, Rayhon res, 19',
                  style: TextStyle(
                    fontSize: 13.sp,
                  ),
                ),
                trailing: SizedBox(
                  height: 36.h,
                  child: Image.asset(
                    'assets/icons/pan_ic.png',
                  ),
                ),
              ),
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: SizedBox(
                  height: 30.h,
                  child: Image.asset(
                    'assets/icons/lacation_ic1.png',
                  ),
                ),
                title: Text(
                  'Milliy Bank'.tr(),
                  style: TextStyle(
                    fontSize: 17.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                subtitle: Text(
                  'Qatortol ko’cha, Rayhon res, 19',
                  style: TextStyle(
                    fontSize: 13.sp,
                  ),
                ),
                trailing: SizedBox(
                  height: 36.h,
                  child: Image.asset(
                    'assets/icons/pan_ic.png',
                  ),
                ),
              ),
              const Divider(endIndent: 0, indent: 0, thickness: 1.5),
              TextRow(
                title: 'Yo’l haqi',
                kmtext: '14 000 sum',
                myColor: AppColors.primaryClr,
              ),
              SizedBox(
                height: 20.h,
              ),
              SizedBox(
                height: 46.h,
                child: ElevetedBtn(
                  onPressed: () {},
                  title: 'Taksi chaqirish',
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}

class TextRow extends StatelessWidget {
  const TextRow({
    Key? key,
    required this.title,
    required this.kmtext,
    required this.myColor,
  }) : super(key: key);
  final String title;
  final String kmtext;
  final Color myColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SizedBox(width: 20.w),
        // Spacer(),
        Text(
          title,
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
          ),
        ).tr(),
        Spacer(),
        Text(
          kmtext,
          style: TextStyle(
            fontSize: 13.sp,
            fontWeight: FontWeight.w600,
            color: myColor,
          ),
        ),
        SizedBox(width: 20.w)
      ],
    );
  }
}
