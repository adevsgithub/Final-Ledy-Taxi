import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LanguageBtmSheet extends StatelessWidget {
  const LanguageBtmSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(
            16,
          ),
          topRight: Radius.circular(
            16,
          ),
        ),
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            InkWell(
              onTap: () {
                context.setLocale(
                  Locale.fromSubtags(
                    languageCode: 'ru',
                    countryCode: 'RU',
                  ),
                );
              },
              child: SizedBox(
                height: 56.h,
                child: Text('Руский'),
              ),
            ),
            InkWell(
              onTap: () {
                context.setLocale(
                  Locale.fromSubtags(
                    languageCode: 'uz',
                    countryCode: 'UZ',
                  ),
                );
              },
              child: SizedBox(
                height: 56.h,
                child: Text('O\'zbekcha'),
              ),
            ),
            InkWell(
              onTap: () {
                context.setLocale(
                  Locale.fromSubtags(
                    languageCode: 'en',
                    countryCode: 'US',
                  ),
                );
              },
              child: SizedBox(
                height: 56.h,
                child: Text('English'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
