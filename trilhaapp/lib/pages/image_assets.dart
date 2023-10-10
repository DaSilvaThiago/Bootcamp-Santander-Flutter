import 'package:flutter/material.dart';
import 'package:trilhaapp/shared/widgets/app_images.dart';

class ImageAssetsPage extends StatefulWidget {
  const ImageAssetsPage({super.key});

  @override
  State<ImageAssetsPage> createState() => _ImageAssetsPageState();
}

class _ImageAssetsPageState extends State<ImageAssetsPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(AppImages.user_001, height: 50),
        Image.asset(AppImages.user_002, height: 50),
        Image.asset(AppImages.landScape_001, height: 50,),
        Image.asset(AppImages.landscape_002, width: double.infinity),
      ],
    );
  }
}
