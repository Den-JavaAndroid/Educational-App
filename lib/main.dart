import 'package:edu_app/bindings/initial_bindings.dart';
import 'package:edu_app/configs/themes/app_light_theme.dart';
import 'package:edu_app/firebase_options.dart';
import 'package:edu_app/routes/AppRoutes.dart';
import 'package:edu_app/screens/introduction/introduction.dart';
import 'package:edu_app/screens/splash/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'data_uploader_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  InitialBindings().dependencies();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: LightTheme().buildLightTheme(),
      getPages: AppRoutes.routes(),
    );
  }
}

// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
//   runApp( GetMaterialApp(home: DataUploaderScreen(),));
// }
// DataUploaderScreen
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: Container(),
//     );
//   }
// }
