// ignore_for_file: slash_for_doc_comments, file_names
import 'package:flutter/material.dart';
import 'package:portfolio/components/Contact.dart';
import 'package:portfolio/components/EducationBloc.dart';
import 'package:portfolio/components/ExperienceBloc.dart';
import 'package:portfolio/components/SkillsBloc.dart';
import 'package:portfolio/helpers/helper.dart';
import 'package:portfolio/styles/style.dart';

class About extends StatelessWidget {
  final double _width, _height;

  const About(this._width, this._height, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        Stack(children: [
          Container(
              width: _width,
              height: _height,
              decoration: BoxDecoration(
                  color: Colors.blueGrey.shade700, boxShadow: shadow)),
          title(_width < 830 ? 'A.' : 'ABOUT.', _width, _height),
          const Contact(),
          Padding(
              padding: EdgeInsets.only(left: _width / 4),
              child: Row(children: [
                Stack(alignment: Alignment.center, children: [
                  Text('D',
                      style: TextStyle(
                          color: Colors.black45,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w900,
                          fontSize: _width / _height >= 8 / 5
                              ? _height / 1.8
                              : _height / 2.1)),
                  Text('D',
                      style: TextStyle(
                          color: Colors.white38,
                          fontFamily: 'Bonheur Royale',
                          fontSize: _width / _height >= 8 / 5
                              ? _height / 1.8
                              : _height / 2.1,
                          height: 1.8))
                ]),
                Stack(children: [
                  Text('evelopper\nesigner',
                      style: TextStyle(
                          color: Colors.black45,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w700,
                          fontSize: _width / _height >= 8 / 5
                              ? _height / 9
                              : _height / 12,
                          height: 1.6)),
                  Column(children: [
                    SizedBox(height: _height / 12, width: _width / 2.4),
                    Text('Full Stack\nUX',
                        style: TextStyle(
                            color: Colors.white38,
                            fontFamily: 'Bonheur Royale',
                            fontWeight: FontWeight.w700,
                            fontSize: _width / _height >= 8 / 5
                                ? _height / 9
                                : _height / 12,
                            height: 1.4),
                        textAlign: TextAlign.right)
                  ])
                ])
              ]))
        ]),
        SizedBox(height: _height / 8),
        Row(children: [
          if (_width >= 830)
            const Expanded(
                flex: 1,
                child: Padding(
                    padding: EdgeInsets.all(30),
                    child: Image(
                        image: AssetImage('assets/images/others/Ines.png')))),
          Expanded(
              flex: 4,
              child: Padding(
                  padding: const EdgeInsets.only(
                      bottom: 50, top: 30, right: 100, left: 30),
                  child: text(
                      i18n(context, 'ABOUT.introduction'), TextAlign.left)))
        ]),
        title2(i18n(context, 'ABOUT.titles.experiences'), Colors.black87),
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 30),
            child: _width >= 830
                ? Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                        Expanded(child: ExperienceBloc('LIM')),
                        SizedBox(width: 30),
                        Expanded(child: ExperienceBloc('TEHTRIS'))
                      ])
                : Column(children: const [
                    ExperienceBloc('LIM'),
                    ExperienceBloc('TEHTRIS')
                  ])),
        title2(i18n(context, 'ABOUT.titles.education'), Colors.black87),
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 30),
            child: _width >= 830
                ? Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                        Expanded(child: EducationBloc('LR')),
                        Expanded(child: EducationBloc('POITIERS')),
                        Expanded(child: EducationBloc('BORDEAUX'))
                      ])
                : Column(children: const [
                    EducationBloc('LR'),
                    EducationBloc('POITIERS'),
                    EducationBloc('BORDEAUX')
                  ])),
        title2(i18n(context, 'ABOUT.titles.skills'), Colors.black87),
        SizedBox(height: _height / 20),
        for (var i = 0; i < 6; i++) SkillsBloc(_width, _height, line: i),
        SizedBox(height: _height / 20),
        copyright
      ],
    ));
  }
}
