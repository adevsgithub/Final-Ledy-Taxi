import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../data/bloc/Authendition/auth_bloc.dart';
import '../../../utils/app_colors.dart';
import 'registry_page_2.dart';

class RegisterPage1 extends StatefulWidget {
  RegisterPage1({super.key, required this.title});
  final String title;

  @override
  State<RegisterPage1> createState() => _RegisterPage1State();
}

class _RegisterPage1State extends State<RegisterPage1> {
  final TextEditingController _controller = TextEditingController();
  String _userNumber = '';
  final AuthBloc _bloc = AuthBloc();

  @override
  void initState() {
    super.initState();
    _controller.text = '+998 ';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocListener<AuthBloc, AuthState>(
        bloc: _bloc,
        listener: (context, state) {
          if (state is OtpCodeSentSuccessState) {
            Navigator.of(context).push(
              MaterialPageRoute(
                  builder: (context) => RegisterPage2(
                        userNumber: _userNumber,
                      )),
            );
          } else if (state is VeriyOtpCodeSuccesState) {}
        },
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(height: 30.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Ro\'yhatdan o\'tish',
                    style: TextStyle(
                      color: AppColors.blcColor,
                      fontSize: 22.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 50.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Ro’yxatdan o’tish uchun ',
                    style: TextStyle(
                        color: AppColors.blcColor,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'telefon raqamingizni kiriting',
                    style: TextStyle(
                        color: AppColors.blcColor,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              SizedBox(
                height: 80.h,
              ),
              SizedBox(
                width: 360.w,
                height: 86.h,
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 340.w,
                      child: Row(
                        children: [
                          const Text(
                            'Telefon raqam',
                            style: TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Form(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: TextFormField(
                              onChanged: (value) => setState(() {}),
                              onFieldSubmitted: (value) {
                                _userNumber = value;
                              },
                              controller: _controller,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(14)
                              ],
                              keyboardType: TextInputType.phone,
                              // ignore: prefer_const_constructors
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Color(0xFFF0F0F0),
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xFFFAFAFA)),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12)),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xFFEFEFEF)),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12)),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 10,
                child: Container(),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: ElevatedButton(
                  onPressed: _controller.text.length == 14 ? _myFunction : null,
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(3400, 47),
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
                  child: Text('Continue'),
                ),
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  _myFunction() async {
    _userNumber = _controller.text.replaceAll('+', '').replaceAll(' ', '');
    _bloc.add(SendOtpCodeEvent(_userNumber));
  }
}
