import 'package:easy_localization/easy_localization.dart';
import 'package:final_ledy_taxi_app/ui/pages/profile/create_profile_page.dart';
import 'package:final_ledy_taxi_app/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:timer_count_down/timer_controller.dart';
import 'package:timer_count_down/timer_count_down.dart';
import '../../../data/bloc/Authendition/auth_bloc.dart';

class RegisterPage2 extends StatefulWidget {
  const RegisterPage2({super.key, required this.userNumber});
  final String userNumber;
  @override
  State<RegisterPage2> createState() => _RegisterPage2State();
}

class _RegisterPage2State extends State<RegisterPage2> {
  final OtpFieldController _controller = OtpFieldController();
  String _userCode = '';
  bool btnEnabled = false;
  bool txtBtnEnable = false;

  int num = 4;

  final CountdownController _controllerseconds = CountdownController(
    autoStart: true,
  );

  int myDuration = 119;

  formatDuration(int duration) {
    var a = [
      Duration(seconds: duration).inMinutes,
      Duration(seconds: duration).inSeconds
    ].map((e) => e.remainder(60).toString().padLeft(2, '0')).join(':');
    return a;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          'Ro\'yhatdan o\'tish',
          style: TextStyle(
            color: AppColors.blcColor,
            fontSize: 22,
            fontWeight: FontWeight.w600,
          ),
        ),
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: AppColors.blcColor,
          ),
        ),
      ),
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is VeriyOtpCodeSuccesState) {
            Navigator.of(context).push(
              MaterialPageRoute(
                  builder: (context) => CreateProfilePage(
                        myNumber: widget.userNumber,
                      )),
            );
          } else if (state is AuthErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text(' Kodni not\'o\'gri kiritdingiz'),
                // backgroundColor: Colors.blueGrey,
                behavior: SnackBarBehavior.floating,
              ),
            );
          }
        },
        child: Column(
          children: [
            SizedBox(
              height: 20.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Tasdiqlash kodi ',
                  style: TextStyle(fontSize: 18),
                ),
                Text(
                  '+${widget.userNumber}',
                  style: const TextStyle(
                      fontSize: 18, color: AppColors.primaryClr),
                ),
              ],
            ),
            SizedBox(height: 6.h),
            Text(
              'raqamiga yuborildi.'.tr(),
              style: const TextStyle(fontSize: 18),
            ),
            SizedBox(height: 6.h),
            Text(
              'Qabul qilish vaqti:'.tr(),
              style: const TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10.h),
            Countdown(
              controller: _controllerseconds,
              seconds: myDuration,
              build: (_, time) {
                if (time < 1) txtBtnEnable = true;
                print(txtBtnEnable);
                return Text(
                  formatDuration(time.toInt()),
                  style: const TextStyle(
                    fontSize: 20,
                    color: AppColors.primaryClr,
                  ),
                );
              },
            ),
            SizedBox(height: 100.h),
            OTPTextField(
              controller: _controller,
              otpFieldStyle: OtpFieldStyle(
                focusBorderColor: Colors.red,
              ),
              inputFormatter: [LengthLimitingTextInputFormatter(4)],
              length: 4,
              width: MediaQuery.of(context).size.width,
              textFieldAlignment: MainAxisAlignment.spaceAround,
              fieldWidth: 64.w,
              fieldStyle: FieldStyle.box,
              outlineBorderRadius: 12,
              style: const TextStyle(fontSize: 17),
              onChanged: (value) {
                _userCode = value;
                if (_userCode.length == 4) btnEnabled = true;
                if (_userCode.length != 4) btnEnabled = false;
                setState(() {});
              },
            ),
            if (txtBtnEnable)
              TextButton(
                onPressed: () {
                  context
                      .read<AuthBloc>()
                      .add(SendOtpCodeEvent(widget.userNumber));
                },
                child: const Text(
                  'Kod qayta yuborilsin',
                  style: TextStyle(
                    color: AppColors.txtColor,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: ElevatedButton(
                onPressed: () {
                  context
                      .read<AuthBloc>()
                      .add(ConfirOtpcodeEvent(_userCode, widget.userNumber));
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(3400, 50),
                  backgroundColor: AppColors.primaryClr,
                  disabledBackgroundColor:
                      AppColors.primaryClr.withOpacity(0.1),
                  fixedSize: const Size(
                    double.infinity,
                    50,
                  ),
                  elevation: 0.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      30,
                    ),
                  ),
                ),
                child: const Text('Continue'),
              ),
            ),
            SizedBox(
              height: 40.h,
            )
          ],
        ),
      ),
    );
  }
}
