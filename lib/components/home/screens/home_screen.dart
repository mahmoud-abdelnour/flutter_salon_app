import 'package:cached_network_image/cached_network_image.dart';
import 'package:certain_salon/common/widgets/custom_spacing.dart';
import 'package:certain_salon/components/home/providers/banner_provider.dart';
import 'package:certain_salon/components/home/widgets/banners_widget.dart';
import 'package:certain_salon/components/home/widgets/services_widget.dart';
import 'package:certain_salon/components/service/providers/service_provider.dart';
import 'package:certain_salon/components/splash/providers/splash_provider.dart';
import 'package:certain_salon/theme/app_theme.dart';
import 'package:certain_salon/util/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();


  static Future<void> loadData(BuildContext context) async {
    Provider.of<BannerProvider>(context, listen: false).getBannerList(context);
    Provider.of<ServiceProvider>(context, listen: false).getHomeServicesList(context);

    //print('sqsqsqsqs');

  }
}


class _HomeScreenState extends State<HomeScreen> {
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    //HomeScreen.loadData(context);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SplashProvider>(builder: (context, splashPorvider, child) {
      return Scaffold(
        appBar: AppBar(
          title: Text("صالون سيرتن"),
        ),
        backgroundColor: theme.secondaryHeaderColor,
        //backgroundColor: customTheme.onInverseSurface,
        
        body: CustomScrollView(
        controller: scrollController,
        slivers: [
          SliverToBoxAdapter(
            
                  child: SizedBox(
                    child: Column(
                      children: [
                        //CustomSpacing.height(50),
                        const BannersWidget(),
                        CustomSpacing.height(10),
                        Container(
                          alignment: Alignment.centerRight,
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: const Text('خدماتنا' ,style:  TextStyle(
                            fontSize: Dimensions.fontSizeExtraLarge,
                            fontWeight: FontWeight.w700),
                          ),
                        ),
                        CustomSpacing.height(10),
                        const ServicesWidget(),
                ],
              ),
          ))
        ],
      ));
    });
  }
}
