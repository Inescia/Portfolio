// ignore_for_file: slash_for_doc_comments, file_names
import 'package:flutter/material.dart';
import 'package:portfolio/components/CustomIcons.dart';

class Logo extends StatefulWidget {
  final double _width;
  final Color color;

  const Logo(this._width, {required this.color, Key? key}) : super(key: key);

  @override
  _Logo createState() => _Logo();
}

class _Logo extends State<Logo> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
        child: TextButton(
            onPressed: () => Navigator.pushNamed(context, '/'),
            child: Row(children: [
              Icon(CustomIcons.favicon, color: widget.color, size: 35),
              const SizedBox(width: 8),
              Text('Ines Ciattoni',
                  style: TextStyle(
                      color: widget.color,
                      fontSize: widget._width > 820
                          ? 25
                          : widget._width > 600
                              ? 20
                              : 16,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w100,
                      letterSpacing: 1.5))
            ])),
        left: widget._width > 820 ? 20 : 10,
        top: widget._width > 820 ? 25 : 10);
  }
}
