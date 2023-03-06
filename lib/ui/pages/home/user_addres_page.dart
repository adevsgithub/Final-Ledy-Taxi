// // ignore_for_file: unused_import

// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:ledy_taxi_app/ui/pages/history/appsettings_page.dart';
// import 'package:ledy_taxi_app/ui/pages/profile/edit_profile.dart';
// import 'package:ledy_taxi_app/utils/app_colors.dart';
// import 'package:ledy_taxi_app/utils/button/elevetd_btm.dart';
// import 'package:sliding_up_panel/sliding_up_panel.dart';

// import '../diolog/ios_diolog.dart';

// class UserAdresesPage extends StatefulWidget {
//   const UserAdresesPage({super.key});

//   @override
//   State<UserAdresesPage> createState() => _HomePageState();
// }

// class _HomePageState extends State<UserAdresesPage> {
//   final _panelController = PanelController();
//   double _flbHeight = 300.h;
//   final double _sldUpHeight = 300.h;
//   bool _isOpen = true;

//   _open(BuildContext ctx) {
//     print('open begin');
//     Scaffold.of(ctx).openDrawer();
//     print('open end');
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // ignore: prefer_const_constructors
//       drawer: MyDrower(),
//       body: Builder(builder: (context) {
//         return Stack(
//           children: [
//             GestureDetector(
//               onTap: () {
//                 _open(context);
//               },
//               child: SizedBox(
//                 // margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 30.h),
//                 height: 150.h,
//                 width: 80.w,
//                 child: Image.asset(
//                   'assets/icons/menyu_ic.png',
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//             // slidingPanel(),
//             Positioned(
//               bottom: _flbHeight + 20,
//               right: 20,
//               child: floatingActionBtn(),
//             )
//           ],
//         );
//       }),
//     );
//   }

//   FloatingActionButton floatingActionBtn() {
//     return FloatingActionButton(
//       backgroundColor: AppColors.whiteClr,
//       onPressed: () {
//         if (_isOpen) {
//           _panelController.close();
//           _isOpen = !_isOpen;
//         } else {
//           _panelController.open();
//           _isOpen = !_isOpen;
//         }
//         // _panelController.close();
//       },
//       child: SizedBox(
//         height: 26.h,
//         width: 26.w,
//         child: Image.asset(
//           'assets/icons/lacation.png',
//           // fit: BoxFit.scaleDown,
//         ),
//       ),
//     );
//   }
// }

// class MyDrower extends StatelessWidget {
//   const MyDrower({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return
//   }
// }
