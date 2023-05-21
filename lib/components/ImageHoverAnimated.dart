// ignore_for_file: slash_for_doc_comments, file_names
import 'package:flutter/material.dart';
import 'package:hovering/hovering.dart';
import 'package:portfolio/styles/style.dart';

class ImageHoverAnimated extends StatelessWidget {
  final String _image;
  const ImageHoverAnimated(this._image, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HoverWidget(
        child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            decoration: BoxDecoration(boxShadow: shadow, color: Colors.white),
            margin:
                const EdgeInsets.only(left: 40, right: 40, top: 40, bottom: 20),
            padding: const EdgeInsets.all(10),
            child:
                Image(image: AssetImage('assets/images/others/$_image.jpg'))),
        hoverChild: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            decoration: BoxDecoration(boxShadow: shadow, color: Colors.white),
            margin:
                const EdgeInsets.only(left: 40, right: 40, top: 20, bottom: 40),
            padding: const EdgeInsets.all(10),
            child:
                Image(image: AssetImage('assets/images/others/$_image.jpg'))),
        onHover: (event) {});
  }
}
