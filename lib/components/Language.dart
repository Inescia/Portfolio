// ignore_for_file: slash_for_doc_comments, file_names
import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:portfolio/helpers/helper.dart';

class Language extends StatefulWidget {
  final Function() callback;

  const Language({required this.callback, Key? key}) : super(key: key);
  @override
  _Language createState() => _Language();
}

class _Language extends State<Language> {
  List<String> languagesList = ['fr', 'en', 'es'];
  late String currentLanguage;

  /**
   * @method to change the current language
   */
  _changeLanguage() async {
    var index = languagesList.indexOf(currentLanguage);
    index = (index + 1) % languagesList.length;
    currentLanguage = languagesList[index];
    try {
      await FlutterI18n.refresh(context, Locale(currentLanguage));
      setState(() {});
      widget.callback();
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    currentLanguage = FlutterI18n.currentLocale(context)!.languageCode;
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
        child: IconButton(
          onPressed: () => _changeLanguage(),
          icon: Image(image: AssetImage('assets/icons/$currentLanguage.png')),
          iconSize: getWidth(context) / 25 <= 50 ? 50 : getWidth(context) / 25,
        ),
        left: 30,
        bottom: 15);
  }
}
