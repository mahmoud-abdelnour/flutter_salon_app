/*
* File : Navigation Drawer widget
* Version : 1.0.0
* Description :
* */

import 'package:certain_salon/components/home/components/home.dart';
import 'package:certain_salon/util/images.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';

class NavigationDrawerWidget extends StatefulWidget {
  const NavigationDrawerWidget({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _NavigationDrawerWidgetState createState() => _NavigationDrawerWidgetState();
}

class _NavigationDrawerWidgetState extends State<NavigationDrawerWidget> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

  int _selectedPage = 0;

  late ThemeData theme;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    theme = Theme.of(context);
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: const Text("Drawer"),
        ),
        drawer: Drawer(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            /*---------- Drawer Header ----------------*/
            Expanded(
              flex: 2,
              child: DrawerHeader(
                padding:
                    const EdgeInsets.only(bottom: 0, top: 0, right: 0, left: 0),
                margin:
                    const EdgeInsets.only(bottom: 0, top: 0, right: 0, left: 0),
                decoration: BoxDecoration(color: theme.primaryColor),
                child: Padding(
                  padding: const EdgeInsets.only(
                      bottom: 16, top: 0, right: 16, left: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Container(
                                  width: 60,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        image: AssetImage(Images.profiles[1]),
                                        fit: BoxFit.fill),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        image: AssetImage(Images.profiles[2]),
                                        fit: BoxFit.fill),
                                  ),
                                ),
                                Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        image: AssetImage(Images.profiles[3]),
                                        fit: BoxFit.fill),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Taslima Beattie",
                            style: TextStyle(
                                fontWeight: FontWeight.w200,
                                color: theme.colorScheme.onPrimary),
                          ),
                          Text("tas@gmail.com",
                              style: TextStyle(
                                  color: theme.colorScheme.onPrimary,
                                  fontWeight: FontWeight.w500))
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),

            /*------------- Drawer Content -------------*/
            Expanded(
              flex: 6,
              child: Container(
                color: theme.colorScheme.surface,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: ListView(
                    padding: const EdgeInsets.only(
                        bottom: 0, left: 0, right: 0, top: 0),
                    children: <Widget>[
                      singleDrawerItem(Icons.inbox, "All Inboxes", 0),
                      Divider(
                        height: 1,
                        color: theme.dividerColor,
                        thickness: 1,
                      ),
                      singleDrawerItem(Icons.email_outlined, "Primary", 1),
                      singleDrawerItem(Icons.groups_outlined, "Social", 2),
                      singleDrawerItem(Icons.tag_outlined, "Promotion", 3),
                      Container(
                        margin: const EdgeInsets.only(
                            top: 12, left: 16, right: 16, bottom: 12),
                        child: Text("ALL LABELS",
                            style: theme.textTheme.bodySmall!.merge(TextStyle(
                                color:
                                    theme.colorScheme.onSurface.withAlpha(240),
                                fontWeight: FontWeight.w700,
                                letterSpacing: 0.35,
                                wordSpacing: 1.2))),
                      ),
                      singleDrawerItem(Icons.star_outline, "Starred", 4),
                      singleDrawerItem(Icons.schedule_outlined, "Snoozed", 5),
                      singleDrawerItem(Icons.send_outlined, "Sent", 6),
                      singleDrawerItem(
                          Icons.insert_drive_file_outlined, "Drafts", 7),
                      singleDrawerItem(
                          Icons.mark_email_read_outlined, "All Mail", 8),
                      singleDrawerItem(
                          Icons.report_gmailerrorred_outlined, "Spam", 9),
                      singleDrawerItem(Icons.delete_outline, "Bin", 10),
                      Container(
                        margin: const EdgeInsets.only(
                            top: 12, left: 16, right: 16, bottom: 12),
                        child: Text("OTHER APPS",
                            style: theme.textTheme.bodySmall!.merge(TextStyle(
                                color:
                                    theme.colorScheme.onSurface.withAlpha(240),
                                fontWeight: FontWeight.w700,
                                letterSpacing: 0.35,
                                wordSpacing: 1.2))),
                      ),
                      singleDrawerItem(
                          Icons.calendar_today_outlined, "Calender", 11),
                      singleDrawerItem(
                          Icons.perm_contact_cal_outlined, "Contact", 12),
                      Divider(
                        height: 1,
                        color: theme.dividerColor,
                        thickness: 1,
                      ),
                      singleDrawerItem(Icons.build_outlined, "Settings", 13),
                      singleDrawerItem(
                          Icons.help_outline, "Help and feedback", 14),
                    ],
                  ),
                ),
              ),
            )
          ],
        )),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.chevron_left_outlined,
            color: theme.colorScheme.onPrimary,
          ),
        ),
        body: Container(
          color: theme.colorScheme.surface,
          child:EasyDateTimeLine(
              initialDate: DateTime.now(),
              onDateChange: (selectedDate) {
                //`selectedDate` the new date selected.
              },
              locale: "ar",
          ),
        ));
  }

  Widget singleDrawerItem(IconData iconData, String title, int position) {
    return ListTile(
      dense: true,
      contentPadding: const EdgeInsets.only(left: 16, right: 16),
      leading: Icon(iconData,
          size: 20,
          color: _selectedPage == position
              ? theme.colorScheme.primary
              : theme.colorScheme.onSurface.withAlpha(240)),
      title: Text(title,
          style: theme.textTheme.titleSmall!
              .merge(TextStyle(
                  fontWeight: _selectedPage == position
                      ? FontWeight.w600
                      : FontWeight.w500,
                  letterSpacing: 0.2))
              .merge(TextStyle(
                  color: _selectedPage == position
                      ? theme.colorScheme.primary
                      : theme.colorScheme.onSurface.withAlpha(240)))),
      onTap: () {
        setState(() {
          _selectedPage = position;
        });
         Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomeScreen()));
        _scaffoldKey.currentState!.openEndDrawer();
      },
    );
  }

  void showSnackBarWithFloating(String message) {
    scaffoldMessengerKey.currentState!.showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: theme.textTheme.titleSmall!
              .merge(TextStyle(color: theme.colorScheme.onPrimary)),
        ),
        backgroundColor: theme.colorScheme.primary,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}
