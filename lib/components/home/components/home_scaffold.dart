import 'package:certain_salon/util/dimensions.dart';
import 'package:certain_salon/util/images.dart';
import 'package:certain_salon/util/styles.dart';
import 'package:flutter/material.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';

class HomeScaffoldScreen extends StatefulWidget {
  const HomeScaffoldScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _NavigationDrawerWidgetState createState() => _NavigationDrawerWidgetState();
}

class _NavigationDrawerWidgetState extends State<HomeScaffoldScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

  late ThemeData theme;
  var selectedRole = 1;

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
      body: Container(
          color: theme.colorScheme.surface,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Expanded(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  EasyDateTimeLine(
                    initialDate: DateTime.now(),
                    onDateChange: (selectedDate) {
                      //`selectedDate` the new date selected.
                      print("selectedDate is ${selectedDate}");
                    },
                    locale: "ar",
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: theme.focusColor,
                              shape: BoxShape.rectangle,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(15)),
                              border: Border.all(
                                  color: selectedRole == 1
                                      ? theme.colorScheme.primary
                                      : Colors.transparent,
                                  width: 1)),
                          padding: const EdgeInsets.only(
                              left: 28, right: 28, top: 20, bottom: 20),
                          clipBehavior: Clip.none,
                          margin: const EdgeInsets.all(0),
                          child: Column(
                            children: [
                              Image.asset(Images.student,
                                  height: 64, width: 64),
                              const SizedBox(
                                height: 12,
                              ),
                              Text(
                                'Teacher',
                                style: TextStyle(
                                    color: selectedRole == 1
                                        ? theme.colorScheme.primary
                                        : theme.colorScheme.onSurface,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ),
                        Material(
                          child: InkWell(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            onTap: () {
                              /* print("inkwell pressed");
                                setState(() {
                                  //_selected.add(index);
                                }); */
                            },
                            child: Container(
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                  color: theme.focusColor,
                                  shape: BoxShape.rectangle,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(15)),
                                  border: Border.all(
                                      color: selectedRole != 1
                                          ? theme.colorScheme.primary
                                          : Colors.transparent,
                                      width: 1)),
                              padding: const EdgeInsets.only(
                                  left: 28, right: 28, top: 20, bottom: 20),
                              margin: const EdgeInsets.all(0),
                              child: Stack(
                                clipBehavior: Clip.none,
                                children: [
                                  Column(
                                    children: [
                                      Image.asset(Images.student,
                                          height: 64, width: 64),
                                      const SizedBox(
                                        height: 12,
                                      ),
                                      Text(
                                        'Teacher',
                                        style: TextStyle(
                                            color: selectedRole != 1
                                                ? theme.colorScheme.primary
                                                : theme.colorScheme.onSurface,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  ),
                                  Positioned(
                                    right: -30,
                                    top: -20,
                                    child: Container(
                                      padding: const EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                          color: theme.colorScheme.primary,
                                          borderRadius: const BorderRadius.only(
                                              bottomLeft: Radius.circular(8))),
                                      child: Icon(
                                        Icons.check,
                                        color: theme.colorScheme.onPrimary,
                                        size: 16,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ]),
                  GridView.count(
                      physics: const ClampingScrollPhysics(),
                      padding: const EdgeInsets.all(0),
                      crossAxisCount: 3,
                      shrinkWrap: true,
                      childAspectRatio: 2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      children: [
                        Material(
                          child: InkWell(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(15)),
                            onTap: () {},
                            child: Container(
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                  color: theme.focusColor,
                                  shape: BoxShape.rectangle,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(15)),
                                  border: Border.all(
                                      color: selectedRole == 1
                                          ? theme.colorScheme.primary
                                          : Colors.transparent,
                                      width: 1)),
                              padding: const EdgeInsets.only(
                                  left: 0, right: 0, top: 15, bottom: 15),
                              margin: const EdgeInsets.all(0),
                              child: Stack(
                                clipBehavior: Clip.none,
                                children: [
                                  Column(
                                    children: [
                                      Center(
                                        child: Text(
                                          '07:30 PM',
                                          style: TextStyle(
                                              color: selectedRole != 1
                                                  ? theme.colorScheme.primary
                                                  : theme.colorScheme.onSurface,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                    ],
                                  ),
                                  /* Positioned(
                                              right: -0,
                                              top: -0,
                                              child: Container(
                                                padding: const EdgeInsets.all(5) ,
                                                decoration: BoxDecoration(
                                                    color: theme.colorScheme.primary,
                                                    borderRadius: const BorderRadius.only(
                                                      bottomLeft: Radius.circular(8))),
                                                child: Icon(
                                                  Icons.check,
                                                  color: theme.colorScheme.onPrimary,
                                                  size: 16,
                                                ),
                                              ),
                                        ), */
                                ],
                              ),
                            ),
                          ),
                        ),
                      ]),
                ])),
                Row(
                children: [
                  Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: FilledButton(
                      style: ButtonStyle(
                        visualDensity: VisualDensity.compact,
                        backgroundColor:
                            WidgetStatePropertyAll(theme.colorScheme.primary),
                        shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5))),
                        padding: const WidgetStatePropertyAll(EdgeInsets.all(20)),
                      ),
                      onPressed: () {},
                      child:  Text("حجز موعد",style: almaraiExtraBold.copyWith(fontSize: Dimensions.fontSizeLarge)),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            )
          ])),
    );
  }
}


//shopping , quiz

/* profile page => [
  estate 
    apps =>  settings => account
] 
basics => hero 
home made */