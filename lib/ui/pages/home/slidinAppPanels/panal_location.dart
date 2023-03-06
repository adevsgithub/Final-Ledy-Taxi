import 'package:final_ledy_taxi_app/utils/button/elevetd_btm.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LocationPanel extends StatelessWidget {
  const LocationPanel({super.key, required this.funcbtn});

  final Function() funcbtn;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 320,
          child: Row(
            children: [
              Image.asset(
                'assets/icons/lacation_ic1.png',
                height: 50.h,
                width: 50.w,
                cacheHeight: 40,
              ),
              Text(
                'Chilonzor 9 dahasi 13',
                style: TextStyle(fontSize: 20.sp),
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 14.h),
          child: ElevetedBtn(
            title: 'Jo\'nash manzilim',
            onPressed: funcbtn,
          ),
        ),
      ],
    );
  }
}
