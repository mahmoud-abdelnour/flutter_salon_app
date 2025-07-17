import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
class BottomNavigationBarWidget extends StatelessWidget {
  
  const BottomNavigationBarWidget({
    required this.navigationShell,
    Key? key,
  }) : super(key: key ?? const ValueKey<String>('ScaffoldWithNavBar'));

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: BottomNavigationBar(
        elevation: 5,
        backgroundColor: theme.primaryColorLight,
        iconSize: 25,
        selectedFontSize: 15,
        selectedIconTheme:const IconThemeData(size: 27),
        selectedItemColor: theme.colorScheme.onPrimaryContainer,

        unselectedIconTheme: IconThemeData(size: 27,color: theme.primaryColorDark ),
        unselectedItemColor: theme.primaryColorDark,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ' الرئيسية ' ),
          BottomNavigationBarItem(icon: Icon(Icons.work), label: 'حجز موعد'),
          BottomNavigationBarItem(icon: Icon(Icons.tab),  label: 'موديل'),
          BottomNavigationBarItem(icon: Icon(Icons.person),  label: 'الإعدادات'),
        ],
        currentIndex: navigationShell.currentIndex,
        onTap: (int index) => navigationShell.goBranch(index),
        type : BottomNavigationBarType.fixed
      ),
    );
  }

}
