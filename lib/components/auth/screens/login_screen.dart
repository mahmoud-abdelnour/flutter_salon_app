import 'package:certain_salon/common/models/config_model.dart';
import 'package:certain_salon/common/widgets/custom_button_widget.dart';
import 'package:certain_salon/common/widgets/custom_text_field.dart';
import 'package:certain_salon/components/auth/domian/models/user_log_data.dart';
import 'package:certain_salon/components/auth/providers/auth_provider.dart';
import 'package:certain_salon/components/splash/providers/splash_provider.dart';
import 'package:certain_salon/components/splash/screens/splash_screen.dart';
import 'package:certain_salon/helper/custom_snackbar_helper.dart';
import 'package:certain_salon/helper/localization_helper.dart';
import 'package:certain_salon/main.dart';
import 'package:certain_salon/util/app_constants.dart';
import 'package:certain_salon/util/dimensions.dart';
import 'package:certain_salon/util/images.dart';
import 'package:certain_salon/util/routes.dart';
import 'package:certain_salon/util/styles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //late final SharedPreferences sharedPreferences;

  final FocusNode _phoneFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();

  TextEditingController? _phoneController;
  TextEditingController? _passwordController;
  GlobalKey<FormState>? _formKeyLogin;
  bool email = true;
  bool phone = false;
  String? countryCode;

  @override
  void initState() {
    super.initState();
 
    

    _initLoading();
  }

  @override
  void dispose() {
    _phoneController!.dispose();
    //_passwordController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    //final configModel = Provider.of<SplashProvider>(context, listen: false).configModel!;

    return Scaffold(
      appBar: null,
      body: SafeArea(
          child: CustomScrollView(slivers: [
        SliverToBoxAdapter(
            child: Padding(
          padding: const EdgeInsets.all(0),
          child: Center(
              child: Container(
            width: width,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Consumer<AuthProvider>(
              builder: (context, authProvider, child) => Form(
                  key: _formKeyLogin,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                            child: Padding(
                          padding: const EdgeInsets.all(
                              Dimensions.paddingSizeDefault),
                          child: Image.asset(
                            Images.appLogo,
                            height: MediaQuery.of(context).size.height / 4.5,
                            fit: BoxFit.scaleDown,
                          ),
                        )),
                        Center(
                            child: Text(
                          getTranslated('login', context),
                          style: almaraiExtraBold.copyWith(
                            fontSize: Dimensions.fontSizeExtraLarge,
                            color:
                                Theme.of(context).textTheme.bodyMedium?.color,
                          ),
                        )),

                        const SizedBox(
                            height: Dimensions.paddingSizeExtraLarge),
                        const SizedBox(height: Dimensions.paddingSizeSmall),

                        Selector<AuthProvider, bool>(
                          selector: (context, authProvider) =>
                              authProvider.isNumberLogin,
                          builder: (context, isNumberLogin, child) {
                            return CustomTextFieldWidget(
                              hintText: "",
                              title: getTranslated('email_phone', context),
                              isShowBorder: true,
                              //focusNode: _phoneFocus,
                              nextFocus: _passwordFocus,
                              controller: _phoneController,
                              inputType: TextInputType.phone,
                            );
                          },
                        ),
                        const SizedBox(height: Dimensions.paddingSizeLarge),

                        CustomTextFieldWidget(
                          hintText: "",
                          title: getTranslated('password', context),
                          isShowBorder: true,
                          isPassword: true,
                          isShowSuffixIcon: true,
                          //focusNode: _passwordFocus,
                          controller: _passwordController,
                          inputAction: TextInputAction.done,
                        ),
                        const SizedBox(height: Dimensions.paddingSizeLarge),

                        // for remember me section
                        /*  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [

                  InkWell(
                    onTap: ()=> Navigator.of(context).pushNamed(Routes.forgetPassword, arguments: const ForgotPasswordScreen()),
                    child: Padding(padding: const EdgeInsets.all(8.0),
                      child: Text(
                        getTranslated('forgot_password', context),
                        style: Theme.of(context).textTheme.displayMedium!.copyWith(
                          fontSize: Dimensions.fontSizeSmall,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
                  ),

                ]), */
                        const SizedBox(height: Dimensions.paddingSizeSmall),

                        Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              authProvider.loginErrorMessage!.isNotEmpty
                                  ? CircleAvatar(
                                      backgroundColor:
                                          Theme.of(context).colorScheme.error,
                                      radius: Dimensions.radiusSizeSmall)
                                  : const SizedBox.shrink(),
                              const SizedBox(width: 8),
                              Expanded(
                                  child: Text(
                                authProvider.loginErrorMessage ?? "",
                                style: Theme.of(context)
                                    .textTheme
                                    .displayMedium!
                                    .copyWith(
                                      fontSize: Dimensions.fontSizeSmall,
                                      color:
                                          Theme.of(context).colorScheme.error,
                                    ),
                              )),
                            ]),
                        const SizedBox(height: Dimensions.paddingSizeSmall),

                        // for login button
                        CustomButtonWidget(
                          isLoading: authProvider.isLoading,
                          buttonText: getTranslated('sign_in', context),
                          onPressed: () async => _login(),
                        ),

                        const SizedBox(height: Dimensions.paddingSizeLarge),

                        InkWell(
                          onTap: () => context.pushNamed(Routes.signup),
                          //onTap: ()=> GoRouter.of(context).go(Routes.splash),

                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "${getTranslated('do_not_have_an_account', context)} ",
                                  style: almaraiBold.copyWith(
                                    fontSize: Dimensions.fontSizeDefault,
                                    color: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.color,
                                  ),
                                ),
                                const SizedBox(
                                    width: Dimensions.paddingSizeSmall),
                                Text(
                                  getTranslated('sign_up_here', context),
                                  style: almaraiRegular.copyWith(
                                    decoration: TextDecoration.underline,
                                    decorationColor:
                                        Theme.of(context).primaryColor,
                                    fontSize: Dimensions.fontSizeDefault,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                              ]),
                        ),

                        const SizedBox(height: Dimensions.paddingSizeLarge),
                      ])),
            ),
          )),
        )),
      ])),
    );
  }

  void _initLoading() {
    _formKeyLogin = GlobalKey<FormState>();
    _phoneController = TextEditingController();
    _passwordController = TextEditingController();

    final AuthProvider authProvider =
        Provider.of<AuthProvider>(context, listen: false);
    var testme = authProvider.getUserToken();
    if (authProvider.isLoggedIn()) {
      print("i am already logged in");
    }

    print("heeeeeeyyyyyyy the token is ${testme}");
  }

  void _login() {
    final AuthProvider authProvider =
        Provider.of<AuthProvider>(context, listen: false);
    //String phone = _phoneController?.text.trim() ?? '';
    //String password = _passwordController?.text.trim() ?? '';

    String phone = '0551740980';
    String password = '123456';

    if (phone.isEmpty) {
      showCustomSnackBarHelper(getTranslated('enter_phone', context));
    } else if (password.isEmpty) {
      showCustomSnackBarHelper(getTranslated('enter_password', context));
    } else {

        /* 
        authProvider.signOut().then((status) async {
          print("hello i am logged outttttttt succesffully ");
        }); 
        */

      authProvider.login(context, phone, password).then((status) async {
        if (status.isSuccess) {
          print("hello i am logged in succesffully ");

       /*    SharedPreferences sharedPreferences =
              await SharedPreferences.getInstance();
          var stroredSelectedDate =
              sharedPreferences.getString(AppConstants.stroredSelectedDate);

          //print('stroredSelectedDate');
          //print(stroredSelectedDate);

          var stroredSelectedServiceId =
              sharedPreferences?.getInt(AppConstants.stroredSelectedService);
          var stroredSelectedEmployeeId =
              sharedPreferences?.getInt(AppConstants.stroredSelectedEmployee);
          var stroredSelectedTimeSlot = sharedPreferences
              ?.getString(AppConstants.stroredSelectedTimeSlot);

          if (stroredSelectedDate != null &&
              stroredSelectedServiceId != null &&
              stroredSelectedEmployeeId != null &&
              stroredSelectedTimeSlot != null) {
            context.goNamed(Routes.guestAppointment);
          } else {
            context.goNamed(Routes.home);
          } */

            context.goNamed(Routes.home);

        }
      });
    }
  }
}
