// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:hovering/hovering.dart';
import 'package:portfolio/styles/style.dart';
import 'package:portfolio/helpers/helper.dart';

class ProjectCard extends StatelessWidget {
  final double _width;
  final int index;

  const ProjectCard(this._width, {required this.index, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HoverWidget(
        child: MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
                onTap: () =>
                    Navigator.pushNamed(context, '/Project', arguments: index),
                child: AnimatedContainer(
                    width: _width >= 830 ? _width / 4 : _width / 2.5,
                    height: _width >= 830 ? 300 : _width / 2.8,
                    margin: const EdgeInsets.all(25),
                    decoration: BoxDecoration(
                        color: COLORS[index].withOpacity(0.4),
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              spreadRadius: 8,
                              blurRadius: 15)
                        ]),
                    child: Stack(
                        alignment: AlignmentDirectional.center,
                        children: [
                          Padding(
                              padding: const EdgeInsets.all(30),
                              child: Image(
                                  image: AssetImage(
                                      'assets/images/projects/${projectList[index]}.png'))),
                          Positioned(
                              top: 10,
                              left: 10,
                              child: Text(
                                  i18n(context,
                                      'PROJECTS.${projectList[index]}.title'),
                                  style: TextStyle(
                                      shadows: const [
                                        Shadow(
                                          blurRadius: 10.0,
                                          color: Colors.black45,
                                          offset: Offset(5.0, 5.0),
                                        )
                                      ],
                                      fontSize: _width >= 830 ? 33 : 23,
                                      letterSpacing: 2,
                                      fontFamily: 'Allerta Stencil',
                                      color: Colors.white))),
                          Positioned(
                              bottom: 10,
                              left: 15,
                              right: 15,
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                        i18n(context,
                                                'PROJECTS.${projectList[index]}.type') +
                                            ',\n' +
                                            i18n(context,
                                                'PROJECTS.${projectList[index]}.date'),
                                        softWrap: true,
                                        overflow: TextOverflow.fade,
                                        style: TextStyle(
                                            shadows: const [
                                              Shadow(
                                                blurRadius: 10.0,
                                                color: Colors.black45,
                                                offset: Offset(5.0, 5.0),
                                              )
                                            ],
                                            fontSize: _width >= 830 ? 18 : 15,
                                            letterSpacing: 2,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w300,
                                            color: Colors.white)),
                                    Text(
                                        i18n(context,
                                            'PROJECTS.${projectList[index]}.supports'),
                                        softWrap: true,
                                        overflow: TextOverflow.fade,
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                            shadows: const [
                                              Shadow(
                                                blurRadius: 10.0,
                                                color: Colors.black45,
                                                offset: Offset(5.0, 5.0),
                                              )
                                            ],
                                            fontSize: _width >= 830 ? 18 : 15,
                                            letterSpacing: 2,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w300,
                                            color: Colors.white))
                                  ]))
                        ]),
                    duration: const Duration(milliseconds: 800),
                    curve: Curves.fastOutSlowIn))),
        onHover: (event) {},
        hoverChild: MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
                onTap: () =>
                    Navigator.pushNamed(context, '/Project', arguments: index),
                child: AnimatedContainer(
                    width: _width >= 830 ? _width / 4 : _width / 2.5,
                    height: _width >= 830 ? 300 : _width / 2.8,
                    margin: const EdgeInsets.all(25),
                    decoration: BoxDecoration(
                        color: COLORS[index],
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              spreadRadius: 8,
                              blurRadius: 15)
                        ]),
                    child: Stack(
                        alignment: AlignmentDirectional.center,
                        children: [
                          Padding(
                              padding: const EdgeInsets.all(30),
                              child: Image(
                                  image: AssetImage(
                                      'assets/images/projects/${projectList[index]}.png'))),
                          Positioned(
                              top: 10,
                              left: 10,
                              child: Text(
                                  i18n(context,
                                      'PROJECTS.${projectList[index]}.title'),
                                  style: TextStyle(
                                      shadows: const [
                                        Shadow(
                                          blurRadius: 10.0,
                                          color: Colors.black45,
                                          offset: Offset(5.0, 5.0),
                                        )
                                      ],
                                      fontSize: _width >= 830 ? 33 : 23,
                                      letterSpacing: 2,
                                      fontFamily: 'Allerta Stencil',
                                      color: Colors.white))),
                          Positioned(
                              bottom: 10,
                              left: 15,
                              right: 15,
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                        i18n(context,
                                                'PROJECTS.${projectList[index]}.type') +
                                            ',\n' +
                                            i18n(context,
                                                'PROJECTS.${projectList[index]}.date'),
                                        softWrap: true,
                                        overflow: TextOverflow.fade,
                                        style: TextStyle(
                                            shadows: const [
                                              Shadow(
                                                blurRadius: 10.0,
                                                color: Colors.black45,
                                                offset: Offset(5.0, 5.0),
                                              )
                                            ],
                                            fontSize: _width >= 830 ? 18 : 15,
                                            letterSpacing: 2,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w300,
                                            color: Colors.white)),
                                    Text(
                                        i18n(context,
                                            'PROJECTS.${projectList[index]}.supports'),
                                        softWrap: true,
                                        overflow: TextOverflow.fade,
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                            shadows: const [
                                              Shadow(
                                                blurRadius: 10.0,
                                                color: Colors.black45,
                                                offset: Offset(5.0, 5.0),
                                              )
                                            ],
                                            fontSize: _width >= 830 ? 18 : 15,
                                            letterSpacing: 2,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w300,
                                            color: Colors.white))
                                  ]))
                        ]),
                    duration: const Duration(milliseconds: 800),
                    curve: Curves.fastOutSlowIn))));
  }
}
