// ignore_for_file: slash_for_doc_comments, file_names
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:portfolio/components/Contact.dart';
import 'package:portfolio/components/ProjectCard.dart';
import 'package:portfolio/helpers/helper.dart';
import 'package:portfolio/styles/style.dart';

class Works extends StatefulWidget {
  final double _width, _height;

  const Works(this._width, this._height, {Key? key}) : super(key: key);
  @override
  _Works createState() => _Works();
}

class _Works extends State<Works> {
  List<bool> _isDisplayedList = [false, false, false, false];
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(milliseconds: 400), (timer) {
      if (!_isDisplayedList[0]) {
        _isDisplayedList[0] = true;
      } else if (!_isDisplayedList[1]) {
        _isDisplayedList[1] = true;
      } else if (!_isDisplayedList[2]) {
        _isDisplayedList[2] = true;
      } else if (!_isDisplayedList[3]) {
        _isDisplayedList[3] = true;
      } else {
        _isDisplayedList = [false, false, false, false];
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        Stack(children: [
          Container(
            width: widget._width,
            height: widget._height,
            decoration: BoxDecoration(color: Colors.grey.shade900, boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 8,
                  blurRadius: 15)
            ]),
          ),
          title(widget._width < 830 ? 'W.' : 'WORK.', widget._width,
              widget._height),
          for (var i = 0; i < 4; i++)
            if (_isDisplayedList[i])
              title(widget._width < 830 ? 'W.' : 'WORK.', widget._width,
                  widget._height,
                  num: i + 1),
          const Contact()
        ]),
        SizedBox(height: widget._height / 8),
        title2(i18n(context, 'WORKS.title'), Colors.black87),
        SizedBox(height: widget._height / 8),
        if (widget._width >= 830)
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            for (var i = 0; i < 3; i++) ProjectCard(widget._width, index: i)
          ])
        else if (widget._width < 830)
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            for (var i = 0; i < 2; i++) ProjectCard(widget._width, index: i)
          ]),
        if (widget._width >= 830)
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            for (var i = 3; i < 6; i++) ProjectCard(widget._width, index: i)
          ])
        else if (widget._width < 830)
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            for (var i = 2; i < 4; i++) ProjectCard(widget._width, index: i)
          ]),
        if (widget._width < 830)
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            for (var i = 4; i < 6; i++) ProjectCard(widget._width, index: i)
          ]),
        SizedBox(height: widget._height / 8),
        copyright
      ],
    ));
  }
}
