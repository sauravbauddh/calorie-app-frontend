import 'package:calorie_app/app/app_bindings.dart';
import 'package:calorie_app/app/data/value/strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'data/value/constants.dart';
import 'routes/app_pages.dart';
import 'routes/app_routes.dart';
import 'theme/app_theme.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus &&
            currentFocus.focusedChild != null) {
          FocusManager.instance.primaryFocus!.unfocus();
        }
        if (Get.isOverlaysOpen) Get.back();
      },
      child: GetMaterialApp(
        title: AppStrings.appName,
        navigatorKey: GlobalKeys.navigationKey,
        debugShowCheckedModeBanner: false,
        theme: AppTheme.theme,
        initialRoute: Routes.SPLASH,
        getPages: AppPages.pages,
        defaultTransition: Transition.cupertino,
        initialBinding: AppBinding(),
        // localizationsDelegates: [
        //   GlobalMaterialLocalizations.delegate,
        //   GlobalWidgetsLocalizations.delegate,
        //   GlobalCupertinoLocalizations.delegate,
        // ],
        supportedLocales: const [
          Locale('en', 'GB'), // English, UK
          Locale('ar', 'AE'), // Arabic, UAE
          Locale('en', 'IN'), // English, India
        ],
      ),
    );
  }
}
