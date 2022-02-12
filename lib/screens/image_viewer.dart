import 'package:flutter/material.dart';
import 'package:wanderwith/utils/colors.dart';

class ImageViewer extends StatelessWidget {
  final String assetName;
  const ImageViewer(this.assetName, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: blackColor,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Center(
        child: InteractiveViewer(
          panEnabled: false, // Set it to false
          boundaryMargin: const EdgeInsets.all(100),
          minScale: 1,
          maxScale: 2,
          child: Image.asset(
            'assets/images/$assetName',
            height: double.infinity,
            width: double.infinity,
          ),
        ),
      ),
    );
  }
}
