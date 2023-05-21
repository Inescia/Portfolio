// ignore_for_file: slash_for_doc_comments, file_names
import 'package:flutter/material.dart';
import 'package:hovering/hovering.dart';
import 'package:portfolio/helpers/helper.dart';

class NavBar extends StatefulWidget {
  final double _width, _height;
  final Color color;
  final int langue = 0;

  const NavBar(this._width, this._height, {required this.color, Key? key})
      : super(key: key);

  @override
  _NavBar createState() => _NavBar();
}

class _NavBar extends State<NavBar> {
  final Map<String, String> _pages = {
    'home': '/',
    'works': '/Works',
    'about': '/About'
  };

  @override
  Widget build(BuildContext context) {
    return Positioned(
        child: SizedBox(
            width:
                widget._width > 800 ? widget._width / 2.3 : widget._width / 1.8,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  for (var page in _pages.entries)
                    HoverWidget(
                        hoverChild: Column(children: [
                          TextButton(
                              onPressed: () =>
                                  Navigator.pushNamed(context, page.value),
                              child: Text(i18n(context, 'ALL.${page.key}'),
                                  style: TextStyle(
                                      color: widget.color,
                                      fontSize: widget._width > 1000
                                          ? 22
                                          : widget._width > 800
                                              ? 20
                                              : 16,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w700,
                                      letterSpacing: 2.5),
                                  textAlign: TextAlign.center)),
                          const SizedBox(height: 20),
                          AnimatedContainer(
                              margin: const EdgeInsets.only(right: 45),
                              width: widget._width > 930 ? 70 : 50,
                              height: 5,
                              decoration: BoxDecoration(
                                color: widget.color,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              duration: const Duration(seconds: 1),
                              curve: Curves.fastOutSlowIn)
                        ]),
                        onHover: (event) => setState(() {}),
                        child: Column(children: [
                          TextButton(
                              onPressed: () =>
                                  Navigator.pushNamed(context, page.value),
                              child: Text(i18n(context, 'ALL.${page.key}'),
                                  style: TextStyle(
                                      color: widget.color,
                                      fontSize: widget._width > 1000
                                          ? 22
                                          : widget._width > 800
                                              ? 20
                                              : 16,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w700,
                                      letterSpacing: 2.5),
                                  textAlign: TextAlign.center)),
                          const SizedBox(height: 20),
                          AnimatedContainer(
                              margin: const EdgeInsets.only(right: 45),
                              width: 0,
                              height: 5,
                              decoration: BoxDecoration(
                                color: widget.color,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              duration: const Duration(seconds: 1),
                              curve: Curves.fastOutSlowIn)
                        ]))
                ])),
        right: widget._width / 40,
        top: widget._height / 8);
  }
}
