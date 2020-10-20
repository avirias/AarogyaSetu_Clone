import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class LanguageSwitch extends StatelessWidget {

  final Color color;

  const LanguageSwitch({Key key, this.color = Colors.black}) : super(key: key);


  Widget build(BuildContext context) {
    return IconButton(
        icon: Icon(
          Icons.translate,
          color: color,
        ),
        onPressed: () {
          if (EasyLocalization.of(context).locale == Locale('en'))
            EasyLocalization.of(context).locale = Locale('hi');
          else
            EasyLocalization.of(context).locale = Locale('en');
        });
  }
}
