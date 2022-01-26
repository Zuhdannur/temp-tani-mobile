import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:hitungtani/pages/home_page.dart';
import 'package:hitungtani/pages/onboarding_page.dart';
import 'package:hitungtani/pages/splash_screen.dart';
import 'package:hitungtani/utils/colors.dart';
import 'package:hitungtani/utils/font_styles.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:hitungtani/utils/helpers.dart';
import 'package:hive/hive.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:google_map_location_picker/generated/l10n.dart' as location_picker;

import 'controllers/akun_controller.dart';
import 'models/user.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterConfig.loadEnvVariables();
  await Firebase.initializeApp();
  // initializeDateFormatting("id_ID");
  Intl.defaultLocale = "id_ID";
  final appDocumentDir = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDir.path);
  Hive.registerAdapter(UserAdapter());
  setupLocator();
  if (kDebugMode) {
    // Force disable Crashlytics collection while doing every day development.
    // Temporarily toggle this to true if you want to test crash reporting in your app.
    await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
  } else {
    // Handle Crashlytics enabled status when not in Debug,
    // e.g. allow your users to opt-in to crash reporting.
    await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
  }
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((value) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  AkunController akunController = Get.put(AkunController());
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Init.instance.initialize(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return GetMaterialApp(home: SplashScreen());
        } else {
          return GetMaterialApp(
            title: 'Hitung Tani',
            localizationsDelegates: const [
              location_picker.S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: const <Locale>[
              Locale('en', ''),
              Locale('id', ''),
            ],
            theme: ThemeData(
              // This is the theme of your application.
              //
              // Try running your application with "flutter run". You'll see the
              // application has a blue toolbar. Then, without quitting the app, try
              // changing the primarySwatch below to Colors.green and then invoke
              // "hot reload" (press "r" in the console where you ran "flutter run",
              // or simply save your changes to "hot reload" in a Flutter IDE).
              // Notice that the counter didn't reset back to zero; the application
              // is not restarted.
                primarySwatch: MaterialColor(0xFF82B479, AppColors.primaryColorSwatch),
                primaryColor: Color(0xFF82B479),
                bottomSheetTheme: BottomSheetThemeData(
                    backgroundColor: Colors.transparent
                ),
                bottomNavigationBarTheme: BottomNavigationBarThemeData(
                  selectedLabelStyle: AppInter.smallBody.copyWith(color: AppColors.primary),
                  unselectedLabelStyle: AppInter.smallBody.copyWith(color: AppColors.monochromeColorSwatch[300]),
                  backgroundColor: Colors.white,
                  elevation: 8,
                )
            ),
            home: GetBuilder(
              init: AkunController(),
              builder: (AkunController controller) {
                if(controller.user!=null){
                  return HomePage();
                }else return OnboardingPage();
              },
            ),
          );
        }
      },
    );
  }
}
