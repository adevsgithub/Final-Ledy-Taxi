import 'package:easy_localization/easy_localization.dart';
import 'package:final_ledy_taxi_app/service/privoder/theme_privoder.dart';
import 'package:final_ledy_taxi_app/ui/pages/pageView.dart';
import 'package:final_ledy_taxi_app/ui/pages/registry/register_page_1.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_storage/get_storage.dart';
import 'data/bloc/Authendition/auth_bloc.dart';
import 'data/bloc/app_settings/app_settings_cubit.dart';

void main() async {
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  final GetStorage box = GetStorage();
  bool showOnbaording = true;
  if (await box.read("onboarding") != null) {
    showOnbaording = false;
  }
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));

  runApp(
    EasyLocalization(
        supportedLocales: const [
          Locale('ru', 'RU'),
          Locale('uz', 'UZ'),
          Locale('en', 'US'),
        ],
        path: 'assets/translations',
        fallbackLocale: const Locale('en', 'US'),
        child: MyApp(
          showOnboarding: showOnbaording,
        )),
  );
}

class MyApp extends StatelessWidget {
  final bool? showOnboarding;
  const MyApp({super.key, this.showOnboarding});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 800),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider<AuthBloc>(
              create: (BuildContext context) => AuthBloc(),
            ),
            BlocProvider<AppSettingsCubit>(
              create: (BuildContext context) => AppSettingsCubit(),
            ),
          ],
          child: BlocBuilder<AppSettingsCubit, AppSettingsState>(
            builder: (context, state) {
              return MaterialApp(
                  localizationsDelegates: context.localizationDelegates,
                  supportedLocales: context.supportedLocales,
                  locale: context.locale,
                  debugShowCheckedModeBanner: false,
                  theme: state.isLight
                      ? ThemeProvider.lightThemeData
                      : ThemeProvider.darkThemeData,
                  // home: OnBoardingPage(),
                  // home: RegisterPage1(title: ''),
                  // home: const SplashPage(),
                  // home: EditProfile(),
                  // home: AlerDiolog(),
                  // home: const AddresPage,),
                  // home: SettingsPage(),
                  // home: AddresPage(),
                  home: (showOnboarding ?? true)
                      ? OnBoardingPage()
                      : RegisterPage1(
                          title: '',
                        )
                  //   // SplashPage.routeName: (context) => const SplashPage(),
                  //   // OnBoardingPage.routeName: (context) => const OnBoardingPage()
                  //   // // Onboarding2.routeName: (context) => const Onboarding2(),
                  //   // // OnBoarding3.routeName: (context) => const OnBoarding3(),
                  // },
                  );
            },
          ),
        );
      },
    );
  }
}
