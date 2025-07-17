import 'package:certain_salon/common/widgets/custom_spacing.dart';
import 'package:certain_salon/components/service/domain/models/service_model.dart';
import 'package:certain_salon/components/service/providers/service_provider.dart';
import 'package:certain_salon/components/service/screens/service_details_screen.dart';
import 'package:certain_salon/util/images.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../../../common/widgets/custom_image_widget.dart';

class ServicesWidget extends StatelessWidget {
  const ServicesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return Consumer<ServiceProvider>(
        builder: (context, serviceProvider, child) {
      //print("serviceProvider.homeServicesList");
      //print(serviceProvider.homeServicesList?[0].serviceImage);

      return Container(
        padding: CustomSpacing.fromLTRB(20, 0, 20, 20),
        child: ListView(
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          children: [
            serviceProvider.homeServicesList != null
                ? serviceProvider.homeServicesList!.isNotEmpty
                    ? GridView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        padding: CustomSpacing.zero,
                        //physics: BouncingScrollPhysics(),
                        physics: const ClampingScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          mainAxisSpacing: 20,
                          childAspectRatio: 2 / 2,
                          crossAxisSpacing: 20,
                        ),
                        itemCount: serviceProvider.homeServicesList!.length,
                        itemBuilder: (BuildContext context, int index) {
                          //print(serviceProvider.homeServicesList![index]);
                          ServiceModel? serviceModel =
                              serviceProvider.homeServicesList![index];
                          int? serviceId = serviceModel.id;

                          /*  return  SinglePageItem(
                            title: serviceModel.name??'',
                            icon: Images.tie,
                            //navigation: ServiceDetailsScreen(serviceId:'2'),
                            navigation: '/a/servvice_details/$serviceId',
                          ); */

                       /*    print("serviceModel.serviceImage");
                          print(serviceModel); */

                          return singleCategory(
                            context,
                            image: serviceModel.serviceImage ?? '',
                            title: serviceModel.name??'',
                            navigation: '/a/service_details/$serviceId',
                          );
                        })
                    : const Text('No services')
                : Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation(
                          Theme.of(context).primaryColor),
                      strokeWidth: 3,
                    ),
                  )

            /* 

                GridView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    //physics: BouncingScrollPhysics(),
                    physics: const ClampingScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 1.1,
                      crossAxisCount: 3,
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 15,
                    ),
                    itemCount:4,
                    itemBuilder: (BuildContext context, int index) {
                      //return singleService( serviceItem: appointmentProvider.servicesList![index], appointmentProvider: appointmentProvider);

                      return singleCategory(
                        context,
                            image: Images.image_1,
                            title: "سشوار",
                            navigation: '/a/servvice_details/65',
                      );
                    }), */

            /*    
            GridView.count(
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                crossAxisCount: 3,
                padding: CustomSpacing.zero,
                mainAxisSpacing: 20,
                childAspectRatio: 2 / 2,
                crossAxisSpacing: 20,
                
                children:  [              
               
                  // SinglePageItem(
                  //   title: "عروسة",
                  //   icon: Images.tie,
                  //   //navigation: AppointmentScreen(),
                  //   navigation:'',
                  // ),
              

                  singleCategory(
                     context,
                        image: Images.image_1,
                        title: "سشوار",
                        navigation: '/a/servvice_details/65',
                  ),

                  singleCategory(
                      context,
                        image: Images.image_1,
                        title: "عروسة",
                        navigation: '/a/servvice_details/2',
                  ),

                  singleCategory(
                      context,
                        image: Images.image_1,
                        title: "باديكير",
                        navigation: '/a/servvice_details/2',
                  ),

                  singleCategory(
                      context,
                        image: Images.image_1,
                        title: "باديكير",
                        navigation: '/a/servvice_details/2',
                  ),

                  singleCategory(
                      context,
                        image: Images.image_1,
                        title: "باديكير",
                        navigation: '/a/servvice_details/16',
                  ),

                  singleCategory(
                      context,
                        image: Images.image_1,
                        title: "باديكير",
                        navigation: '/a/servvice_details/2',
                  ),

                  singleCategory(
                      context,
                        image: Images.image_1,
                        title: "باديكير",
                        navigation: '/a/servvice_details/2',
                  ),

                  singleCategory(
                      context,
                        image: Images.image_1,
                        title: "باديكير",
                        navigation: '/a/servvice_details/2',
                  ),

                  singleCategory(
                      context,
                        image: Images.image_1,
                        title: "باديكير",
                        navigation: '/a/servvice_details/2',
                  ),
                  
          ]),
 */
          ],
        ),
      );

      /*  return Column(
        children: [
          Container(
              width: Dimensions.webScreenWidth,
              height: size.width * 0.49,
              padding: CustomSpacing.y(20),
              child: bannerProvider.bannerList != null
                  ? bannerProvider.bannerList!.isNotEmpty
                      ? const Stack(
                          fit: StackFit.expand,
                          children: [
                            Text('كوافير')
                            ],
                        )
                      : const Center(child: Text('no banner avalaible'))
                  : const Center(child: Text('shimmer')))
        ],
      ); */
    });
  }
}

class SinglePageItem extends StatelessWidget {
  final String? title, icon;
  final String? navigation;
  final IconData? iconData;
  final Color? iconColor, backgroundColor, textColor, borderColor;

  const SinglePageItem(
      {super.key,
      required this.title,
      required this.navigation,
      this.icon,
      this.iconData,
      this.iconColor,
      this.backgroundColor,
      this.textColor,
      this.borderColor});

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);

    Widget iconWidget;
    if (icon == null) {
      if (iconData != null) {
        iconWidget = Icon(
          iconData,
          color: iconColor ?? themeData.colorScheme.primary,
          size: 36,
        );
      } else {
        iconWidget = Image.asset(
          'assets/icons/rocket-outline.png',
          color: iconColor ?? themeData.colorScheme.primary,
          width: 36,
          height: 36,
        );
      }
    } else {
      iconWidget = Image.asset(
        icon!,
        //color: iconColor ?? themeData.colorScheme.primary,
        width: 50,
        height: 50,
      );
    }

    return InkWell(
      onTap: () async {
        context.go(navigation!);

        //GoRouter.of(context).go(navigation!);

        /* Navigator.of(context).push(
          MaterialPageRoute(
            builder: (BuildContext context) {
              return navigation;
            },
          ),
        ); */
      },
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor ?? Theme.of(context).colorScheme.onPrimary,
          borderRadius: const BorderRadius.all(Radius.circular(4.0)),
          border: Border.all(
              width: 1.2,
              color: borderColor ?? Theme.of(context).colorScheme.onSurface),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              iconWidget,
              Container(
                margin: const EdgeInsets.only(top: 16),
                child: Text(title!,
                    style: TextStyle(
                        fontWeight: FontWeight.w600, color: textColor)),
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget singleCategory(BuildContext context,
    {required String image,
    required String title,
    required String navigation}) {
  return InkWell(
    onTap: () {
      context.go(navigation);

      /*  Navigator.push(context,
            MaterialPageRoute(builder: (context) => FoodProductScreen())); */
    },
    child: ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(4)),
      child: Center(
        child: Stack(
          children: <Widget>[
            SizedBox(
              //width:MediaQuery.of(context).size.width,
              width: 140,
              height: 140,

            /*   child: 
              Image(
              image: AssetImage(Images.image_1),
                width: 140,
                height: 140,
                fit: BoxFit.fill,
              ), */


              child: CustomImageWidget(
                      width: 140,
                      height: 140,
                      image:image
                    ),


            ),
            Container(
              width: 140,
              height: 140,
              color: const Color.fromARGB(255, 75, 10, 67).withOpacity(0.6),
            ),
            SizedBox(
              width: 140,
              height: 140,
              child: Center(
                  child: Text(title,
                      style: const TextStyle(
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                          letterSpacing: 0.3))),
            )
          ],
        ),
      ),
    ),
  );
}
