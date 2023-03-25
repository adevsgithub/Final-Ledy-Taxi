import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DrawerButton extends StatelessWidget {
  const DrawerButton({required this.onTap, super.key});
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(context),
      child: SizedBox(
        height: 150.h,
        width: 80.w,
        child: Image.asset(
          'assets/icons/menyu_ic.png',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class DrawerButton1 extends StatelessWidget {
  const DrawerButton1({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 20,
      height: 20,
      color: Colors.amber,
    );
  }
}
