import 'package:easy_localization/easy_localization.dart';
import 'package:final_ledy_taxi_app/data/bloc/get%20user%20bloc/get_user_bloc.dart';
import 'package:final_ledy_taxi_app/service/privoder/theme_privoder.dart';
import 'package:final_ledy_taxi_app/ui/splash/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'data/bloc/Authendition/auth_bloc.dart';
import 'data/bloc/app_settings/app_settings_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));

  runApp(
    EasyLocalization(supportedLocales: const [
      Locale('ru', 'RU'),
      Locale('uz', 'UZ'),
      Locale('en', 'US'),
    ], path: 'assets/translations', fallbackLocale: const Locale('en', 'US'), child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
            BlocProvider<GetUserBloc>(
              create: (BuildContext context) => GetUserBloc()..add(GetUserEvent()),
            ),
          ],
          child: BlocBuilder<AppSettingsCubit, AppSettingsState>(
            builder: (context, state) {
              return MaterialApp(
                localizationsDelegates: context.localizationDelegates,
                supportedLocales: context.supportedLocales,
                locale: context.locale,
                debugShowCheckedModeBanner: false,
                theme: state.isLight ? ThemeProvider.lightThemeData : ThemeProvider.darkThemeData,
                // home: OnBoardingPage(),
                // home: const AddresPage,),
                // home: SettingsPage(),
                // home: AddresPage(),
                // home: HistoryPage(),
                // home: (showOnboarding ?? true) ? SplashPage() : RegisterPage1(),
                home: SplashPage(),
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
