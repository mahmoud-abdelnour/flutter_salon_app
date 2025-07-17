import 'package:cached_network_image/cached_network_image.dart';
import 'package:certain_salon/common/widgets/custom_button.dart';
import 'package:certain_salon/common/widgets/custom_spacing.dart';
import 'package:certain_salon/common/widgets/custom_text.dart';
import 'package:certain_salon/components/appointment/providers/appointment_provider.dart';
import 'package:certain_salon/components/service/providers/service_provider.dart';
import 'package:certain_salon/util/app_constants.dart';
import 'package:certain_salon/util/dimensions.dart';
import 'package:certain_salon/util/images.dart';
import 'package:certain_salon/util/styles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:provider/provider.dart';
import 'package:certain_salon/theme/app_theme.dart';

import '../../../common/widgets/custom_image_widget.dart';

class ServiceDetailsScreen extends StatefulWidget {
  const ServiceDetailsScreen({super.key, this.serviceId});
  final String? serviceId;

  @override
  State<ServiceDetailsScreen> createState() => _ServiceDetailsScreenState();

  static Future<void> loadData(BuildContext context,
      {String? serviceId}) async {
    //Provider.of<ServiceProvider>(context, listen: false).getServicesDetails(context, serviceId);
  }
}

class _ServiceDetailsScreenState extends State<ServiceDetailsScreen> {
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    Provider.of<ServiceProvider>(context, listen: false)
        .getServicesDetails(context, (widget.serviceId));
    //print('service details page');
    //ServiceDetailsScreen.loadData(context, serviceId: '2');
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = AppTheme.theme;

    return Scaffold(
        backgroundColor: Colors.white,
        body: Consumer<ServiceProvider>(
            builder: (context, serviceProvider, child) {
          String? serviceName = serviceProvider.serviceDetails?.name;
          String? serviceDescription =
              serviceProvider.serviceDetails?.description;
          int? serviceId = serviceProvider.serviceDetails?.id;
          String? serviceImage = serviceProvider.serviceDetails?.serviceImage;

          print("Image URL: ${serviceProvider.serviceDetails?.serviceImage}");


          return ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              SizedBox(
                //height:MediaQuery.of(context).size.height,
                child: Stack(
                  children: <Widget>[
                    /*   const Image(
                      image: AssetImage(Images.image_1),
                      fit: BoxFit.fill,
                    ), */

                  serviceImage != null && serviceImage.isNotEmpty
                  ? CustomImageWidget(
                      image: serviceImage,
                      fit: BoxFit.fill,
                    )
                  : Container(
                        
                    ),
                    
                    Positioned(
                        top: 20,
                        right: 20,
                        child: SafeArea(
                          child: InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: const Icon(
                                LucideIcons.chevronRight,
                                color: Colors.black,
                              )),
                        ))
                  ],
                ),
              ),
              Container(
                  //margin: const EdgeInsets.only(left: 20, top: 20),
                  padding: CustomSpacing.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        serviceName ?? '',
                        style: TextStyle(
                            color: theme.colorScheme.onSurface,
                            letterSpacing: 0,
                            fontSize: 21,
                            fontWeight: FontWeight.w700),
                      ),
                      CustomSpacing.height(8),
                      Text(
                        serviceDescription ?? '',
                        style: TextStyle(
                            color: theme.colorScheme.onSurface,
                            fontWeight: FontWeight.w400),
                      ),
                      CustomSpacing.height(30),
                      Consumer<AppointmentProvider>(
                          builder: (context, appointmentProvider, child) {
                        return /* FilledButton(
                              style: ButtonStyle(
                                visualDensity: VisualDensity.compact,
                                backgroundColor:
                                    WidgetStatePropertyAll(theme.colorScheme.primary),
                                shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5))),
                                padding:
                                    const WidgetStatePropertyAll(EdgeInsets.all(20)),
                              ),
                              onPressed: () {
                                //context.go('/b/appointments/$serviceId');
                                context.go('/a/appointments/$serviceId');
                              },
                              child: Text("حجز الخدمة",
                                  style: almaraiExtraBold.copyWith(
                                      fontSize: Dimensions.fontSizeLarge)),
                            ); */

                            serviceProvider.serviceDetails?.id != null
                                ? CustomButton.rounded(
                                    elevation: 0,
                                    padding: CustomSpacing.y(15),
                                    //backgroundColor: customTheme.colorWarning,
                                    backgroundColor: theme.primaryColor,
                                    //buttonType:CustomButtonType.elevated  ,
                                    borderColor: theme.dividerColor,
                                    borderRadiusAll:
                                        AppConstants.buttonRadius.small,
                                    block: true,
                                    onPressed: () async {
                                      context.go('/a/appointments/$serviceId');
                                    },
                                    child: CustomText(
                                      'حجز الخدمة',
                                      fontSize: 18,
                                      color: customTheme.onInfo,
                                      fontWeight: 800,
                                    ))
                                : Center(child: Text('جاري التحميل'));
                      }),
                    ],
                  )),
            ],
          );
        }));
  }
}
