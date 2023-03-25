import 'package:easy_localization/easy_localization.dart';
import 'package:final_ledy_taxi_app/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              myListhistory(),
              myListhistory(),
              myListhistory(),
            ],
          ),
        ),
      ),
    );
  }

  Column myListhistory() {
    return Column(
      children: [
        textData(),
        SizedBox(
          height: 20.h,
        ),
        ListTile(
          // onTap: () => Navigator.of(context).push(
          //   MaterialPageRoute(
          //     builder: (context) => EditProfile(),
          //   ),
          // ),
          leading: const Icon(
            Icons.adjust,
            size: 30,
            color: AppColors.greenColor,
          ),
          title: Text('7958 Swift Village'.tr()),
        ),
        ListTile(
          // onTap: () => Navigator.of(context).push(
          //   MaterialPageRoute(
          //     builder: (context) => EditProfile(),
          //   ),
          // ),
          leading: Icon(
            Icons.location_on_rounded,
            color: AppColors.primaryClr,
            size: 30.h,
          ),
          title: Text('105 William St, Chicago, US'.tr()),
        ),
        const Divider(endIndent: 0, indent: 0, thickness: 1),
        ListTile(
          // onTap: () => Navigator.of(context).push(
          //   MaterialPageRoute(
          //     builder: (context) => EditProfile(),
          //   ),
          // ),
          leading: Icon(
            Icons.monetization_on_outlined,
            color: AppColors.greenColor,
            size: 30.h,
          ),
          title: Row(
            children: [
              Text(
                '14 000 sum'.tr(),
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
              Spacer(),
              Text(
                'Completed',
                style: TextStyle(
                  color: AppColors.greenColor,
                ),
              ).tr(),
              SizedBox(
                width: 10.w,
              ),
              Icon(
                Icons.arrow_forward_ios,
                color: Color(0xFFDAD9E2),
              ),
            ],
          ),
        ),
        const Divider(endIndent: 0, indent: 0, thickness: 1),
      ],
    );
  }

  Row textData() {
    return Row(
      children: [
        Spacer(),
        Text(
          'Bugun',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          width: 20.w,
        )
      ],
    );
  }

  AppBar appBar() {
    return AppBar(
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back_ios_new,
          color: AppColors.blcColor,
        ),
        onPressed: () {},
      ),
      backgroundColor: Colors.white,
      elevation: 0,
      title: Text(
        'Safarlar tarixi'.tr(),
        style: TextStyle(
          color: AppColors.blcColor,
        ),
      ),
    );
  }
}
