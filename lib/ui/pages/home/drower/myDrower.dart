import 'package:easy_localization/easy_localization.dart';
import 'package:final_ledy_taxi_app/ui/pages/bottom_sheet/exit_bottom_shett.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/app_colors.dart';
import '../../diolog/ios_diolog.dart';
import '../../history/appsettings_page.dart';
import '../../profile/edit_profile.dart';

class MyDrower extends StatelessWidget {
  MyDrower({super.key, required this.userNum});
  final String userNum;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            width: double.infinity,
            height: 275.h,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/images/background_primaty.png',
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    CircleAvatar(
                      backgroundColor: AppColors.primaryClr,
                      radius: 50,
                      backgroundImage: AssetImage('assets/images/Avatar.png'),
                    ),
                    Positioned(
                      bottom: 10,
                      right: 10,
                      child: Image.asset(
                        'assets/icons/pan_ic.png',
                        cacheHeight: 20,
                      ),
                    ),
                  ],
                ),
                Text(
                  'Madina Aliyeva',
                  style: TextStyle(fontSize: 20, color: AppColors.whiteClr),
                ),
                SizedBox(
                  height: 4.h,
                ),
                Text(
                  '   +${userNum}',
                  style: TextStyle(fontSize: 12, color: AppColors.whiteClr),
                ),
                SizedBox(
                  height: 20.h,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
            child: Column(
              children: [
                ListTile(
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => EditProfile(),
                    ),
                  ),
                  leading: Icon(
                    size: 30,
                    Icons.account_circle,
                  ),
                  title: Text('Profil'.tr()),
                ),
                ListTile(
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => EditProfile(),
                    ),
                  ),
                  leading: const Icon(
                    Icons.history,
                    size: 30,
                  ),
                  title: Text('Sozlamar tarixi'.tr()),
                ),
                ListTile(
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => SettingsPage(),
                    ),
                  ),
                  leading: const Icon(
                    size: 30,
                    Icons.settings,
                  ),
                  title: Text('Sozlamalar'.tr()),
                ),
                ListTile(
                  onTap: () {
                    showModalBottomSheet(
                        backgroundColor: Colors.transparent,
                        context: context,
                        builder: (context) {
                          return ExitBottomSheet();
                        });
                    // showCupertinoModalPopup(
                    //     context: context,
                    //     builder: (BuildContext context) =>
                    //         const logOutIosDialog());
                  },
                  leading: const Icon(
                    size: 30,
                    Icons.logout,
                  ),
                  title: Text('Chiqish'.tr()),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
