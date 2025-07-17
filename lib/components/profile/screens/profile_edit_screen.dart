import 'package:certain_salon/common/models/reponse_model.dart';
import 'package:certain_salon/common/widgets/custom_button.dart';
import 'package:certain_salon/common/widgets/custom_spacing.dart';
import 'package:certain_salon/common/widgets/custom_text.dart';
import 'package:certain_salon/common/widgets/custom_text_style.dart';
import 'package:certain_salon/components/auth/providers/auth_provider.dart';
import 'package:certain_salon/components/profile/domain/models/userInfo_model.dart';
import 'package:certain_salon/components/profile/providers/profile_provider.dart';
import 'package:certain_salon/helper/custom_snackbar_helper.dart';
import 'package:certain_salon/localization/app_localization.dart';
import 'package:certain_salon/theme/app_theme.dart';
import 'package:certain_salon/theme/custom_theme.dart';
import 'package:certain_salon/util/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:provider/provider.dart';

class ProfileEditScreen extends StatefulWidget {
  @override
  _ProfileEditScreenState createState() => _ProfileEditScreenState();
}

class _ProfileEditScreenState extends State<ProfileEditScreen> {
  bool _passwordVisible = false;
  late CustomTheme customTheme;
  late ThemeData theme;

  final FocusNode _userNameFocus = FocusNode();
  final FocusNode _phoneFocus = FocusNode();
  final FocusNode _emailFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();
  final FocusNode _confirmPasswordFocus = FocusNode();

  TextEditingController? _userNameController;
  TextEditingController? _phoneController;
  TextEditingController? _emailController;
  TextEditingController? _passwordController;
  TextEditingController? _confirmPasswordController;

  @override
  void initState() {
    super.initState();
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
    print("sqsqqaaaaaaaqqq");
    _initLoading();
  }

  Future<void> _initLoading() async {
    final ProfileProvider profileProvider =
        Provider.of<ProfileProvider>(context, listen: false);

    WidgetsBinding.instance.addPostFrameCallback((ss) {
      //profileProvider.getUserInfo(true);
    });

    _userNameController = TextEditingController();
    _phoneController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();

    if (profileProvider.userInfoModel == null) {
      await profileProvider.getUserInfo(true).then((_) {
        _userNameController?.text =
            profileProvider.userInfoModel?.firstName ?? '';
        _phoneController?.text = profileProvider.userInfoModel?.phone ?? '';
        _emailController?.text = profileProvider.userInfoModel?.email ?? '';
      });

      //profileProvider.getUserInfo(true);
    } else {
      print("holaaaaa ----- ${profileProvider.userInfoModel?.firstName}");
      _userNameController?.text =
          profileProvider.userInfoModel?.firstName ?? '';
      _phoneController?.text = profileProvider.userInfoModel?.phone ?? '';
      _emailController?.text = profileProvider.userInfoModel?.email ?? '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProfileProvider>(
        builder: (context, profileProvider, child) {
      return Scaffold(
          appBar: AppBar(
            title: Text(' الملف الشخصي'),
          ),
          body: ListView(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.only(top: 36, left: 24, right: 24),
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.only(top: 20),
                      child: TextFormField(
                        style: CustomTextStyle.bodyLarge(
                            letterSpacing: 0.1,
                            color: theme.colorScheme.onSurface,
                            fontWeight: 500),
                        decoration: InputDecoration(
                          hintText: "الإسم",
                          hintStyle: CustomTextStyle.titleSmall(
                              letterSpacing: 0.1,
                              color: theme.colorScheme.onSurface,
                              fontWeight: 500),
                          border: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(8.0),
                              ),
                              borderSide: BorderSide.none),
                          enabledBorder: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(8.0),
                              ),
                              borderSide: BorderSide.none),
                          focusedBorder: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(8.0),
                              ),
                              borderSide: BorderSide.none),
                          filled: true,
                          fillColor: customTheme.card,
                          prefixIcon: const Icon(
                            LucideIcons.user,
                          ),
                          contentPadding: const EdgeInsets.all(0),
                        ),
                        controller:
                            //TextEditingController(text: "${profileProvider.userInfoModel?.firstName}"),
                            _userNameController,
                        textCapitalization: TextCapitalization.sentences,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 20),
                      child: TextFormField(
                        style: CustomTextStyle.bodyLarge(
                            letterSpacing: 0.1,
                            color: theme.colorScheme.onSurface,
                            fontWeight: 500),
                        decoration: InputDecoration(
                          hintText: "البريد الالكتروني",
                          hintStyle: CustomTextStyle.titleSmall(
                              letterSpacing: 0.1,
                              color: theme.colorScheme.onSurface,
                              fontWeight: 500),
                          border: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(8.0),
                              ),
                              borderSide: BorderSide.none),
                          enabledBorder: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(8.0),
                              ),
                              borderSide: BorderSide.none),
                          focusedBorder: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(8.0),
                              ),
                              borderSide: BorderSide.none),
                          filled: true,
                          fillColor: customTheme.card,
                          prefixIcon: const Icon(
                            LucideIcons.mail,
                          ),
                          contentPadding: const EdgeInsets.all(0),
                        ),
                        keyboardType: TextInputType.emailAddress,
                        controller:
                            //TextEditingController(text: "nat@gmail.com"),
                            _emailController,
                        textCapitalization: TextCapitalization.sentences,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 20),
                      child: TextFormField(
                        style: CustomTextStyle.bodyLarge(
                            letterSpacing: 0.1,
                            color: theme.colorScheme.onSurface,
                            fontWeight: 500),
                        decoration: InputDecoration(
                          hintText: "رقم الجوال",
                          hintStyle: CustomTextStyle.titleSmall(
                              letterSpacing: 0.1,
                              color: theme.colorScheme.onSurface,
                              fontWeight: 500),
                          border: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(8.0),
                              ),
                              borderSide: BorderSide.none),
                          enabledBorder: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(8.0),
                              ),
                              borderSide: BorderSide.none),
                          focusedBorder: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(8.0),
                              ),
                              borderSide: BorderSide.none),
                          filled: true,
                          fillColor: customTheme.card,
                          prefixIcon: const Icon(
                            LucideIcons.phone,
                          ),
                          contentPadding: const EdgeInsets.all(0),
                        ),
                        keyboardType: TextInputType.emailAddress,
                        textCapitalization: TextCapitalization.sentences,
                        controller:
                            //TextEditingController(text: "091-987456321"),
                            _phoneController,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 20),
                      child: TextFormField(
                        style: CustomTextStyle.bodyLarge(
                            letterSpacing: 0.1,
                            color: theme.colorScheme.onSurface,
                            fontWeight: 500),
                        decoration: InputDecoration(
                          hintText: " كلمة المرور",
                          hintStyle: CustomTextStyle.titleSmall(
                              letterSpacing: 0.1,
                              color: theme.colorScheme.onSurface,
                              fontWeight: 500),
                          border: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(8.0),
                              ),
                              borderSide: BorderSide.none),
                          enabledBorder: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(8.0),
                              ),
                              borderSide: BorderSide.none),
                          focusedBorder: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(8.0),
                              ),
                              borderSide: BorderSide.none),
                          filled: true,
                          fillColor: customTheme.card,
                          prefixIcon: const Icon(
                            LucideIcons.lock,
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _passwordVisible
                                  ? LucideIcons.eye
                                  : LucideIcons.eyeOff,
                            ),
                            onPressed: () {
                              setState(() {
                                _passwordVisible = !_passwordVisible;
                              });
                            },
                          ),
                          contentPadding: const EdgeInsets.all(0),
                        ),
                        textCapitalization: TextCapitalization.sentences,
                        obscureText: _passwordVisible,
                        controller: _passwordController,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 20),
                      child: TextFormField(
                        style: CustomTextStyle.bodyLarge(
                            letterSpacing: 0.1,
                            color: theme.colorScheme.onSurface,
                            fontWeight: 500),
                        decoration: InputDecoration(
                          hintText: "تأكيد كلمة المرور",
                          hintStyle: CustomTextStyle.titleSmall(
                              letterSpacing: 0.1,
                              color: theme.colorScheme.onSurface,
                              fontWeight: 500),
                          border: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(8.0),
                              ),
                              borderSide: BorderSide.none),
                          enabledBorder: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(8.0),
                              ),
                              borderSide: BorderSide.none),
                          focusedBorder: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(8.0),
                              ),
                              borderSide: BorderSide.none),
                          filled: true,
                          fillColor: customTheme.card,
                          prefixIcon: const Icon(
                            LucideIcons.lock,
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _passwordVisible
                                  ? LucideIcons.eye
                                  : LucideIcons.eyeOff,
                            ),
                            onPressed: () {
                              setState(() {
                                _passwordVisible = !_passwordVisible;
                              });
                            },
                          ),
                          contentPadding: const EdgeInsets.all(0),
                        ),
                        textCapitalization: TextCapitalization.sentences,
                        obscureText: _passwordVisible,
                        controller: _confirmPasswordController,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 70),
                      child: CustomButton.rounded(
                          elevation: 0,
                          padding: CustomSpacing.y(15),
                          //backgroundColor: customTheme.colorWarning,
                          backgroundColor: theme.primaryColor,
                          //buttonType:CustomButtonType.elevated  ,
                          borderColor: theme.dividerColor,
                          borderRadiusAll: AppConstants.buttonRadius.small,
                          block: true,
                          onPressed: () async {
                            _onSubmit();
                          },
                          child: CustomText(
                            'تحديث',
                            fontSize: 18,
                            color: customTheme.onInfo,
                            fontWeight: 800,
                          )),
                    ),

                    /* Container(
                          margin: const EdgeInsets.only(top: 24),
                          child: ElevatedButton(
                            onPressed: () {},
                            child: Text("UPDATE",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: theme.colorScheme.onPrimary,
                                    letterSpacing: 0.3)),
                      )), */
                  ],
                ),
              ),
            ],
          ));
    });
  }

  Future<void> _onSubmit() async {
    final ProfileProvider profileProvider =
        Provider.of<ProfileProvider>(context, listen: false);
    final AuthProvider authProvider =
        Provider.of<AuthProvider>(context!, listen: false);

    String userName = _userNameController?.text.trim() ?? '';
    String email = _userNameController?.text.trim() ?? '';
    String phoneNumber = _phoneController?.text.trim() ?? '';
    String password = _passwordController?.text.trim() ?? '';
    String _confirmPassword = _confirmPasswordController?.text.trim() ?? '';

    if (userName.isEmpty) {
      showCustomSnackBarHelper("لابد من ادخال اسم المستخدم");
    } else if (phoneNumber.isEmpty) {
      showCustomSnackBarHelper("لابد من ادخال رقم الجوال");
    } else if ((!password.isEmpty || !_confirmPassword.isEmpty) &&
        password != _confirmPassword) {
      showCustomSnackBarHelper("كلمة المرور غير متطابقة");
    } else {
      //print("hhhhhhhhh");
      UserInfoModel? updateUserInfoModel = profileProvider.userInfoModel;
      updateUserInfoModel?.firstName = _userNameController?.text;
      updateUserInfoModel?.phone = _phoneController?.text;
      updateUserInfoModel?.email = _emailController?.text;

      String password = _passwordController?.text.trim() ?? '';

      ResponseModel responseModel =
          await profileProvider.updateUserInfo(updateUserInfoModel!, password);

      if (responseModel.isSuccess) {
        profileProvider.getUserInfo(true);
        _passwordController?.text = '';
        _confirmPasswordController?.text = '';
        showCustomSnackBarHelper('updated_successfully'.tr, isError: false);
      } else {
        showCustomSnackBarHelper(responseModel.message!, isError: true);
      }
    }
  }
}
