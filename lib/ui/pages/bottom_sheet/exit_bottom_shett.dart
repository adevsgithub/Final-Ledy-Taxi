import 'package:final_ledy_taxi_app/data/bloc/Authendition/auth_bloc.dart';
import 'package:final_ledy_taxi_app/ui/pages/registry/register_page_1.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../utils/app_colors.dart';

class ExitBottomSheet extends StatelessWidget {
  const ExitBottomSheet(this.ctx, {super.key});
  final BuildContext ctx;

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthInitial) {
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => RegisterPage1()));
        }
      },
      child: Container(
        height: 280.h,
        padding: const EdgeInsets.only(top: 6),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
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
            SizedBox(height: 20.h),
            Text(
              'Chiqish',
              style: TextStyle(fontSize: 18.sp, color: AppColors.primaryClr),
            ),
            const Spacer(),
            const Divider(
              color: Color.fromARGB(255, 37, 29, 29),
            ),
            const Spacer(),
            Text(
              'Nahotki bizni tark qilyapsiz?',
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(160, 60),
                    backgroundColor: Color(0xFFF6F6F6),
                    fixedSize: const Size(double.infinity, 50),
                    elevation: 0.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        30,
                      ),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
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
                  onPressed: () {
                    Navigator.of(context).pop();
                    ctx.read<AuthBloc>().add(LogOutEvent());
                  },
                  child: Text(
                    'Davom etish',
                    style: TextStyle(color: AppColors.whiteClr, fontSize: 14.sp),
                  ),
                ),
              ],
            ),
            SizedBox(height: 70.h),
          ],
        ),
      ),
    );
  }

  ButtonStyle btmStyle() {
    return ElevatedButton.styleFrom(
      minimumSize: const Size(160, 60),
      backgroundColor: AppColors.primaryClr,
      fixedSize: const Size(double.infinity, 50),
      elevation: 0.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
    );
  }
}
