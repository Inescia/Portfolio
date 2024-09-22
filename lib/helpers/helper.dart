import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:portfolio/styles/style.dart';

List<String> projectList = [
  'HORSESAFE',
  'LIVIA',
  'ISPORT',
  'HP',
  'SUPERHEROES',
  'LAETI'
];

Map<String, List<String>> projectCategorieList = {
  'HORSESAFE': ['search', 'features', 'mockups', 'tests', 'development'],
  'LIVIA': ['search', 'identity', 'mockups', 'visibility'],
  'ISPORT': ['search', 'mockups', 'web', 'analysis'],
  'HP': ['search', 'mockups', 'tests'],
  'SUPERHEROES': ['instructions', 'mockups', 'development'],
  'LAETI': ['features', 'mockups', 'development', 'improvements']
};

List<String> chartTitles = [
  'UX Method',
  'Design',
  'Front-End',
  'Back-End',
  'Langages C',
  'Mobile'
];

List<List<ChartData>> chartData = [
  [
    ChartData('Recherche', 4),
    ChartData('Itération', 4),
    ChartData('Prototypage', 4),
    ChartData('Test', 4),
  ],
  [
    ChartData('Xd', 4),
    ChartData('Photoshop', 3),
    ChartData('InDesign', 2),
    ChartData('Illustrator', 2)
  ],
  [
    ChartData('HTML', 4),
    ChartData('CSS', 4),
    ChartData('JavaScript', 4),
    ChartData('Vue', 4)
  ],
  [
    ChartData('Firebase', 4),
    ChartData('Node', 3),
    ChartData('SQL', 3),
    ChartData('PHP', 2)
  ],
  [ChartData('C#', 3), ChartData('C++', 3), ChartData('C', 2)],
  [ChartData('Flutter', 4), ChartData('React Native', 2)]
];

double getWidth(context) {
  return MediaQuery.of(context).size.width;
}

double getHeight(context) {
  return MediaQuery.of(context).size.height;
}

bool isHorizontal(context) {
  return getHeight(context) > getWidth(context) ? true : false;
}

String i18n(context, key) {
  return FlutterI18n.translate(context, key);
}
