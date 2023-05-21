// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:portfolio/components/ImageHoverAnimated.dart';
import 'package:portfolio/helpers/helper.dart';
import 'package:portfolio/styles/style.dart';

class ExperienceBloc extends StatelessWidget {
  final String company;

  const ExperienceBloc(this.company, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ImageHoverAnimated(company),
      Text(i18n(context, 'ABOUT.experiences.$company.title'),
          style: const TextStyle(fontFamily: 'Bonheur Royale', fontSize: 40)),
      textWithIcon(i18n(context, 'ABOUT.experiences.$company.missions'),
          icon: 'missions'),
      textWithIcon(i18n(context, 'ABOUT.experiences.$company.tools'),
          icon: 'tools'),
    ]);
  }
}
