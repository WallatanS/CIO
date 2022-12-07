// import 'package:dynamic_color/dynamic_color.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:listcom/commons/app_provider.dart';
// import 'package:listcom/commons/color_schemes.g2.dart';
// import 'package:listcom/commons/custom_color.g3.dart';
// import 'package:listcom/commons/color_schemes.g3.dart';
// import 'package:listcom/main_page_screen.dart';

// import 'package:listcom/main_page_screen.dart';
// import 'package:listcom/screen/home/home_page_img.dart';
import 'package:listcom/screen/login/login_screen_new.dart';
import 'package:provider/provider.dart';

void main() async {
  await EasyLocalization.ensureInitialized();
  const firebaseConfig = FirebaseOptions(
    apiKey: "AIzaSyDd790d6QuN6eP2EBH4fNjnIgRNMBCn-9w",
    appId: "1:255704546632:web:31c4253bf3cacbfdd0477d",
    messagingSenderId: "255704546632",
    projectId: "shopcom-f2cca",
    storageBucket: "shopcom-f2cca.appspot.com",
  );
  if (kIsWeb) {
    await Firebase.initializeApp(options: firebaseConfig);
    // await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
    // FireaseFirestore.instance.useFirestoreEmulator("localhost", 8080);
  } else {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    // await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
    // FirebaseFirestore.instance.useFirestoreEmulator("localhost", 8080);
  }
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => AppProvider())],
      child: EasyLocalization(
        supportedLocales: const [Locale('en'), Locale('tr')],
        fallbackLocale: const Locale('en'),
        path: 'lang',
        child: MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final ThemeData theme = ThemeData();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      title: 'Lista de Compras 1.0',
      // theme: context.watch<AppProvider>().theme,
      theme: theme.copyWith(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        primaryColor: Colors.amber[800],
        colorScheme: theme.colorScheme.copyWith(
          primary: Colors.purple[800],
          secondary: Colors.amber,
          brightness: Brightness.dark,
        ),
      ),
      home: LoginScreenNew(),
    );
  }
}

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return DynamicColorBuilder(
//       builder: (ColorScheme? lightDynamic, ColorScheme? darkDynamic) {
//         ColorScheme lightScheme;
//         ColorScheme darkScheme;

//         if (lightDynamic != null && darkDynamic != null) {
//           lightScheme = lightDynamic.harmonized();
//           lightCustomColors = lightCustomColors.harmonized(lightScheme);

//           // Repeat for the dark color scheme.
//           darkScheme = darkDynamic.harmonized();
//           darkCustomColors = darkCustomColors.harmonized(darkScheme);
//         } else {
//           // Otherwise, use fallback schemes.
//           lightScheme = lightColorScheme;
//           darkScheme = darkColorScheme;
//         }

//         return MaterialApp(
//             theme: ThemeData(
//               useMaterial3: true,
//               colorScheme: lightScheme, //?? _defaultLightColorScheme,
//               extensions: [lightCustomColors],
//             ),
//             darkTheme: ThemeData(
//               useMaterial3: true,
//               colorScheme: darkColorScheme, //?? _defaultDarkColorScheme,
//               extensions: [darkCustomColors],
//             ),
//             home: const MainPageScreen() //LoginScreenNew(),
//             );
//       },
//     );
//   }
// }

