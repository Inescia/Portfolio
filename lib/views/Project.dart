// ignore_for_file: slash_for_doc_comments, file_names
import 'package:portfolio/components/Contact.dart';
import 'package:portfolio/helpers/helper.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/styles/style.dart';

class Project extends StatefulWidget {
  final double _width, _height;
  final int index;

  const Project(this._width, this._height, {Key? key, required this.index})
      : super(key: key);
  @override
  _Project createState() => _Project();
}

class _Project extends State<Project> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    var project = projectList[widget.index];
    super.initState();
    if (project != 'HP') {
      _controller = VideoPlayerController.asset('assets/videos/$project.mp4')
        ..initialize().then((_) {
          _controller.setLooping(true);
          setState(() {});
        });
    }
  }

  @override
  void dispose() {
    super.dispose();
    if (widget.index >= 0 && widget.index <= 2) _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var project = projectList[widget.index];
    if (widget.index < 0 || widget.index > 5) {
      Navigator.pushNamed(context, '/Works');
    }
    return Scaffold(
        body: ListView(children: [
      Stack(children: [
        Container(
            color: COLORS[widget.index],
            width: widget._width,
            height: widget._height),
        Container(
            padding: const EdgeInsets.all(15),
            height: widget._height,
            width: widget._width - 30,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () => Navigator.pushNamed(context, '/Project',
                        arguments: widget.index > 0 ? widget.index - 1 : 5),
                    icon: Icon(Icons.skip_previous_sharp,
                        color: Colors.white.withOpacity(.5), size: 50)),
                IconButton(
                    onPressed: () => Navigator.pushNamed(context, '/Project',
                        arguments: widget.index < 5 ? widget.index + 1 : 0),
                    icon: Icon(Icons.skip_next_sharp,
                        color: Colors.white.withOpacity(.5), size: 50))
              ],
            )),
        Container(
            height: widget._height,
            width: widget._width,
            padding: EdgeInsets.only(
                top: widget._height / 6,
                left: widget._width / 10,
                right: widget._width / 10),
            child: Stack(alignment: AlignmentDirectional.center, children: [
              Image(image: AssetImage('assets/images/projects/$project.png')),
              Positioned(
                  right: 0,
                  top: widget._height / 10,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(i18n(context, 'PROJECTS.$project.title'),
                            textAlign: TextAlign.end,
                            style: TextStyle(
                                fontFamily: 'Allerta Stencil',
                                fontSize: widget._width >= 740 ? 90 : 60,
                                color: Colors.white.withOpacity(.9),
                                shadows: [
                                  Shadow(
                                      blurRadius: 5.0,
                                      color: COLORS[widget.index],
                                      offset: const Offset(3.0, 3.0))
                                ])),
                        Text(i18n(context, 'PROJECTS.$project.subtitle'),
                            textAlign: TextAlign.end,
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w300,
                                fontSize: widget._width >= 740 ? 50 : 30,
                                color: Colors.white.withOpacity(.9),
                                shadows: [
                                  Shadow(
                                      blurRadius: 5.0,
                                      color: COLORS[widget.index],
                                      offset: const Offset(3.0, 3.0))
                                ]))
                      ]))
            ])),
        title(widget._width < 830 ? 'P.' : 'PROJECT.', widget._width,
            widget._height),
        const Contact(),
      ]),
      Container(
          padding: const EdgeInsets.all(25),
          height: 100,
          color: COLORS[widget.index].withOpacity(.6),
          child: Row(children: [
            Expanded(
                child: Row(children: [
              for (var support
                  in i18n(context, 'PROJECTS.$project.supports').split('\n'))
                Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Image(
                      image: AssetImage(
                          'assets/icons/${support.toLowerCase()}.png'),
                      height: widget._width >= 700 ? 50 : 40,
                    ))
            ])),
            Expanded(
                flex: widget._width >= 1060
                    ? 3
                    : widget._width >= 850
                        ? 2
                        : 1,
                child: Text(
                    '${i18n(context, 'PROJECTS.$project.type')} / ${i18n(context, 'PROJECTS.$project.date')} / ${i18n(context, 'PROJECTS.$project.time')}',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Bonheur Royale',
                        letterSpacing: 2.5,
                        fontSize: widget._width >= 1060
                            ? 35
                            : widget._width >= 800
                                ? 25
                                : 20))),
            Expanded(
                child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
              for (var technologie
                  in i18n(context, 'PROJECTS.$project.technologies')
                      .split(', '))
                Image(
                  image: AssetImage('assets/images/skills/$technologie.png'),
                  height: widget._width >= 700 ? 50 : 40,
                )
            ]))
          ])),
      Container(height: widget._height / 20),
      title2(i18n(context, 'ALL.context'), Colors.black87),
      Padding(
          padding: EdgeInsets.symmetric(
              vertical: widget._width >= 830 ? 50 : 20,
              horizontal: widget._width >= 830 ? 100 : 30),
          child: text(i18n(context, 'PROJECTS.$project.context'))),
      title2(i18n(context, 'ALL.steps'), Colors.black87),
      for (var i = 0; i < projectCategorieList[project]!.length; i++)
        Column(children: [
          SizedBox(
              width: widget._width,
              child: title3(
                  i18n(context,
                      'PROJECTS.$project.etapes.${projectCategorieList[project]![i]}.title'),
                  COLORS[widget.index],
                  i % 2 == 1 ? TextAlign.right : TextAlign.left)),
          if (['mockups', 'identity']
              .contains(projectCategorieList[project]![i]))
            SizedBox(
                child: Image(
                    image: AssetImage(
                        'assets/images/projects/${i18n(context, 'PROJECTS.$project.etapes.${projectCategorieList[project]![i]}.media')}.png')))
          else if (['features', 'tests', 'analysis']
                  .contains(projectCategorieList[project]![i]) &&
              project != 'HP')
            Row(
              children: [
                if (i == 1)
                  SizedBox(
                      width: widget._width * (2 / 5),
                      child: Image(
                          image: AssetImage(
                              'assets/images/projects/${i18n(context, 'PROJECTS.$project.etapes.${projectCategorieList[project]![i]}.media')}.png'))),
                SizedBox(
                    width: widget._width * (3 / 5),
                    child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: widget._width >= 830 ? 50 : 20,
                            horizontal: widget._width >= 830 ? 100 : 30),
                        child: text(i18n(context,
                            'PROJECTS.$project.etapes.${projectCategorieList[project]![i]}.content')))),
                if (i != 1)
                  SizedBox(
                      width: widget._width * (2 / 5),
                      child: Image(
                          image: AssetImage(
                              'assets/images/projects/${i18n(context, 'PROJECTS.$project.etapes.${projectCategorieList[project]![i]}.media')}.png')))
              ],
            )
          else
            Padding(
                padding: EdgeInsets.symmetric(
                    vertical: widget._width >= 830 ? 50 : 20,
                    horizontal: widget._width >= 830 ? 100 : 30),
                child: text(i18n(context,
                    'PROJECTS.$project.etapes.${projectCategorieList[project]![i]}.content'))),
        ]),
      if (project != 'HP')
        SizedBox(
            width: widget._width,
            child: title3(i18n(context, 'ALL.demo'), COLORS[widget.index],
                TextAlign.center)),
      if (project != 'HP')
        _controller.value.isInitialized
            ? Stack(alignment: AlignmentDirectional.center, children: [
                Container(
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 10,
                        blurRadius: 50)
                  ]),
                  margin: const EdgeInsets.all(20),
                  padding: const EdgeInsets.all(20),
                  height: widget._height / 1.5,
                  child: _controller.value.isInitialized
                      ? AspectRatio(
                          aspectRatio: _controller.value.aspectRatio,
                          child: VideoPlayer(_controller),
                        )
                      : Container(),
                ),
                IconButton(
                    iconSize: 35,
                    color: Colors.black54,
                    onPressed: () => _controller.value.isPlaying
                        ? _controller.pause().then((value) => setState(() {}))
                        : _controller.play().then((value) => setState(() {})),
                    icon: Icon(
                      _controller.value.isPlaying
                          ? Icons.pause
                          : Icons.play_arrow,
                    ))
              ])
            : const Center(child: CircularProgressIndicator()),
      copyright
    ]));
  }
}
