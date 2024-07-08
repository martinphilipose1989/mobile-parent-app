import 'package:app/themes_setup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:localisation/strings.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:services/services.dart';

import 'package:themes/themes.dart';

import 'navigation/app_router.dart';
import 'navigation/route_paths.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ThemeBuilder(
      defaultThemeMode: ThemeMode.system,
      themes: getThemes(),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          surface: Colors.blue[700],
          secondary: Colors.yellow[700],
          brightness: Brightness.dark,
        ),
      ),
      lightTheme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          surface: Colors.blue[300],
          secondary: Colors.yellow[300],
          brightness: Brightness.light,
        ),
      ),
      builder: (context, regularTheme, darkTheme, themeMode) {
        return ScreenUtilInit(
            designSize: const Size(390, 844),
            builder: (context, child) {
              return MaterialApp(
                  key: AppService.appKey,
                  navigatorKey: AppService.navigatorKey,
                  builder: (context, widget) => ResponsiveBreakpoints.builder(
                        child: widget!,
                        breakpoints: [
                          const Breakpoint(start: 0, end: 450, name: MOBILE),
                          const Breakpoint(start: 451, end: 800, name: TABLET),
                          const Breakpoint(
                              start: 801, end: 1920, name: DESKTOP),
                          const Breakpoint(
                              start: 1921, end: double.infinity, name: '4K'),
                        ],
                      ),
                  localizationsDelegates: const [
                    Strings.delegate,
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate
                  ],
                  supportedLocales: Strings.delegate.supportedLocales,
                  onGenerateTitle: (context) => Strings.of(context).appName,
                  debugShowCheckedModeBanner: false,
                  initialRoute: RoutePaths.splash,
                  theme: regularTheme,
                  darkTheme: darkTheme,
                  themeMode: themeMode,
                  onGenerateRoute: AppRouter.generateRoute);
            });
      },
    );
  }
}
