// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:portfolio/components/ImageHoverAnimated.dart';
import 'package:portfolio/helpers/helper.dart';
import 'package:portfolio/styles/style.dart';

class EducationBloc extends StatelessWidget {
  final String city;

  const EducationBloc(this.city, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ImageHoverAnimated(city),
      Text(i18n(context, 'ABOUT.education.$city.date'),
          style: const TextStyle(fontFamily: 'Bonheur Royale', fontSize: 40)),
      for (var item in ['degree', 'internship', 'association', 'international'])
        if (i18n(context, 'ABOUT.education.$city.$item') !=
            'ABOUT.education.$city.$item')
          textWithIcon(i18n(context, 'ABOUT.education.$city.$item'), icon: item)
    ]);
  }
}
