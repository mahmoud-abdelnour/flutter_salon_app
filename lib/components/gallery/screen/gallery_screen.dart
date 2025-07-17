
import 'package:certain_salon/common/widgets/custom_image_widget.dart';
import 'package:certain_salon/common/widgets/custom_spacing.dart';
import 'package:certain_salon/components/gallery/screen/full_image_screen.dart';
import 'package:certain_salon/theme/app_theme.dart';
import 'package:certain_salon/util/images.dart';
import 'package:flutter/material.dart';

class GalleryScreen extends StatefulWidget {
  @override
  _GalleryScreenState createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.theme;
  }

  final List<String> _imageList = Images.squares.sublist(0, 14);

  void _showFullImage(String imagePath, String imageTag) {
    Navigator.of(context).push(PageRouteBuilder(
        opaque: false,
        pageBuilder: (BuildContext context, _, __) => FullImageScreen(
              imagePath: imagePath,
              imageTag: imageTag,
              backgroundOpacity: 200,
            )));
  }

  _generateGridItems() {
    List<Widget> list = [];
    for (int i = 1; i < 5; i++) {
      list.add(GestureDetector(
        onTap: () {
          _showFullImage(_imageList[i % 14], 'imageTag-$i');
        },
        child: Hero(
            tag: 'imageTag-$i',
            child:
                Image(image: AssetImage(_imageList[i % 14]), fit: BoxFit.fill),
               

      )));
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            padding: CustomSpacing.xy(8, 12),
            child: GridView.count(
                crossAxisCount: 3,
                mainAxisSpacing: 8.0,
                crossAxisSpacing: 8.0,
                children: _generateGridItems())));
  }
}
