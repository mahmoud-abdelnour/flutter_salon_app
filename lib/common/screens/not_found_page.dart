import 'package:certain_salon/helper/localization_helper.dart';
import 'package:certain_salon/theme/app_theme.dart';
import 'package:flutter/material.dart';


class NotFoundScreen extends StatelessWidget {
  const NotFoundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
   
      body: SingleChildScrollView(child: Column(children: [

        ConstrainedBox(
          constraints: BoxConstraints(
            minHeight:  height - 100
          ),
          child: Center(child: TweenAnimationBuilder(
            curve: Curves.bounceOut,
            duration: const Duration(seconds: 2),
            tween: Tween<double>(begin: 0.0,end: 30.0),
            builder: (BuildContext context, dynamic value, Widget? child){
              return Column(
                children: [
                   Icon(
                        Icons.info,
                        color: theme.colorScheme.primary,
                        size: 80,
                    ),
                    
                    SizedBox(height: MediaQuery.of(context).size.height * 0.01),

                    Text(
                      getTranslated('page_not_found', context),
                      style: const TextStyle(fontSize: 18),
                    ),
                ],
              );
            },

          )),
        ),

      ])),
    );
  }
}
