import 'package:carousel_slider/carousel_slider.dart';
import 'package:certain_salon/common/widgets/custom_spacing.dart';
import 'package:certain_salon/components/home/providers/banner_provider.dart';
import 'package:certain_salon/util/dimensions.dart';
import 'package:certain_salon/util/images.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../common/widgets/custom_image_widget.dart';

class BannersWidget extends StatelessWidget {
  const BannersWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return Consumer<BannerProvider>(builder: (context, bannerProvider, child) {
      return Column(
        children: [
          Container(
            width: Dimensions.webScreenWidth,
            height: size.width * 0.59,
            padding: CustomSpacing.y(20),
            child: bannerProvider.bannerList != null ?
              bannerProvider.bannerList!.isNotEmpty  ?
              Stack(
                    fit: StackFit.expand,
                    children: [
                     CarouselSlider.builder(
                          itemCount: bannerProvider.bannerList!.isEmpty? 1 : bannerProvider.bannerList!.length,
                          itemBuilder: (context, index, _) {
                            return InkWell(
                              hoverColor: Colors.transparent,
                              child: Container(
                                margin: const EdgeInsets.symmetric(horizontal: 10),
                                decoration: BoxDecoration( borderRadius: BorderRadius.circular(10)),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: CustomImageWidget(
                                    width: MediaQuery.of(context).size.width,
                                    height: 250,
                                    image:'${bannerProvider.bannerList?[index].image}'
                                  ),
                                ),
                              ),
                            );
                          },
                          options: CarouselOptions(
                            autoPlay: true,
                            enlargeCenterPage: true,
                            enlargeFactor: 0,
                            disableCenter: true,
                            onPageChanged: (index, reason) =>
                                bannerProvider.setCurrentIndex(index),
                          ))
                    ],
                  )
              : const Center(child:Text('no banner avalaible')): const Center(child:Text('shimmer'))
          )
        ],
      );
    });
  }
}
