// ignore_for_file: slash_for_doc_comments, file_names
import 'package:flutter/material.dart';
import 'package:portfolio/components/Language.dart';
import 'package:portfolio/components/Logo.dart';
import 'package:portfolio/components/NavBar.dart';
import 'package:portfolio/helpers/helper.dart';
import 'package:portfolio/views/About.dart';
import 'package:portfolio/views/Home.dart';
import 'package:portfolio/views/Project.dart';
import 'package:portfolio/views/Works.dart';

class MainContainer extends StatefulWidget {
  final String page;

  const MainContainer(this.page, {Key? key}) : super(key: key);

  @override
  _MainContainer createState() => _MainContainer();
}

class _MainContainer extends State<MainContainer>
    with TickerProviderStateMixin {
  late double _width, _height;
  late Widget _child;
  late AnimationController _controller;
  late Animation _colors;

  /**
   * @method to handler the scroll
   * @param {ScrollNotification} scrollInfo
   */
  bool _scrollListener(ScrollNotification scrollInfo) {
    if (scrollInfo.metrics.axis == Axis.vertical) {
      _controller.animateTo(scrollInfo.metrics.pixels / (_height * 1.3));
      return true;
    }
    return false;
  }

  /**
   * @method to set the dimensions (rotate if it's necessary)
   * @param {BuildContext} context
   */
  void _setDimensions(BuildContext context) {
    if (isHorizontal(context)) {
      _width = getHeight(context);
      _height = getWidth(context);
    } else {
      _width = getWidth(context);
      _height = getHeight(context);
    }
  }

  /**
   * @method to select the page component
   * @param {BuildContext} context
   */
  void _selectComponent(BuildContext context) {
    int projectIndex = ModalRoute.of(context)!.settings.arguments != null
        ? ModalRoute.of(context)!.settings.arguments as int
        : 0;
    switch (widget.page) {
      case 'Works':
        _child = Works(_width, _height);
        break;
      case 'About':
        _child = About(_width, _height);
        break;
      case 'Project':
        _child = Project(_width, _height, index: projectIndex);
        break;
      default:
        _child = Home(_width, _height);
        break;
    }
  }

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 0));
    _colors =
        ColorTween(begin: Colors.white, end: Colors.black).animate(_controller);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _setDimensions(context);
    _selectComponent(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: RotatedBox(
            quarterTurns: isHorizontal(context) ? 1 : 0,
            child: NotificationListener<ScrollNotification>(
                onNotification: _scrollListener,
                child: SizedBox(
                    height: _height,
                    width: _width,
                    child: Stack(children: [
                      _child,
                      AnimatedBuilder(
                          animation: _controller,
                          builder: (context, child) =>
                              Logo(_width, color: _colors.value)),
                      AnimatedBuilder(
                          animation: _controller,
                          builder: (context, child) =>
                              NavBar(_width, _height, color: _colors.value)),
                      Language(
                          callback: () =>
                              {setState(() {}), _selectComponent(context)}),
                    ])))));
  }
}
