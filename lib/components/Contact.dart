// ignore_for_file: slash_for_doc_comments, file_names, avoid_print
import 'package:flutter/material.dart';
import 'package:hovering/hovering.dart';
import 'package:portfolio/helpers/helper.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:widget_circular_animator/widget_circular_animator.dart';

class Contact extends StatelessWidget {
  const Contact({Key? key}) : super(key: key);

  /**
   * @method to open a mail editor
   */
  void sendMail() async {
    //{mailto:<email address>?subject=<subject>&body=<body>},
    const mailUrl = 'mailto:iciattoni@ensc.fr';
    try {
      // ignore: deprecated_member_use
      await launch(mailUrl);
    } catch (e) {
      print('iciattoni@ensc.fr');
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = getWidth(context);
    return Positioned(
        child: Tooltip(
            message: i18n(context, 'ALL.contact'),
            child: WidgetCircularAnimator(
                size: width / 10 <= 80 ? 80 : width / 10,
                innerIconsSize: 0,
                outerIconsSize: 0,
                innerAnimation: Curves.easeInOutBack,
                outerAnimation: Curves.easeInOutBack,
                innerColor: Colors.white,
                outerColor: Colors.white,
                innerAnimationSeconds: 10,
                outerAnimationSeconds: 10,
                child: Center(
                    child: HoverWidget(
                        hoverChild: Opacity(
                            opacity: 0.8,
                            child: IconButton(
                                onPressed: () => sendMail(),
                                icon: const Image(
                                    image:
                                        AssetImage('assets/icons/contact.png')),
                                iconSize: 75)),
                        onHover: (event) {},
                        child: GestureDetector(
                            onTap: () => sendMail(),
                            child: Text(
                              'iciattoni\n@ensc.fr',
                              style: TextStyle(
                                  fontSize: width >= 1000
                                      ? 13
                                      : width >= 820
                                          ? 11
                                          : 10,
                                  color: Colors.white,
                                  fontFamily: 'Poppins',
                                  letterSpacing: 1.1),
                              textAlign: TextAlign.center,
                            )))))),
        right: width > 700 ? 40 : 15,
        bottom: width > 700 ? 15 : 5);
  }
}
