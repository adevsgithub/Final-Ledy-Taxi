import 'package:final_ledy_taxi_app/ui/pages/pageView.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../service/hive_service.dart';

// ignore: camel_case_types
class logOutIosDialog extends StatelessWidget {
  const logOutIosDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text('Вийты из приложения'),
      content: Text('Вы точна хотити выйти из аккаунта ?'),
      actions: <CupertinoDialogAction>[
        CupertinoDialogAction(
          isDefaultAction: true,
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('No'),
        ),
        CupertinoDialogAction(
          isDestructiveAction: true,
          onPressed: () {
            HiveServise.clear().then((value) {
              Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
                builder: (ctx) {
                  return OnBoardingPage();
                },
              ), (route) => false);
            });
          },
          child: Text('Yes'),
        )
      ],
    );
  }
}
