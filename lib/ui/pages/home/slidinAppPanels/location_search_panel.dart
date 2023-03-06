import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/app_colors.dart';

class LocationSerchPanalSc extends StatelessWidget {
  const LocationSerchPanalSc({super.key, required this.controller});
  final ScrollController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Container(
            height: 2,
            width: 60,
            color: AppColors.primaryClr,
          ),
          SizedBox(height: 10.h),
          Text(
            'Manzilni kiriting',
            style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 20.h),
          MyTextForm1(),
          SizedBox(
            height: 10.h,
          ),
          MyTextForm2(),
          SizedBox(
            height: 20.h,
          ),
          Divider(endIndent: 0, indent: 0, thickness: 2),
          SizedBox(height: 8.h),
          ListTile(
            trailing: Icon(Icons.arrow_forward_ios),
            contentPadding: EdgeInsets.zero,
            leading: Icon(
              size: 32.h,
              Icons.bookmark,
              color: AppColors.primaryClr,
            ),
            title: Text('Joyni aniqlash'.tr()),
          ),
          Divider(endIndent: 0, indent: 0, thickness: 2),
          SizedBox(
            height: 300.h,
            child: ListView.builder(
              padding: EdgeInsets.zero,
              controller: controller,
              itemCount: 10,
              itemBuilder: (context, index) {
                return _myListTile();
              },
            ),
          ),
        ],
      ),
    );
  }

  _myListTile() {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Icon(Icons.access_time, size: 28.h),
      title: Text('Najot Ta\'lim Qatortol'.tr()),
      subtitle: Text('Toshkent, Uzbekistan'),
      trailing: Text('2.5 km'),
    );
  }

  Row MyTextForm2() {
    return Row(
      children: [
        Icon(
          Icons.location_on_rounded,
          color: AppColors.primaryClr,
          size: 30.h,
        ),
        Spacer(),
        SizedBox(
          height: 50.h,
          width: 340,
          child: TextFormField(
            decoration: InputDecoration(
              filled: true,
              // fillColor: const Color(0xFFF0F0F0),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFFFAFAFA)),
                borderRadius: BorderRadius.all(Radius.circular(16)),
              ),
              hintText: 'Qayerga borasiz?',
              suffixIcon: Icon(
                Icons.location_on_rounded,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Row MyTextForm1() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Icon(
          Icons.adjust,
          color: Color(0xff4CE5B1),
          size: 30.h,
        ),
        Spacer(),
        SizedBox(
          height: 50.h,
          width: 340,
          child: TextFormField(
            decoration: InputDecoration(
              filled: true,
              // fillColor: const Color(0xFFF0F0F0),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFFFAFAFA)),
                borderRadius: BorderRadius.all(Radius.circular(16)),
              ),
              hintText: 'Joylashuv',
              suffixIcon: Icon(
                Icons.my_location,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
