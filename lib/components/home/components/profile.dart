import 'package:certain_salon/common/widgets/custom_spacing.dart';
import 'package:certain_salon/common/widgets/custom_text.dart';
import 'package:certain_salon/components/auth/providers/auth_provider.dart';
import 'package:certain_salon/helper/custom_snackbar_helper.dart';
import 'package:certain_salon/localization/app_localization.dart';
import 'package:certain_salon/util/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ProfileScreenWidgetState createState() => _ProfileScreenWidgetState();
}

class _ProfileScreenWidgetState extends State<ProfileScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text("الإعدادات"),
      ),
      body: Container(
        padding: CustomSpacing.top(CustomSpacing.safeAreaTop(context)),
        child: Column(
          children: [
            SizedBox(
              height: 2,
              child: Container(
                height: 2,
              ),
            ),
            Expanded(
              child: _buildBody(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSingleRow(
      {String? title,
      IconData? icon,
      String? navigationType,
      String? navigation}) {
    return Consumer<AuthProvider>(
        builder: (context, auth, child) => InkWell(
              onTap: () {
                if (navigation != null) {
                  //context.go(navigation);
                  GoRouter.of(context).pushReplacement(navigation);
                } else if (navigationType == 'logout') {
                    //todo logut code here
                    //context.goNamed(Routes.guestAppointment);
                    auth.signOut().then((value) {
                        context.go('/a');
                        showCustomSnackBarHelper('logout_successful'.tr,isError: false);  
                    });
                }
              },
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      color: Theme.of(context).colorScheme.primaryContainer,
                    ),
                    child: Icon(
                      icon,
                      color: Theme.of(context).colorScheme.primary,
                      size: 20,
                    ),
                  ),
                  CustomSpacing.width(16),
                  Expanded(
                    child: Text(
                      title!,
                      style: const TextStyle(letterSpacing: .5),
                    ),
                  ),
                  CustomSpacing.width(16),
                  Icon(
                    Icons.keyboard_arrow_left,
                    color:
                        Theme.of(context).colorScheme.onSurface.withAlpha(160),
                  ),
                ],
              ),
            ));
  }

  Widget _buildBody() {
    return ListView(
      padding: CustomSpacing.fromLTRB(
          20, CustomSpacing.safeAreaTop(context), 20, 20),
      children: [
        CustomText.headlineSmall(
          'نهى احمد الزهراني',
          textAlign: TextAlign.center,
          letterSpacing: 0.8,
        ),
        CustomSpacing.height(4),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomSpacing.width(6),
          ],
        ),
        CustomSpacing.height(24),
        Text(
          '',
          style: TextStyle(
              color: Theme.of(context).colorScheme.onSurface,
              fontWeight: FontWeight.w600),
        ),
        CustomSpacing.height(24),
        _buildSingleRow(
            title: 'حجوزاتي',
            icon: LucideIcons.creditCard,
            navigation: '/d/user_appointments'),
        CustomSpacing.height(8),
        const Divider(),
        CustomSpacing.height(8),
        _buildSingleRow(
            title: 'تغيير كلمة المرور',
            icon: LucideIcons.user,
            navigation: '/d/user_password'),
        CustomSpacing.height(8),
        const Divider(),
        CustomSpacing.height(8),
        _buildSingleRow(
            title: 'تسجيل خروج',
            icon: LucideIcons.logOut,
            navigationType: 'logout'),
      ],
    );
  }
}
