import 'package:certain_salon/common/models/config_model.dart';
import 'package:certain_salon/common/widgets/custom_button_widget.dart';
import 'package:certain_salon/common/widgets/custom_text_field.dart';
import 'package:certain_salon/components/auth/domian/models/signup_model.dart';
import 'package:certain_salon/components/auth/domian/models/user_log_data.dart';
import 'package:certain_salon/components/auth/providers/auth_provider.dart';
import 'package:certain_salon/components/splash/providers/splash_provider.dart';
import 'package:certain_salon/components/splash/screens/splash_screen.dart';
import 'package:certain_salon/helper/custom_snackbar_helper.dart';
import 'package:certain_salon/helper/localization_helper.dart';
import 'package:certain_salon/main.dart';
import 'package:certain_salon/util/dimensions.dart';
import 'package:certain_salon/util/images.dart';
import 'package:certain_salon/util/routes.dart';
import 'package:certain_salon/util/styles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final FocusNode _userNameFocus = FocusNode();
  final FocusNode _phoneFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();
  final FocusNode _confirmPasswordFocus = FocusNode();

  TextEditingController? _userNameController;
  TextEditingController? _phoneController;
  TextEditingController? _passwordController;
  TextEditingController? _confirmPasswordController;

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
    //print("Current Route : ${ModalRoute.of(context)?.settings.name}");

    double width = MediaQuery.of(context).size.width;
    final configModel =  Provider.of<SplashProvider>(context, listen: false).configModel!;


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
                          getTranslated('sign up', context),
                          style: almaraiExtraBold.copyWith(
                            fontSize: Dimensions.fontSizeExtraLarge,
                            color:
                                Theme.of(context).textTheme.bodyMedium?.color,
                          ),
                        )),

                        const SizedBox(
                            height: Dimensions.paddingSizeExtraLarge),
                        const SizedBox(
                            height: Dimensions.paddingSizeExtraLarge),

                        Selector<AuthProvider, bool>(
                          selector: (context, authProvider) =>
                              authProvider.isNumberLogin,
                          builder: (context, isNumberLogin, child) {
                            return CustomTextFieldWidget(
                              hintText: "",
                              title: getTranslated('user_name', context),
                              isShowBorder: true,
                              focusNode: _userNameFocus,
                              controller: _userNameController,
                              inputType: TextInputType.name,
                            );
                          },
                        ),
                        const SizedBox(height: Dimensions.paddingSizeLarge),

                        Selector<AuthProvider, bool>(
                          selector: (context, authProvider) =>
                              authProvider.isNumberLogin,
                          builder: (context, isNumberLogin, child) {
                            return CustomTextFieldWidget(
                              hintText: "",
                              title: getTranslated('email_phone', context),
                              isShowBorder: true,
                              focusNode: _phoneFocus,
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
                          focusNode: _passwordFocus,
                          controller: _passwordController,
                          inputAction: TextInputAction.done,
                          inputType: TextInputType.visiblePassword,
                        ),
                        const SizedBox(height: Dimensions.paddingSizeLarge),

                        CustomTextFieldWidget(
                          hintText: "",
                          title: getTranslated('confirm_password', context),
                          isShowBorder: true,
                          isPassword: true,
                          isShowSuffixIcon: true,
                          focusNode: _confirmPasswordFocus,
                          controller: _confirmPasswordController,
                          inputAction: TextInputAction.done,
                          inputType: TextInputType.visiblePassword,
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
                            buttonText: getTranslated('sign_up', context),
                            onPressed: () async => {
                                //print(configModel) 
                                _signup(configModel)
                            } ,
                            ),

                        const SizedBox(height: Dimensions.paddingSizeLarge),

                        InkWell(
                          //onTap: ()=> Navigator.of(context).pushNamed(RouteHelper.getCreateAccount()),
                          onTap: () => context.pushNamed(Routes.login),

                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "${getTranslated('have_an_account', context)} ",
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
                                  getTranslated('sign_in_here', context),
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

    _userNameController = TextEditingController();
    _phoneController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();

    final AuthProvider authProvider =
        Provider.of<AuthProvider>(context, listen: false);
    var testme = authProvider.getUserToken();
    if (authProvider.isLoggedIn()) {
      print("i am already logged in");
    }
    print("heeeeeeyyyyyyy the token is ${testme}");
  }

  void _signup(ConfigModel config) {
    final AuthProvider authProvider = Provider.of<AuthProvider>(context, listen: false);
    String username = _userNameController?.text.trim() ?? '';
    String phone = _phoneController?.text.trim() ?? '';
    String password = _passwordController?.text.trim() ?? '';
    String confirm_password = _confirmPasswordController?.text.trim() ?? '';

    print(username);
    print(phone);
    print(password);
    print(confirm_password);

    if (username.isEmpty) {
      showCustomSnackBarHelper(getTranslated('enter_username', context));
    } else if (password.isEmpty) {
      showCustomSnackBarHelper(getTranslated('enter_password', context));
    } else if (phone.isEmpty) {
      showCustomSnackBarHelper(getTranslated('enter_phone', context));
    } else if (confirm_password.isEmpty) {
      showCustomSnackBarHelper(
          getTranslated('enter_confirm_password_password', context));
    } else {

      SignUpModel signUpModel = SignUpModel(
        userName: username,
        phone: phone,
        password: password,
      );

      /* 
          authProvider.signOut().then((status) async {
            print("hello i am logged outttttttt succesffully ");
          }); 
        */

      authProvider
          .registration(context, signUpModel, config)
          .then((status) async {
        if (status.isSuccess) {
          //print("hello i am logged in succesffully ");
          //context.goNamed(Routes.menu);
        }
      });
    }
  }
}
