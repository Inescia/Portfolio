// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:portfolio/helpers/helper.dart';
import 'package:portfolio/styles/style.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class SkillsBloc extends StatelessWidget {
  final double _width, _height;
  final int line;

  const SkillsBloc(this._width, this._height, {required this.line, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var data = chartData[line];
    return Stack(alignment: AlignmentDirectional.center, children: [
      backTitle(chartTitles[line], _width,
          color: COLORS[line].withOpacity(.15)),
      Padding(
          padding: EdgeInsets.symmetric(horizontal: _width / 15),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            for (var i = 0; i < data.length; i++)
              Expanded(
                  child:
                      Stack(alignment: AlignmentDirectional.center, children: [
                SfCircularChart(series: <CircularSeries>[
                  RadialBarSeries<ChartData, String>(
                      animationDuration: 3000,
                      pointColorMapper: (ChartData data, _) => COLORS[line],
                      dataSource: [data[i]],
                      xValueMapper: (ChartData data, _) => data.x,
                      yValueMapper: (ChartData data, _) => data.y,
                      radius: '70%',
                      innerRadius: '90%',
                      cornerStyle: CornerStyle.bothCurve,
                      maximumValue: 4)
                ]),
                Tooltip(
                    message: i18n(context, 'ABOUT.skills.levels.${data[i].y}'),
                    child: Column(children: [
                      Image(
                          height: _height / 10,
                          image: AssetImage(
                              'assets/images/skills/${data[i].x}.png')),
                      Text(data[i].x,
                          style: const TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w100,
                              fontSize: 16),
                          textAlign: TextAlign.center)
                    ]))
              ]))
          ]))
    ]);
  }
}
