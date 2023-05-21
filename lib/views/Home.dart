// ignore_for_file: slash_for_doc_comments, file_names
import 'package:flutter/material.dart';
import 'package:portfolio/components/Contact.dart';
import 'package:portfolio/helpers/helper.dart';
import 'package:portfolio/styles/style.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Home extends StatefulWidget {
  final double _width, _height;

  const Home(this._width, this._height, {Key? key}) : super(key: key);
  @override
  _Home createState() => _Home();
}

class _Home extends State<Home> {
  final CarouselController _controller = CarouselController();
  Color _color = Colors.grey;
  int currentIndex = 0;

  /**
   * @method to change background color
   * @param {number} index
   */
  void _changeColor(int index) {
    currentIndex = index;
    if (currentIndex >= COLORS.length) currentIndex -= COLORS.length;
    setState(() => _color = COLORS[currentIndex]);
  }

  @override
  void initState() {
    super.initState();
    _color = COLORS[currentIndex];
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      AnimatedContainer(
        width: widget._width,
        height: widget._height,
        duration: const Duration(seconds: 2),
        color: _color,
      ),
      Stack(alignment: AlignmentDirectional.bottomCenter, children: [
        CarouselSlider(
            carouselController: _controller,
            options: CarouselOptions(
              height: widget._height,
              autoPlayAnimationDuration: const Duration(seconds: 2),
              onPageChanged: (page, reason) => _changeColor(page),
              autoPlay: true,
            ),
            items: [0, 1, 2, 3, 4, 5].map((index) {
              return Builder(builder: (BuildContext context) {
                return Container(
                    padding:
                        EdgeInsets.symmetric(vertical: widget._height / 5.5),
                    width: widget._width,
                    height: widget._height,
                    child: MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: GestureDetector(
                            onTap: () => Navigator.pushNamed(
                                context, '/Project', arguments: index),
                            child: Stack(
                                alignment: AlignmentDirectional.center,
                                children: [
                                  Image(
                                      image: AssetImage(
                                          'assets/images/projects/${projectList[index]}.png')),
                                  Positioned(
                                      right: 0,
                                      top: widget._height / 10,
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Text(
                                                i18n(context,
                                                    'PROJECTS.${projectList[index]}.title'),
                                                textAlign: TextAlign.end,
                                                style: TextStyle(
                                                    fontFamily:
                                                        'Allerta Stencil',
                                                    fontSize:
                                                        widget._width >= 740
                                                            ? 90
                                                            : 60,
                                                    color: Colors.white
                                                        .withOpacity(.9),
                                                    shadows: [
                                                      Shadow(
                                                          blurRadius: 5.0,
                                                          color: COLORS[index],
                                                          offset: const Offset(
                                                              3.0, 3.0))
                                                    ])),
                                            Text(
                                                i18n(context,
                                                    'PROJECTS.${projectList[index]}.subtitle'),
                                                textAlign: TextAlign.end,
                                                style: TextStyle(
                                                    fontFamily: 'Poppins',
                                                    fontWeight: FontWeight.w300,
                                                    fontSize:
                                                        widget._width >= 740
                                                            ? 50
                                                            : 30,
                                                    color: Colors.white
                                                        .withOpacity(.9),
                                                    shadows: [
                                                      Shadow(
                                                          blurRadius: 5.0,
                                                          color: COLORS[index],
                                                          offset: const Offset(
                                                              3.0, 3.0))
                                                    ]))
                                          ]))
                                ]))));
              });
            }).toList()),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          for (var i = 0; i < 6; i++)
            MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                    onTap: () => _controller.animateToPage(i,
                        duration: const Duration(milliseconds: 1800)),
                    child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Container(
                            width: 15,
                            height: 15,
                            decoration: BoxDecoration(
                                color: COLORS[i],
                                borderRadius: BorderRadius.circular(25))))))
        ])
      ]),
      Container(
          padding: const EdgeInsets.all(15),
          height: widget._height,
          width: widget._width - 30,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                  onPressed: () => _controller.previousPage(
                      duration: const Duration(seconds: 1)),
                  icon: Icon(Icons.skip_previous_sharp,
                      color: Colors.white.withOpacity(.5), size: 50)),
              IconButton(
                  onPressed: () => _controller.nextPage(
                      duration: const Duration(seconds: 2)),
                  icon: Icon(Icons.skip_next_sharp,
                      color: Colors.white.withOpacity(.5), size: 50))
            ],
          )),
      title(
          widget._width < 830 ? 'H.' : 'HOME.', widget._width, widget._height),
      const Contact()
    ]);
  }
}
