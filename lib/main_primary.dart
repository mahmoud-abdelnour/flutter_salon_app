import 'package:certain_salon/common/providers/localization_provider.dart';
import 'package:certain_salon/components/auth/providers/auth_provider.dart';
import 'package:certain_salon/components/splash/providers/splash_provider.dart';
import 'package:certain_salon/helper/localization_helper.dart';
import 'package:certain_salon/localization/app_localization.dart';
import 'package:certain_salon/routes/app_routes.dart';
import 'package:certain_salon/util/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'di.dart' as di;
import 'package:flutter_localizations/flutter_localizations.dart';
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await di.init();

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => di.sl<SplashProvider>()),
    ChangeNotifierProvider(create: (context) => di.sl<AuthProvider>()),
    ChangeNotifierProvider(create: (context) => di.sl<LocalizationProvider>()),
  ], child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Locale> locals = [];
    for (var language in AppConstants.languages) {
      locals.add(Locale(language.languageCode!, language.countryCode));
    }

    return Consumer<SplashProvider>(builder: (context, splashProvider, child) {
      return MaterialApp.router(
        title: "Certain Salon",
        routeInformationProvider: AppRouter.router.routeInformationProvider,
        routeInformationParser: AppRouter.router.routeInformationParser,
        routerDelegate: AppRouter.router.routerDelegate,
        locale: Provider.of<LocalizationProvider>(context).locale,
        supportedLocales: locals,
        localizationsDelegates: const [
          AppLocalization.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate
        ],
        theme: ThemeData(fontFamily: 'Almarai'),
      );
    });
  }
}

class Get {
  static BuildContext? get context => navigatorKey.currentContext;
  static NavigatorState? get navigator => navigatorKey.currentState;
}

//0551740980
//123456