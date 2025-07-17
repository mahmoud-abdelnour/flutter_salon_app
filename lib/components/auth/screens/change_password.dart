/*
* File : Edit Profile
* Version : 1.0.0
* */

import 'dart:io';

import 'package:certain_salon/common/widgets/custom_button.dart';
import 'package:certain_salon/common/widgets/custom_spacing.dart';
import 'package:certain_salon/common/widgets/custom_text.dart';
import 'package:certain_salon/common/widgets/custom_text_style.dart';
import 'package:certain_salon/theme/app_theme.dart';
import 'package:certain_salon/theme/custom_theme.dart';
import 'package:certain_salon/util/app_constants.dart';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:provider/provider.dart';

class ChangePasswordScreen extends StatefulWidget {
  @override
  _ChangePasswordScreenState createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  bool _passwordVisible = false;
  late CustomTheme customTheme;
  late ThemeData theme;

  final ImagePicker picker = ImagePicker();

  XFile? imageFile;

  @override
  void initState() {
    super.initState();
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;


  }


  @override
  Widget build(BuildContext context) {
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
                        hintText: "Name",
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
                          TextEditingController(text: "Marcelina Willis"),
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
                        hintText: "Email",
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
                      controller: TextEditingController(text: "nat@gmail.com"),
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
                        hintText: "Phone",
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
                      controller: TextEditingController(text: "091-987456321"),
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
                        hintText: "Change Password",
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
                    ),
                  ),

                  Container(
                      margin: const EdgeInsets.only(top: 70),
                      child:
                      CustomButton.rounded(
                          elevation: 0,
                          padding: CustomSpacing.y(15),
                          //backgroundColor: customTheme.colorWarning,
                          backgroundColor: theme.primaryColor,
                          //buttonType:CustomButtonType.elevated  ,
                          borderColor: theme.dividerColor,
                          borderRadiusAll: AppConstants.buttonRadius.small,
                          block: true,
                          onPressed: () {},
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
  }
}
