import 'package:certain_salon/common/widgets/custom_spacing.dart';
import 'package:certain_salon/util/dimensions.dart';
import 'package:certain_salon/util/images.dart';
import 'package:certain_salon/util/styles.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';

class AppointmentScreen extends StatefulWidget {
  const AppointmentScreen({super.key});

  @override
  State<AppointmentScreen> createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {
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
        appBar: AppBar(
          title: Text('حجز موعد'),
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
                        Padding(
                          padding: CustomSpacing.all(Dimensions.paddingSizeDefault) ,
                          child: 
                          
                           
                                  GridView.count(
                                      physics: const ClampingScrollPhysics(),
                                      padding: const EdgeInsets.all(0),
                                      crossAxisCount: 3,
                                      shrinkWrap: true,
                                      children: [
                                          Material(
                                            child: InkWell(
                                              borderRadius:
                                                  BorderRadius.all(Radius.circular(15)),
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
                                                            borderRadius:
                                                                const BorderRadius.only(
                                                                    bottomLeft:
                                                                        Radius.circular(8))),
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
                                      ]
                                  ),

/* 
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
                                    padding: CustomSpacing.fromLTRB(28,20,28,20) ,
                                    clipBehavior: Clip.none,
                                    margin: const EdgeInsets.all(0),
                                    child: Column(
                                      children: [
                                        Image.asset(Images.student, height: 64, width: 64),
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
                                  
 */

                                 /* 
                                  Material(
                                    child: InkWell(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(15)),
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
                                                    borderRadius:
                                                        const BorderRadius.only(
                                                            bottomLeft:
                                                                Radius.circular(8))),
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
 */


                              
                           
                        ),
                        Padding(
                          padding: CustomSpacing.all(Dimensions.paddingSizeDefault) ,
                          child: GridView.count(
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
                                                        : theme
                                                            .colorScheme.onSurface,
                                                    fontWeight: FontWeight.w600),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ]
                      ),
                        )
                    
                    ])
                  ),

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
                              padding:
                                  const WidgetStatePropertyAll(EdgeInsets.all(20)),
                            ),
                            onPressed: () {},
                            child: Text("حجز موعد",style: almaraiExtraBold.copyWith(fontSize: Dimensions.fontSizeLarge)),
                          ),
                        ),
                      ),
                    ],
                  ),
                   CustomSpacing.height(20)
                ])
              )
          );
  }
}



 /* GridView.count(
                  physics: const ClampingScrollPhysics(),
                  shrinkWrap: true,
                  childAspectRatio: .8,
                  crossAxisCount: 3,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                  children: <Widget>[
                      singleEmp(),
                      singleEmp(),
                      singleEmp(),
                      singleEmp(),
                      singleEmp(),
                      singleEmp(),
                      singleEmp(),
                      singleEmp(),
                      singleEmp(),
                      singleEmp(),
                  ]) */



                    /* GridView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      //physics: BouncingScrollPhysics(),
                      physics: const ClampingScrollPhysics(),
                      gridDelegate: const  SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: .8,
                        crossAxisCount: 3,
                        crossAxisSpacing: 15,
                        mainAxisSpacing: 15,
                      ),
                    itemCount: 12, 
                    itemBuilder: (BuildContext context, int index) {
                      return singleEmp();
                    })  */
                    