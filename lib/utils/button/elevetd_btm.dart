// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:final_ledy_taxi_app/utils/app_colors.dart';
import 'package:flutter/material.dart';

class ElevetedBtn extends StatelessWidget {
  const ElevetedBtn({
    Key? key,
    required this.title,
    required this.onPressed,
  }) : super(key: key);
  final String title;
  final VoidCallback onPressed;

  static const routeName = '/ontap1';
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: btmStyle(),
      onPressed: onPressed,
      child: Text(title),
    );
  }

  ButtonStyle btmStyle() {
    return ElevatedButton.styleFrom(
      minimumSize: const Size(3400, 47),
      backgroundColor: AppColors.primaryClr,
      fixedSize: const Size(
        double.infinity,
        50,
      ),
      elevation: 0.0,
      // primary: AppColors.primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          30,
        ),
      ),
    );
  }
}
