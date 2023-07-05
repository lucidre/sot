import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:sot/firebase_options.dart';

import 'common_libs.dart';

void main() async {
  //GET INITS
  // permannent as the instance must persistet through out the application

  Get.put(ConnectionStatusController(), permanent: true);

  // WIDGET SETUPS
  WidgetsFlutterBinding.ensureInitialized();

//SYSTEM SETUPS
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.light,
    systemNavigationBarIconBrightness: Brightness.light,
    statusBarBrightness: Brightness.dark,
  ));

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();

  MyApp({Key? key}) : super(key: key);
  final _appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp.router(
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
      debugShowCheckedModeBanner: false,
      title: appName,
      scaffoldMessengerKey: scaffoldMessengerKey,
      theme: context.lightTheme,
    );
  }
}
