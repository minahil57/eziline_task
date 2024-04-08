import 'package:eziline_task/firebase_options.dart';
import 'package:eziline_task/ui/common/app_colors.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:eziline_task/app/app.bottomsheets.dart';
import 'package:eziline_task/app/app.dialogs.dart';
import 'package:eziline_task/app/app.locator.dart';
import 'package:eziline_task/app/app.router.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked_services/stacked_services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  setupDialogUi();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp, // Locks the app to portrait mode
    DeviceOrientation.portraitDown,
  ]);
  EasyLoading.instance
    ..textStyle = const TextStyle(fontSize: 12, color: kcBackgroundColor)
    ..loadingStyle = EasyLoadingStyle.custom
    ..backgroundColor = kcBackgroundColor.withOpacity(0.5)
    ..radius = 12
    ..indicatorSize = 30
    ..textColor = kcWhiteColor
    ..textStyle = const TextStyle(fontSize: 14)
    ..indicatorColor = kcPrimaryColor
    ..maskColor = kcBackgroundColor.withOpacity(0.5)
    ..userInteractions = false
    ..displayDuration = const Duration(seconds: 3)
    ..dismissOnTap = false;
  setupBottomSheetUi();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Eziline Task',
            initialRoute: Routes.startupView,
            onGenerateRoute: StackedRouter().onGenerateRoute,
            navigatorKey: StackedService.navigatorKey,
            navigatorObservers: [
              StackedService.routeObserver,
            ],
            builder: EasyLoading.init(),
          );
        });
  }
}
