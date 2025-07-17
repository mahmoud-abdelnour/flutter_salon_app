import 'dart:async';
import 'package:certain_salon/common/models/config_model.dart';
import 'package:certain_salon/components/auth/providers/auth_provider.dart';
import 'package:certain_salon/components/splash/providers/splash_provider.dart';
import 'package:certain_salon/routes/app_routes.dart';
import 'package:certain_salon/util/routes.dart';
import 'package:certain_salon/util/app_constants.dart';
import 'package:certain_salon/util/dimensions.dart';
import 'package:certain_salon/util/images.dart';
import 'package:certain_salon/util/styles.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  StreamSubscription<List<ConnectivityResult>>? subscription;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    _checkConnectivity();

    Provider.of<SplashProvider>(context, listen: false).initSharedData();
    _route();
  }

  void _route() {
    final SplashProvider splashProvider =
        Provider.of<SplashProvider>(context, listen: false);
    // Provider.of<SplashProvider>(context, listen: false).removeSharedData();
    splashProvider.initConfig().then((bool isSuccess) async {
      final ConfigModel? configModel = splashProvider.configModel;

      if (isSuccess) {
        splashProvider.initializeScreenList(context);

        Timer(const Duration(seconds: 1), () async {
          if (Provider.of<AuthProvider>(context, listen: false).isLoggedIn()) {
            context.go('/a');

            //Provider.of<AuthProvider>(context, listen: false).updateToken();
            //Navigator.of(context).pushNamedAndRemoveUntil(Routes.menu, (route) => false);
          } else {
            if (Provider.of<SplashProvider>(context, listen: false).showIntro()) {
              
              context.go('/a');

              //Navigator.pushNamedAndRemoveUntil(context, Routes.onBoarding, (route) => false, arguments: OnBoardingScreen());
            } else {
              print("hello i want to go to home");
              //Navigator.of(context).pushNamedAndRemoveUntil(Routes.menu, (route) => false);
            }

            //Navigator.of(context).pushNamedAndRemoveUntil(Routes.login, (route) => false);
            //context.goNamed(Routes.signup);
            //context.goNamed(Routes.login);
            context.go('/a');

          }
        });
      }
    });
  }

  void _checkConnectivity() {
    bool isFirst = true;
    subscription = Connectivity()
        .onConnectivityChanged
        .listen((List<ConnectivityResult> result) {
      bool isConnected = result.contains(ConnectivityResult.wifi) ||
          result.contains(ConnectivityResult.mobile);

      if ((isFirst && !isConnected) || !isFirst && context.mounted) {
        //showCustomSnackBarHelper(getTranslated(isConnected ?  'connected' : 'no_internet_connection', context), isError: !isConnected);

        if (isConnected &&
            ModalRoute.of(context)?.settings.name == Routes.splash) {
          _route();
        }
      }
      isFirst = false;
    });
  }

  @override
  Widget build(BuildContext context) {

    /* return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [

          Image.asset(Images.appLogo, height: 130, width: 500),
          const SizedBox(height: Dimensions.paddingSizeSmall),
          Text(AppConstants.appName,
              textAlign: TextAlign.center,
              style: almaraiBold.copyWith(
                color: Theme.of(context).primaryColor,
                fontSize: 30,
              )),

              
        ],
      ),
    ); */


    return Scaffold(
  body: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      Expanded( // Takes all available space
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/certain_splash.png'), // Your image path
              fit: BoxFit.cover, // Covers entire space
            ),
          ),
        ),
      ),
    ],
  ),
);


  }
}
