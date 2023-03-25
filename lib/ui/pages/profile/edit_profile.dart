import 'package:easy_localization/easy_localization.dart';
import 'package:final_ledy_taxi_app/data/models/User_Info.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/button/elevetd_btm.dart';

class EditProfile extends StatelessWidget {
  const EditProfile(this.userInfo, {super.key});
  final UserInfoModel userInfo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: Column(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            SizedBox(height: 50.h),
            TextFormFieldw(
              title: userInfo.fullName,
              icon: SvgPicture.asset(
                'assets/icons/editpr_ic_2.svg',
                fit: BoxFit.scaleDown,
                height: 21.h,
                width: 21.w,
              ),
            ),
            SizedBox(height: 20.h),
            TextFormFieldw(
              title: userInfo.phoneNumber,
              icon: null,
            ),
            SizedBox(height: 20.h),
            TextFormFieldw(
              title: 'KK.OO.YYYY',
              icon: SvgPicture.asset(
                'assets/icons/editpr_ic_3.svg',
                fit: BoxFit.scaleDown,
                height: 21.h,
                width: 21.w,
              ),
            ),
            SizedBox(height: 20.h),
            TextFormFieldw(
              title: 'Elektron pochta',
              icon: SvgPicture.asset(
                'assets/icons/editpr_ic_1.svg',
                fit: BoxFit.scaleDown,
                height: 21.h,
                width: 21.w,
              ),
            ),
            SizedBox(height: 30.h),
            ElevetedBtn(title: 'Yangilash'.tr(), onPressed: () {})
          ],
        ),
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      leading: IconButton(
        color: AppColors.blcColor,
        icon: SvgPicture.asset(
          'assets/icons/ic_next.svg',
        ),
        onPressed: () {},
      ),
      backgroundColor: Colors.white,
      elevation: 0,
      title: Text(
        'Profil sozlamalari'.tr(),
        style: TextStyle(
          color: AppColors.blcColor,
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class TextFormFieldw extends StatelessWidget {
  TextFormFieldw({
    this.icon,
    required this.title,
    super.key,
  });
  String title;
  Widget? icon;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // controller: _controller,
      // inputFormatters: [LengthLimitingTextInputFormatter(13)],
      keyboardType: TextInputType.name,
      decoration: InputDecoration(
        hintText: title,
        suffixIcon: icon,
        filled: true,
        fillColor: Color(0xFFF0F0F0),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFFFAFAFA)),
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFFEFEFEF)),
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
      ),
    );
  }
}
