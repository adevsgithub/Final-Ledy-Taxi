import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../data/bloc/app_settings/app_settings_cubit.dart';
import '../../../utils/app_colors.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar(),
      body: BlocBuilder<AppSettingsCubit, AppSettingsState>(
        builder: (BuildContext context, state) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 14.w),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 60.h,
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    // padding: const EdgeInsets.symmetric(vertical: 14),
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      // border: Border.all(width: 0), // Set border width
                      borderRadius: BorderRadius.all(Radius.circular(10.0)), //
                      color: Color(
                        0xFFF6F6F6,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 20, left: 20),
                        ),
                        Text(
                          'Tungi rejim'.tr(),
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Switch(
                            activeColor: AppColors.primaryClr,
                            // focusColor: AppColors.primaryClr,
                            // hoverColor: AppColors.primaryClr,
                            // activeTrackColor: AppColors.primaryClr,
                            inactiveThumbColor: AppColors.whiteClr,
                            inactiveTrackColor: AppColors.primaryClr,
                            value: !state.isLight,
                            onChanged: (bool value) {
                              context.read<AppSettingsCubit>().changeThema();
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                conteinerSettings(
                  onPressed: () {},
                  title: 'Xavsizlik'.tr(),
                ),
                conteinerSettings(
                  onPressed: () {},
                  title: 'Til'.tr(),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 60.h,
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    // padding: const EdgeInsets.symmetric(vertical: 14),
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      // border: Border.all(width: 0), // Set border width
                      borderRadius: BorderRadius.all(Radius.circular(10.0)), //
                      color: Color(
                        0xFFF6F6F6,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 20, left: 20),
                        ),
                        Text(
                          'Bildirishnoma'.tr(),
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Switch(
                            activeColor: AppColors.primaryClr,
                            // focusColor: AppColors.primaryClr,
                            // hoverColor: AppColors.primaryClr,
                            // activeTrackColor: AppColors.primaryClr,
                            inactiveThumbColor: AppColors.whiteClr,
                            inactiveTrackColor: AppColors.primaryClr,
                            value: !state.isLight,
                            onChanged: (bool value) {
                              context.read<AppSettingsCubit>().changeThema();
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      leading: IconButton(
        icon: SvgPicture.asset(
          'assets/icons/ic_next.svg',
        ),
        onPressed: () {},
      ),
      backgroundColor: Colors.white,
      elevation: 0,
      title: Text(
        'Sozlamalar'.tr(),
        style: TextStyle(
          color: AppColors.blcColor,
        ),
      ),
    );
  }
}

// ignore: camel_case_types
class conteinerSettings extends StatelessWidget {
  const conteinerSettings({
    super.key,
    required this.title,
    required this.onPressed,
  });

  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 60.h,
        margin: const EdgeInsets.symmetric(vertical: 20),
        padding: const EdgeInsets.symmetric(vertical: 22),
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          // border: Border.all(width: 0), // Set border width
          borderRadius: BorderRadius.all(Radius.circular(10.0)), //
          color: Color(
            0xFFF6F6F6,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 20, left: 20),
            ),
            Text(
              title.tr(),
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Spacer(),
            Icon(Icons.arrow_forward_ios)
          ],
        ),
      ),
    );
  }
}
