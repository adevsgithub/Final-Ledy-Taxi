import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:final_ledy_taxi_app/data/bloc/Authendition/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/app_colors.dart';
import '../home/addres_page.dart';

class CreateProfilePage extends StatefulWidget {
  CreateProfilePage({super.key, required this.myNumber});

  final String myNumber;
  String? selectedValue;
  @override
  State<CreateProfilePage> createState() => _CreateProfilePageState();
}

class _CreateProfilePageState extends State<CreateProfilePage> {
  final AuthBloc _bloc = AuthBloc();
  final TextEditingController _controller = TextEditingController();
  @override
  void initState() {
    super.initState();
    _controller.text = '+${widget.myNumber}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteClr,
      appBar: appBar(),
      body: BlocListener<AuthBloc, AuthState>(
        bloc: _bloc,
        listener: (context, state) {
          if (state is CreateProfileEvent) {
            Navigator.of(context).push(
              MaterialPageRoute(
                  builder: (context) => AddresPage(
                        myNumber: '',
                      )),
            );
          }
        },
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: double.infinity,
                height: 40.h,
              ),
              Stack_ic(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 30),
                child: Column(
                  children: [
                    textForm1(),
                    SizedBox(height: 10.h),
                    MyDorpDown(context),
                    SizedBox(height: 16.h),
                    textForm3(),
                    SizedBox(height: 200.h),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: ElevatedButton(
                        onPressed: _controller.text.length == 13
                            ? () {
                                context
                                    .read<AuthBloc>()
                                    .add(const CreateProfileEvent());
                                // Navigator.of(context).pushAndRemoveUntil(
                                //   MaterialPageRoute(builder: (context) {
                                //     return AddresPage(
                                //       myNumber: widget.myNumber,
                                //     );
                                //   }),
                                //   (route) => false,
                                // );
                              }
                            : null,
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
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  DropdownButton2<String> MyDorpDown(BuildContext context) {
    return DropdownButton2(
      hint: Text(
        'Jinsi',
        style: TextStyle(
          fontSize: 14,
          color: Theme.of(context).hintColor,
        ),
      ),
      items: ['Erkak', 'Ayol']
          .map((item) => DropdownMenuItem<String>(
                value: item,
                child: Text(
                  item,
                  style: const TextStyle(
                    fontSize: 14,
                  ),
                ),
              ))
          .toList(),
      value: widget.selectedValue,
      onChanged: (value) {
        setState(() {
          widget.selectedValue = value as String;
        });
      },
      buttonStyleData: ButtonStyleData(
        height: 50.h,
        width: 360.w,
      ),
      menuItemStyleData: const MenuItemStyleData(
        height: 40,
      ),
    );
  }

  TextField textForm3() {
    return TextField(
      onChanged: (value) {
        setState(() {});
      },
      controller: _controller,
      inputFormatters: [LengthLimitingTextInputFormatter(13)],
      keyboardType: TextInputType.none,
      decoration: InputDecoration(
        hintText: widget.myNumber,
        filled: true,
        fillColor: const Color(0xFFF0F0F0),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFFFAFAFA)),
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFFEFEFEF)),
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
      ),
    );
  }

  Widget textForm2() {
    return const TextField(
      // controller: _controller,
      // inputFormatters: [LengthLimitingTextInputFormatter(13)],
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
        hintText: 'Jinsi',
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

  Widget textForm1() {
    return TextFormField(
      onChanged: (value) => setState(() {}),
      onFieldSubmitted: (value) {},
      // controller: _controller,
      // inputFormatters: [LengthLimitingTextInputFormatter(13)],
      keyboardType: TextInputType.name,
      decoration: const InputDecoration(
        hintText: 'F.I.Sh',
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

  // ignore: non_constant_identifier_names
  Stack Stack_ic() {
    return Stack(
      children: [
        Container(
          height: 110,
          width: 110,
          decoration: const BoxDecoration(
            color: Color(0xFFF6F6F6),
            shape: BoxShape.circle,
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/images/EditProfImg.png')),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: Container(
            height: 26.h,
            width: 26.w,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.contain,
                  image: AssetImage('assets/images/Purpl_ic.png')),
            ),
          ),
        ),
      ],
    );
  }

  AppBar appBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: AppColors.whiteClr,
      title: Text(
        'Profil yaratish',
        style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: AppColors.blcColor),
      ),
    );
  }
  // _myFunction{
  //       _bloc.add(SendOtpCodeEvent(_token));
  // }
}
